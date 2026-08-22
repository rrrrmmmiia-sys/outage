#!/usr/bin/env python3
"""
⚡ استخراج قطعی برق مازندران از baboliha.ir و ذخیره‌ی مستقیم در Postgres
────────────────────────────────────────────────────────────────────
نسخه‌ی جدید: به‌جای SQLite، مستقیم رو همون دیتابیس Postgres ای می‌نویسه
که ربات تلگرام ازش استفاده می‌کنه — بدون هیچ واسطه‌ای.

⚠️ پیش‌نیاز: قبل از اولین اجرای این اسکریپت، باید ربات حداقل یک‌بار
   بالا اومده باشه (که جدول‌ها و ایندکس‌های fuzz search رو خودش می‌سازه).
   این اسکریپت فقط INSERT/UPDATE می‌زنه، جدول نمی‌سازه.

نحوه‌ی اجرا:
  export DATABASE_URL="postgresql://user:pass@host:port/dbname"
  pip install psycopg2-binary
  python3 fetch_outages.py

اگه از بیرون شبکه‌ی Railway اجرا می‌کنی (لپ‌تاپ خودت، کرون جاب بیرونی و
غیره)، باید از DATABASE_PUBLIC_URL سرویس Postgres تو داشبورد Railway
استفاده کنی، نه DATABASE_URL داخلی.
"""

import datetime as dt
import os
import re
import sys
import urllib.request
from collections import defaultdict
from html import unescape

try:
    import psycopg2
    import psycopg2.extras
except ImportError:
    print("❌ psycopg2 نصب نیست. اول این رو بزن: pip install psycopg2-binary")
    sys.exit(1)

# ═══════════════════════════════════════════════════════════════
#  تنظیمات
# ═══════════════════════════════════════════════════════════════

WEBSITE_URL = "https://baboliha.ir/"
PROVINCE_CODE = "mazandaran"

# دقیقاً همون ۱۳ شهر و کدهایی که تو data/iran_divisions.py ربات هست.
# اگه شهر جدیدی به ربات اضافه شد، اینجا هم باید اضافه بشه.
# نکته‌ی مهم: کدها باید حرف‌به‌حرف با iran_divisions.py یکی باشن، وگرنه
# ربات هیچ‌وقت این رکوردها رو پیدا نمی‌کنه (یه باگ دقیقاً از همین جنس تو
# نسخه‌ی قبلی این اسکریپت برای "میاندرود" بود که اینجا اصلاح شده).
CITY_TO_COUNTY_CODE = {
    "آمل": "amol",
    "بابل": "babol",
    "قائمشهر": "qaemshahr",
    "بهشهر": "behshahr",
    "بابلسر": "babolsar",
    "جویبار": "juybar",
    "نكا": "neka",
    "نکا": "neka",
    "سوادکوه": "savadkuh",
    "سوادكوه شمالي": "savadkuh_shomali",
    "سوادکوه شمالی": "savadkuh_shomali",
    "مياندرود": "miandorud",
    "میاندرود": "miandorud",
    "گلوگاه": "galugah",
    "فريدون کنار": "fereydunkenar",
    "فریدون کنار": "fereydunkenar",
    "سيمرغ": "simorgh",
    "سیمرغ": "simorgh",
    # عمداً "ساري" رو نذاشتیم چون ربات فعلاً ساری رو تو لیست شهرهاش نداره.
    # اگه بعداً اضافه شد، اینجا هم باید اضافه بشه: "ساري": "sari",
}


# ═══════════════════════════════════════════════════════════════
#  نرمالایز متن فارسی/عربی (دقیقاً هم‌فرم با services/outage_service.py ربات)
# ═══════════════════════════════════════════════════════════════

def _fold_arabic_chars(text: str) -> str:
    """یکسان‌سازی کاراکترهای عربی و فارسی، چون دیتای خام سایت این دو رو قاطی داره"""
    text = text.replace("\u064a", "\u06cc")  # ي → ی
    text = text.replace("\u0643", "\u06a9")  # ك → ک
    return text


def _normalize(text: str) -> str:
    """دقیقاً همون منطق _normalize تو services/outage_service.py ربات"""
    text = text.strip().lower()
    text = re.sub(r"\s+", "_", text)
    return text


def build_region_key(county_code: str, city_fa: str, district_fa: str) -> str:
    norm_city = _normalize(city_fa)
    norm_district = _normalize(district_fa)
    return f"{PROVINCE_CODE}|{county_code}|{norm_city}|{norm_district}"


