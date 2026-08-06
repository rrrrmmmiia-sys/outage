import asyncio
import logging

from telegram.ext import ApplicationBuilder

import config
from bot.handlers import register_handlers
from db.database import init_db
from services.scheduler import setup_scheduler

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)


async def _post_init(application):
    await init_db()
    logger.info("دیتابیس آماده شد")
    setup_scheduler(application.bot)
    logger.info("زمان‌بند فعال شد")


def main():
    application = (
        ApplicationBuilder()
        .token(config.TELEGRAM_BOT_TOKEN)
        .post_init(_post_init)
        .build()
    )

    register_handlers(application)

    logger.info("ربات در حال اجراست...")
    application.run_polling(allowed_updates=["message", "callback_query"])


if __name__ == "__main__":
    main()
