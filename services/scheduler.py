import datetime as dt
import logging
from collections import defaultdict
from zoneinfo import ZoneInfo

from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy import select

import config
from db.database import get_session
from db.models import (
    Location,
    NightlySummarySent,
    NotificationSent,
    OutageCache,
    User,
)


logger = logging.getLogger(__name__)

TZ = ZoneInfo(config.TIMEZONE)


async def notification_worker(bot):
    """
    هر ۱ دقیقه اجرا می‌شود.

    برای هر مکان ذخیره‌شده توسط کاربر:
      1. قطعی‌های امروز را بررسی می‌کند.
      2. شهر و شهرستان را با مکان کاربر تطبیق می‌دهد.
      3. district_fa کاربر را داخل note قطعی جستجو می‌کند.
      4. اگر قطعی در محدوده NOTIFY_MINUTES_BEFORE دقیقه‌ای باشد،
         هشدار ارسال می‌کند.

    نکته:
    دیگر برای ارسال هشدار به region_key دقیق متکی نیستیم؛
    چون ممکن است مکان ذخیره‌شده مثلاً «فارابی» باشد ولی
    note قطعی یک توضیح طولانی‌تر مثل:
    «123- ... کوچه‌های فارابی - ولیعصر ...» داشته باشد.

    نکته‌ی مهم درباره‌ی پنجره‌ی هشدار:
    مقایسه با تاریخ کامل (datetime.combine) انجام میشه نه صرفاً time،
    چون اگه الان نزدیک نیمه‌شب باشه و قطعی فردا ساعت ۰۰:۰۵ شروع بشه،
    مقایسه‌ی صرفِ time باعث میشد window_end کوچکتر از window_start بشه
    و هیچ هشداری فرستاده نشه.
    """

    now = dt.datetime.now(TZ)
    today = now.date()

    notify_minutes = config.NOTIFY_MINUTES_BEFORE

    window_low = now + dt.timedelta(
        minutes=notify_minutes - 1
    )
    window_high = now + dt.timedelta(
        minutes=notify_minutes + 1
    )

    # ردیف‌های امروز و فردا رو با هم می‌خونیم تا قطعی‌های بعد از نیمه‌شب
    # (که تو دیتابیس با date=فردا ثبت شدن) هم پوشش داده بشن
    candidate_dates = sorted(
        {today, today + dt.timedelta(days=1)}
    )

    async with get_session() as session:

        # ---------------------------------------------------------
        # 1. قطعی‌هایی که زمان شروعشان در بازه هشدار است
        # ---------------------------------------------------------

        cache_result = await session.execute(
            select(OutageCache).where(
                OutageCache.date.in_(candidate_dates),
                OutageCache.found == True,  # noqa: E712
                OutageCache.start_time.is_not(None),
            )
        )

        all_caches = cache_result.scalars().all()

        due_caches = [
            c
            for c in all_caches
            if window_low
            <= dt.datetime.combine(
                c.date, c.start_time, tzinfo=TZ
            )
            <= window_high
        ]

        if not due_caches:
            return

        due_keys = {c.region_key for c in due_caches}

        logger.info(
            "Notification worker: %s outage(s) due around %s",
            len(due_caches),
            now.strftime("%H:%M"),
        )

        # ---------------------------------------------------------
        # 2. همه Locationهای ذخیره‌شده را می‌گیریم
        # ---------------------------------------------------------

        location_result = await session.execute(
            select(Location)
        )

        locations = location_result.scalars().all()

        if not locations:
            return

        # نگاشت region_key -> قطعی سررسیده (برای تطبیق دقیق سریع)
        cache_by_region = {
            c.region_key: c for c in due_caches
        }

        # ---------------------------------------------------------
        # 3. برای هر مکان کاربر، قطعی مناسب را پیدا می‌کنیم
        # ---------------------------------------------------------

        for location in locations:

            user = await session.get(
                User,
                location.user_id,
            )

            if user is None:
                logger.warning(
                    "User not found for location id=%s",
                    location.id,
                )
                continue

            # -----------------------------------------------------
            # 4. جلوگیری از ارسال چندباره برای یک مکان در همان روز
            # -----------------------------------------------------

            already_sent = await session.scalar(
                select(NotificationSent).where(
                    NotificationSent.location_id == location.id,
                    NotificationSent.date == today,
                )
            )

            if already_sent:
                continue

            # -----------------------------------------------------
            # 5. پیدا کردن قطعی سررسیده‌ی این مکان
            #
            # اول تطبیق دقیق region_key (سریع و بدون ابهام).
            # اگه پیدا نشد، فالبک: district کاربر باید واقعاً داخل
            # note یکی از همون چند قطعیِ سررسیده باشه — چون ممکنه
            # کاربر متن آزاد تایپ کرده باشه و region_key اش با
            # کلید رکورد خام هرمس یکی نباشه.
            # -----------------------------------------------------

            if not (location.district_fa or "").strip():
                logger.warning(
                    "Location %s has empty district_fa",
                    location.id,
                )
                continue

            cache = cache_by_region.get(
                location.region_key
            )

            if cache is None:

                keyword = (
                    location.district_fa
                    .replace("ي", "ی")
                    .replace("ك", "ک")
                    .strip()
                )

                for candidate in due_caches:

                    note = (
                        candidate.note or ""
                    ).replace("ي", "ی").replace("ك", "ک")

                    if keyword in note:

                        cache = candidate

                        break

            if cache is None:
                continue

            # -----------------------------------------------------
            # 6. قطعی پیدا شد
            # -----------------------------------------------------

            logger.info(
                "MATCH FOUND: location_id=%s | user=%s | "
                "city=%s | district=%s | outage_note=%s",
                location.id,
                user.telegram_id,
                location.city_fa,
                location.district_fa,
                cache.note,
            )

            # -----------------------------------------------------
            # 7. ساخت پیام
            # -----------------------------------------------------

            message = (
                f"⚠️ تا {notify_minutes} دقیقه‌ی دیگه "
                f"قطعی برق شروع میشه.\n"
                f"مکان: {location.city_fa} - "
                f"{location.district_fa}\n"
                f"ساعت شروع: "
                f"{cache.start_time.strftime('%H:%M')}\n"
            )

            if cache.end_time:
                message += (
                    f"ساعت پایان: "
                    f"{cache.end_time.strftime('%H:%M')}\n"
                )

            # -----------------------------------------------------
            # 8. ارسال پیام تلگرام
            # -----------------------------------------------------

            try:

                await bot.send_message(
                    chat_id=user.telegram_id,
                    text=message,
                )

                # -------------------------------------------------
                # 9. ثبت اینکه هشدار این مکان امروز ارسال شده
                # -------------------------------------------------

                session.add(
                    NotificationSent(
                        location_id=location.id,
                        date=today,
                    )
                )

                await session.commit()

                logger.info(
                    "Notification sent successfully: "
                    "location_id=%s user=%s",
                    location.id,
                    user.telegram_id,
                )

            except Exception as exc:

                await session.rollback()

                logger.error(
                    "خطا در ارسال پیام به کاربر %s: %s",
                    user.telegram_id,
                    exc,
                    exc_info=True,
                )


