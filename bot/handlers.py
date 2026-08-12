import datetime as dt
import logging
from zoneinfo import ZoneInfo

from sqlalchemy import select

from telegram import (
    InlineKeyboardButton,
    InlineKeyboardMarkup,
    Update,
)

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
    back_to_locations_keyboard,
    confirm_keyboard,
    counties_keyboard,
    location_list_keyboard,
    main_menu_keyboard,
)

from data.iran_divisions import PROVINCES

from db.database import get_session
from db.models import Location, User

from services.outage_service import (
    build_region_key,
    find_similar_locations,
    find_similar_outage_entries,
    get_cached_outage,
)


logger = logging.getLogger(__name__)


TZ = ZoneInfo(config.TIMEZONE)


CHOOSING_COUNTY, TYPING_DISTRICT, CHOOSING_MATCH, CONFIRMING = range(4)


PROVINCE_FA = PROVINCES[MAZANDARAN_CODE]["fa"]


# ============================================================
# تنظیمات صفحه‌بندی
# ============================================================

MATCHES_PER_PAGE = 5


# ============================================================
# متن تایید مکان
# ============================================================

def _confirm_text(loc: dict) -> str:
    return (
        f"استان: {loc['province_fa']}\n"
        f"شهر: {loc['city_fa']}\n"
        f"منطقه: {loc['district_fa']}\n\n"
        "این اطلاعات درسته؟"
    )


# ============================================================
# متن نتایج جستجو
# ============================================================

def _matches_text(
    candidates: list[dict],
    page: int,
) -> str:
    """
    نام کامل مناطق در متن پیام نمایش داده می‌شود
    تا Telegram روی موبایل آن‌ها را با ... قطع نکند.
    """

    total = len(candidates)

    if total == 0:
        return "هیچ منطقه‌ای پیدا نشد."

    total_pages = (
        total + MATCHES_PER_PAGE - 1
    ) // MATCHES_PER_PAGE

    start = page * MATCHES_PER_PAGE

    end = min(
        start + MATCHES_PER_PAGE,
        total,
    )

    current = candidates[start:end]

    lines = [
        "📍 مناطق پیدا شده:\n",
        f"صفحه {page + 1} از {total_pages}\n",
    ]

    for local_index, candidate in enumerate(
        current,
        start=1,
    ):
        lines.append(
            f"{local_index}️⃣ "
            f"{candidate['city_fa']} - "
            f"{candidate['district_fa']}"
        )

    lines.append(
        "\n👇 برای انتخاب منطقه روی شماره آن بزن."
    )

    return "\n".join(lines)


# ============================================================
# Keyboard صفحه‌بندی نتایج
# ============================================================

def _matches_keyboard(
    candidates: list[dict],
    page: int,
) -> InlineKeyboardMarkup:

    total = len(candidates)

    start = page * MATCHES_PER_PAGE

    end = min(
        start + MATCHES_PER_PAGE,
        total,
    )

    current = candidates[start:end]

    keyboard = []

    # --------------------------------------------------------
    # دکمه‌های شماره مناطق
    # --------------------------------------------------------

    row = []

    for local_index, _candidate in enumerate(
        current
    ):
        absolute_index = start + local_index

        row.append(
            InlineKeyboardButton(
                text=f"{local_index + 1}️⃣",
                callback_data=(
                    f"pick_match:{absolute_index}"
                ),
            )
        )

    if row:
        keyboard.append(row)

    # --------------------------------------------------------
    # صفحه‌بندی
    # --------------------------------------------------------

    total_pages = max(
        1,
        (
            total + MATCHES_PER_PAGE - 1
        ) // MATCHES_PER_PAGE,
    )

    navigation = []

    if page > 0:
        navigation.append(
            InlineKeyboardButton(
                "◀️ قبلی",
                callback_data=(
                    f"match_page:{page - 1}"
                ),
            )
        )

    navigation.append(
        InlineKeyboardButton(
            f"{page + 1}/{total_pages}",
            callback_data="match_page:noop",
        )
    )

    if page < total_pages - 1:
        navigation.append(
            InlineKeyboardButton(
                "بعدی ▶️",
                callback_data=(
                    f"match_page:{page + 1}"
                ),
            )
        )

    keyboard.append(navigation)

    # --------------------------------------------------------
    # گزینه منطقه جدید
    # --------------------------------------------------------

    keyboard.append(
        [
            InlineKeyboardButton(
                "❌ هیچکدام، منطقه جدید است",
                callback_data="use_new",
            )
        ]
    )

    return InlineKeyboardMarkup(keyboard)


