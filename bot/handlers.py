import datetime as dt
import logging
from collections import defaultdict
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
    PAGE_SIZE,
    back_to_locations_keyboard,
    confirm_keyboard,
    counties_keyboard,
    location_list_keyboard,
    main_menu_keyboard,
)

from data.iran_divisions import PROVINCES

from db.database import get_session
from db.models import Location, OutageCache, User

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
    page: int = 0,
):
    """
    لیست مکان‌ها با صفحه‌بندی. هم از دکمه‌ی منو صدا زده میشه و هم
    از دکمه‌های ◀️/▶️ صفحه‌بندی (با پارامتر page).
    """

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

    # اگه صفحه درخواستی خارج از بازه باشه، به صفحه‌ی معتبر محدود میشه
    per_page = PAGE_SIZE

    total_pages = max(
        1,
        -(-len(locations) // per_page),
    )

    page = max(0, min(page, total_pages - 1))

    lines = [
        "🗺 مکان‌های ثبت‌شده‌ی شما:\n"
    ]

    start = page * per_page

    for index, loc in enumerate(
        locations[start:start + per_page],
        start=start + 1,
    ):

        lines.append(
            f"{index}️⃣ "
            f"{loc.city_fa} / "
            f"{loc.district_fa}"
        )

    if total_pages > 1:
        lines.append(
            f"\nصفحه {page + 1} از {total_pages}"
        )

    lines.append(
        "\nبرای هر مکان می‌تونی وضعیت "
        "قطعی رو ببینی یا حذفش کنی."
    )

    await query.edit_message_text(
        "\n".join(lines),
        reply_markup=location_list_keyboard(
            locations,
            page=page,
            per_page=per_page,
        ),
    )


# ============================================================
# صفحه‌بندی لیست مکان‌ها
# ============================================================

async def my_locations_page(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    query = update.callback_query

    await query.answer()

    try:

        value = query.data.split(":", 1)[1]

    except (IndexError, AttributeError):

        return

    if value == "noop":
        return  # دکمه‌ی شماره صفحه غیرفعاله؛ فقط answer شد

    try:

        page = int(value)

    except ValueError:

        page = 0

    await my_locations(
        update,
        context,
        page=page,
    )


# ============================================================
# وضعیت فعلی قطعی
# ============================================================

def _format_outage_ranges(outages) -> str:
    """لیست بازه‌های قطعی یک مکان را به «۰۹:۰۰ تا ۱۰:۰۰ و ۱۷:۰۰ تا ...» تبدیل می‌کند"""

    ranges = []

    for outage in outages:

        rng = outage.start_time.strftime("%H:%M")

        if outage.end_time:
            rng += " تا " + outage.end_time.strftime("%H:%M")

        ranges.append(rng)

    return " و ".join(ranges)


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

        # چند قطعی در روز → همه‌ی ردیف‌های امروزِ این منطقه
        outages_result = await session.execute(
            select(OutageCache)
            .where(
                OutageCache.region_key == location.region_key,
                OutageCache.date == today,
                OutageCache.found == True,  # noqa: E712
                OutageCache.start_time.is_not(None),
            )
            .order_by(OutageCache.start_time)
        )

        outages = list(outages_result.scalars().all())

    label = (
        f"{location.city_fa} - "
        f"{location.district_fa}"
    )

    if not outages:

        text = (
            f"⚡ وضعیت الان برای {label}:\n\n"
            "طبق آخرین به‌روزرسانی (ساعت ۰۰:۳۰ شب)، قطعی "
            "برنامه‌ریزی‌شده‌ای برای امروز این منطقه پیدا نشد."
        )

    else:

        time_range = _format_outage_ranges(outages)

        note = outages[0].note or ""

        last_updated = max(
            (o.updated_at for o in outages if o.updated_at),
            default=None,
        )

        updated = (
            last_updated.strftime("%H:%M")
            if last_updated
            else "-"
        )

        note_line = f"\n\n📌 {note}" if note else ""

        text = (
            f"⚡ وضعیت الان برای {label}:\n\n"
            f"🕐 قطعی امروز: {time_range}"
            f"{note_line}\n\n"
            f"🔄 آخرین بروزرسانی: {updated}"
        )

    await query.edit_message_text(
        text,
        reply_markup=back_to_locations_keyboard(),
    )


# ============================================================
# داشبورد: وضعیت همه‌ی مکان‌ها در یک پیام
# ============================================================

async def status_dashboard(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):
    """داشبورد وضعیت همه‌ی مکان‌های کاربر در یک پیام (دکمه‌ی منو)"""

    query = update.callback_query

    await query.answer()

    await _render_dashboard(
        query.edit_message_text,
        update.effective_user.id,
        with_keyboard=True,
    )


async def status_dashboard_command(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):
    """/status — همون داشبورد، ولی به‌صورت دستور متنی"""

    await _render_dashboard(
        update.message.reply_text,
        update.effective_user.id,
        with_keyboard=True,
    )


async def _render_dashboard(
    reply_fn,
    telegram_id: int,
    with_keyboard: bool = True,
):

    async with get_session() as session:

        user = await session.scalar(
            select(User).where(User.telegram_id == telegram_id)
        )

        if user is None:

            await reply_fn(
                "اول /start رو بزن تا ثبت‌نام کنی."
            )

            return

        locations = await _get_user_locations(
            session,
            user.id,
        )

    if not locations:

        await reply_fn(
            "📍 هنوز هیچ مکانی ثبت نکردی. "
            "از منوی اصلی «افزودن مکان جدید» رو بزن."
        )

        return

    today = dt.datetime.now(TZ).date()

    region_keys = [loc.region_key for loc in locations]

    async with get_session() as session:

        outages_result = await session.execute(
            select(OutageCache)
            .where(
                OutageCache.region_key.in_(region_keys),
                OutageCache.date == today,
                OutageCache.found == True,  # noqa: E712
                OutageCache.start_time.is_not(None),
            )
            .order_by(OutageCache.start_time)
        )

        all_outages = outages_result.scalars().all()

    # گروه‌بندی بر اساس region_key (چند قطعی در روز → چند بازه پشت هم)
    outages_by_region = defaultdict(list)

    for outage in all_outages:
        outages_by_region[outage.region_key].append(outage)

    now = dt.datetime.now(TZ)

    lines = [
        f"📊 وضعیت قطعی امروز ({today.isoformat()}):\n"
    ]

    for loc in locations:

        label = f"{loc.city_fa} - {loc.district_fa}"

        outages = outages_by_region.get(loc.region_key, [])

        if not outages:
            lines.append(f"✅ {label}: قطعی نداره")
            continue

        ranges = _format_outage_ranges(outages)

        # آیا الان وسط قطعیه؟
        is_out_now = any(
            o.start_time <= now.time() and (o.end_time is None or now.time() <= o.end_time)
            for o in outages
        )

        icon = "🚫" if is_out_now else "⚡"

        lines.append(f"{icon} {label}: {ranges}")

    await reply_fn(
        "\n".join(lines),
        reply_markup=main_menu_keyboard(
            user.nightly_summary_enabled
        ),
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
        "DELETE CALLBACK: %s",
        query.data,
    )

    try:
        loc_id = int(
            query.data.split(":", 1)[1]
        )
    except (ValueError, IndexError):
        logger.error(
            "INVALID LOCATION ID: %s",
            query.data,
        )
        return

    logger.warning(
        "TRYING TO DELETE LOCATION ID=%s",
        loc_id,
    )

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        logger.warning(
            "CURRENT USER ID=%s",
            user.id,
        )

        location = await session.scalar(
            select(Location).where(
                Location.id == loc_id,
                Location.user_id == user.id,
            )
        )

        if location is None:

            logger.error(
                "LOCATION NOT FOUND: id=%s user_id=%s",
                loc_id,
                user.id,
            )

            await query.answer(
                "❌ مکان پیدا نشد.",
                show_alert=True,
            )

            return

        logger.warning(
            "FOUND LOCATION: id=%s region=%s",
            location.id,
            location.region_key,
        )

        await session.delete(location)

        logger.warning(
            "LOCATION MARKED FOR DELETE: id=%s",
            location.id,
        )

        await session.commit()

        logger.warning(
            "DELETE COMMITTED: id=%s",
            loc_id,
        )

    await query.edit_message_text(
        "✅ مکان با موفقیت حذف شد."
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

# ============================================================
# دستورات متنی (/) — منوی کنار دکمه‌ی سنجاق
# ============================================================

async def add_command(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):
    """/add — شروع جریان افزودن مکان (معادل دکمه‌ی منو)"""

    # همون entry_point کانورسیشن رو شبیه‌سازی می‌کنیم
    context.user_data["new_location"] = {
        "province_code": MAZANDARAN_CODE,
        "province_fa": PROVINCE_FA,
    }

    await update.message.reply_text(
        "شهر خودت رو انتخاب کن:",
        reply_markup=counties_keyboard(),
    )

    return CHOOSING_COUNTY


async def locations_command(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):
    """/locations — لیست مکان‌های ثبت‌شده (معادل دکمه‌ی منو)"""

    async with get_session() as session:

        user = await _get_or_create_user(
            session,
            update.effective_user,
        )

        locations = await _get_user_locations(
            session,
            user.id,
        )

    if not locations:

        await update.message.reply_text(
            "📍 هنوز هیچ مکانی ثبت نکردی. "
            "با /add اولین مکانت رو ثبت کن.",
            reply_markup=main_menu_keyboard(
                user.nightly_summary_enabled
            ),
        )

        return

    lines = ["🗺 مکان‌های ثبت‌شده‌ی شما:\n"]

    for index, loc in enumerate(locations, start=1):

        lines.append(
            f"{index}️⃣ {loc.city_fa} / {loc.district_fa}"
        )

    lines.append(
        "\nبرای هر مکان می‌تونی وضعیت قطعی رو ببینی یا حذفش کنی."
    )

    await update.message.reply_text(
        "\n".join(lines),
        reply_markup=location_list_keyboard(
            locations, page=0
        ),
    )


async def help_command(
    update: Update,
    context: ContextTypes.DEFAULT_TYPE,
):

    text = (
        "🤖 راهنمای ربات هشدار قطعی برق مازندران\n\n"
        "این ربات ساعت قطعی برق مناطق مازندران رو از "
        "سایت توزیع برق می‌گیره و بهت هشدار میده.\n\n"
        "📌 قابلیت‌ها:\n"
        "• تا ۳ مکان می‌تونی ثبت کنی\n"
        "• حدود ۱ ساعت قبل و ۱۰ دقیقه قبل از هر قطعی "
        "هشدار می‌گیری (برای هر قطعی جداگانه)\n"
        "• هر شب ساعت ۲۲:۱۵ خلاصه‌ی قطعی‌های فردا رو "
        "می‌فرستم (قابل خاموش کردن از منو)\n"
        "• با /status وضعیت همه‌ی مکان‌هات رو یکجا ببین\n\n"
        "⚡ دستورات:\n"
        "/status — داشبورد وضعیت امروز\n"
        "/add — افزودن مکان جدید\n"
        "/locations — لیست مکان‌های من\n"
        "/help — همین راهنما"
    )

    await update.message.reply_text(text)


def register_handlers(app):

    app.add_handler(
        CommandHandler(
            "start",
            start,
        )
    )

    app.add_handler(CommandHandler("help", help_command))
    app.add_handler(CommandHandler("locations", locations_command))

    # /add باید «داخل» کانورسیشن هم کار کنه (اگه وسط جریان دیگه‌ای بود)
    app.add_handler(CommandHandler("add", add_command))

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
            my_locations_page,
            pattern=r"^locs_page:(?:\d+|noop)$",
        )
    )

    app.add_handler(
        CallbackQueryHandler(
            status_dashboard,
            pattern="^status_dashboard$",
        )
    )

    app.add_handler(
        CommandHandler(
            "status",
            status_dashboard_command,
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
