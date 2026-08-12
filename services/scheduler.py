import datetime as dt
import logging
from zoneinfo import ZoneInfo

from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy import select, text

import config
from db.database import get_session
from db.models import Location, NotificationSent, OutageCache, User


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
    """

    now = dt.datetime.now(TZ)
    today = now.date()

    notify_minutes = config.NOTIFY_MINUTES_BEFORE

    window_start = (
        now + dt.timedelta(minutes=notify_minutes - 1)
    ).time()

    window_end = (
        now + dt.timedelta(minutes=notify_minutes + 1)
    ).time()

    async with get_session() as session:

        # ---------------------------------------------------------
        # 1. قطعی‌های امروز که زمان شروعشان در بازه هشدار است
        # ---------------------------------------------------------

        cache_result = await session.execute(
            select(OutageCache).where(
                OutageCache.date == today,
                OutageCache.found == True,  # noqa: E712
                OutageCache.start_time.is_not(None),
                OutageCache.start_time >= window_start,
                OutageCache.start_time <= window_end,
            )
        )

        due_caches = cache_result.scalars().all()

        if not due_caches:
            return

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
            # 5. جستجوی قطعی مناسب این مکان
            #
            # ابتدا شهر و شهرستان را محدود می‌کنیم.
            # سپس district کاربر باید واقعاً داخل note قطعی وجود
            # داشته باشد.
            # -----------------------------------------------------

            keyword = (location.district_fa or "").strip()

            if not keyword:
                logger.warning(
                    "Location %s has empty district_fa",
                    location.id,
                )
                continue

            # normalize ساده برای جلوگیری از تفاوت ي / ی و ك / ک
            keyword_normalized = (
                keyword
                .replace("ي", "ی")
                .replace("ك", "ک")
                .strip()
            )

            outage_result = await session.execute(
                text(
                    """
                    SELECT
                        oc.id,
                        oc.region_key,
                        oc.note,
                        oc.start_time,
                        oc.end_time
                    FROM outage_cache AS oc
                    WHERE oc.date = :date
                      AND oc.found = TRUE
                      AND oc.start_time IS NOT NULL

                      -- فقط همان شهرستان
                      AND oc.region_key LIKE :county_prefix

                      -- فقط قطعی‌هایی که زمانشان همین حوالی است
                      AND oc.start_time >= :window_start
                      AND oc.start_time <= :window_end

                      -- عبارت منطقه کاربر باید واقعاً
                      -- داخل توضیح قطعی وجود داشته باشد
                      AND translate(
                          oc.note,
                          'يك',
                          'یک'
                      ) ILIKE
                          '%' ||
                          translate(
                              :keyword,
                              'يك',
                              'یک'
                          ) ||
                          '%'

                    ORDER BY oc.start_time
                    LIMIT 20
                    """
                ),
                {
                    "date": today,
                    "county_prefix": (
                        f"mazandaran|{location.county_code}|%"
                    ),
                    "window_start": window_start,
                    "window_end": window_end,
                    "keyword": keyword_normalized,
                },
            )

            outages = outage_result.mappings().all()

            if not outages:
                continue

            # -----------------------------------------------------
            # 6. قطعی پیدا شد
            # -----------------------------------------------------

            cache = outages[0]

            logger.info(
                "MATCH FOUND: location_id=%s | user=%s | "
                "city=%s | district=%s | outage_note=%s",
                location.id,
                user.telegram_id,
                location.city_fa,
                location.district_fa,
                cache["note"],
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
                f"{cache['start_time'].strftime('%H:%M')}\n"
            )

            if cache["end_time"]:
                message += (
                    f"ساعت پایان: "
                    f"{cache['end_time'].strftime('%H:%M')}\n"
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

    scheduler.start()

    logger.info(
        "Notification scheduler started. "
        "Interval: 1 minute"
    )

    return scheduler
