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

CHOOSING_COUNTY, TYPING_CITY, TYPING_DISTRICT, CHOOSING_MATCH, CONFIRMING = range(5)

PROVINCE_FA = PROVINCES[MAZANDARAN_CODE]["fa"]


def _confirm_text(loc: dict) -> str:
    return (
        f"استان: {loc['province_fa']}\n"
        f"شهرستان: {loc['county_fa']}\n"
        f"شهر/روستا: {loc['city_fa']}\n"
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


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    async with get_session() as session:
        await _get_or_create_user(session, update.effective_user)

    await update.message.reply_text(
        f"سلام! این ربات فقط برای استان {PROVINCE_FA} فعاله.\n"
        f"می‌تونی تا {config.MAX_LOCATIONS_PER_USER} مکان ثبت کنی تا هر روز ساعت قطعی برقش رو بهت بگم "
        "و ۱۰ دقیقه قبل از شروع قطعی هشدار بدم.",
        reply_markup=main_menu_keyboard(),
    )


async def show_main_menu(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    await query.edit_message_text("منوی اصلی:", reply_markup=main_menu_keyboard())


async def add_location_start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        count = len(user.locations)

    if count >= config.MAX_LOCATIONS_PER_USER:
        await query.edit_message_text(
            f"شما در حال حاضر {config.MAX_LOCATIONS_PER_USER} مکان ثبت کردید. "
            "برای افزودن مکان جدید، اول یکی از مکان‌های قبلی رو حذف کن.",
            reply_markup=main_menu_keyboard(),
        )
        return ConversationHandler.END

    context.user_data["new_location"] = {
        "province_code": MAZANDARAN_CODE,
        "province_fa": PROVINCE_FA,
    }
    await query.edit_message_text(
        f"استان {PROVINCE_FA} انتخاب شد. حالا شهرستان رو انتخاب کن:",
        reply_markup=counties_keyboard(),
    )
    return CHOOSING_COUNTY


async def county_chosen(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    county_code = query.data.split(":", 1)[1]
    county_fa = PROVINCES[MAZANDARAN_CODE]["counties"][county_code]

    context.user_data["new_location"]["county_code"] = county_code
    context.user_data["new_location"]["county_fa"] = county_fa

    await query.edit_message_text("اسم شهر یا روستا رو تایپ کن:")
    return TYPING_CITY


async def city_typed(update: Update, context: ContextTypes.DEFAULT_TYPE):
    city = update.message.text.strip()
    if len(city) < 2:
        await update.message.reply_text("اسم شهر/روستا خیلی کوتاهه، دوباره بفرست:")
        return TYPING_CITY

    context.user_data["new_location"]["city_fa"] = city
    await update.message.reply_text("اسم منطقه یا محله رو تایپ کن:")
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
            "مکان‌های مشابهی تو دیتابیس پیدا شد. اگه یکیشون دقیقاً مکان خودته "
            "انتخابش کن (این‌جوری دیگه لازم نیست دوباره براش سرچ بشه)، "
            "وگرنه بزن «هیچکدوم»:",
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
        if len(user.locations) >= config.MAX_LOCATIONS_PER_USER:
            await query.edit_message_text(
                f"شما در حال حاضر {config.MAX_LOCATIONS_PER_USER} مکان ثبت کردید.",
                reply_markup=main_menu_keyboard(),
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

    context.user_data.pop("new_location", None)
    context.user_data.pop("match_candidates", None)
    await query.edit_message_text(
        "مکان با موفقیت ثبت شد. از امشب ساعت ۲۲:۰۰ ساعت قطعی فردا برات چک میشه.",
        reply_markup=main_menu_keyboard(),
    )
    return ConversationHandler.END


async def cancel_flow(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()
    context.user_data.pop("new_location", None)
    context.user_data.pop("match_candidates", None)
    await query.edit_message_text("لغو شد.", reply_markup=main_menu_keyboard())
    return ConversationHandler.END


async def my_locations(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    async with get_session() as session:
        user = await _get_or_create_user(session, update.effective_user)
        locations = user.locations

    if not locations:
        await query.edit_message_text(
            "هنوز مکانی ثبت نکردی.", reply_markup=main_menu_keyboard()
        )
        return

    lines = ["مکان‌های ثبت‌شده‌ی شما:\n"]
    for loc in locations:
        lines.append(f"- {loc.county_fa} / {loc.city_fa} / {loc.district_fa}")

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

    await query.edit_message_text("مکان حذف شد.", reply_markup=main_menu_keyboard())


def build_conversation_handler() -> ConversationHandler:
    return ConversationHandler(
        entry_points=[CallbackQueryHandler(add_location_start, pattern="^add_location$")],
        states={
            CHOOSING_COUNTY: [
                CallbackQueryHandler(county_chosen, pattern="^county:"),
            ],
            TYPING_CITY: [
                MessageHandler(filters.TEXT & ~filters.COMMAND, city_typed),
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