def setup_scheduler(bot) -> AsyncIOScheduler:
    """
    راه‌اندازی Scheduler.

    notification_worker هر یک دقیقه اجرا می‌شود.
    nightly_summary_worker هم هر شب بعد از نوشتن دیتای هرمس اجرا می‌شود.
    """

    scheduler = AsyncIOScheduler(
        timezone=TZ
    )

    scheduler.add_job(
        notification_worker,
        "interval",
        minutes=1,
        args=[bot],
        id="notification_worker",
        misfire_grace_time=30,
        replace_existing=True,
    )

    scheduler.add_job(
        nightly_summary_worker,
        "cron",
        hour=config.NIGHTLY_SUMMARY_HOUR,
        minute=config.NIGHTLY_SUMMARY_MINUTE,
        args=[bot],
        id="nightly_summary_worker",
        # اگه ربات دقیقاً سرِ ساعت بالا نبود، تا ۱ ساعت بعد هم جبران میشه
        misfire_grace_time=3600,
        replace_existing=True,
    )

    scheduler.start()

    logger.info(
        "Notification scheduler started. "
        "Interval: 1 minute. "
        "Nightly summary at %02d:%02d.",
        config.NIGHTLY_SUMMARY_HOUR,
        config.NIGHTLY_SUMMARY_MINUTE,
    )

    return scheduler


