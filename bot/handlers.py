import logging

from sqlalchemy import select
from telegram import Update
from telegram.ext import (
    CallbackQueryHandler,
    CommandHandler,
    ContextTypes,
    ConversationHandler,
    MessageHandler,
    filters,
)

import config
from bot.keyboards import (
    MAZANDARAN_CODE,
    confirm_keyboard,
    counties_keyboard,
    location_list_keyboard,
    main_menu_keyboard,
    matches_keyboard,
)
from data.iran_divisions import PROVINCES
from db.database import get_session
from db.models import Location, User
from services.outage_service import build_region_key, find_similar_locations

logger = logging.getLogger(__name__)

CHOOSING_COUNTY, TYPING_DISTRICT, CHOOSING_MATCH, CONFIRMING = range(4)

PROVINCE_FA = PROVINCES[MAZANDARAN_CODE]["fa"]


def _confirm_text(loc: dict) -> str:
    return (
        f"استان: {loc['province_fa']}\n"
        f"شهر: {loc['city_fa']}\n"
        f"منطقه: {loc['district_fa']}\n\n"
        "این اطلاعات درسته؟"
    )


async def _get_or_create_user(session, telegram_user) -> User:
    user = await session.scalar(
        select(User).where(User.telegram_id == telegram_user.id)
    )
    if user is None:
        user = User(telegram_id=telegram_user.id, first_name=telegram_user.first_name)
        session.add(user)
        await session.commit()
        await session.refresh(user)
    return user


async def _get_user_locations(session, user_id: int) -> list[Location]:
    """
    به‌جای user.locations (که lazy loading رو در SQLAlchemy async پشتیبانی
    نمی‌کنه و باعث کرش خاموش هندلر میشه)، مستقیم کوئری می‌زنیم.
    """
    result = await session.execute(
        select(Location).where(Location.user_id == user_id)
    )
    return list(result.scalars().all())


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        nightly = user.nightly_summary_enabled

    await update.message.reply_text(
        f"سلام! این ربات فقط برای استان {PROVINCE_FA} فعاله.\n"
        f"می‌تونی تا {config.MAX_LOCATIONS_PER_USER} مکان ثبت کنی تا هر روز ساعت قطعی برقش رو بهت بگم "
        "و ۱۰ دقیقه قبل از شروع قطعی هشدار بدم.",
        reply_markup=main_menu_keyboard(nightly),
    )


