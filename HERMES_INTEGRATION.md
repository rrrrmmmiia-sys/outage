# اتصال Hermes Agent به دیتابیس ربات

این سند مشخص می‌کنه که جاب شبانه‌ی هرمس دقیقاً باید چه کاری بکنه و چطور با
دیتابیس این ربات هماهنگ بمونه.

## دسترسی به دیتابیس

هرمس باید از **بیرون** ریلوی به Postgres وصل بشه، پس باید از
`DATABASE_PUBLIC_URL` استفاده کنی (نه `DATABASE_URL` داخلی که فقط بین
سرویس‌های خود ریلوی کار می‌کنه). این مقدار رو از تب Variables سرویس
Postgres تو داشبورد Railway پیدا می‌کنی.

## زمان‌بندی

جاب باید هر شب ساعت ۲۲:۰۰ به وقت ایران اجرا بشه و **ساعت قطعی فردا** رو
پیدا کنه (نه امروز)، چون واحد هشدار ربات هر روز از همون دیتای امروز/فردا
که تو `outage_cache` هست می‌خونه.

## مرحله‌های کاری که هرمس باید انجام بده

### ۱. خوندن مناطق فعال
از جدول `locations` این ستون‌ها رو بخون (چون ربات الان فقط مازندران رو
پوشش می‌ده، همه‌شون تو همین استان هستن):

```sql
SELECT DISTINCT region_key, county_fa, city_fa, district_fa
FROM locations;
```

### ۲. سرچ برای هر منطقه
برای هر ردیف، وب‌سرچ کن (منابع رسمی شرکت توزیع برق مازندران یا خبرهای
محلی معتبر) تا ساعت قطعی **فردا** رو برای اون شهر/روستا/منطقه پیدا کنی.

### ۳. نوشتن نتیجه در `outage_cache`
برای هر منطقه، این کوئری رو (با upsert) بزن:

```sql
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES (:region_key, :tomorrow_date, :found, :start_time, :end_time, :note, now())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = now();
```

### مقادیر مورد انتظار هر فیلد

| فیلد                    |                                     نوع |                                               مثال                            |               توضیح                                    |
|---    |---|---|---|
| `region_key` | text | `mazandaran\|sari\|شهر_x\|منطقه_y` | دقیقاً همون مقداری که تو ستون `region_key` جدول `locations` برای اون ردیف هست — این رو از همون‌جا کپی کن، خودت نسازش |
| `date` | date | `2026-08-06` | تاریخ **فردا** (میلادی)، به وقت ایران |
| `found` | boolean | `true` | اگه اطلاعاتی پیدا شد `true`، وگرنه `false` |
| `start_time` | time (`HH:MM`) | `14:30` | اگه پیدا نشد، `NULL` بذار |
| `end_time` | time (`HH:MM`) | `16:00` | اگه پیدا نشد، `NULL` بذار |
| `note` | text | `"طبق سایت برق منطقه‌ای مازندران"` | حداکثر یک جمله‌ی کوتاه، حداکثر ۲۰ کلمه |

⚠️ نکته‌ی مهم: `region_key` رو **از جدول locations بخون و عیناً کپی کن**،
خودت با فرمول جدا نسازش — چون اگه فرمت نرمالایز شدنش (حروف کوچک،
جای‌گزینی فاصله با `_`) یه ذره فرق کنه، ربات دیگه نمی‌تونه رکورد رو پیدا
کنه و هشدار نمی‌فرسته.

## جدول‌های مرتبط (ساختار فعلی دیتابیس)

```
locations(id, user_id, province_code, province_fa, county_code, county_fa,
          city_fa, district_fa, region_key, created_at)

outage_cache(id, region_key, date, found, start_time, end_time, note, updated_at)
    UNIQUE(region_key, date)
```

## چک نهایی بعد از اجرای جاب

بعد از اینکه جاب هرمس اجرا شد، می‌تونی با این کوئری مطمئن بشی داده برای
فردا نوشته شده:

```sql
SELECT region_key, found, start_time, end_time
FROM outage_cache
WHERE date = CURRENT_DATE + INTERVAL '1 day';
```

اگه ردیفی نبود یا `found = false` بود برای همه، یعنی یا جاب اجرا نشده یا
سرچش نتیجه‌ای نداشته — ارزش داره لاگ خود هرمس رو چک کنی.
