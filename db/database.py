from contextlib import asynccontextmanager

from sqlalchemy import text
from sqlalchemy.ext.asyncio import (
    AsyncSession,
    async_sessionmaker,
    create_async_engine,
)

import config
from db.models import Base

engine = create_async_engine(config.DATABASE_URL, pool_pre_ping=True)
SessionLocal = async_sessionmaker(engine, expire_on_commit=False)


async def _migrate_existing_tables(conn) -> None:
    """
    create_all جدول‌های موجود رو تغییر نمیده؛ پس تغییرات idempotent دستی
    اینجا انجام میشه. کوئری‌ها قابل حمل‌اند (Postgres و SQLite).
    """

    is_postgres = engine.dialect.name == "postgresql"

    # ۱) جدول notifications_sent قدیمی فقط (location_id, date) یکتا داشت —
    #    برای پشتیبانی «چند قطعی در روز» + دو نوع هشدار، ستون‌های
    #    start_time/kind و قید جدید اضافه میشن. دیتای قدیمی قابل تبدیل نیست،
    #    پس رکوردهای قدیمی پاک میشن تا هشدارها از نو برن.
    if is_postgres:
        cols_result = await conn.execute(text(
            "SELECT column_name FROM information_schema.columns "
            "WHERE table_name = 'notifications_sent'"
        ))
        existing_cols = {row[0] for row in cols_result}
    else:
        # SQLite: PRAGMA table_info
        rows = await conn.exec_driver_sql("PRAGMA table_info(notifications_sent)")
        existing_cols = {r[1] for r in rows}

    if "start_time" not in existing_cols:
        await conn.execute(text("ALTER TABLE notifications_sent ADD COLUMN start_time TIME NOT NULL DEFAULT '00:00'"))
        await conn.execute(text("DELETE FROM notifications_sent"))  # ردیف‌های قدیمی بی‌معنا شدن
    if "kind" not in existing_cols:
        await conn.execute(text("ALTER TABLE notifications_sent ADD COLUMN kind VARCHAR(16) NOT NULL DEFAULT 'ten_min'"))

    # ۲) قید یکتای قدیمی uq_location_date حذف میشه (جاش قید چهارستونه هست)
    #    در SQLite DROP CONSTRAINT نداریم؛ چون create_all جدول موجود رو
    #    دست نمی‌زنه، این مشکل فقط روی Postgres (پروداکشن) پیش میاد.
    if is_postgres:
        old_ucs = await conn.execute(text(
            "SELECT constraint_name FROM information_schema.table_constraints "
            "WHERE table_name = 'notifications_sent' AND constraint_type = 'UNIQUE'"
        ))
        for (uc_name,) in old_ucs:
            if uc_name == "uq_location_date":
                await conn.execute(text(f"ALTER TABLE notifications_sent DROP CONSTRAINT {uc_name}"))

    # ۳) قید یکتای جدید اگه نیست اضافه میشه
    if is_postgres:
        has_new_uc = await conn.scalar(text(
            "SELECT 1 FROM information_schema.table_constraints "
            "WHERE table_name = 'notifications_sent' "
            "AND constraint_name = 'uq_location_date_start_kind'"
        ))
        if not has_new_uc:
            await conn.execute(text(
                "ALTER TABLE notifications_sent "
                "ADD CONSTRAINT uq_location_date_start_kind "
                "UNIQUE (location_id, date, start_time, kind)"
            ))

    # ۴) قید یکتای outage_cache از (region_key, date) به
    #    (region_key, date, start_time) تغییر می‌کنه تا چند قطعی در روز
    #    برای یک منطقه ممکن بشه. دیتای فعلی رو نگه می‌داریم.
    if is_postgres:
        old_region_uc = await conn.scalar(text(
            "SELECT 1 FROM information_schema.table_constraints "
            "WHERE table_name = 'outage_cache' "
            "AND constraint_name = 'uq_region_date'"
        ))
        if old_region_uc:
            await conn.execute(text("ALTER TABLE outage_cache DROP CONSTRAINT uq_region_date"))

        has_new_uc = await conn.scalar(text(
            "SELECT 1 FROM information_schema.table_constraints "
            "WHERE table_name = 'outage_cache' "
            "AND constraint_name = 'uq_region_date_start'"
        ))
        if not has_new_uc:
            # اگه رکوردهای تکراری (همون منطقه، همون روز، همون ساعت شروع)
            # وجود داشته باشن، این ADD CONSTRAINT شکست می‌خوره — پس اول
            # تکراری‌ها رو با نگه داشتن یکی پاک می‌کنیم
            await conn.execute(text("""
                DELETE FROM outage_cache a
                USING outage_cache b
                WHERE a.id > b.id
                  AND a.region_key = b.region_key
                  AND a.date = b.date
                  AND a.start_time IS NOT DISTINCT FROM b.start_time
            """))
            await conn.execute(text(
                "ALTER TABLE outage_cache "
                "ADD CONSTRAINT uq_region_date_start "
                "UNIQUE (region_key, date, start_time)"
            ))

    # ۵) ردیف‌های یتیم notifications_sent پاک میشن (FK قدیمی CASCADE نبود)
    await conn.execute(text("""
        DELETE FROM notifications_sent
        WHERE NOT EXISTS (
            SELECT 1 FROM locations WHERE locations.id = notifications_sent.location_id
        )
    """))


async def init_db():
    async with engine.begin() as conn:
        if engine.dialect.name == "postgresql":
            # برای fuzzy search (پیدا کردن مکان‌های مشابه) لازمه
            await conn.execute(text("CREATE EXTENSION IF NOT EXISTS pg_trgm"))
        await conn.run_sync(Base.metadata.create_all)
        await _migrate_existing_tables(conn)


@asynccontextmanager
async def get_session():
    async with SessionLocal() as session:
        yield session
