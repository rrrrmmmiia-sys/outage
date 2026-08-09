import datetime as dt
import re

from sqlalchemy import select
from sqlalchemy import text as sql_text
from sqlalchemy.ext.asyncio import AsyncSession

from db.models import OutageCache


def build_region_key(province_code: str, county_code: str, city_fa: str, district_fa: str) -> str:
    """
    کلید یکتای منطقه، مستقل از کاربر.
    هرمس ایجنت هم باید دقیقاً همین فرمت رو برای نوشتن تو outage_cache استفاده کنه
    (یا بهتر، این مقدار رو مستقیم از ستون region_key جدول locations بخونه).
    """
    norm_city = _normalize(city_fa)
    norm_district = _normalize(district_fa)
    return f"{province_code}|{county_code}|{norm_city}|{norm_district}"


def _normalize(text: str) -> str:
    text = text.strip().lower()
    text = re.sub(r"\s+", "_", text)
    return text


async def get_cached_outage(
    session: AsyncSession, region_key: str, date: dt.date
) -> OutageCache | None:
    """فقط از کش می‌خونه؛ نوشتن توی این جدول کار هرمس ایجنته، نه این ربات"""
    return await session.scalar(
        select(OutageCache).where(
            OutageCache.region_key == region_key, OutageCache.date == date
        )
    )


_SIMILARITY_THRESHOLD = 0.25

_SIMILAR_LOCATIONS_QUERY = sql_text(
    """
    SELECT region_key, province_fa, county_fa, city_fa, district_fa, score FROM (
        SELECT DISTINCT region_key, province_fa, county_fa, city_fa, district_fa,
               GREATEST(similarity(city_fa, :city_fa), similarity(district_fa, :district_fa)) AS score
        FROM locations
        WHERE county_code = :county_code
    ) sub
    WHERE score > :threshold
    ORDER BY score DESC
    LIMIT :limit
    """
)


async def find_similar_locations(
    session: AsyncSession,
    county_code: str,
    city_fa: str,
    district_fa: str,
    limit: int = 5,
) -> list[dict]:
    """
    دنبال مکان‌های از قبل ثبت‌شده‌ی مشابه (همون شهرستان) می‌گرده تا اگه یکی از
    کاربرهای قبلی همین منطقه رو با یه املای کمی متفاوت ثبت کرده، کاربر جدید
    بتونه همون رکورد رو انتخاب کنه و نیازی به سرچ جدید نباشه.
    """
    result = await session.execute(
        _SIMILAR_LOCATIONS_QUERY,
        {
            "county_code": county_code,
            "city_fa": city_fa,
            "district_fa": district_fa,
            "threshold": _SIMILARITY_THRESHOLD,
            "limit": limit,
        },
    )
    return [dict(row) for row in result.mappings().all()]


_OUTAGE_WORD_SIMILARITY_THRESHOLD = 0.3

# word_similarity بهترین تطابق یه کلمه‌ی کوتاه رو داخل یه متن بلندتر پیدا می‌کنه؛
# دقیقاً همون چیزی که لازم داریم چون کلمه‌ی کاربر کوتاهه ولی note آدرس کامل و بلنده.
# translate هم کاراکترهای عربی (ي، ك) رو به معادل فارسی‌شون (ی، ک) یکسان می‌کنه،
# چون داده‌ی خام هرمس این دو رسم‌الخط رو قاطی داره.
_SIMILAR_OUTAGES_QUERY = sql_text(
    """
    SELECT region_key, note, start_time, end_time, score FROM (
        SELECT region_key, note, start_time, end_time,
               word_similarity(
                   translate(:keyword, 'يك', 'یک'),
                   translate(note, 'يك', 'یک')
               ) AS score
        FROM outage_cache
        WHERE region_key LIKE :prefix
          AND date = :date
          AND found = TRUE
          AND note IS NOT NULL
    ) sub
    WHERE score > :threshold
    ORDER BY score DESC
    LIMIT :limit
    """
)


async def find_similar_outage_entries(
    session: AsyncSession,
    county_code: str,
    date: dt.date,
    keyword: str,
    limit: int = 5,
) -> list[dict]:
    """
    داخل داده‌ی خامی که هرمس همون روز نوشته (outage_cache) دنبال آدرس‌های
    مشابه کلمه‌ی کلیدی کاربر می‌گرده. برای وقتیه که هرمس به‌جای سرچ مناطق
    ثبت‌شده، کل لیست قطعی شهر رو یک‌جا ریخته تو دیتابیس.
    """
    prefix = f"mazandaran|{county_code}|%"
    result = await session.execute(
        _SIMILAR_OUTAGES_QUERY,
        {
            "prefix": prefix,
            "date": date,
            "keyword": keyword,
            "threshold": _OUTAGE_WORD_SIMILARITY_THRESHOLD,
            "limit": limit,
        },
    )
    return [dict(row) for row in result.mappings().all()]