async def show_main_menu(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        nightly = user.nightly_summary_enabled

    await query.edit_message_text("منوی اصلی:", reply_markup=main_menu_keyboard(nightly))


async def toggle_nightly_summary(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        user.nightly_summary_enabled = not user.nightly_summary_enabled
        await session.commit()
        nightly = user.nightly_summary_enabled

    status_text = "روشن شد ✅" if nightly else "خاموش شد ❌"
    await query.edit_message_text(
        f"خلاصه‌ی شبانه {status_text}\n\n"
        "(این خلاصه هر شب ساعت ۲۲ به شما می‌گه فردا برق منطقه‌هاتون ساعت چند قطع میشه؛ "
        "هشدار ۱۰ دقیقه‌ی قبل از قطعی مستقل از این تنظیمه و همیشه فعاله)",
        reply_markup=main_menu_keyboard(nightly),
    )


async def add_location_start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        count = len(await _get_user_locations(session, user.id))
        nightly = user.nightly_summary_enabled

    if count >= config.MAX_LOCATIONS_PER_USER:
        await query.edit_message_text(
            f"شما در حال حاضر {config.MAX_LOCATIONS_PER_USER} مکان ثبت کردید. "
            "برای افزودن مکان جدید، اول یکی از مکان‌های قبلی رو حذف کن.",
            reply_markup=main_menu_keyboard(nightly),
        )
        return ConversationHandler.END

    context.user_data["new_location"] = {
        "province_code": MAZANDARAN_CODE,
        "province_fa": PROVINCE_FA,
    }
    await query.edit_message_text(
        "شهر خودت رو انتخاب کن:", reply_markup=counties_keyboard()
    )
    return CHOOSING_COUNTY


async def county_chosen(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    county_code = query.data.split(":", 1)[1]
    city_fa = PROVINCES[MAZANDARAN_CODE]["counties"][county_code]

    # چون دیگه مرحله‌ی جدای «تایپ شهر» نداریم، شهر انتخاب‌شده مستقیم city ثبت میشه
    context.user_data["new_location"]["county_code"] = county_code
    context.user_data["new_location"]["county_fa"] = city_fa
    context.user_data["new_location"]["city_fa"] = city_fa

    await query.edit_message_text(
        "به منظور نتیجه‌ی بهتر برای شما، فقط یک کلمه کلیدی از منطقه‌ی خود را تایپ کنید:"
    )
    return TYPING_DISTRICT


async def district_typed(update: Update, context: ContextTypes.DEFAULT_TYPE):
    district = update.message.text.strip()
    if len(district) < 2:
        await update.message.reply_text("اسم منطقه خیلی کوتاهه، دوباره بفرست:")
        return TYPING_DISTRICT

    loc = context.user_data["new_location"]
    loc["district_fa"] = district

    async with get_session() as session:
        matches = await find_similar_locations(
            session, loc["county_code"], loc["city_fa"], district
        )

    if matches:
        context.user_data["match_candidates"] = matches
        await update.message.reply_text(
            "چند تا منطقه‌ی مشابه با همین کلمه تو دیتابیس پیدا شد. "
            "اگه یکیشون دقیقاً مکان خودته انتخابش کن، وگرنه بزن «هیچکدوم»:",
            reply_markup=matches_keyboard(matches),
        )
        return CHOOSING_MATCH

    await update.message.reply_text(_confirm_text(loc), reply_markup=confirm_keyboard())
    return CONFIRMING


async def pick_match(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    idx = int(query.data.split(":", 1)[1])
    candidates = context.user_data.get("match_candidates", [])

    if idx >= len(candidates):
        await query.edit_message_text("خطایی رخ داد، دوباره شروع کن.")
        return ConversationHandler.END

    chosen = candidates[idx]
    loc = context.user_data["new_location"]
    # عیناً همون مقادیر و همون region_key رکورد قبلی رو کپی می‌کنیم تا کش reuse بشه
    loc["city_fa"] = chosen["city_fa"]
    loc["district_fa"] = chosen["district_fa"]
    loc["region_key"] = chosen["region_key"]

    await query.edit_message_text(_confirm_text(loc), reply_markup=confirm_keyboard())
    return CONFIRMING


async def use_new_location(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    loc = context.user_data["new_location"]
    await query.edit_message_text(_confirm_text(loc), reply_markup=confirm_keyboard())
    return CONFIRMING


async def confirm_location(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    loc = context.user_data.get("new_location")
    if not loc:
        await query.edit_message_text("خطایی رخ داد، دوباره شروع کن.")
        return ConversationHandler.END

    # اگه از یه مکان مشابه‌ی قبلی انتخاب شده، همون region_key استفاده میشه؛
    # وگرنه یه region_key جدید از روی متن تایپ‌شده ساخته میشه
    region_key = loc.get("region_key") or build_region_key(
        loc["province_code"], loc["county_code"], loc["city_fa"], loc["district_fa"]
    )

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        if len(await _get_user_locations(session, user.id)) >= config.MAX_LOCATIONS_PER_USER:
            await query.edit_message_text(
                f"شما در حال حاضر {config.MAX_LOCATIONS_PER_USER} مکان ثبت کردید.",
                reply_markup=main_menu_keyboard(user.nightly_summary_enabled),
            )
            return ConversationHandler.END

        new_loc = Location(
            user_id=user.id,
            province_code=loc["province_code"],
            province_fa=loc["province_fa"],
            county_code=loc["county_code"],
            county_fa=loc["county_fa"],
            city_fa=loc["city_fa"],
            district_fa=loc["district_fa"],
            region_key=region_key,
        )
        session.add(new_loc)
        await session.commit()
        nightly = user.nightly_summary_enabled

    context.user_data.pop("new_location", None)
    context.user_data.pop("match_candidates", None)
    await query.edit_message_text(
        "مکان با موفقیت ثبت شد. از امشب ساعت ۲۲:۰۰ ساعت قطعی فردا برات چک میشه.",
        reply_markup=main_menu_keyboard(nightly),
    )
    return ConversationHandler.END


async def cancel_flow(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    context.user_data.pop("new_location", None)
    context.user_data.pop("match_candidates", None)

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        nightly = user.nightly_summary_enabled

    await query.edit_message_text("لغو شد.", reply_markup=main_menu_keyboard(nightly))
    return ConversationHandler.END


async def my_locations(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        locations = await _get_user_locations(session, user.id)
        nightly = user.nightly_summary_enabled

    if not locations:
        await query.edit_message_text(
            "هنوز مکانی ثبت نکردی.", reply_markup=main_menu_keyboard(nightly)
        )
        return

    lines = ["مکان‌های ثبت‌شده‌ی شما:\n"]
    for loc in locations:
        lines.append(f"- {loc.city_fa} / {loc.district_fa}")

    await query.edit_message_text(
        "\n".join(lines), reply_markup=location_list_keyboard(locations)
    )


async def delete_location(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    loc_id = int(query.data.split(":", 1)[1])

    async with get_session() as session:
        location = await session.get(Location, loc_id)
        if location:
            await session.delete(location)
            await session.commit()
        user = await _get_or_create_user(session, update.effective_user)
        nightly = user.nightly_summary_enabled

    await query.edit_message_text("مکان حذف شد.", reply_markup=main_menu_keyboard(nightly))


def build_conversation_handler() -> ConversationHandler:
    return ConversationHandler(
        entry_points=[CallbackQueryHandler(add_location_start, pattern="^add_location$")],
        states={
            CHOOSING_COUNTY: [
                CallbackQueryHandler(county_chosen, pattern="^county:"),
            ],
            TYPING_DISTRICT: [
                MessageHandler(filters.TEXT & ~filters.COMMAND, district_typed),
            ],
            CHOOSING_MATCH: [
                CallbackQueryHandler(pick_match, pattern="^pick_match:"),
                CallbackQueryHandler(use_new_location, pattern="^use_new$"),
            ],
            CONFIRMING: [
                CallbackQueryHandler(confirm_location, pattern="^confirm_location$"),
                CallbackQueryHandler(cancel_flow, pattern="^cancel_flow$"),
            ],
        },
        fallbacks=[CallbackQueryHandler(cancel_flow, pattern="^cancel_flow$")],
        per_message=False,
    )


def register_handlers(app):
    app.add_handler(CommandHandler("start", start))
    app.add_handler(build_conversation_handler())
    app.add_handler(CallbackQueryHandler(show_main_menu, pattern="^back_to_menu$"))
    app.add_handler(CallbackQueryHandler(my_locations, pattern="^my_locations$"))
    app.add_handler(CallbackQueryHandler(delete_location, pattern="^delete_loc:"))
    app.add_handler(CallbackQueryHandler(toggle_nightly_summary, pattern="^toggle_nightly$"))
