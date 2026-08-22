import os
from dotenv import load_dotenv

load_dotenv()


def _clean_db_url(url: str) -> str:
    """ریلوی گاهی postgresql:// می‌ده که باید برای SQLAlchemy async به +asyncpg تبدیل بشه"""
    if url.startswith("postgresql://"):
        return url.replace("postgresql://", "postgresql+asyncpg://", 1)
    return url


TELEGRAM_BOT_TOKEN = os.getenv("TELEGRAM_BOT_TOKEN", "")

DATABASE_URL = _clean_db_url(os.getenv("DATABASE_URL", ""))

TIMEZONE = os.getenv("TIMEZONE", "Asia/Tehran")

MAX_LOCATIONS_PER_USER = int(os.getenv("MAX_LOCATIONS_PER_USER", "3"))

NOTIFY_MINUTES_BEFORE = int(os.getenv("NOTIFY_MINUTES_BEFORE", "10"))

# هشدار دوم: چند دقیقه قبل از قطعی (۰ یعنی خاموش). پیش‌فرض ۶۰ دقیقه.
NOTIFY_HOUR_BEFORE_MINUTES = int(os.getenv("NOTIFY_HOUR_BEFORE_MINUTES", "60"))

NIGHTLY_SUMMARY_HOUR = int(os.getenv("NIGHTLY_SUMMARY_HOUR", "22"))
NIGHTLY_SUMMARY_MINUTE = int(os.getenv("NIGHTLY_SUMMARY_MINUTE", "15"))

if not TELEGRAM_BOT_TOKEN:
    raise RuntimeError("TELEGRAM_BOT_TOKEN تنظیم نشده. فایل .env رو چک کن.")

if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL تنظیم نشده. فایل .env رو چک کن.")