# ═══════════════════════════════════════════════════════════════
#  مرحله ۱: دانلود صفحه
# ═══════════════════════════════════════════════════════════════

def fetch_page(url: str) -> str:
    print(f"🌐 در حال دانلود {url} ...")
    # هدرهای HTTP باید ASCII باشن (استاندارد latin-1)، برای همین توضیح فارسی
    # اینجا نیست؛ توضیح کامل همین‌جا به‌عنوان کامنته: این ربات هشدار قطعی
    # برق مازندرانه و با اجازه‌ی مدیر سایت baboliha.ir این درخواست رو می‌زنه.
    req = urllib.request.Request(url, headers={
        "Accept-Language": "fa-IR,fa;q=0.9",
        "User-Agent": "tele-bragh-outage-bot/1.0 (+mazandaran power outage alert bot; used with site owner permission)",
    })
    with urllib.request.urlopen(req, timeout=30) as resp:
        html = resp.read().decode("utf-8")
    print(f"   ✅ دانلود شد ({len(html):,} کاراکتر)")
    return html


# ═══════════════════════════════════════════════════════════════
#  مرحله ۲: پارس کردن کارت‌های قطعی
# ═══════════════════════════════════════════════════════════════

def parse_outage_cards(html: str) -> list[dict]:
    parts = html.split('<li class="outage-card')
    cards = []

    for part in parts[1:]:
        date_match = re.search(r'data-gregorian-date="([^"]*)"', part)
        start_match = re.search(r'data-start="([^"]*)"', part)
        end_match = re.search(r'data-end="([^"]*)"', part)
        city_match = re.search(r'data-city="([^"]*)"', part)
        addr_match = re.search(
            r'class="card-address address-box"[^>]*>\s*(.*?)\s*</div>',
            part, re.DOTALL
        )

        if not all([date_match, start_match, end_match, city_match]):
            continue

        address = ""
        if addr_match:
            address = re.sub(r'<[^>]+>', '', addr_match.group(1)).strip()
            address = re.sub(r'\s+', ' ', address)
            address = unescape(address)

        cards.append({
            "date": date_match.group(1),
            "start": start_match.group(1),
            "end": end_match.group(1),
            "city": city_match.group(1),
            "address": address,
        })

    return cards


def filter_today(cards: list[dict], today: dt.date) -> list[dict]:
    today_str = today.isoformat()
    return [c for c in cards if c["date"] == today_str]


# ═══════════════════════════════════════════════════════════════
#  مرحله ۳: ساخت ردیف‌های آماده برای درج
# ═══════════════════════════════════════════════════════════════

def build_db_rows(cards: list[dict], today: dt.date) -> tuple[list[tuple], dict]:
    rows = []
    skipped = defaultdict(int)

    for card in cards:
        city_raw = card["city"]
        city_folded = _fold_arabic_chars(city_raw)

        county_code = CITY_TO_COUNTY_CODE.get(city_raw) or CITY_TO_COUNTY_CODE.get(city_folded)
        if not county_code:
            skipped[city_raw] += 1
            continue

        district = card["address"] if card["address"] else city_raw
        district_folded = _fold_arabic_chars(district)

        region_key = build_region_key(county_code, city_folded, district_folded)

        try:
            start_h, start_m = map(int, card["start"].split(":"))
            end_h, end_m = map(int, card["end"].split(":"))
        except ValueError:
            skipped[f"{city_raw} (ساعت نامعتبر)"] += 1
            continue

        note = district_folded[:1024] if district_folded else f"قطعی برق {city_folded}"

        rows.append((
            region_key,
            today,
            True,  # found
            dt.time(start_h, start_m),
            dt.time(end_h, end_m),
            note,
        ))

    if skipped:
        print(f"   ⚠️  رد شدند (شهر پشتیبانی‌نشده یا خطای پارس): {dict(skipped)}")

    return rows, skipped


# ═══════════════════════════════════════════════════════════════
#  مرحله ۴: نوشتن مستقیم روی Postgres پروژه‌ی ربات
# ═══════════════════════════════════════════════════════════════

def get_pg_connection():
    db_url = os.getenv("DATABASE_URL", "")
    if not db_url:
        print("❌ متغیر محیطی DATABASE_URL تنظیم نشده.")
        sys.exit(1)
    # psycopg2 با پیشوند postgresql+asyncpg:// که تو کد خود ربات استفاده میشه کار نمی‌کنه
    db_url = db_url.replace("postgresql+asyncpg://", "postgresql://", 1)
    return psycopg2.connect(db_url)


