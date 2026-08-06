import datetime as dt
import logging
from zoneinfo import ZoneInfo

from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy import select

import config
from db.database import get_session
from db.models import Location, NotificationSent, OutageCache, User

logger = logging.getLogger(__name__)

TZ = ZoneInfo(config.TIMEZONE)


async def notification_worker(bot):
    """
    هر ۱ دقیقه اجرا میشه: اگه تا NOTIFY_MINUTES_BEFORE دقیقه‌ی دیگه قطعی شروع میشه، هشدار می‌فرسته.
    داده‌ی outage_cache رو هرمس ایجنت هر شب ساعت ۲۲:۰۰ برای روز بعد پر می‌کنه؛
    این تابع فقط می‌خونه و پیام می‌فرسته، هیچ تماسی با هیچ AI ای نداره.
    """
    now = dt.datetime.now(TZ)
    today = now.date()
    window_start = (now + dt.timedelta(minutes=config.NOTIFY_MINUTES_BEFORE - 1)).time()
    window_end = (now + dt.timedelta(minutes=config.NOTIFY_MINUTES_BEFORE + 1)).time()

    async with get_session() as session:
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

        region_keys = [c.region_key for c in due_caches]
        loc_result = await session.execute(
            select(Location).where(Location.region_key.in_(region_keys))
        )
        locations = loc_result.scalars().all()

        cache_by_region = {c.region_key: c for c in due_caches}

        for location in locations:
            already_sent = await session.scalar(
                select(NotificationSent).where(
                    NotificationSent.location_id == location.id,
                    NotificationSent.date == today,
                )
            )
            if already_sent:
                continue

            cache = cache_by_region[location.region_key]
            user = await session.get(User, location.user_id)

            text = (
                f"⚠️ تا {config.NOTIFY_MINUTES_BEFORE} دقیقه‌ی دیگه قطعی برق شروع میشه.\n"
                f"مکان: {location.city_fa} - {location.district_fa}\n"
                f"ساعت شروع: {cache.start_time.strftime('%H:%M')}\n"
                + (f"ساعت پایان: {cache.end_time.strftime('%H:%M')}\n" if cache.end_time else "")
            )
            try:
                await bot.send_message(chat_id=user.telegram_id, text=text)
                session.add(
                    NotificationSent(location_id=location.id, date=today)
                )
                await session.commit()
            except Exception as exc:  # noqa: BLE001
                logger.error("خطا در ارسال پیام به کاربر %s: %s", user.telegram_id, exc)


def setup_scheduler(bot) -> AsyncIOScheduler:
    scheduler = AsyncIOScheduler(timezone=TZ)

    scheduler.add_job(
        notification_worker,
        "interval",
        minutes=1,
        args=[bot],
        id="notification_worker",
        misfire_grace_time=30,
    )

    scheduler.start()
    return scheduler
