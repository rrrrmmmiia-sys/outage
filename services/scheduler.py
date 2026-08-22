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

    # دو نوع هشدار: «یک ساعت قبل» (اگه روشنه) و «۱۰ دقیقه قبل».
    # هر کدوم پنجره‌ی ±۱ دقیقه‌ای دور زمان هدف خودش رو داره؛
    # ممکنه هر دو همزمان برن (قطعی‌ای که دقیقاً ۶۰ دقیقه مونده).
    alert_kinds = [
        (
            "ten_min",
            notify_minutes,
            f"⚠️ تا {notify_minutes} دقیقه‌ی دیگه قطعی برق شروع میشه.",
        ),
    ]
    hour_before = config.NOTIFY_HOUR_BEFORE_MINUTES
    if hour_before > 0:
        alert_kinds.insert(
            0,
            (
                "hour",
                hour_before,
                f"🔌 حدود {hour_before // 60} ساعت دیگه قطعی برق شروع میشه.",
            ),
        )

    windows = [
        (
            kind,
            message_head,
            now + dt.timedelta(minutes=minutes - 1),
            now + dt.timedelta(minutes=minutes + 1),
        )
        for kind, minutes, message_head in alert_kinds
    ]

    # ردیف‌های امروز و فردا رو با هم می‌خونیم تا قطعی‌های بعد از نیمه‌شب
    # (که تو دیتابیس با date=فردا ثبت شدن) هم پوشش داده بشن
    candidate_dates = sorted(
        {today, today + dt.timedelta(days=1)}
    )

    async with get_session() as session:

        # ---------------------------------------------------------
        # 1. همه‌ی قطعی‌های امروز/فردا (پنجره‌ها روی این‌ها چک میشن)
        # ---------------------------------------------------------

        cache_result = await session.execute(
            select(OutageCache).where(
                OutageCache.date.in_(candidate_dates),
                OutageCache.found == True,  # noqa: E712
                OutageCache.start_time.is_not(None),
            )
        )

        all_caches = cache_result.scalars().all()

        # نگاشت region_key -> لیست (قطعی سررسیده، انواع هشدارِ خورده).
        # ⚠️ هر قطعی فقط برای kind ای هشدار می‌گیره که واقعاً پنجره‌اش رو
        # خورده — نه همه‌ی انواع.
        due_by_region: dict[str, list[tuple[OutageCache, list[str]]]] = defaultdict(list)

        for c in all_caches:

            hit_kinds = [
                kind
                for kind, _head, low, high in windows
                if low <= dt.datetime.combine(c.date, c.start_time, tzinfo=TZ) <= high
            ]

            if hit_kinds:
                due_by_region[c.region_key].append((c, hit_kinds))

        if not due_by_region:
            return

        due_caches = [
            c for pairs in due_by_region.values() for c, _kinds in pairs
        ]

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

        # نگاشت region_key -> اولین قطعی سررسیده (برای فالبکِ زیررشته)
        cache_by_region = {
            k: v[0][0] for k, v in due_by_region.items()
        }

        # هشدارهایی که همین امروز قبلاً رفتن (همه رو یکجا می‌خونیم)
        loc_ids = [loc.id for loc in locations]

        sent_result = await session.execute(
            select(NotificationSent).where(
                NotificationSent.location_id.in_(loc_ids),
                NotificationSent.date.in_(candidate_dates),
            )
        )

        sent_rows = sent_result.scalars().all()

        sent_keys = {
            (s.location_id, s.date, s.start_time, s.kind)
            for s in sent_rows
        }

        # ---------------------------------------------------------
        # 3. برای هر مکان کاربر، قطعی‌های سررسیده را پیدا می‌کنیم
        #
        # تطبیق: اول دقیق روی region_key؛ اگه نشد فالبکِ زیررشته —
        # district کاربر باید واقعاً داخل note یکی از همون چند قطعیِ
        # سررسیده باشه (کاربر ممکنه متن آزاد تایپ کرده باشه).
        # ---------------------------------------------------------

        def _match_outages(location) -> list[tuple[OutageCache, list[str]]]:
            exact = due_by_region.get(location.region_key)
            if exact:
                return exact

            keyword = (location.district_fa or "").strip()
            if not keyword:
                return []

            keyword = keyword.replace("ي", "ی").replace("ك", "ک")

            matched = []
            seen_ids = set()
            for candidate in due_caches:
                if id(candidate) in seen_ids:
                    continue
                note = (candidate.note or "").replace("ي", "ی").replace("ك", "ک")
                if keyword in note:
                    # فالبک: kind های این قطعی رو از نگاشت اصلی پیدا کن
                    kinds = next(
                        (ks for c, ks in due_by_region.get(candidate.region_key, []) if c is candidate),
                        [],
                    )
                    matched.append((candidate, kinds))
                    seen_ids.add(id(candidate))
            return matched

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

            matched_outages = _match_outages(location)

            if not matched_outages:
                continue

            # -----------------------------------------------------
            # 4. برای هر (قطعی، نوع هشدار): اگه قبلاً نرفته، بفرست
            #    چند قطعی در روز → چند ردیف مستقل در notifications_sent
            # -----------------------------------------------------

            for outage, hit_kinds in matched_outages:

                for kind in hit_kinds:

                    head = next(
                        h for k, _m, h in alert_kinds if k == kind
                    )

                    dedup_key = (
                        location.id,
                        outage.date,
                        outage.start_time,
                        kind,
                    )

                    if dedup_key in sent_keys:
                        continue

                    message = (
                        f"{head}\n"
                        f"مکان: {location.city_fa} - "
                        f"{location.district_fa}\n"
                        f"ساعت شروع: "
                        f"{outage.start_time.strftime('%H:%M')}\n"
                    )

                    if outage.end_time:
                        message += (
                            f"ساعت پایان: "
                            f"{outage.end_time.strftime('%H:%M')}\n"
                        )

                    try:

                        await bot.send_message(
                            chat_id=user.telegram_id,
                            text=message,
                        )

                        session.add(
                            NotificationSent(
                                location_id=location.id,
                                date=outage.date,
                                start_time=outage.start_time,
                                kind=kind,
                            )
                        )

                        await session.commit()

                        sent_keys.add(dedup_key)

                        logger.info(
                            "Notification sent (%s): "
                            "location_id=%s user=%s start=%s",
                            kind,
                            location.id,
                            user.telegram_id,
                            outage.start_time.strftime("%H:%M"),
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
    nightly_summary_worker هم هر شب اجرا می‌شود (بعد از جاب ۰۰:۳۰ گیت‌هاب که دیتا رو به‌روز می‌کنه).
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
    هر شب برای کاربرهایی که
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
            select(OutageCache)
            .where(
                OutageCache.region_key.in_(region_keys),
                OutageCache.date == tomorrow,
                OutageCache.found == True,  # noqa: E712
                OutageCache.start_time.is_not(None),
            )
            .order_by(OutageCache.start_time)
        )

        # چند قطعی در روز → برای هر region_key لیستی از بازه‌ها
        caches_by_region: dict[str, list[OutageCache]] = defaultdict(list)

        for c in cache_result.scalars().all():
            caches_by_region[c.region_key].append(c)

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

                outages = caches_by_region.get(
                    loc.region_key,
                    [],
                )

                if not outages:

                    lines.append(
                        f"▫️ {loc.city_fa} - "
                        f"{loc.district_fa}: "
                        "قطعی برنامه‌ریزی‌شده‌ای پیدا نشد"
                    )

                    continue

                # همه‌ی بازه‌های قطعی اون روز، پشت هم تو یه خط
                ranges = []

                for outage in outages:

                    rng = outage.start_time.strftime("%H:%M")

                    if outage.end_time:
                        rng += (
                            " تا "
                            + outage.end_time.strftime("%H:%M")
                        )

                    ranges.append(rng)

                lines.append(
                    f"⚡ {loc.city_fa} - "
                    f"{loc.district_fa}: "
                    f"{' و '.join(ranges)}"
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
