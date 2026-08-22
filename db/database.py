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

    # ۱) ردیف‌های یتیم notifications_sent پاک میشن (FK قدیمی CASCADE نبود)
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