def upsert_rows(conn, rows: list[tuple]) -> dict:
    if not rows:
        return {
            "inserted_or_updated": 0,
            "duplicates_removed": 0,
        }

    # حذف duplicateها
    unique_rows = {}
    duplicates_removed = 0

    for row in rows:
        key = (row[0], row[1])

        if key in unique_rows:
            duplicates_removed += 1

        unique_rows[key] = row

    rows = list(unique_rows.values())

    query = """
        INSERT INTO outage_cache (
            region_key,
            date,
            found,
            start_time,
            end_time,
            note,
            updated_at
        )
        VALUES %s
        ON CONFLICT (region_key, date)
        DO UPDATE SET
            found = EXCLUDED.found,
            start_time = EXCLUDED.start_time,
            end_time = EXCLUDED.end_time,
            note = EXCLUDED.note,
            updated_at = NOW()
    """

    rows_with_timestamp = [
        (
            r[0],
            r[1],
            r[2],
            r[3],
            r[4],
            r[5],
            dt.datetime.now(dt.UTC),
        )
        for r in rows
    ]

    try:
        with conn.cursor() as cur:
            # 🔥 پاک کردن تمام اطلاعات قبلی
            cur.execute("TRUNCATE TABLE outage_cache")

            # درج دیتای جدید
            psycopg2.extras.execute_values(
                cur,
                query,
                rows_with_timestamp
            )

        conn.commit()

    except Exception:
        conn.rollback()
        raise

    return {
        "inserted_or_updated": len(rows),
        "duplicates_removed": duplicates_removed,
    }
   
# ═══════════════════════════════════════════════════════════════
#  اجرای اصلی
# ═══════════════════════════════════════════════════════════════

def _tehran_today() -> dt.date:
    """
    تاریخ «امروز» از دید ایران، نه سیستم.

    ⚠️ این همون باگی بود که جاب شبانه رو خراب می‌کرد: گیت‌هاب اکشن
    حدود ۲۱:۰۰ UTC (۰۰:۳۰ بامداد تهران) اجرا میشه؛ runner تاریخش
    هنوز UTC است (دیروزِ ایران)، ولی سایت لیست روزِ جدید ایران را
    گذاشته. نتیجه: «کارت‌های امروز: 0» و خروج بدون درج هیچ ردیفی.
    پس تاریخ باید صریحاً با timezone تهران حساب بشه.
    """
    return dt.datetime.now(dt.ZoneInfo("Asia/Tehran")).date()


def main():
    print("⚡ اسکریپت استخراج قطعی برق مازندران (نسخه‌ی مستقیم-به-Postgres)")
    print("─" * 60)

    today = _tehran_today()
    utc_today = dt.datetime.now(dt.UTC).date()
    if utc_today != today:
        print(f"ℹ️  تاریخ UTC سرور ({utc_today}) با تهران فرق داره — ملاک: تهران")

    print(f"📅 تاریخ امروز (تهران): {today.isoformat()}")

    try:
        html = fetch_page(WEBSITE_URL)
    except Exception as e:
        print(f"❌ خطا در دانلود: {e}")
        sys.exit(1)

    all_cards = parse_outage_cards(html)
    today_cards = filter_today(all_cards, today)
    print(f"   📋 مجموع کارت‌ها در صفحه: {len(all_cards)}")
    print(f"   📋 کارت‌های امروز ({today.isoformat()}): {len(today_cards)}")

    if not today_cards:
        print("   ⚠️  هیچ قطعی‌ای برای امروز پیدا نشد. خارج میشم.")
        sys.exit(0)

    rows, skipped = build_db_rows(today_cards, today)
    print(f"   ✅ ردیف‌های آماده‌ی درج: {len(rows)}")

    conn = get_pg_connection()
    try:
        stats = upsert_rows(conn, rows)
        print(f"   💾 درج/آپدیت شد: {stats['inserted_or_updated']} ردیف")
    finally:
        conn.close()

    # خلاصه‌ی تفکیک‌شده بر اساس شهر
    city_counts = defaultdict(int)
    for region_key, *_ in rows:
        parts = region_key.split("|")
        if len(parts) >= 2:
            city_counts[parts[1]] += 1

    print(f"\n{'═' * 50}")
    print("  ✅ دیتابیس Postgres به‌روز شد!")
    print(f"{'═' * 50}")
    for county_code, count in sorted(city_counts.items(), key=lambda x: -x[1]):
        print(f"    {county_code}: {count} قطعی")
    print(f"{'═' * 50}")
    print("\n🎉 تمام! کاربرهای ربات از همین الان می‌تونن این اطلاعات رو ببینن.")


if __name__ == "__main__":
    main()
