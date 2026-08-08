from telegram import InlineKeyboardButton, InlineKeyboardMarkup

from data.iran_divisions import PROVINCES

MAZANDARAN_CODE = "mazandaran"


def counties_keyboard() -> InlineKeyboardMarkup:
    """چون ربات فقط مازندران رو پوشش می‌ده، این کیبورد همیشه شهرستان‌های همین استانه"""
    counties = PROVINCES[MAZANDARAN_CODE]["counties"]
    rows = []
    items = list(counties.items())
    for i in range(0, len(items), 2):
        row = []
        for code, fa_name in items[i : i + 2]:
            row.append(InlineKeyboardButton(fa_name, callback_data=f"county:{code}"))
        rows.append(row)
    return InlineKeyboardMarkup(rows)


def confirm_keyboard() -> InlineKeyboardMarkup:
    return InlineKeyboardMarkup(
        [
            [InlineKeyboardButton("تایید و ثبت", callback_data="confirm_location")],
            [InlineKeyboardButton("لغو", callback_data="cancel_flow")],
        ]
    )


def matches_keyboard(candidates: list[dict]) -> InlineKeyboardMarkup:
    rows = []
    for i, c in enumerate(candidates):
        label = f"{c['city_fa']} - {c['district_fa']}"
        rows.append([InlineKeyboardButton(label, callback_data=f"pick_match:{i}")])
    rows.append([InlineKeyboardButton("هیچکدوم، مورد جدیده", callback_data="use_new")])
    return InlineKeyboardMarkup(rows)


def main_menu_keyboard(nightly_summary_enabled: bool = True) -> InlineKeyboardMarkup:
    toggle_label = (
        "🔕 خاموش‌کردن خلاصه‌ی شبانه"
        if nightly_summary_enabled
        else "🔔 روشن‌کردن خلاصه‌ی شبانه"
    )
    return InlineKeyboardMarkup(
        [
            [InlineKeyboardButton("افزودن مکان جدید", callback_data="add_location")],
            [InlineKeyboardButton("مکان‌های من", callback_data="my_locations")],
            [InlineKeyboardButton(toggle_label, callback_data="toggle_nightly")],
        ]
    )


def back_to_locations_keyboard() -> InlineKeyboardMarkup:
    return InlineKeyboardMarkup(
        [[InlineKeyboardButton("بازگشت به مکان‌های من", callback_data="my_locations")]]
    )


def location_list_keyboard(locations) -> InlineKeyboardMarkup:
    rows = []
    for loc in locations:
        label = f"{loc.city_fa} - {loc.district_fa}"
        rows.append(
            [InlineKeyboardButton(f"⚡ الان وضعیت قطعی: {label}", callback_data=f"check_now:{loc.id}")]
        )
        rows.append(
            [InlineKeyboardButton(f"🗑 حذف: {label}", callback_data=f"delete_loc:{loc.id}")]
        )
    rows.append([InlineKeyboardButton("بازگشت به منو", callback_data="back_to_menu")])
    return InlineKeyboardMarkup(rows)