async def nightly_summary_worker(bot):
    """
    هر شب (بعد از اینکه هرمس دیتای فردا رو نوشت) برای کاربرهایی که
    خلاصه‌ی شبانه براشون روشنه، ساعت قطعی فردای همه‌ی مکان‌هاشون رو
    در یک پیام می‌فرسته.
    """

    now = dt.datetime.now(TZ)
    tomorrow = (now + dt.timedelta(days=1)).date()

    async with get_session() as session:

        user_result = await session.execute(
            select(User).where(
                User.nightly_summary_enabled == True  # noqa: E712
            )
        )

        users = user_result.scalars().all()

        if not users:
            return

        user_ids = [u.id for u in users]

        location_result = await session.execute(
            select(Location).where(
                Location.user_id.in_(user_ids)
            )
        )

        locations = location_result.scalars().all()

        if not locations:
            return

        region_keys = sorted(
            {loc.region_key for loc in locations}
        )

        cache_result = await session.execute(
            select(OutageCache).where(
                OutageCache.region_key.in_(region_keys),
                OutageCache.date == tomorrow,
            )
        )

        cache_by_region = {
            c.region_key: c
            for c in cache_result.scalars().all()
        }

        # جلوگیری از ارسال تکراری اگه جاب دو بار تو یه شب اجرا بشه
        sent_result = await session.execute(
            select(NightlySummarySent.user_id).where(
                NightlySummarySent.user_id.in_(user_ids),
                NightlySummarySent.date == tomorrow,
            )
        )

        already_sent_ids = set(
            sent_result.scalars().all()
        )

        locs_by_user = defaultdict(list)

        for loc in locations:
            locs_by_user[loc.user_id].append(loc)

        for user in users:

            if user.id in already_sent_ids:
                continue

            user_locs = locs_by_user.get(user.id)

            if not user_locs:
                continue

            lines = [
                f"🌙 خلاصه‌ی قطعی فردا "
                f"({tomorrow.isoformat()}):\n"
            ]

            for loc in user_locs:

                cache = cache_by_region.get(
                    loc.region_key
                )

                if (
                    cache
                    and cache.found
                    and cache.start_time
                ):

                    time_range = (
                        cache.start_time.strftime("%H:%M")
                    )

                    if cache.end_time:
                        time_range += (
                            " تا "
                            + cache.end_time.strftime("%H:%M")
                        )

                    lines.append(
                        f"⚡ {loc.city_fa} - "
                        f"{loc.district_fa}: {time_range}"
                    )

                else:

                    lines.append(
                        f"▫️ {loc.city_fa} - "
                        f"{loc.district_fa}: "
                        "قطعی برنامه‌ریزی‌شده‌ای پیدا نشد"
                    )

            try:

                await bot.send_message(
                    chat_id=user.telegram_id,
                    text="\n".join(lines),
                )

                session.add(
                    NightlySummarySent(
                        user_id=user.id,
                        date=tomorrow,
                    )
                )

                await session.commit()

                logger.info(
                    "Nightly summary sent: user=%s",
                    user.telegram_id,
                )

            except Exception as exc:

                await session.rollback()

                logger.error(
                    "خطا در ارسال خلاصه‌ی شبانه به کاربر %s: %s",
                    user.telegram_id,
                    exc,
                    exc_info=True,
                )