# ============================================================
# User
# ============================================================

async def _get_or_create_user(
    session,
    telegram_user,
) -> User:

    user = await session.scalar(
        select(User).where(
            User.telegram_id == telegram_user.id
        )
    )

    if user is None:
        user = User(
            telegram_id=telegram_user.id,
            first_name=telegram_user.first_name,
        )

        session.add(user)

        await session.commit()
        await session.refresh(user)

    return user


# ============================================================
# مکان‌های کاربر
# ============================================================

async def _get_user_locations(
    session,
    user_id: int,
) -> list[Location]:

    result = await session.execute(
        select(Location)
        .where(Location.user_id == user_id)
        .order_by(Location.id)
    )

    return list(result.scalars().all())


# ============================================================
# START
# ============================================================

async def start(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        nightly = user.nightly_summary_enabled

    await update.message.reply_text(
        f"سلام! این ربات فقط برای استان "
        f"{PROVINCE_FA} فعاله.\n\n"
        f"می‌تونی تا "
        f"{config.MAX_LOCATIONS_PER_USER} "
        "مکان ثبت کنی تا هر روز ساعت قطعی برقش "
        "رو بهت بگم و ۱۰ دقیقه قبل از شروع قطعی "
        "هشدار بدم.",
        reply_markup=main_menu_keyboard(nightly),
    )


# ============================================================
# منوی اصلی
# ============================================================

async def show_main_menu(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        nightly = user.nightly_summary_enabled

    await query.edit_message_text(
        "منوی اصلی:",
        reply_markup=main_menu_keyboard(nightly),
    )


# ============================================================
# خلاصه شبانه
# ============================================================

async def toggle_nightly_summary(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        user.nightly_summary_enabled = (
            not user.nightly_summary_enabled
        )

        await session.commit()

        nightly = user.nightly_summary_enabled

    status_text = (
        "روشن شد ✅"
        if nightly
        else "خاموش شد ❌"
    )

    await query.edit_message_text(
        f"خلاصه‌ی شبانه {status_text}\n\n"
        "این خلاصه هر شب ساعت ۲۲ به شما می‌گه "
        "فردا برق منطقه‌هاتون ساعت چند قطع میشه.\n\n"
        "هشدار ۱۰ دقیقه‌ی قبل از قطعی مستقل از "
        "این تنظیمه و همیشه فعاله.",
        reply_markup=main_menu_keyboard(nightly),
    )


# ============================================================
# شروع ثبت مکان
# ============================================================

async def add_location_start(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        locations = await _get_user_locations(
            session,
            user.id,
        )

        count = len(locations)

        nightly = user.nightly_summary_enabled

    if count >= config.MAX_LOCATIONS_PER_USER:

        await query.edit_message_text(
            f"شما در حال حاضر "
            f"{config.MAX_LOCATIONS_PER_USER} "
            "مکان ثبت کردید.\n\n"
            "برای افزودن مکان جدید، اول یکی از "
            "مکان‌های قبلی رو حذف کن.",
            reply_markup=main_menu_keyboard(nightly),
        )

        return ConversationHandler.END

    context.user_data["new_location"] = {
        "province_code": MAZANDARAN_CODE,
        "province_fa": PROVINCE_FA,
    }

    await query.edit_message_text(
        "شهر خودت رو انتخاب کن:",
        reply_markup=counties_keyboard(),
    )

    return CHOOSING_COUNTY


# ============================================================
# انتخاب شهر
# ============================================================

async def county_chosen(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    county_code = query.data.split(
        ":",
        1,
    )[1]

    city_fa = (
        PROVINCES[MAZANDARAN_CODE]["counties"]
        [county_code]
    )

    context.user_data["new_location"][
        "county_code"
    ] = county_code

    context.user_data["new_location"][
        "county_fa"
    ] = city_fa

    context.user_data["new_location"][
        "city_fa"
    ] = city_fa

    await query.edit_message_text(
        "برای پیدا کردن منطقه، فقط یک کلمه "
        "کلیدی از اسم منطقه رو تایپ کن:"
    )

    return TYPING_DISTRICT


# ============================================================
# جستجوی منطقه
# ============================================================

async def district_typed(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    district = update.message.text.strip()

    if len(district) < 2:

        await update.message.reply_text(
            "اسم منطقه خیلی کوتاهه، دوباره بفرست:"
        )

        return TYPING_DISTRICT

    loc = context.user_data["new_location"]

    loc["district_fa"] = district

    today = dt.datetime.now(TZ).date()

    async with get_session() as session:

        # مکان‌های فعلی موجود در locations
        loc_matches = await find_similar_locations(
            session,
            loc["county_code"],
            loc["city_fa"],
            district,
            limit=1000,
        )

        # مناطق قطعی امروز
        outage_matches = (
            await find_similar_outage_entries(
                session,
                loc["county_code"],
                today,
                district,
                limit=1000,
            )
        )

    candidates = []

    # ========================================================
    # 1. مکان‌های موجود در locations
    # ========================================================

    active_region_keys = set()

    for match in loc_matches:

        region_key = match["region_key"]

        active_region_keys.add(region_key)

        candidates.append(
            {
                "region_key": region_key,
                "city_fa": match["city_fa"],
                "district_fa": match["district_fa"],
                "label": (
                    f"{match['city_fa']} - "
                    f"{match['district_fa']}"
                ),
            }
        )

    # ========================================================
    # 2. outage_cache
    # ========================================================

    for match in outage_matches:

        region_key = match["region_key"]

        note = (
            match.get("note") or ""
        ).strip()

        if not note:
            continue

        # اگر قبلاً همین منطقه در locations هست،
        # دوباره اضافه نکن.
        if region_key in active_region_keys:
            continue

        candidates.append(
            {
                "region_key": region_key,
                "city_fa": loc["city_fa"],
                "district_fa": note[:255],
                "label": f"{loc['city_fa']} - {note[:255]}",
            }
        )

    # ========================================================
    # حذف duplicate
    # ========================================================

    seen = set()

    deduped = []

    for candidate in candidates:

        region_key = candidate["region_key"]

        if region_key in seen:
            continue

        seen.add(region_key)

        deduped.append(candidate)

    candidates = deduped

    # ========================================================
    # نمایش نتایج
    # ========================================================

    if candidates:

        context.user_data[
            "match_candidates"
        ] = candidates

        context.user_data[
            "match_page"
        ] = 0

        await update.message.reply_text(
            _matches_text(
                candidates,
                0,
            ),
            reply_markup=_matches_keyboard(
                candidates,
                0,
            ),
        )

        return CHOOSING_MATCH

    # ========================================================
    # هیچ نتیجه‌ای پیدا نشد
    # ========================================================

    await update.message.reply_text(
        _confirm_text(loc),
        reply_markup=confirm_keyboard(),
    )

    return CONFIRMING


# ============================================================
# صفحه بعد / قبل
# ============================================================

async def matches_page(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    try:

        value = query.data.split(
            ":",
            1,
        )[1]

    except (IndexError, AttributeError):

        return CHOOSING_MATCH

    if value == "noop":

        return CHOOSING_MATCH

    try:

        page = int(value)

    except ValueError:

        return CHOOSING_MATCH

    candidates = context.user_data.get(
        "match_candidates",
        [],
    )

    if not candidates:

        await query.edit_message_text(
            "نتایج جستجو منقضی شده.\n\n"
            "دوباره منطقه رو جستجو کن."
        )

        return ConversationHandler.END

    total_pages = (
        len(candidates)
        + MATCHES_PER_PAGE
        - 1
    ) // MATCHES_PER_PAGE

    if page < 0 or page >= total_pages:

        return CHOOSING_MATCH

    context.user_data[
        "match_page"
    ] = page

    await query.edit_message_text(
        _matches_text(
            candidates,
            page,
        ),
        reply_markup=_matches_keyboard(
            candidates,
            page,
        ),
    )

    return CHOOSING_MATCH


# ============================================================
# انتخاب نتیجه
# ============================================================

async def pick_match(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    try:

        idx = int(
            query.data.split(
                ":",
                1,
            )[1]
        )

    except (ValueError, IndexError):

        await query.edit_message_text(
            "❌ انتخاب نامعتبر بود."
        )

        return ConversationHandler.END

    candidates = context.user_data.get(
        "match_candidates",
        [],
    )

    if idx < 0 or idx >= len(candidates):

        await query.edit_message_text(
            "❌ این نتیجه دیگر معتبر نیست.\n"
            "دوباره جستجو کن."
        )

        return ConversationHandler.END

    chosen = candidates[idx]

    loc = context.user_data[
        "new_location"
    ]

    loc["city_fa"] = chosen["city_fa"]

    loc["district_fa"] = (
        chosen["district_fa"]
    )

    loc["region_key"] = (
        chosen["region_key"]
    )

    await query.edit_message_text(
        _confirm_text(loc),
        reply_markup=confirm_keyboard(),
    )

    return CONFIRMING


# ============================================================
# منطقه جدید
# ============================================================

async def use_new_location(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    loc = context.user_data[
        "new_location"
    ]

    await query.edit_message_text(
        _confirm_text(loc),
        reply_markup=confirm_keyboard(),
    )

    return CONFIRMING


# ============================================================
# تایید ثبت مکان
# ============================================================

async def confirm_location(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    loc = context.user_data.get(
        "new_location"
    )

    if not loc:

        await query.edit_message_text(
            "خطایی رخ داد، دوباره شروع کن."
        )

        return ConversationHandler.END

    region_key = (
        loc.get("region_key")
        or build_region_key(
            loc["province_code"],
            loc["county_code"],
            loc["city_fa"],
            loc["district_fa"],
        )
    )

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        locations = await _get_user_locations(
            session,
            user.id,
        )

        if (
            len(locations)
            >= config.MAX_LOCATIONS_PER_USER
        ):

            await query.edit_message_text(
                f"شما در حال حاضر "
                f"{config.MAX_LOCATIONS_PER_USER} "
                "مکان ثبت کردید.",
                reply_markup=main_menu_keyboard(
                    user.nightly_summary_enabled
                ),
            )

            return ConversationHandler.END

        new_loc = Location(
            user_id=user.id,
            province_code=loc[
                "province_code"
            ],
            province_fa=loc[
                "province_fa"
            ],
            county_code=loc[
                "county_code"
            ],
            county_fa=loc[
                "county_fa"
            ],
            city_fa=loc[
                "city_fa"
            ],
            district_fa=loc[
                "district_fa"
            ],
            region_key=region_key,
        )

        session.add(new_loc)

        await session.commit()

        nightly = (
            user.nightly_summary_enabled
        )

    context.user_data.pop(
        "new_location",
        None,
    )

    context.user_data.pop(
        "match_candidates",
        None,
    )

    context.user_data.pop(
        "match_page",
        None,
    )

    await query.edit_message_text(
        "✅ مکان با موفقیت ثبت شد.\n\n"
        "از امشب ساعت ۲۲:۰۰، قطعی فردای "
        "این منطقه بررسی میشه.",
        reply_markup=main_menu_keyboard(
            nightly
        ),
    )

    return ConversationHandler.END


# ============================================================
# لغو
# ============================================================

async def cancel_flow(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    context.user_data.pop(
        "new_location",
        None,
    )

    context.user_data.pop(
        "match_candidates",
        None,
    )

    context.user_data.pop(
        "match_page",
        None,
    )

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        nightly = (
            user.nightly_summary_enabled
        )

    await query.edit_message_text(
        "لغو شد.",
        reply_markup=main_menu_keyboard(
            nightly
        ),
    )

    return ConversationHandler.END


# ============================================================
# مکان‌های من
# ============================================================

async def my_locations(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        locations = await _get_user_locations(
            session,
            user.id,
        )

        nightly = (
            user.nightly_summary_enabled
        )

    if not locations:

        await query.edit_message_text(
            "📍 هنوز هیچ مکانی ثبت نکردی.",
            reply_markup=main_menu_keyboard(
                nightly
            ),
        )

        return

    lines = [
        "🗺 مکان‌های ثبت‌شده‌ی شما:\n"
    ]

    for index, loc in enumerate(
        locations,
        start=1,
    ):

        lines.append(
            f"{index}️⃣ "
            f"{loc.city_fa} / "
            f"{loc.district_fa}"
        )

    lines.append(
        "\nبرای هر مکان می‌تونی وضعیت "
        "قطعی رو ببینی یا حذفش کنی."
    )

    await query.edit_message_text(
        "\n".join(lines),
        reply_markup=location_list_keyboard(
            locations
        ),
    )


# ============================================================
# وضعیت فعلی قطعی
# ============================================================

async def check_now_status(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    try:

        loc_id = int(
            query.data.split(
                ":",
                1,
            )[1]
        )

    except (ValueError, IndexError):

        await query.answer(
            "❌ شناسه مکان نامعتبر است.",
            show_alert=True,
        )

        return

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        location = await session.scalar(
            select(Location)
            .where(
                Location.id == loc_id,
                Location.user_id == user.id,
            )
        )

        if not location:

            await query.edit_message_text(
                "❌ این مکان پیدا نشد یا "
                "دیگه متعلق به شما نیست.",
                reply_markup=back_to_locations_keyboard(),
            )

            return

        today = dt.datetime.now(
            TZ
        ).date()

        cache = await get_cached_outage(
            session,
            location.region_key,
            today,
        )

    label = (
        f"{location.city_fa} - "
        f"{location.district_fa}"
    )

    if cache is None:

        text = (
            f"⚡ وضعیت الان برای {label}:\n\n"
            "هنوز هیچ اطلاعاتی برای امروز "
            "در دیتابیس ثبت نشده.\n\n"
            "ممکنه هرمس هنوز این منطقه رو "
            "برای امروز بررسی نکرده باشه."
        )

    elif (
        not cache.found
        or not cache.start_time
    ):

        text = (
            f"⚡ وضعیت الان برای {label}:\n\n"
            "طبق آخرین بررسی، قطعی "
            "برنامه‌ریزی‌شده‌ای برای امروز "
            "پیدا نشده."
        )

    else:

        time_range = (
            cache.start_time.strftime(
                "%H:%M"
            )
        )

        if cache.end_time:

            time_range += (
                " تا "
                + cache.end_time.strftime(
                    "%H:%M"
                )
            )

        note = (
            f"\n\n📌 {cache.note}"
            if cache.note
            else ""
        )

        updated = (
            cache.updated_at.strftime(
                "%H:%M"
            )
            if cache.updated_at
            else "-"
        )

        text = (
            f"⚡ وضعیت الان برای {label}:\n\n"
            f"🕐 قطعی امروز: "
            f"{time_range}"
            f"{note}\n\n"
            f"🔄 آخرین بروزرسانی: "
            f"{updated}"
        )

    await query.edit_message_text(
        text,
        reply_markup=back_to_locations_keyboard(),
    )


# ============================================================
# حذف مکان
# ============================================================

async def delete_location(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):
    query = update.callback_query

    await query.answer(
        "DELETE CALLBACK RECEIVED",
        show_alert=True,
    )

    logger.warning(
        "DELETE LOCATION CALLBACK RECEIVED: %s",
        query.data,
    )
        return

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        # فقط مکان متعلق به همین کاربر
        location = await session.scalar(
            select(Location)
            .where(
                Location.id == loc_id,
                Location.user_id == user.id,
            )
        )

        if location is None:

            locations = await _get_user_locations(
                session,
                user.id,
            )

            if locations:

                lines = [
                    "🗺 مکان‌های ثبت‌شده‌ی شما:\n"
                ]

                for index, loc in enumerate(
                    locations,
                    start=1,
                ):

                    lines.append(
                        f"{index}️⃣ "
                        f"{loc.city_fa} / "
                        f"{loc.district_fa}"
                    )

                lines.append(
                    "\nمکان موردنظر را انتخاب کن:"
                )

                await query.edit_message_text(
                    "\n".join(lines),
                    reply_markup=location_list_keyboard(
                        locations
                    ),
                )

            else:

                await query.edit_message_text(
                    "📍 هنوز هیچ مکانی ثبت نکردی.",
                    reply_markup=main_menu_keyboard(
                        user.nightly_summary_enabled
                    ),
                )

            return

        deleted_label = (
            f"{location.city_fa} / "
            f"{location.district_fa}"
        )

        # حذف واقعی Location
        await session.delete(location)

        await session.commit()

        # دریافت لیست جدید
        locations = await _get_user_locations(
            session,
            user.id,
        )

        nightly = (
            user.nightly_summary_enabled
        )

    # ========================================================
    # اگر هیچ مکان دیگری باقی نمانده
    # ========================================================

    if not locations:

        await query.edit_message_text(
            "🗑 مکان با موفقیت حذف شد.\n\n"
            f"📍 {deleted_label}\n\n"
            "در حال حاضر هیچ مکان دیگری "
            "ثبت نکردی.",
            reply_markup=main_menu_keyboard(
                nightly
            ),
        )

        return

    # ========================================================
    # نمایش دوباره مکان‌های من
    # ========================================================

    lines = [
        "🗺 مکان‌های ثبت‌شده‌ی شما:\n"
    ]

    for index, loc in enumerate(
        locations,
        start=1,
    ):

        lines.append(
            f"{index}️⃣ "
            f"{loc.city_fa} / "
            f"{loc.district_fa}"
        )

    lines.append(
        "\nبرای هر مکان می‌تونی وضعیت "
        "قطعی رو ببینی یا حذفش کنی."
    )

    await query.edit_message_text(
        "\n".join(lines),
        reply_markup=location_list_keyboard(
            locations
        ),
    )


# ============================================================
# Conversation Handler
# ============================================================

def build_conversation_handler() -> ConversationHandler:

    return ConversationHandler(

        entry_points=[
            CallbackQueryHandler(
                add_location_start,
                pattern="^add_location$",
            )
        ],

        states={

            CHOOSING_COUNTY: [
                CallbackQueryHandler(
                    county_chosen,
                    pattern="^county:",
                ),
            ],

            TYPING_DISTRICT: [
                MessageHandler(
                    filters.TEXT
                    & ~filters.COMMAND,
                    district_typed,
                ),
            ],

            CHOOSING_MATCH: [

                CallbackQueryHandler(
                    pick_match,
                    pattern=r"^pick_match:\d+$",
                ),

                CallbackQueryHandler(
                    matches_page,
                    pattern=r"^match_page:(?:\d+|noop)$",
                ),

                CallbackQueryHandler(
                    use_new_location,
                    pattern="^use_new$",
                ),
            ],

            CONFIRMING: [

                CallbackQueryHandler(
                    confirm_location,
                    pattern="^confirm_location$",
                ),

                CallbackQueryHandler(
                    cancel_flow,
                    pattern="^cancel_flow$",
                ),
            ],
        },

        fallbacks=[
            CallbackQueryHandler(
                cancel_flow,
                pattern="^cancel_flow$",
            )
        ],

        per_message=False,
    )


# ============================================================
# ثبت Handlerها
# ============================================================

def register_handlers(app):

    app.add_handler(
        CommandHandler(
            "start",
            start,
        )
    )

    app.add_handler(
        build_conversation_handler()
    )

    app.add_handler(
        CallbackQueryHandler(
            show_main_menu,
            pattern="^back_to_menu$",
        )
    )

    app.add_handler(
        CallbackQueryHandler(
            my_locations,
            pattern="^my_locations$",
        )
    )

    app.add_handler(
        CallbackQueryHandler(
            check_now_status,
            pattern="^check_now:",
        )
    )

    app.add_handler(
        CallbackQueryHandler(
            delete_location,
            pattern="^delete_loc:",
        )
    )

    app.add_handler(
        CallbackQueryHandler(
            toggle_nightly_summary,
            pattern="^toggle_nightly$",
        )
    )
