from telegram import InlineKeyboardButton, InlineKeyboardMarkup

from data.iran_divisions import PROVINCES


MAZANDARAN_CODE = "mazandaran"


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


def location_list_keyboard(locations) -> InlineKeyboardMarkup:
    """
    دکمه‌های مکان‌های ثبت‌شده کاربر.

    عمداً نام طولانی مکان را داخل دکمه قرار نمی‌دهیم،
    چون Telegram در موبایل ممکن است آن را با ... نمایش دهد.

    نام کامل مکان در متن پیام نمایش داده می‌شود.
    """

    rows = []

    for loc in locations:

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

    rows.append(
        [
            InlineKeyboardButton(
                "↩️ بازگشت به منو",
                callback_data="back_to_menu",
            )
        ]
    )

    return InlineKeyboardMarkup(rows)
