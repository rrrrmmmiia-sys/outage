from telegram import InlineKeyboardButton, InlineKeyboardMarkup

from data.iran_divisions import PROVINCES


MAZANDARAN_CODE = "mazandaran"

PAGE_SIZE = 5  # تعداد مکان در هر صفحه‌ی «مکان‌های من»


def counties_keyboard() -> InlineKeyboardMarkup:
    """
    چون ربات فقط مازندران رو پوشش می‌ده،
    این کیبورد همیشه شهرستان‌های همین استان رو نمایش می‌ده.
    """
    counties = PROVINCES[MAZANDARAN_CODE]["counties"]

    rows = []
    items = list(counties.items())

    for i in range(0, len(items), 2):
        row = []

        for code, fa_name in items[i:i + 2]:
            row.append(
                InlineKeyboardButton(
                    fa_name,
                    callback_data=f"county:{code}",
                )
            )

        rows.append(row)

    return InlineKeyboardMarkup(rows)


def confirm_keyboard() -> InlineKeyboardMarkup:
    return InlineKeyboardMarkup(
        [
            [
                InlineKeyboardButton(
                    "تایید و ثبت",
                    callback_data="confirm_location",
                )
            ],
            [
                InlineKeyboardButton(
                    "لغو",
                    callback_data="cancel_flow",
                )
            ],
        ]
    )


def main_menu_keyboard(
    nightly_summary_enabled: bool = True,
) -> InlineKeyboardMarkup:

    toggle_label = (
        "🔕 خاموش‌کردن خلاصه‌ی شبانه"
        if nightly_summary_enabled
        else "🔔 روشن‌کردن خلاصه‌ی شبانه"
    )

    return InlineKeyboardMarkup(
        [
            [
                InlineKeyboardButton(
                    "➕ افزودن مکان جدید",
                    callback_data="add_location",
                )
            ],
            [
                InlineKeyboardButton(
                    "📍 مکان‌های من",
                    callback_data="my_locations",
                )
            ],
            [
                InlineKeyboardButton(
                    "📊 وضعیت امروز همه‌ی مکان‌ها",
                    callback_data="status_dashboard",
                )
            ],
            [
                InlineKeyboardButton(
                    toggle_label,
                    callback_data="toggle_nightly",
                )
            ],
        ]
    )


def back_to_locations_keyboard() -> InlineKeyboardMarkup:
    return InlineKeyboardMarkup(
        [
            [
                InlineKeyboardButton(
                    "📍 بازگشت به مکان‌های من",
                    callback_data="my_locations",
                )
            ]
        ]
    )


def location_list_keyboard(
    locations,
    page: int = 0,
    per_page: int = PAGE_SIZE,
) -> InlineKeyboardMarkup:
    """
    دکمه‌های مکان‌های ثبت‌شده کاربر با صفحه‌بندی.

    عمداً نام طولانی مکان را داخل دکمه قرار نمی‌دهیم،
    چون Telegram در موبایل ممکن است آن را با ... نمایش دهد.

    نام کامل مکان در متن پیام نمایش داده می‌شود.
    اگه تعداد مکان‌ها بیشتر از per_page باشه، ردیف ناوبری
    ◀️ ۱/۳ ▶️ هم اضافه میشه (دکمه‌ی شماره صفحه غیرفعاله).
    """

    rows = []

    start = page * per_page

    page_locs = locations[start:start + per_page]

    for loc in page_locs:

        rows.append(
            [
                InlineKeyboardButton(
                    "⚡ وضعیت قطعی",
                    callback_data=f"check_now:{loc.id}",
                ),
                InlineKeyboardButton(
                    "🗑 حذف",
                    callback_data=f"delete_loc:{loc.id}",
                ),
            ]
        )

    total_pages = max(
        1,
        -(-len(locations) // per_page),  # ceil division
    )

    if total_pages > 1:

        navigation = []

        if page > 0:
            navigation.append(
                InlineKeyboardButton(
                    "◀️ قبلی",
                    callback_data=f"locs_page:{page - 1}",
                )
            )

        navigation.append(
            InlineKeyboardButton(
                f"{page + 1}/{total_pages}",
                callback_data="locs_page:noop",
            )
        )

        if page < total_pages - 1:
            navigation.append(
                InlineKeyboardButton(
                    "بعدی ▶️",
                    callback_data=f"locs_page:{page + 1}",
                )
            )

        rows.append(navigation)

    rows.append(
        [
            InlineKeyboardButton(
                "↩️ بازگشت به منو",
                callback_data="back_to_menu",
            )
        ]
    )

    return InlineKeyboardMarkup(rows)
