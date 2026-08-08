-- ═══════════════════════════════════════════════════════════════
-- ⚡ قطعی برق مازندران — 2026-08-08
-- 📌 منبع: baboliha.ir
-- 🕐 تولید شده در: 2026-08-08T07:44:13
-- ═══════════════════════════════════════════════════════════════
--
-- ⚠️  اگه region_key دقیق کاربرهات با این فرق داره،
--    اول از جدول locations بخونش و جایگزین کن.
--    نگاه کن به HERMES_INTEGRATION.md بخش 'region_key'.
--

BEGIN;

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|هارون_کلا_جنب_مسجد', '2026-08-08', TRUE, '07:34', '09:34', 'هارون كلا جنب مسجد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|لاله_36_جنب_منبع_اب_ساختمان_روماک', '2026-08-08', TRUE, '07:51', '09:51', 'لاله 36 جنب منبع اب ساختمان روماك', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|پل_گردن_سه_راه_رویروی_آژانس_پل_گردن_جنب_ترانس', '2026-08-08', TRUE, '07:54', '09:54', 'پل گردن سه راه رويروي آژانس پل گردن جنب ترانس', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر-شریفی_12_-فرعی_5_-اولین_کوچه_سمت_راست_-دوباره_سمت_چپ_-یک_عدد', '2026-08-08', TRUE, '07:57', '09:57', 'بابلسر-شريفي 12 -فرعي 5 -اولين كوچه سمت راست -دوباره سمت چپ -يك عدد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|روستای_سنگسر_لنگه_روبروی_کاشی_جمالی', '2026-08-08', TRUE, '07:58', '09:58', 'روستاي سنگسر لنگه روبروي كاشي جمالي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر-_قبل_از_نگهبانی_شهرک_صنعتی_شورک_-_شرکت_محمدیان', '2026-08-08', TRUE, '07:59', '09:59', 'بابلسر- قبل از نگهباني شهرك صنعتي شورك - شركت محمديان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|مو.زی_باغ_کوچه_فردوسی', '2026-08-08', TRUE, '08:05', '10:05', 'مو.زي باغ كوچه فردوسي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|جاده_پلاژ_روبروی_پلاژ_دارایی_کوچه_امین', '2026-08-08', TRUE, '08:05', '10:05', 'جاده پلاژ روبروي پلاژ دارايي كوچه امين', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|روستای_مهلبان_انتهای_محل', '2026-08-08', TRUE, '08:06', '10:06', 'روستاي مهلبان انتهاي محل', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|عباسعلی_کش-_بعد_از_پیچ_-_مسیر_کانال_-_جنب_پمپ_سید_محله', '2026-08-08', TRUE, '08:07', '10:07', 'عباسعلي كش- بعد از پيچ - مسير كانال - جنب پمپ سيد محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|پست_17.1_دریاکنار', '2026-08-08', TRUE, '08:08', '10:08', 'پست 17.1 درياكنار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|بعد_از_پیچ_عباسعلی_کش_-_سمت_راست_-_400_متر_بعد_آپاراتی', '2026-08-08', TRUE, '08:09', '10:09', 'بعد از پيچ عباسعلي كش - سمت راست - 400 متر بعد آپاراتي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|دخانیات_کوچه_شهید_جعفری_40_متر_قبل_کوچه_سعادت', '2026-08-08', TRUE, '08:10', '10:10', 'دخانيات كوچه شهيد جعفري 40 متر قبل كوچه سعادت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر-روستای_باقرتنگه_-ذوالفقاری_29', '2026-08-08', TRUE, '08:11', '10:11', 'بابلسر-روستاي باقرتنگه -ذوالفقاري 29', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|میدان_قدس_-_امام_رضا_2_-_کوچه_اذرخش_-_کل_کوچه_خاموش', '2026-08-08', TRUE, '08:11', '10:11', 'ميدان قدس - امام رضا 2 - كوچه اذرخش - كل كوچه خاموش', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|اراضی_اطرب-مزارعسکری_به_سمت_آجند', '2026-08-08', TRUE, '08:13', '10:13', 'اراضي اطرب-مزارعسكري به سمت آجند', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|22_بهمن_جنب_بازار_روز', '2026-08-08', TRUE, '08:16', '10:16', '22 بهمن جنب بازار روز', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|فرهنگیان_-_روبروی_مدرسه_-_م_مدائن', '2026-08-08', TRUE, '08:19', '10:19', 'فرهنگيان - روبروي مدرسه - م مدائن', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|ملیک_جنب_گاردجنگل_داخل_کوچه_ایستگاه_راهبند', '2026-08-08', TRUE, '08:20', '10:20', 'مليك جنب گاردجنگل داخل كوچه ايستگاه راهبند', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|بلوار_کشاورز_کشاورز54_ازادی_15_کوچه_قائم', '2026-08-08', TRUE, '08:22', '10:22', 'بلوار كشاورز كشاورز54 ازادي 15 كوچه قائم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|جاده_دریا_روستای_آبمال_سه_راه_پنبه_چوله_جاده_پنبه_چوله_100_متر_قبل_از_شالیکوبی_دوم_گوهر_دهی_کوچه_گلستان_منزل_بسطامی', '2026-08-08', TRUE, '08:23', '10:23', 'جاده دريا روستاي آبمال سه راه پنبه چوله جاده پنبه چوله 100 متر قبل از شاليكوبي دوم گوهر دهي كوچه گلستان منزل بسطامي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|ارطه_جوجاده_زمین_ورزشی_بالا', '2026-08-08', TRUE, '08:23', '10:23', 'ارطه جوجاده زمين ورزشي بالا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|روستای_کردخیل_مرغداری_معصومی', '2026-08-08', TRUE, '08:25', '10:25', 'روستاي كردخيل مرغداري معصومي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر_-_بلوار_نیرو_هوایی_روستا_های_میرود_و_کرفون_و_شهرک_صنعتی_میرود_میرود_سر_و_نفت_چال_م_قسمتی_از_افرا_تخت', '2026-08-08', TRUE, '08:30', '10:30', 'بابلسر - بلوار نيرو هوايي روستا هاي ميرود و كرفون و شهرك صنعتي ميرود ميرود سر و نفت چال م قسمتي از افرا تخت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر_-_گلچین_سرا_-_جنب_ترانس_چهارم', '2026-08-08', TRUE, '08:30', '10:30', 'بابلسر - گلچين سرا - جنب ترانس چهارم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|جاده_فریدونکنار_به_بابلسر_-_شهرک_خزرشهر_جنوبی_-_انتهای_خیابان_یاس', '2026-08-08', TRUE, '08:30', '10:30', 'جاده فريدونكنار به بابلسر - شهرك خزرشهر جنوبي - انتهاي خيابان ياس', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|بلوار_شهدا_-_خیابان_ولیعصر_-_روبروی_شالیکوبی_طلوع_-_جنب_شالیکوبی_نیک(هاشمی_نسب)', '2026-08-08', TRUE, '08:30', '10:30', 'بلوار شهدا - خيابان وليعصر - روبروي شاليكوبي طلوع - جنب شاليكوبي نيك(هاشمي نسب)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|ثبت_شده_در_صندوق_صوتی', '2026-08-08', TRUE, '08:35', '10:35', 'ثبت شده در صندوق صوتي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|کفشگرکلا_رو_به_رو_عدالت_18', '2026-08-08', TRUE, '08:35', '10:35', 'كفشگركلا رو به رو عدالت 18', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|بلوار_کشاورز_اسبوورد_گلستان_23بنبست_اسماییل_قاسمی', '2026-08-08', TRUE, '08:36', '10:36', 'بلوار كشاورز اسبوورد گلستان 23بنبست اسماييل قاسمي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|اراضی_ولاشد_جاده_قدیم', '2026-08-08', TRUE, '08:37', '10:37', 'اراضي ولاشد جاده قديم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_روبروی_دوچرخه_سازی_برادران_علیجانی-_سر_کوچه_فرهنگیان', '2026-08-08', TRUE, '08:41', '10:41', 'خيابان آرامگاه- روبروي دوچرخه سازي برادران عليجاني- سر كوچه فرهنگيان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|المشیر_پاینن_محله_ک_شهیذ_علی_اکبرولیپور', '2026-08-08', TRUE, '08:43', '10:43', 'المشير پاينن محله ك شهيذ علي اكبروليپور', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|بلوار_کشاورز_بالادزا_پشت_پیر_تکیه', '2026-08-08', TRUE, '08:45', '10:45', 'بلوار كشاورز بالادزا پشت پير تكيه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|بلوار_کشاورز_-کوچه_سجاد_کوچه_شهید_عالی_نژاد_نبش_قائم_11', '2026-08-08', TRUE, '08:47', '10:47', 'بلوار كشاورز -كوچه سجاد كوچه شهيد عالي نژاد نبش قائم 11', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|بلوارطالقانی_بعداز_شهابی_/_لباس_فروشی_موکارلو', '2026-08-08', TRUE, '08:48', '10:48', 'بلوارطالقاني بعداز شهابي / لباس فروشي موكارلو', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|16_متری_دوم_یادگار_4-_به_سمت_عزیزی', '2026-08-08', TRUE, '08:58', '10:58', '16 متري دوم يادگار 4- به سمت عزيزي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|خیابان_ساری_-_روستای_کوتنا-_نبش_کوهساران_50', '2026-08-08', TRUE, '08:58', '10:58', 'خيابان ساري - روستاي كوتنا- نبش كوهساران 50', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سیمرغ | سيمرغ
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|simorgh|سیمرغ|جاده_قائمشهر_-_روستای_اخته_چی_بعد_از_پمپ_بنزین_قلی_زاده', '2026-08-08', TRUE, '09:00', '11:00', 'جاده قائمشهر - روستاي اخته چي بعد از پمپ بنزين قلي زاده', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سیمرغ | سيمرغ
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|simorgh|سیمرغ|میدان_صمصام_طور_-_عبور_روستای_کارتیج_کلا_و_جاده_قائمشهر_روستای_اخته_چی_بعد_از_پمپ_بنزین_قلی_زاده', '2026-08-08', TRUE, '09:00', '11:00', 'ميدان صمصام طور - عبور روستاي كارتيج كلا و جاده قائمشهر روستاي اخته چي بعد از پمپ بنزين قلي زاده', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|بلوار_شهدا_-_خیابان_ولیعصر_-_کوچه_ولیعصر_18/1_-_شرکت_توربافی_بحر_خزر', '2026-08-08', TRUE, '09:00', '11:00', 'بلوار شهدا - خيابان وليعصر - كوچه وليعصر 18/1 - شركت توربافي بحر خزر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_روبروی_عبور_دوگنبدان-نبش_شهدا7-جنب_آپارتمان_پارسه', '2026-08-08', TRUE, '09:00', '11:00', 'خيابان آرامگاه- روبروي عبور دوگنبدان-نبش شهدا7-جنب آپارتمان پارسه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|خیابان_قارن-کوچه_الهیه-پشت_پاساژ', '2026-08-08', TRUE, '09:00', '11:00', 'خيابان قارن-كوچه الهيه-پشت پاساژ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|چهاردانگه-_جاده_ی_کیاسر-_مسیر_روستای_کارنام', '2026-08-08', TRUE, '09:00', '11:00', 'چهاردانگه- جاده ي كياسر- مسير روستاي كارنام', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|16_متری_دوم_یادگار_18_نبش_بن_بست_سوم', '2026-08-08', TRUE, '09:02', '11:02', '16 متري دوم يادگار 18 نبش بن بست سوم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|کمربندی_شرقی_بلوار_دفاع_مقدس_ام_دی_اف_رودگریان', '2026-08-08', TRUE, '09:05', '11:05', 'كمربندي شرقي بلوار دفاع مقدس ام دي اف رودگريان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|جاده_دریا_-_شهرک_صنعتی_شماره_1', '2026-08-08', TRUE, '09:06', '11:06', 'جاده دريا - شهرك صنعتي شماره 1', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|دیوکتی_کوچه_بهاران_بهاران4انتهای_اسفالت_درب_قهوه_ای_کر_کره_ای', '2026-08-08', TRUE, '09:07', '11:07', 'ديوكتي كوچه بهاران بهاران4انتهاي اسفالت درب قهوه اي كر كره اي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|روستای_پاشاکلا_سادات_محله_جنب_اربابی_روبوی_سوپر_مارکت_ارشیا_زیر_آب_بندان_اول', '2026-08-08', TRUE, '09:13', '11:13', 'روستاي پاشاكلا سادات محله جنب اربابي روبوي سوپر ماركت ارشيا زير آب بندان اول', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|قاسم_خیل_ارطه_جنب_امامزاده_طاهر_گلستان_19', '2026-08-08', TRUE, '09:13', '11:13', 'قاسم خيل ارطه جنب امامزاده طاهر گلستان 19', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|صنم_حاجیکلا-روبروی_آرامگاه', '2026-08-08', TRUE, '09:14', '11:14', 'صنم حاجيكلا-روبروي آرامگاه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|متانکلا_رو_به_رو_مسجد', '2026-08-08', TRUE, '09:18', '11:18', 'متانكلا رو به رو مسجد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سیمرغ | سيمرغ
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|simorgh|سیمرغ|سر_چهارراه_پلاسکو_ضایی', '2026-08-08', TRUE, '09:22', '11:22', 'سر چهارراه پلاسكو ضايي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|بلوار_شهدا_-_خیابان_ولیعصر_-_جنب_پل_دوم_ولیعصر_-_کوچه_ولیعصر_15_(کوچه_محسنی)', '2026-08-08', TRUE, '09:30', '11:30', 'بلوار شهدا - خيابان وليعصر - جنب پل دوم وليعصر - كوچه وليعصر 15 (كوچه محسني)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|بابل-زرگرشهر-جاده_امل_ابتدا_روستای_دهک_به_سمت_خانه_بهداشت', '2026-08-08', TRUE, '09:30', '11:30', 'بابل-زرگرشهر-جاده امل ابتدا روستاي دهك به سمت خانه بهداشت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_شهدا10-نبش_کوچه_دوگنبدان_3', '2026-08-08', TRUE, '09:30', '11:30', 'خيابان آرامگاه- شهدا10-نبش كوچه دوگنبدان 3', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سیمرغ | سيمرغ
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|simorgh|سیمرغ|شهرک_شهید_بهشتی_کوچه_نبوت', '2026-08-08', TRUE, '09:30', '11:30', 'شهرك شهيد بهشتي كوچه نبوت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|پاساژ_بهارسان_لوازم_ارایشی', '2026-08-08', TRUE, '09:36', '11:36', 'پاساژ بهارسان لوازم ارايشي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|پهنه_کلا_شمال_500متر_بعد_از_استانه_کوچه_مرادی', '2026-08-08', TRUE, '09:37', '11:37', 'پهنه كلا شمال 500متر بعد از استانه كوچه مرادي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|تازه_آباد_کوچه_لاله_32', '2026-08-08', TRUE, '09:44', '11:44', 'تازه آباد كوچه لاله 32', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|قبل_پاسداران_22', '2026-08-08', TRUE, '09:47', '11:47', 'قبل پاسداران 22', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|بوستان19_سعدی_6', '2026-08-08', TRUE, '09:56', '11:56', 'بوستان19 سعدي 6', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|16_متری_دوم_یادگار_4-_به_سمت_عزیزی', '2026-08-08', TRUE, '10:00', '12:00', '16 متري دوم يادگار 4- به سمت عزيزي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|بلوار_شهدا_-_خیابان_ولیعصر_-_جنب_پل_اول_ولیعصر_-_کوچه_ولیعصر_2_و_پارک_جزیره', '2026-08-08', TRUE, '10:00', '12:00', 'بلوار شهدا - خيابان وليعصر - جنب پل اول وليعصر - كوچه وليعصر 2 و پارك جزيره', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_شهدا10-کوچه_دوگنبدان_2-جنب_ساختمان_سمنانی_نژاد', '2026-08-08', TRUE, '10:00', '12:00', 'خيابان آرامگاه- شهدا10-كوچه دوگنبدان 2-جنب ساختمان سمناني نژاد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|بابل_-_جاده_قائمشهر_-_هریکنده_ابتدای_محل_-_نبش_پاینده_5', '2026-08-08', TRUE, '10:01', '12:01', 'بابل - جاده قائمشهر - هريكنده ابتداي محل - نبش پاينده 5', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|شهابدین_کلا_شهرک_بهار_1', '2026-08-08', TRUE, '10:05', '12:05', 'شهابدين كلا شهرك بهار 1', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|بلوار_نژاد_اکبر_ولیعصر21-_مرکزی_14', '2026-08-08', TRUE, '10:06', '12:06', 'بلوار نژاد اكبر وليعصر21- مركزي 14', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_کیاکلا_-_رمنت_-_پشت_مسجد_امام_حسین-_گلزار_34', '2026-08-08', TRUE, '10:07', '12:07', 'جاده كياكلا - رمنت - پشت مسجد امام حسين- گلزار 34', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|نرسیده_به_سرداران18', '2026-08-08', TRUE, '10:07', '12:07', 'نرسيده به سرداران18', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|قبل_از_مسجد_کاردکش_مولایی', '2026-08-08', TRUE, '10:07', '12:07', 'قبل از مسجد كاردكش مولايي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_کیاکلا_-_محمود_آباد_-_ابتدا_محمود_آباد_عبور_دوم', '2026-08-08', TRUE, '10:08', '12:08', 'جاده كياكلا - محمود آباد - ابتدا محمود آباد عبور دوم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|گلستان1_قبل_از_مسجد', '2026-08-08', TRUE, '10:11', '12:11', 'گلستان1 قبل از مسجد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|ملاکلا_جنب_میدان_غدیر', '2026-08-08', TRUE, '10:12', '12:12', 'ملاكلا جنب ميدان غدير', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|میدان_حمزه_جنب_دیلی_مارکت_کلینیک_شبنم', '2026-08-08', TRUE, '10:19', '12:19', 'ميدان حمزه جنب ديلي ماركت كلينيك شبنم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|وولی_کتی_بعد_از_تکیه', '2026-08-08', TRUE, '10:25', '12:25', 'وولي كتي بعد از تكيه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|بعد_فجر_44_باتری_فروشی', '2026-08-08', TRUE, '10:27', '12:27', 'بعد فجر 44 باتري فروشي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|بلوک_رود_پی_پایین_محل', '2026-08-08', TRUE, '10:29', '12:29', 'بلوك رود پي پايين محل', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|سنگچال__خ_امامزاده_محمد_کوچه_آقاسر_5', '2026-08-08', TRUE, '10:29', '12:29', 'سنگچال _خ امامزاده محمد كوچه آقاسر 5', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر-_میرود_-_جنب_پل_و_کوچه_شیلات', '2026-08-08', TRUE, '10:30', '12:30', 'بابلسر- ميرود - جنب پل و كوچه شيلات', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|میدان_درنا_-_بلوار_امام_خمینی_-_سر_کوچه_امام_خمینی_13', '2026-08-08', TRUE, '10:30', '12:30', 'ميدان درنا - بلوار امام خميني - سر كوچه امام خميني 13', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|جاده_فریدونکنار_به_بابلسر_-_شهرک_خزرشهر_جنوبی_-_خیابان_یاس_7', '2026-08-08', TRUE, '10:30', '12:30', 'جاده فريدونكنار به بابلسر - شهرك خزرشهر جنوبي - خيابان ياس 7', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_شهدا10روبروی_کوچه_آزادی5-جنب_ساختمان_شهریار_یک', '2026-08-08', TRUE, '10:30', '12:30', 'خيابان آرامگاه- شهدا10روبروي كوچه آزادي5-جنب ساختمان شهريار يك', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_بابل_به_بهنمیر_روستای_عزیزک_بعد_از_عبور_خردمرد', '2026-08-08', TRUE, '10:37', '12:37', 'جاده بابل به بهنمير روستاي عزيزك بعد از عبور خردمرد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|آفتاب_13_روبروی_شهرک_مهر_پ_35', '2026-08-08', TRUE, '10:39', '12:39', 'آفتاب 13 روبروي شهرك مهر پ 35', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|ورکاده_بعد_از_مدرسه', '2026-08-08', TRUE, '10:40', '12:40', 'وركاده بعد از مدرسه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|فرهنگ_شهر_ک_جنب_اتش_نشانی_چهارراه_طلوع_5_بین_یلدا_6_و_8_پ_45', '2026-08-08', TRUE, '10:49', '12:49', 'فرهنگ شهر ك جنب اتش نشاني چهارراه طلوع 5 بين يلدا 6 و 8 پ 45', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|کوچه_تختی_مقابل_دبیرستان_دخترانه_جمشید_نژاد', '2026-08-08', TRUE, '10:55', '12:55', 'كوچه تختي مقابل دبيرستان دخترانه جمشيد نژاد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|056-_خیابان_هراز_از_ایران_خودرو_پهلوان_زاده_تا_روستای_مرزانکلا-_تسکابن_-_چندرمحله_-_میخران_-_درازان', '2026-08-08', TRUE, '10:55', '12:55', '056- خيابان هراز از ايران خودرو پهلوان زاده تا روستاي مرزانكلا- تسكابن - چندرمحله - ميخران - درازان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|209-_کوچه_های_20_متری_شاهد_-_پاسداران_-_تخت_جمشید_-_جاده_معدن_و_از_شرکت_کاله_سمت_راست_به_سمت_شهر', '2026-08-08', TRUE, '10:55', '12:55', '209- كوچه هاي 20 متري شاهد - پاسداران - تخت جمشيد - جاده معدن و از شرکت کاله سمت راست به سمت شهر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|091-_خیابن_17_شهریور_از_آزمایشگاه_شفایی_به_سمت_پشت_ساختمان_پزشکان_-_بازار_روز_شهید_عراقی_-_نیاکی_محله_از_نیکان_1_تا_تکیه_نیاکی_-_کوچه_پشت_مصلی_و_راسته_برنج_فروشان', '2026-08-08', TRUE, '10:55', '12:55', '091- خیابن 17 شهریور از آزمایشگاه شفایی به سمت پشت ساختمان پزشکان - بازار روز شهید عراقی - نیاکی محله از نیکان 1 تا تکیه نیاکی - کوچه پشت مصلی و راسته برنج فروشان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|047-_بلوار_طالب_آملی_دریاهای_فرد_از_دریای_45/1_تا_روستای_معصوم_آباد_حسین_آباد_کلاصفا_به_جز_دریای_55_و_67_-_ورودی_روستای_بامتی_و_هلی_کتی_و_دو_راهی_اوجی_آباد_به_سمت_شهرستان_محمودآباد_مسیر_چپ_و_راست_خیابان_اصلی', '2026-08-08', TRUE, '10:55', '12:55', '047- بلوار طالب آملي درياهاي فرد از درياي 45/1 تا روستاي معصوم آباد حسين آباد كلاصفا به جز درياي 55 و 67 - ورودي روستاي بامتي و هلي كتي و دو راهي اوجي آباد به سمت شهرستان محمودآباد مسير چپ و راست خياب', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|208-_جاده_ولیسده_ترانس_روبروی_شالیکوبی_جباری_و_روستاهای_ورکاده_کوسه_رز', '2026-08-08', TRUE, '10:55', '12:55', '208- جاده ولیسده ترانس روبروی شالیکوبی جباری و روستاهای ورکاده کوسه رز', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|افتاب_2_کل_کوچه', '2026-08-08', TRUE, '10:57', '12:57', 'افتاب 2 كل كوچه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|میدان_درنا_-_بلوار_امام_خمینی_-_همت_آباد_-_ابتدای_کوچه_شهید_عابدپور', '2026-08-08', TRUE, '11:00', '13:00', 'ميدان درنا - بلوار امام خميني - همت آباد - ابتداي كوچه شهيد عابدپور', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_شهدا10-روبروی_کوچه_آزادی_7-جنب_ساختمان_یعقوبی', '2026-08-08', TRUE, '11:00', '13:00', 'خيابان آرامگاه- شهدا10-روبروي كوچه آزادي 7-جنب ساختمان يعقوبي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|287-_ضلع_جنوبی_بلوار_امام_رضا_تا_پل_ذغالچال_-_قسمتی_از_کوی_طالقانی_اول_و_دوم_-_کوچه_های_آزادگان_-_حقانی_-_غفاری_-_پلیس_راه', '2026-08-08', TRUE, '11:00', '13:00', '287- ضلع جنوبی بلوار امام رضا تا پل ذغالچال - قسمتی از كوي طالقاني اول و دوم - كوچه های آزادگان - حقانی - غفاري - پليس راه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|280-_بخشی_از_خیابان_قارن_-_کوچه_های_قارن_14_-_قارن_16_-_قارن_18_-_تقاطع_قارن_و_انقلاب_تا_رویروی_استانداری', '2026-08-08', TRUE, '11:00', '13:00', '280- بخشي از خیابان قارن - كوچه هاي قارن 14 - قارن 16 - قارن 18 - تقاطع قارن و انقلاب تا رویروی استانداری', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|278-_خیابان_قارن_کوچه_های_قارن_1_-_قارن_5_-_قارن_7_تا_بانک_صادرات_-_قارن_2_-_قارن_4_-_قارن_6-_بخشی_از_خیابان_فرهنگ_-_استادیوم_سید_رسول_حسینی_-', '2026-08-08', TRUE, '11:00', '13:00', '278- خیابان قارن کوچه های قارن 1 - قارن 5 - قارن 7 تا بانک صادرات - قارن 2 - قارن 4 - قارن 6- بخشي از خیابان فرهنگ - استاديوم سيد رسول حسيني -', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|274-_خیابان_انقلاب_چهار_راه_برق_-_امور_برق_جنوب_ساری_-_پاسا‍ژ_مسچی_-_تا_پاسا‍ژ_دری_-_میدان_ساعت_سمت_راست_خیابان_18_دی_-_18_دی_کوچه_حسینیه_شهدا', '2026-08-08', TRUE, '11:00', '13:00', '274- خیابان انقلاب چهار راه برق - امور برق جنوب ساري - پاسا‍ژ مسچي - تا پاسا‍ژ دري - میدان ساعت سمت راست خیابان 18 دی - 18 دی کوچه حسینیه شهدا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|481-_منطقه_هولار_و_روستاهای_اطراف', '2026-08-08', TRUE, '11:00', '13:00', '481- منطقه هولار و روستاهاي اطراف', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|295-_خیابان_پیروزی_-_از_زندان_قدیم_تا_تقاطع_15_خرداد_-_کل_خیابان_15_خرداد_-_قسمتی_از_خیابان_فرهنگ_کوچه_های_فرهنگ_15_-_فرهنگ_17_-_استخر_معراج_-_سامانه_سامد', '2026-08-08', TRUE, '11:00', '13:00', '295- خيابان پيروزي - از زندان قديم تا تقاطع 15 خرداد - كل خيابان 15 خرداد - قسمتي از خيابان فرهنگ كوچه هاي فرهنگ 15 - فرهنگ 17 - استخر معراج - سامانه سامد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|447-_صحرای_رستمکلا', '2026-08-08', TRUE, '11:00', '13:00', '447- صحراي رستمكلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|451-_روستاهای_آسیابسر_-_کوهستان_و_شهیدآباد_(_دانشگاه_آزاد_اسلامی_بهشهر_-_پمپ_بنزین_کوهستان_)', '2026-08-08', TRUE, '11:00', '13:00', '451- روستاهاي آسيابسر - كوهستان و شهيدآباد ( دانشگاه آزاد اسلامي بهشهر - پمپ بنزين كوهستان )', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|334-_بلوار_پاسداران_درمانگاه_دکتر_شهیدی_-_بیمارستان_بوعلی_-_کوچه_ام_آر_آی_امام_خامنه_ای_-_بیمارستان_ولایت', '2026-08-08', TRUE, '11:00', '13:00', '334- بلوار پاسداران درمانگاه دکتر شهیدی - بیمارستان بوعلی - کوچه ام آر آی امام خامنه ای - بیمارستان ولایت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|248-_جاده_دریا_-_از_روبروی_عبور_دازمیرکنده_تا_انتهای_دازمیر_کنده_-_کلمر-_جره_سر_-_شاهفرا', '2026-08-08', TRUE, '11:00', '13:00', '248- جاده دریا - از روبروی عبور دازمیرکنده تا انتهاي دازمير کنده - کلمر- جره سر - شاهفرا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|260-_میدان_خزر_-_بسمت_ساری_کنار_-مناطق_تحت_پوشش_-_کل_شهبند_و_قسمتی_از_مهدی_اباد_-_قسمتی_از_خیابان_وصال', '2026-08-08', TRUE, '11:00', '13:00', '260- ميدان خزر - بسمت ساري کنار -مناطق تحت پوشش - کل شهبند و قسمتي از مهدي اباد - قسمتی از خیابان وصال', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|459-_سمت_غرب_جاده_جویبار_از_کوی_خاورداران_تا_سه_راه_جویبار،_منطقه_شریف_آباد_و_کوی_اصحاب_-_زرگر_باغ_-_فرح_آباد_خیل_-_خرم_آباد_-_طوربدار_-تجنک_علیا_و_سفلی_-زوار_محله_-_خاریک_-_اناردین-_چاه_آب_پهناب_و_قسمتی_از_روستای_شهاب_لیلم', '2026-08-08', TRUE, '11:00', '13:00', '459- سمت غرب جاده جويبار از كوي خاورداران تا سه راه جويبار، منطقه شريف آباد و کوی اصحاب - زرگر باغ - فرح آباد خیل - خرم آباد - طوربدار -تجنک علیا و سفلی -زوار محله - خاریک - اناردین- چاه آب پهناب و قس', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|258-_بلوار_خزر_از_دریای_20_تا_22_-_مجتمع_پزشکی_طوبی_-_میدان_خزر_کمربندی_غربی_مسیر_نهضت_سواد_آموزی_الی_روبروی_زعفرانیه_-_خیابان_فلسطین_از_ابتدای_کمربندی_غربی_تا_فلسطین5-_30_متری_شهیند_تا_شمشیر_بند_17', '2026-08-08', TRUE, '11:00', '13:00', '258- بلوار خزر از دریای 20 تا 22 - مجتمع پزشکی طوبی - میدان خزر کمربندی غربی مسیر نهضت سواد آموزی الی روبروی زعفرانیه - خیابان فلسطین از ابتدای کمربندی غربی تا فلسطین5- 30 متری شهیند تا شمشیر بند 17', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|463-_کمربندی_غربی_-_کوی_قرق-_کوی_شفا_-_کوچه_گلها_-_کوی_بخشی', '2026-08-08', TRUE, '11:00', '13:00', '463- کمربندی غربی - کوي قرق- کوي شفا - کوچه گلها - کوی بخشی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|394-_حد_فاصل_پل_هوایی_تا_آرامگاه_سید_نظام_،_پل_ستیر_به_سمت_مدرسه_ادیب', '2026-08-08', TRUE, '11:00', '13:00', '394- حد فاصل پل هوایی تا آرامگاه سید نظام ، پل ستیر به سمت مدرسه ادیب', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|393-_خیابان_تهران_حد_فاصل_البرز_106_تا_هفت_تن_-_تالار_پشت_-_هفت_تن_-_متانکلا-_واسکس-_شهرودکلا-وسطی_کلا', '2026-08-08', TRUE, '11:00', '13:00', '393- خیابان تهران حد فاصل البرز 106 تا هفت تن - تالار پشت - هفت تن - متانکلا- واسکس- شهرودکلا-وسطی کلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|383-_خیابان_ساری_حد_فاصل_جانبازان_تا_راهبند_شماره_2_-شهرک_یثرب_-کوی_شهید_آهنگران_روستای_لهرم_تلوک-_بخشی_از_روستای_ساروکلا_جنب_منبع_آب', '2026-08-08', TRUE, '11:00', '13:00', '383- خیابان ساری حد فاصل جانبازان تا راهبند شماره 2 -شهرک یثرب -کوی شهید آهنگران روستای لهرم تلوک- بخشی از روستای ساروکلا جنب منبع آب', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|149-_امامزاده_قاسم_تا_میدان_اوقاف_اندیشه_های_2_تا_18_و_1_تا_13_،_محله_چاله_زمین،_میدان_اوقاف_کوچه_های_شکوفه،_از_چهارشنبه_پیش_تاخوابگاه_امینیان_(مصلی_های_11تا_37_و6تا_36)_شهرک_صدف_،_قسمتی_از_محله_رضیاکلا_و_گلستان_16', '2026-08-08', TRUE, '11:00', '13:00', '149- امامزاده قاسم تا میدان اوقاف اندیشه های 2 تا 18 و 1 تا 13 ، محله چاله زمین، میدان اوقاف کوچه های شکوفه، از چهارشنبه پیش تاخوابگاه امینیان (مصلی های 11تا 37 و6تا 36) شهرک صدف ، قسمتی از محله رضیاک', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|011-_سورک_-_قسمت_جنوبی_جاده_ساری_نکا_الی_روستاهای_کیاپی_و_رسول_آباد_و_اسبوکلا_و_ولاشد_و_لالیم_و_انجیل_نسام_و_بادله', '2026-08-08', TRUE, '11:00', '13:00', '011- سورك - قسمت جنوبي جاده ساري نكا الي روستاهاي كياپي و رسول آباد و اسبوكلا و ولاشد و لاليم و انجيل نسام و بادله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|063-_چاه_آب_شرب_بابل_-_مسیر_انستیتو_پاستور_به_سمت_هندوکلا_-_جاده_قدیم_از_اجوارکلا_تا_پل_هوایی_شاد_محل_-_از_پل_هوایی_تا_روستای_آب_بخشان_کته_پشت.', '2026-08-08', TRUE, '11:00', '13:00', '063- چاه آب شرب بابل - مسیر انستیتو پاستور به سمت هندوکلا - جاده قدیم از اجوارکلا تا پل هوایی شاد محل - از پل هوایی تا روستای آب بخشان کته پشت.', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|073-_خیابان_امام_رضا_-_بیمارستان_امام_رضا-_رضوان_6_-_رضوان24_و_26-رضوان30_-لاله1_و_لاله13', '2026-08-08', TRUE, '11:00', '13:00', '073- خیابان امام رضا - بیمارستان امام رضا- رضوان 6 - رضوان24 و 26-رضوان30 -لاله1 و لاله13', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|218-_شهرک_دریاکنار', '2026-08-08', TRUE, '11:00', '13:00', '218- شهرک دریاکنار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|353-_انتهای_خیابان_ولیعصر_-روستاهای_سوته_،_فرم_،_حیدرکلا_،_ملاکلا_،_کلاگرسرا_و_جزین', '2026-08-08', TRUE, '11:00', '13:00', '353- انتهاي خيابان وليعصر -روستاهاي سوته ، فرم ، حيدركلا ، ملاكلا ، كلاگرسرا و جزين', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|520-_خیابان_راه_آهن_از_چهارراه_آزادگان_الی_کوچه_دهپور_و_بخشی_از_کوچه_کارخانه_آرد_سابق_نرسیده_به_پیتزا_دلف', '2026-08-08', TRUE, '11:00', '13:00', '520- خيابان راه آهن از چهارراه آزادگان الي كوچه دهپور و بخشی از کوچه کارخانه آرد سابق نرسیده به پیتزا دلف', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|عزیزک_عبور_دوشنبه_بازار', '2026-08-08', TRUE, '11:00', '13:00', 'عزيزك عبور دوشنبه بازار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|آفتاب_44_ابتدای_کوچه_سمت_چپ_منزل_عطایی', '2026-08-08', TRUE, '11:00', '13:00', 'آفتاب 44 ابتداي كوچه سمت چپ منزل عطايي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|اندیشه_27', '2026-08-08', TRUE, '11:01', '13:01', 'انديشه 27', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|مسکون_کوچه_شاه_بابایی_ایثار_5/2_پ22', '2026-08-08', TRUE, '11:04', '13:04', 'مسكون كوچه شاه بابايي ايثار 5/2 پ22', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|افتاب_70_شمس_5', '2026-08-08', TRUE, '11:05', '13:05', 'افتاب 70 شمس 5', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|میدان_درنا_-_بلوار_امام_خمینی_-_همت_آباد_-_انتهای_کوچه_شهید_عابدپور(لب_رودخانه)', '2026-08-08', TRUE, '11:30', '13:30', 'ميدان درنا - بلوار امام خميني - همت آباد - انتهاي كوچه شهيد عابدپور(لب رودخانه)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|خیابان_آرامگاه-_شهدا10-_کوچه_آزادی_9-انتهای_کوچه', '2026-08-08', TRUE, '11:30', '13:30', 'خيابان آرامگاه- شهدا10- كوچه آزادي 9-انتهاي كوچه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|خیابان_آزادگان_2', '2026-08-08', TRUE, '11:40', '13:40', 'خيابان آزادگان 2', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_بابل_به_بهنمیر_-_روستای_عزیزک_-_از_کوچه_لاله_10_تا_14', '2026-08-08', TRUE, '11:45', '13:45', 'جاده بابل به بهنمير - روستاي عزيزك - از كوچه لاله 10 تا 14', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_کیاکلا_-_محمود_آباد_-_ابتدا_محمود_آباد-_محموذ_1تا_3', '2026-08-08', TRUE, '12:00', '14:00', 'جاده كياكلا - محمود آباد - ابتدا محمود آباد- محموذ 1تا 3', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_کیاکلا_-_رمنت_-_پشت_مسجد_امام_حسین-گلزار_34-گلستان_4', '2026-08-08', TRUE, '12:00', '14:00', 'جاده كياكلا - رمنت - پشت مسجد امام حسين-گلزار 34-گلستان 4', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|خیابان_آزادگان_2', '2026-08-08', TRUE, '12:20', '14:20', 'خيابان آزادگان 2', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_بابل_به_بهنمیر_روستای_عزیزک_نبش_کوچه_شهید_شعبان_نتاج', '2026-08-08', TRUE, '12:30', '14:30', 'جاده بابل به بهنمير روستاي عزيزك نبش كوچه شهيد شعبان نتاج', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|خیابان_آزادگان_4', '2026-08-08', TRUE, '13:00', '15:00', 'خيابان آزادگان 4', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|422-_کل_روستاهای_بخش_دودانگه', '2026-08-08', TRUE, '13:00', '15:00', '422- کل روستاهاي بخش دودانگه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|283-_بلوار_طالقانی_-_از_ابتدای_خیابان_پیروزی_تا_تقاطع_پانزده_خرداد', '2026-08-08', TRUE, '13:00', '15:00', '283- بلوار طالقاني - از ابتداي خيابان پيروزي تا تقاطع پانزده خرداد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|300-_میدان_اول_سلمان_فارسی_تا_میدان_زندان', '2026-08-08', TRUE, '13:00', '15:00', '300- ميدان اول سلمان فارسي تا ميدان زندان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|179-_کل_خیابان_فرودگاه_-_ابتدای_کوچه_رامیان_و_ابتدای_خ_نواب_-کوچه_زارع_-_از_چهارراه_گرگان_تا_پمپ_بنزین_گرائیل_محله(ضلع_جنوبی)_-_از_پارک_22_بهمن_تا_پمپ_بنزین_گرائیل_محله(ضلع_شمالی)_-_بعثت_-_pmt', '2026-08-08', TRUE, '13:00', '15:00', '179- كل خيابان فرودگاه - ابتداي كوچه راميان و ابتداي خ نواب -كوچه زارع - از چهارراه گرگان تا پمپ بنزين گرائيل محله(ضلع جنوبي) - از پارك 22 بهمن تا پمپ بنزين گرائيل محله(ضلع شمالي) - بعثت - pmt', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|177-_سی_متری_گرائیل_محله_-_انتهای_کوچه_سیدی_-_انتهای_کوچه_رامیان_-_کوچه_بازیافت_-کوچه_جنب_پمپ_بنزین_جعفری_-_کوچه_یاس_-_کوچه_بهارنارنج_-_زیروان_و_صحرای_زیروان_-_صحرای_شهیدآباد-_خنک_جام_-_کوچه_مولانا-_کوچه_شهید_یعقوبی', '2026-08-08', TRUE, '13:00', '15:00', '177- سي متري گرائيل محله - انتهاي كوچه سيدي - انتهاي كوچه راميان - كوچه بازيافت -كوچه جنب پمپ بنزين جعفري - كوچه ياس - كوچه بهارنارنج - زيروان و صحراي زيروان - صحراي شهيدآباد- خنك جام - كوچه مولانا- ك', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|180-_خیابان_شهید_رجایی_-_کوچه_نیکزاد_-_کوچه_آرایشگاه_لیلا_-_کوچه_کارکنان_بانک_ملی_-_انتهای_خ_معلم_-_کوچه_شهید_فلاحی_-کوچه_کشاورز_-_ابتدای_خ_فرهنگیان_از_سمت_خ_ش_رجایی_-_عبدالحق_-_شهید_مهرزادی_-_بیست_متری_امت_-_کوچه_سپیدبر_-_سه_راه_پیرحلب_تا_چهارراه_گرگان_-_خیابان_مدرس', '2026-08-08', TRUE, '13:00', '15:00', '180- خيابان شهيد رجايي - كوچه نيكزاد - كوچه آرايشگاه ليلا - كوچه كاركنان بانك ملي - انتهاي خ معلم - كوچه شهيد فلاحي -كوچه كشاورز - ابتداي خ فرهنگيان از سمت خ ش رجايي - عبدالحق - شهيد مهرزادي - بيست مت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|293-_کمربندی_شرقی_تا_پل_ولیعصر_-_کوی_دادگستری_-_بهار_-_شهید_رجایی', '2026-08-08', TRUE, '13:00', '15:00', '293- کمربندي شرقي تا پل وليعصر - کوی دادگستری - بهار - شهید رجایی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|261-_از_ابتدای_خیابان_شهید_فرجی_به_سمت_مسجد_قمربنی_هاشم_و_خیابان_امام_حسن_مجتبی_و_تا_تالار_شهرداری،_خیابان_شهید_ساداتی،_کل_خیابان_مهدی_آباد_تا_ابتدای_کوچه_وصال_21،_از_چهارراه_وصال_تا_وصال_5،_دانشکده_پرستاری_نسیبه،_خیابان_شهبند_کوچه_حق_شناس.', '2026-08-08', TRUE, '13:00', '15:00', '261- از ابتداي خيابان شهيد فرجي به سمت مسجد قمربني هاشم و خيابان امام حسن مجتبي و تا تالار شهرداري، خيابان شهيد ساداتي، كل خيابان مهدي آباد تا ابتداي كوچه وصال 21، از چهارراه وصال تا وصال 5، دانشكده پ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|244-_جاده_دریا_از_روبروی_عبور_دازمیرکنده_تا_کارخانه_انتی_بیوتیک_-_روستاهای_دامیر_-_دینک_-_خارمیان_-_سمندک_-_سنته_-_چمازک_-_حاجی_آباد', '2026-08-08', TRUE, '13:00', '15:00', '244- جاده دریا از روبروی عبور دازمیرکنده تا کارخانه انتي بيوتيک - روستاهای دامیر - دینک - خارمیان - سمندک - سنته - چمازک - حاجی آباد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|289-_ضلع_شمالی_بلوار_امام_رضا_از_پل_تجن_تا_پل_ذغالچال_-_ابتدای_جاده_گلما_-_ابتدای_کوچه_شهید_احمدی_آزاد_-_ابتدای_خیابان_امامزاده_عباس', '2026-08-08', TRUE, '13:00', '15:00', '289- ضلع شمالی بلوار امام رضا از پل تجن تا پل ذغالچال - ابتدای جاده گلما - ابتدای کوچه شهید احمدی آزاد - ابتدای خیابان امامزاده عباس', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|385-_خیابان_تهران_حد_فاصل_سه_راه_فیروزکوه_تا_شرکت_نفت_سمت_راست_خیابان_-_ایستگاه_پمپاژآب', '2026-08-08', TRUE, '13:00', '15:00', '385- خیابان تهران حد فاصل سه راه فیروزکوه تا شرکت نفت سمت راست خیابان - ایستگاه پمپاژآب', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه شمالی | سوادكوه شمالي
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh_shomali|سوادکوه_شمالی|335-_از_فرمانداری_تا_محدوده_بالا_بازار_-_از_میدان_تا_کوچه_خبره_-_دادگستری_شیرگاه_-_کوچه_فضیلت_-_کوچه_شهید_درویشی_-_سید_تاج_الدین_-_بانک_سپه_-_کوچه_قاسمی_-_کوچه_نصر_-_کوچه_سادات_-_کوچه_جانباز_-_کوچه_کشاورز', '2026-08-08', TRUE, '13:00', '15:00', '335- از فرمانداري تا محدوده بالا بازار - از ميدان تا كوچه خبره - دادگستري شيرگاه - كوچه فضيلت - كوچه شهيد درويشي - سيد تاج الدين - بانك سپه - كوچه قاسمي - كوچه نصر - كوچه سادات - كوچه جانباز - كوچه كش', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه شمالی | سوادكوه شمالي
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh_shomali|سوادکوه_شمالی|337-_محدوده_کشتارگاه_به_طرف_چاه_های_آب_-_روستاهای_آبدنگسر_-_-_چایباغ_و_اندارگلی_تا_منطقه_رضا_اباد_-_مسیر_میخ_خزر_و_مرغداری_های_مسیر_الاشت_جوجه', '2026-08-08', TRUE, '13:00', '15:00', '337- محدوده کشتارگاه به طرف چاه های آب - روستاهای آبدنگسر - - چایباغ و اندارگلی تا منطقه رضا اباد - مسیر میخ خزر و مرغداری های مسیر الاشت جوجه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه | سوادکوه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh|سوادکوه|235-_پلسفید_منطقه_1_-_از_پمپ_بنزین_ابتدای_شهر_به_سمت_دادگستری_-_اداره_برق_به_سمت_مرکز_بهداشت_و_داخل_شهر-_ابتدای_جاده_ساحلی_بسمت_شهرک_قدس_-_منطقه_میار_کلا_مسیر_راه_آهن_به_سمت_بخشداری_و_کلانتری_-_کوی_معدن_به_سمت_کشتارگاه_قدیم_.', '2026-08-08', TRUE, '13:00', '15:00', '235- پلسفید منطقه 1 - از پمپ بنزين ابتداي شهر به سمت دادگستري - اداره برق به سمت مرکز بهداشت و داخل شهر- ابتداي جاده ساحلي بسمت شهرک قدس - منطقه میار کلا مسیر راه آهن به سمت بخشداری و کلانتری - کوی مع', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|201-_سروکلا_–_سه_راهی_خدمات_سمت_راست_تا_پل_شیب_آبندان-روبروی_تکیه_شیب_آبندان_تا_مدرسه_رنجبرشیب_ابندان-سید_کلا-حاجی_کلا-آزان-شیب_ابندان-دیوکلاالیمون-پادگان_شهیدمحلاتی-روستای_کفشگرکلا', '2026-08-08', TRUE, '13:00', '15:00', '201- سروکلا – سه راهی خدمات سمت راست تا پل شیب آبندان-روبروی تکیه شیب آبندان تا مدرسه رنجبرشیب ابندان-سید کلا-حاجی کلا-آزان-شیب ابندان-دیوکلاالیمون-پادگان شهیدمحلاتی-روستای کفشگرکلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|194-_باغبانمحله-آیش_باغ_رضائیان-خیابان_شهیداخلاقی_و_اسماعیلی_–_شافرا_–_کلاگرمحله_خیابان_بیزیکی_–_خیابان_مژده_–_خیابان_مصلحی_–_میدان_امام_حسین_-_چلمیان', '2026-08-08', TRUE, '13:00', '15:00', '194- باغبانمحله-آیش باغ رضائیان-خیابان شهیداخلاقی و اسماعیلی – شافرا – کلاگرمحله خیابان بیزیکی – خیابان مژده – خیابان مصلحی – میدان امام حسین - چلمیان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|146-_نیایش_1_پشت_سینما_آزادی_تا_بنیاد_حریری،_توحید_5،_خیابان_استادیوم_حر_2_تا_7_(توحید_4.1)_از_محله_ضرابپوری_تا_هاشم_آباد_کوچه_های_گلچین_و_نوریان_و_استقلال', '2026-08-08', TRUE, '13:00', '15:00', '146- نیایش 1 پشت سینما آزادی تا بنیاد حریری، توحید 5، خیابان استادیوم حر 2 تا 7 (توحید 4.1) از محله ضرابپوری تا هاشم آباد کوچه های گلچین و نوریان و استقلال', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|100-_میدان_فاضل_تا_میدان_هادی_نوروزی_بلوار_یاسینی_کشاورزی_بسمت_طلائیه_-_جاده_قائم_شهراز_میدان_هادی_نوروزی_ضلع_شمالی_تا_مازیار_صنعت_،کبودکلا_و_سیدآباد_،_دریکنده،چمازکلا_شمالی،_گرجی_آباد_شمالی_،_کوچه_خجسته،_شهرک_مهر_ولایت،', '2026-08-08', TRUE, '13:00', '15:00', '100- میدان فاضل تا میدان هادی نوروزی بلوار یاسینی کشاورزی بسمت طلائیه - جاده قائم شهراز میدان هادی نوروزی ضلع شمالی تا مازیار صنعت ،کبودکلا و سیدآباد ، دریکنده،چمازکلا شمالی، گرجی آباد شمالی ، کوچه خج', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|145-_از_چهار_راه_شهربانی_تا_میدان_ولایت_و_سبز_میدان،_خیابان_مدرس،_پاساژ_شهریار_و_عطر_زیستان،_آزمایشگاه_رازی،_کوچه_معلوجی،_از_چهارراه_فرهنگ_تا_نبش_سه_راه_فرهنگ_-_هلال_احمر_(ساختمان_جهانیان_تا_دادگستری_و_باغبان_محله)', '2026-08-08', TRUE, '13:00', '15:00', '145- از چهار راه شهربانی تا میدان ولایت و سبز میدان، خیابان مدرس، پاساژ شهریار و عطر زیستان، آزمایشگاه رازی، کوچه معلوجی، از چهارراه فرهنگ تا نبش سه راه فرهنگ - هلال احمر (ساختمان جهانیان تا دادگستری ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|144-_از_چهار_راه_شهدا_تا_میدان_کارگر_سرداران_11_(_فرهنگ_های_1_تا_15_و_2_تا_6_)_کوچه_مسجد_جامع_تا_اشرفی_3', '2026-08-08', TRUE, '13:00', '15:00', '144- از چهار راه شهدا تا میدان کارگر سرداران 11 ( فرهنگ های 1 تا 15 و 2 تا 6 ) کوچه مسجد جامع تا اشرفی 3', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|499-_ابتدای_کرد_محله_تا_فاطمه_ابندان_کشتله_چناربن_،_ولوکلا،_آهنگرکلای_بزرگ،_چوبست،_بالامرزبال،_گل_باغ،_بالامرزناک،_مسیر_احمد_کلا_تا_کرد_محله_و_مسیر_آخمن', '2026-08-08', TRUE, '13:00', '15:00', '499- ابتدای کرد محله تا فاطمه ابندان کشتله چناربن ، ولوکلا، آهنگرکلای بزرگ، چوبست، بالامرزبال، گل باغ، بالامرزناک، مسیر احمد کلا تا کرد محله و مسیر آخمن', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|106-_دانش5_کوچه_های_شهید_بابائی_(دارایی_سابق_کوچه)_و_قسمتی_از_محله_بحر_ارم_شرقی_کوچه_های_کمیل_وجنت_و_محله_بحر_ارم_غربی_کوچه_های_گلزار', '2026-08-08', TRUE, '13:00', '15:00', '106- دانش5 کوچه های شهید بابائی (دارایی سابق کوچه) و قسمتی از محله بحر ارم شرقی کوچه های کمیل وجنت و محله بحر ارم غربی کوچه های گلزار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|094-_از_میدان_هادی_نورزی_تا_انتهای_روستای_هریکنده_و_مناطق(شهرک_بذری،_گوهر_دشت_و_علمدار_و_گرجی_اباد_جنوبی،_قسمتی_از_میرودپشت_)', '2026-08-08', TRUE, '13:00', '15:00', '094- از میدان هادی نورزی تا انتهای روستای هریکنده و مناطق(شهرک بذری، گوهر دشت و علمدار و گرجی اباد جنوبی، قسمتی از میرودپشت )', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|122-_خیابان_امام_سمت_راست_از_میدان_امام_علی_تا_میدان_انقلاب_(ساعت)_کوچه_های_نیمای_یک_تا_نیمای_چهار_و_قسمتی_از_شهرک_فاطری_-_کوچه_های_اسایش_-_ارامش_-_عابدی_-_کوچه_بیمارستان_کودکان_-_نشاط_-_رازی_-_اطراف_بیمارستان_مهرگان_-_و_ابتدای_خیابان_ابن_سینا_-_چاووشی', '2026-08-08', TRUE, '13:00', '15:00', '122- خيابان امام سمت راست از ميدان امام علي تا ميدان انقلاب (ساعت) کوچه هاي نيماي يک تا نيماي چهار و قسمتي از شهرک فاطري - کوچه هاي اسايش - ارامش - عابدي - کوچه بيمارستان کودکان - نشاط - رازي - اطراف ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|436-_جاده_هراز_از_رستوران_چهار_فصل_تا_پمپ_بنزین_گلستان_رزکه_-_پارک_جنگلی_میرزا_کوچک_خان_-_سپاسد_-_رستورانهای_شاندیز_و_ساسان', '2026-08-08', TRUE, '13:00', '15:00', '436- جاده هراز از رستوران چهار فصل تا پمپ بنزین گلستان رزکه - پارک جنگلی میرزا کوچک خان - سپاسد - رستورانهای شاندیز و ساسان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|307-_جاده_هراز_از_رستوران_سالاری_تا_دانشگاه_پیام_نور_رینه_-_روستاهای_انهه_-_کندلو_-_گیلاس_-_گرنا_-_مون', '2026-08-08', TRUE, '13:00', '15:00', '307- جاده هراز از رستوران سالاری تا دانشگاه پیام نور رینه - روستاهای انهه - کندلو - گیلاس - گرنا - مون', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|434-_جاده_هراز_از_رستوران_چهارفصل_تا_کارخانه_آمولو_-_روستای_پرن_-_روستاهای_مسیر_چلاو', '2026-08-08', TRUE, '13:00', '15:00', '434- جاده هراز از رستوران چهارفصل تا کارخانه آمولو - روستای پرن - روستاهای مسیر چلاو', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|211-_از_پل_چمستان_به_طرف_آمل_مسیر_سمت_راست_تا_شرکت_کاله_و_زندان_و_ابتدای_کمربندی_و_سه_راهی_ولیسده_الی_روستای_کوکده_و_مرانده', '2026-08-08', TRUE, '13:00', '15:00', '211- از پل چمستان به طرف آمل مسیر سمت راست تا شرکت کاله و زندان و ابتدای کمربندی و سه راهی ولیسده الی روستای کوکده و مرانده', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|088-_کوی_جنب_اداره_برق_-_از_رضوانیه_3_تا_بلوار_طبری_-_از_میدان_طبری_تا_بانک_خون_-آفتاب_36_از_میدان_حر_تا_مدرسه_معرفت_و_انتهای_آفتاب_40', '2026-08-08', TRUE, '13:00', '15:00', '088- کوی جنب اداره برق - از رضوانیه 3 تا بلوار طبری - از میدان طبری تا بانک خون -آفتاب 36 از میدان حر تا مدرسه معرفت و انتهای آفتاب 40', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|439-_از_ابتدای_جاده_ی_فریونکنار_الی_سه_راه_آهنگرکلا_و_جاده_ی_مرزنگو_الی_روستای_کچب_سفلی', '2026-08-08', TRUE, '13:00', '15:00', '439- از ابتداي جاده ي فريونكنار الي سه راه آهنگركلا و جاده ي مرزنگو الي روستاي كچب سفلي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|475-_از_سه_راه_فیروزکلا_تا_کمدره_-_فیروزکلا_-_پاشاکلا_-_کمدره_-_شهنه_کلا-_بلیران', '2026-08-08', TRUE, '13:00', '15:00', '475- از سه راه فیروزکلا تا کمدره - فیروزکلا - پاشاکلا - کمدره - شهنه کلا- بلیران', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|050-_بلوار_بسیج-ابتدای_لاله16_بسمت_گلبرگ_19_کوچه_طبرستان_و_روستای_کنسی', '2026-08-08', TRUE, '13:00', '15:00', '050- بلوار بسیج-ابتدای لاله16 بسمت گلبرگ 19 کوچه طبرستان و روستای کنسی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|153-_شهرک_المپیک_-_روستای_تازه_آباد_-_روستاهای_منگلاب-_پارومحله-_سرخدشت-_گالشکلا-_بالا_محله_بهنمیر-_جاده_عزیزک-_جاده_کیاکلا_-_مسکن_مهر_نگین_خزر', '2026-08-08', TRUE, '13:00', '15:00', '153- شهرک المپیک - روستای تازه آباد - روستاهای منگلاب- پارومحله- سرخدشت- گالشکلا- بالا محله بهنمیر- جاده عزیزک- جاده کیاکلا - مسکن مهر نگین خزر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|355-_ضلع_غربی_خیابان_بهشتی_از_پمپ_بنزین_الی_خیابان_بهشتی_13_-_بلوار_معلم_-_خیابان_24متری_غربی-_خیابان_16_متری_ساحلی_-_حد_فاصل_چهارراه_معلم_الی_پل_میلاد_-_کوچه_اسدی', '2026-08-08', TRUE, '13:00', '15:00', '355- ضلع غربي خيابان بهشتي از پمپ بنزین الی خیابان بهشتی 13 - بلوار معلم - خيابان 24متري غربي- خیابان 16 متري ساحلي - حد فاصل چهارراه معلم الي پل ميلاد - کوچه اسدي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|226-_شهرک_خزرشهرشمالی_و_جنوبی-_بلوارساحلی_از_خزرشهر_الی_سه_راه_جهاد-_خیابان_ماشین_سازی_و_خیابان_کمیته_امداد-_شهرک_ایثارگران_-خیابان_بقیه_الله', '2026-08-08', TRUE, '13:00', '15:00', '226- شهرک خزرشهرشمالي و جنوبي- بلوارساحلي از خزرشهر الي سه راه جهاد- خيابان ماشين سازي و خيابان کميته امداد- شهرک ايثارگران -خيابان بقيه الله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|529-_سمت_راست_جاده_نیروگاه_بسمت_جاده_اطرب،_روستاهای_آجند،_چوپان_بنه_آجند،_گلچالسر،_ملیج_گاله،_اسکاردین،_لاکتراشان،_خانسر،_اراضی_کلت_و_بخشی_از_اراضی_شورابسر', '2026-08-08', TRUE, '13:00', '15:00', '529- سمت راست جاده نیروگاه بسمت جاده اطرب، روستاهای آجند، چوپان بنه آجند، گلچالسر، ملیج گاله، اسکاردین، لاکتراشان، خانسر، اراضی کلت و بخشی از اراضی شورابسر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|515-_سمت_چپ_جاده_اومال_بسمت_کوچه_صفائیان،_از_زیرگذر_قلعه_سر_بسمت_چپ_خیابان_آرامگاه_الی_نبش_کوچه_مسجد_سجادیه،_منطقه_خشک_آبندان_و_شهرک_نگین', '2026-08-08', TRUE, '13:00', '15:00', '515- سمت چپ جاده اومال بسمت کوچه صفائیان، از زیرگذر قلعه سر بسمت چپ خیابان آرامگاه الی نبش کوچه مسجد سجادیه، منطقه خشک آبندان و شهرک نگین', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|516-_مجتمع_مسکونی_مسکن_مهر،دانشگاه_پیام_نور_و_شهرک_شهیدعباسپور', '2026-08-08', TRUE, '13:00', '15:00', '516- مجتمع مسکونی مسکن مهر،دانشگاه پیام نور و شهرک شهیدعباسپور', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|232-_میدان_امیرآباد_بسمت_سیکل_ترکیبی،_جاده_گهرباران_تا_پل_شیلات،_روستاهای_نوذرآباد،_دنگسرک_تا_نرسیده_به_سورتینگ_محمدی_و_اراضی', '2026-08-08', TRUE, '13:00', '15:00', '232- میدان امیرآباد بسمت سیکل ترکیبی، جاده گهرباران تا پل شیلات، روستاهای نوذرآباد، دنگسرک تا نرسیده به سورتینگ محمدی و اراضی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|خیابان_آزادگان_10', '2026-08-08', TRUE, '13:40', '15:40', 'خيابان آزادگان 10', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_کیاکلا_-_محمود_آباد_-_ابتدا_محمود_آباد_-محمد_3', '2026-08-08', TRUE, '14:00', '16:00', 'جاده كياكلا - محمود آباد - ابتدا محمود آباد -محمد 3', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|جاده_کیاکلا_-_رمنت_-_پشت_مسجد_امام_حسین-گلزار_34-_گلستان_2تا_4', '2026-08-08', TRUE, '14:00', '16:00', 'جاده كياكلا - رمنت - پشت مسجد امام حسين-گلزار 34- گلستان 2تا 4', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|265-_انتهای_بلوار_کشاورز_-_بالادزا_-_گنبد_-_تنگ_لته_-_پایین_کولا_-_سانخیل_-_وارد_محله_-_پرچیکلا_-_خانعباسی_-_مرمت_-_نوده-_آسیابسر', '2026-08-08', TRUE, '15:00', '17:00', '265- انتهای بلوار کشاورز - بالادزا - گنبد - تنگ لته - پایین کولا - سانخیل - وارد محله - پرچیکلا - خانعباسی - مرمت - نوده- آسيابسر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|324-_بلوار_پاسداران_انتهای_خیابان_مقدم_فر_و_شهید_یوسفی_بعد_از_ریل-14_متری_شهید_رضایی-_انتهای_بلوار_عسگری_محمدیان_خیابان_رسانه_تا_روبروی_پل_دخانیات-_کوچه_شیرآب-_خیابان_فارابی_تا_سراه_خاقانی_و_خیابان_بقیه_الله_تا_چهارراه_کارمندان_قبل_از_امیرکبیر_-_انتهای_خیابان_جام_جم_و_خیابان_دولت_-_انتهای_شهید_احتشامی', '2026-08-08', TRUE, '15:00', '17:00', '324- بلوار پاسداران انتهای خیابان مقدم فر و شهید یوسفی بعد از ریل-14 متری شهید رضایی- انتهای بلوار عسگری محمدیان خیابان رسانه تا روبروی پل دخانیات- کوچه شیرآب- خیابان فارابی تا سراه خاقانی و خیابان بق', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|357-_دودانگه_از_محمدآباد_تا_روستای_میانان_-_مسیر_روستای_شلدره_تا_مسکوپا', '2026-08-08', TRUE, '15:00', '17:00', '357- دودانگه از محمدآباد تا روستای میانان - مسیر روستای شلدره تا مسکوپا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|268-_بلوار_کشاورز_خیابانهای_شهدای_محراب_-_شهید_فهمیده_-_ابتدای_خیابان_لسانی', '2026-08-08', TRUE, '15:00', '17:00', '268- بلوار كشاورز خيابانهاي شهداي محراب - شهيد فهميده - ابتداي خيابان لساني', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|277-_ضلیع_غربی_خیابان_انقلاب_-_بازار_نرگسیه_و_شهید_رجایی_-_مسجد_جامع_-_خیابان_جمهوری_تا_جنب_پاسا‍ژ_رضا_-_خیابان_ملت_-_خیابان_شیخ_طبرسی_-_پشت_دادگستری_چاله_مسجد-ابتدای_خیابان_ورزش_-_پشت_پاساژ_ابوالقاسمی_و_خیابان_رفاه', '2026-08-08', TRUE, '15:00', '17:00', '277- ضلیع غربی خیابان انقلاب - بازار نرگسيه و شهيد رجايي - مسجد جامع - خیابان جمهوری تا جنب پاسا‍ژ رضا - خیابان ملت - خیابان شیخ طبرسی - پشت دادگستری چاله مسجد-ابتدای خیابان ورزش - پشت پاساژ ابوالقاسم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|230-_زاغمرز_-_روستاهای_زاغمرز_-_یکه_توت_-_صنایع_ساحلی_خزر_از_میدان_شهید_هاشمی_نژاد_تا_شرکت_ایران_صدرا', '2026-08-08', TRUE, '15:00', '17:00', '230- زاغمرز - روستاهاي زاغمرز - يكه توت - صنايع ساحلي خزر از ميدان شهيد هاشمي نژاد تا شركت ايران صدرا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|190-_ضلع_شمالی_از_میدان_قدس_تا_چهارراه_گرگان-_خیابان_شهید_صدقی-قائم_-گلها_-_خیابان_جمهوری_-_ابتدای_شهید_برفامی_-_ابتدای_شهید_نجفی_-_شهید_محسنی', '2026-08-08', TRUE, '15:00', '17:00', '190- ضلع شمالي از ميدان قدس تا چهارراه گرگان- خيابان شهيد صدقي-قائم -گلها - خيابان جمهوري - ابتداي شهيد برفامي - ابتداي شهيد نجفي - شهيد محسني', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|181-_خیابان_17_شهریور_-خیابان_نواب_-_سی_متری_آیت_الله_کوهستانی_-_کل_خیابان_مهدیه_-_چهارراه_سنگ_ذغال_تا_میدان_بصیرت-سه_راه_مهدیه_تا_اداره_دارائی_و_ابتدای_خ_گلستان', '2026-08-08', TRUE, '15:00', '17:00', '181- خيابان 17 شهريور -خيابان نواب - سي متري آيت الله کوهستاني - کل خيابان مهديه - چهارراه سنگ ذغال تا میدان بصیرت-سه راه مهدیه تا اداره دارائی و ابتدای خ گلستان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|292-_بلوار_امام_رضا_از_ابتدای_جاده_گلما_تا_روستای_گله_دون_-_کوچه_جهان_پیما_-_امامزاده_عباس', '2026-08-08', TRUE, '15:00', '17:00', '292- بلوار امام رضا از ابتدای جاده گلما تا روستای گله دون - کوچه جهان پیما - امامزاده عباس', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|241-_جاده_دریا_-_از_روبروی_عبور_دازمیرکنده_تا_سراهی_لاریم_-_سراهی_لاریم_تا_سرسر_لنگه_-_عباسعلی_کش_-_لپوصحرا_-_چمازک_-_سمندک', '2026-08-08', TRUE, '15:00', '17:00', '241- جاده دریا - از روبروی عبور دازمیرکنده تا سراهي لاريم - سراهی لاریم تا سرسر لنگه - عباسعلی کش - لپوصحرا - چمازک - سمندک', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|282-_خیابان_امیر_مازندرانی_-_روبروی_بیمارستان_امیر_تا_روبروی_عمارت_شهرداری_-_قسمتی_از_خیابان_شهید_نوری_-_خیابان_عبوری_-_اوایل_فلسطین_-_کوچه_میرمشهد', '2026-08-08', TRUE, '15:00', '17:00', '282- خیابان امیر مازندرانی - روبروی بیمارستان امیر تا روبروی عمارت شهرداری - قسمتی از خیابان شهید نوری - خیابان عبوری - اوایل فلسطین - کوچه میرمشهد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|379-_کمربندی_شمالی_از_عبور_ایران_گاز_تا_میدان_جانبازان_سمت_راست_خیابان_-_شهرک_انتقال_-_کوچه_روستا_-_میدان_جانبازان_تا_عبور_افراکتی_سمت_چپ_خیابان_-_خیابان_ساری_روستای_افراکتی_و_مهدی_آباد_لهرم', '2026-08-08', TRUE, '15:00', '17:00', '379- كمربندي شمالي از عبور ايران گاز تا ميدان جانبازان سمت راست خيابان - شهرك انتقال - كوچه روستا - ميدان جانبازان تا عبور افراكتي سمت چپ خيابان - خيابان ساري روستاي افراكتي و مهدي آباد لهرم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|362-_شانزده_متری_اول_حد_فاصل_کمربندی_تا_میدان_علی_به_سمت_چهارراه_لاریمی_-_ابتدای_لاریمی_کوچه_ایزد_و_کوچه_صداقت_-تامین_اجتماعی_-کوی_پارسا_و_پرورش', '2026-08-08', TRUE, '15:00', '17:00', '362- شانزده متری اول حد فاصل کمربندی تا میدان علی به سمت چهارراه لاریمی - ابتدای لاریمی کوچه ایزد و کوچه صداقت -تامین اجتماعی -کوی پارسا و پرورش', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|405-_سمت_شمالی_خیابان_ساری_از_چهار_راه_ترک_محله_تا_خیابان_ظرافت،_سمت_غربی_خیابان_ظرافت،_کوی_ولیعصر،_کوی_شرافت،_قسمتی_از_کوی_شهید_بهشتی', '2026-08-08', TRUE, '15:00', '17:00', '405- سمت شمالی خيابان ساري از چهار راه ترك محله تا خيابان ظرافت، سمت غربی خیابان ظرافت، كوی وليعصر، كوی شرافت، قسمتي از كوي شهيد بهشتي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|395-_چهار_راه_ترک_محله_به_سمت_مدرسه_ادیب-بخشی_از_کوی_زیراب-حریم_راه_آهن_از_زیرگذر_ترک_محله_تا_عبور_چشمه_سر-مدرسه_داداشی-شهرک_فرهنگیان-آزادی_74', '2026-08-08', TRUE, '15:00', '17:00', '395- چهار راه ترك محله به سمت مدرسه اديب-بخشي از كوي زيراب-حريم راه آهن از زيرگذر ترك محله تا عبور چشمه سر-مدرسه داداشي-شهرك فرهنگيان-آزادي 74', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|388-_حد_فاصل_پل_هوایی_تا_انتهای_کتی_سر', '2026-08-08', TRUE, '15:00', '17:00', '388- حد فاصل پل هوايي تا انتهاي كتي سر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|401-_خیابان_جویبار_حد_فاصل_ایستگاه_تاکسی_تا_ظرافت،_کوی_هفده_شهریور،_کوی_شفا_به_سمت_کتابخانه_و_پارک_سید_محله،_کوی_شهید_سلیمی،_ابتدای_کوی_شهید_بهشتی،_ابتدای_کوچه_سیدین(خیابان_جویبار_)', '2026-08-08', TRUE, '15:00', '17:00', '401- خیابان جویبار حد فاصل ایستگاه تاکسی تا ظرافت، کوی هفده شهریور، کوی شفا به سمت کتابخانه و پارک سید محله، کوی شهید سلیمی، ابتدای کوی شهید بهشتی، ابتدای کوچه سیدین(خیابان جویبار )', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه شمالی | سوادكوه شمالي
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh_shomali|سوادکوه_شمالی|338-_منطقه_لپر_-_سر_تپه_-_شهرک_اشباع_-_منطقه_زیولا_-_کوچه_ازادی_-_کوچه_داوودیان_-_خیابان_امام_رضا_-_کوچه_هدایت_-_کوچه_قائم_-_کوچه_دوستعلی_زاده_-_دلگشا_-_شکوه_عباس_نژاد_-_صداقت-_روستای_شیرجیکلا_-_کلیج_خیل', '2026-08-08', TRUE, '15:00', '17:00', '338- منطقه لپر - سر تپه - شهرک اشباع - منطقه زیولا - کوچه ازادی - کوچه داوودیان - خیابان امام رضا - کوچه هدایت - کوچه قائم - کوچه دوستعلی زاده - دلگشا - شکوه عباس نژاد - صداقت- روستای شیرجیکلا - کلیج ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه شمالی | سوادكوه شمالي
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh_shomali|سوادکوه_شمالی|317-_روستای_منگل_-_پشت_راه_آهن_روستای_مهدی_آباد_-_شرکت_زیگورات_-_چاه_آب_شهرک_بشل_-_دشت_چاکسر', '2026-08-08', TRUE, '15:00', '17:00', '317- روستاي منگل - پشت راه آهن روستاي مهدي آباد - شركت زيگورات - چاه آب شهرك بشل - دشت چاكسر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه شمالی | سوادكوه شمالي
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh_shomali|سوادکوه_شمالی|313-_روستاهای_یاغکوه_و_برنجستانک_-_کارخانه_شهاب_بتن_-_کارخانه_سوله_طبرستان_-_مرغداری_شعبانی_-_پادگان_شهید_یونسی', '2026-08-08', TRUE, '15:00', '17:00', '313- روستاهای یاغکوه و برنجستانک - کارخانه شهاب بتن - کارخانه سوله طبرستان - مرغداری شعبانی - پادگان شهید یونسی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه | سوادکوه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh|سوادکوه|234-_پلسفید_منطقه_2_-_روستای_استخر_سر-_منطقه_امیرده_به_سمت_گلزار_شهدا-_سه_راه_شرکت_نفت_به_سمت_داخل_شهر_و_ملا_جیلم-_منطقه_کندوان_به_سمت_استلک_تا_میدان_شهید_سلیمانی-_روستاهای_اساس_،_اوزود_و_ازانده_-_منطقه_للوک_از_فلورد_به_سمت_سرکله_-روستاهای_رجه_و_دهمیان_تا_برنت_-_مسیر_سنگده_تا_فریم', '2026-08-08', TRUE, '15:00', '17:00', '234- پلسفيد منطقه 2 - روستاي استخر سر- منطقه اميرده به سمت گلزار شهدا- سه راه شركت نفت به سمت داخل شهر و ملا جيلم- منطقه كندوان به سمت استلك تا ميدان شهيد سليماني- روستاهاي اساس ، اوزود و ازانده - منط', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه | سوادکوه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh|سوادکوه|237-_زیراب_منطقه2:_ازمنطقه_بالازیراب_سمت_چپ_بلوارتا_پمپ_بنزین_–_محدوده_هنرستان_وشهرک_فرهنگیان_-_محدوده_امامزاده_ابوطالب_زیر_جاده_سمت_چپ_بلواربسمت_اداره_برق_تا_روبروی_بیمارستان_-_خیابان_آزادی_بعد_بیمارستان_ازپل_هوایی_بسمت_کوچه_آینه_تا_ایستگاه_آلاشت_-_مسیرخیابان_17_شهریور،_خیابان_انقلاب،_نوبنیاد_وخیابان_خدمات_،راهبندی_وچمران_-_بعد_ازمیدان_ازقبل_ایستگاه_سواری_قائمشهرسمت_چپ_بلواربسمت_سپاه_ودمزنون_-_منطقه_کرد_آباد،_سرخکلا_وکنیج_کلا-_روستاهای_معدن،_قاسم_آباد،_جمشیدآباد_تا_جوارم', '2026-08-08', TRUE, '15:00', '17:00', '237- زیراب منطقه2: ازمنطقه بالازيراب سمت چپ بلوارتا پمپ بنزين – محدوده هنرستان وشهرك فرهنگيان - محدوده امامزاده ابوطالب زير جاده سمت چپ بلواربسمت اداره برق تا روبروی بیمارستان - خيابان آزادي بعد بیمار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|432-_سمت_راست_جاده_کوهیخیل_به_بهنمیر_–_دونچال_-_لاک_دشت-_انارمرز-گلدشت-نفت_چال-لپورصحرا-_شهرک_قناری-_شهرک_بهشت_پنهان-_دانشگاه_آزاد-_پرورش_خاویار_اسلامی-شرکت_روماک-سالن_ورزشی_حسن_یزدانی_–_میستان_–_زغال_منزل', '2026-08-08', TRUE, '15:00', '17:00', '432- سمت راست جاده کوهیخیل به بهنمیر – دونچال - لاک دشت- انارمرز-گلدشت-نفت چال-لپورصحرا- شهرک قناری- شهرک بهشت پنهان- دانشگاه آزاد- پرورش خاویار اسلامی-شرکت روماک-سالن ورزشی حسن یزدانی – میستان – زغال', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|038-_میدان_مادر،_حر_14،_کوچه_های_(لاله_1_تا_14)،_شهاب_نیا_کوچه_های_(حر_11_تا_25)_و_حر_8', '2026-08-08', TRUE, '15:00', '17:00', '038- میدان مادر، حر 14، کوچه های (لاله 1 تا 14)، شهاب نیا کوچه های (حر 11 تا 25) و حر 8', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|097-_فیضیه_2،_گلستان_های_3_،4،_9_و_13،_،_شهرک_صالحین،_گلستان_و_صدف،_بازگیر_کلا_کوچه_های_محسن_پور_غربی_و_کوچه_های_کمیل،_یاسر_و_عمار', '2026-08-08', TRUE, '15:00', '17:00', '097- فیضیه 2، گلستان های 3 ،4، 9 و 13، ، شهرک صالحین، گلستان و صدف، بازگیر کلا کوچه های محسن پور غربی و کوچه های کمیل، یاسر و عمار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|128-_امیرکبیر_شرقی_و_غربی_کوچه_های_(فردوس2_تا_14و_فردوس_1تا_23)،_کوچه_های_سما،_فردوس_4_تا_معراج_16_و_(معلم_12_تا_20)_و_چهار_راه_تندست_تا_بیمارستان_بابل_کلینیک_کوچه_های_کاکا9و_4', '2026-08-08', TRUE, '15:00', '17:00', '128- امیرکبیر شرقی و غربی کوچه های (فردوس2 تا 14و فردوس 1تا 23)، کوچه های سما، فردوس 4 تا معراج 16 و (معلم 12 تا 20) و چهار راه تندست تا بیمارستان بابل کلینیک کوچه های کاکا9و 4', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|127-_میدان_سردار_سلیمانی_از_معلم_19_تا_دانشگاه_نوشیروانی،_گلستان_19_تا_ورودی_بسیج_1_و_گلستان20_،_از_چهارراه_شهرک_دانش_تا_خوابگاه_امنیان_(مصلی_های1تا_7_و2تا_4)_،_قسمتی_از_محله_رضیاکلا_واز_چهارراه_دانش_تا_گلستان_20و_گلستان_16و_21', '2026-08-08', TRUE, '15:00', '17:00', '127- میدان سردار سلیمانی از معلم 19 تا دانشگاه نوشیروانی، گلستان 19 تا ورودی بسیج 1 و گلستان20 ، از چهارراه شهرک دانش تا خوابگاه امنیان (مصلی های1تا 7 و2تا 4) ، قسمتی از محله رضیاکلا واز چهارراه دانش ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|130-_هوشنگ_پوری_(بسیج_های_10_تا_20)،_میدان_بسیج_تا_چهار_راه_امیرکبیر،_توحید_46_تا_سبحان_4(_از_توحید_46_تا52_و_58تا_66_)_و_(توحید_41_تا_49)_وکوچه_صائمی_و_توحید_43_کوچه_های_یعقوبی_و_شکوفه', '2026-08-08', TRUE, '15:00', '17:00', '130- هوشنگ پوری (بسیج های 10 تا 20)، میدان بسیج تا چهار راه امیرکبیر، توحید 46 تا سبحان 4( از توحید 46 تا52 و 58تا 66 ) و (توحید 41 تا 49) وکوچه صائمی و توحید 43 کوچه های یعقوبی و شکوفه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|036-_بلوار_مادر_کوچه_های_بارفروش5_تا_مامطیر_2وردی_مسکن_مهر_و_از_(حجاب_1_تا_6)،_و_مسکن_مهر_امید', '2026-08-08', TRUE, '15:00', '17:00', '036- بلوار مادر کوچه های بارفروش5 تا مامطیر 2وردی مسکن مهر و از (حجاب 1 تا 6)، و مسکن مهر امید', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|098-_از_میدان_فاضل_تا_فیضیه_10_،_فیضیه_14_تا_طالقانی_5شهرک_سجاد_شهرک_سجاد،از_میدان_شهید_نجاریان_تا_دانشگاه_راه_دانش_کوچه_های_محسن_پور_غربی_1تا_12_،_شهرک_گلستان_،_کوچه_باباجانیان_-_کوچه_فلاح_،_اتحاد_،_تا_بلوار_حائری_،گلستان_9_تا_تربیت_معلم_و_پزشک_قانونی', '2026-08-08', TRUE, '15:00', '17:00', '098- از میدان فاضل تا فیضیه 10 ، فیضیه 14 تا طالقانی 5شهرک سجاد شهرک سجاد،از میدان شهید نجاریان تا دانشگاه راه دانش کوچه های محسن پور غربی 1تا 12 ، شهرک گلستان ، کوچه باباجانیان - کوچه فلاح ، اتحاد ، ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|102-_فیضیه_14_از_انتهای_طالقانی_5تا_کوچه_گرمابه_خزر_تا_سه_راه_حیدرکلا_-_واز_سه_راه_حیدر_کلا_بسمت_کوچه_شهید_فیروزجایی_تا_چهارراه_شهید_قربانی_-_حیدر_7تا_17_و_10تا_26-32-_،_محله_حیدرکلا(حیدر(17_تا39و_26تا_40)_بلوار_نژاد_اکبر_از_ابتدا_بلوار_کوچه_های_ولیعصر1_تا_28_تا_انتهای_حاجی_کلا_میدان_،_قالیشویی_اطلس_،_شهرک_صاحب_الزمان_،_روستای_حاجیکلا', '2026-08-08', TRUE, '15:00', '17:00', '102- فیضیه 14 از انتهای طالقانی 5تا کوچه گرمابه خزر تا سه راه حیدرکلا - واز سه راه حیدر کلا بسمت کوچه شهید فیروزجایی تا چهارراه شهید قربانی - حیدر 7تا 17 و 10تا 26-32- ، محله حیدرکلا(حیدر(17 تا39و 26ت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|169-_از_شهر_مرزیکلا_تا_باغ_پهلوان_گنج_افروز،_درونکلای_شرقی،_فولاد_کلا،_هلیدشت،_طلوت،_پایین_گنج_افروز(_خشک_دشت،_اسبوکلا،_کمانگر_کلا،_دومیرکلا،_معلم_کلا،_کلاگر_محله،_سادات_محله)_و_جنب_پل_چاری', '2026-08-08', TRUE, '15:00', '17:00', '169- از شهر مرزیکلا تا باغ پهلوان گنج افروز، درونکلای شرقی، فولاد کلا، هلیدشت، طلوت، پایین گنج افروز( خشک دشت، اسبوکلا، کمانگر کلا، دومیرکلا، معلم کلا، کلاگر محله، سادات محله) و جنب پل چاری', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|138-_باغ_ثباتی،_بین_کارگر_تا_انتهای_موزیرج،_خ_شهید_صالحی_از_حسینی_1_تا_سید_ذکریا', '2026-08-08', TRUE, '15:00', '17:00', '138- باغ ثباتی، بین کارگر تا انتهای موزیرج، خ شهید صالحی از حسینی 1 تا سید ذکریا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|135-_شهرک_امام،_شهرک_انقلاب،_کمانگر_کلا،_کوچه_جمال_،_قسمتی_از_درزیکلا_نصیرایی،_شهرک_شمال_1_و_2،وکوچه_پور_گنجی_فرداز_1تا37', '2026-08-08', TRUE, '15:00', '17:00', '135- شهرک امام، شهرک انقلاب، کمانگر کلا، کوچه جمال ، قسمتی از درزیکلا نصیرایی، شهرک شمال 1 و 2،وکوچه پور گنجی فرداز 1تا37', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|504-_شهر_گتاب_تا_اطاقسرا_شماره4،_حوالی_بخشداری،_بیل_پی،_مشهدسرا،_سیدکلا_(بالا_و_پایین)،_پائین_مرزبال،_سه_راه_احمد_کلا_تا_انتهای_صورت', '2026-08-08', TRUE, '15:00', '17:00', '504- شهر گتاب تا اطاقسرا شماره4، حوالی بخشداری، بیل پی، مشهدسرا، سیدکلا (بالا و پایین)، پائین مرزبال، سه راه احمد کلا تا انتهای صورت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|165-_درازکلا_تا_انتهای_منطقه_جنگلی_تیرکن،_ریگ_چشمه،_شالیکش،_همه_کتن،_مس_دره،_هلی_کتی،_بلکرون،_موزی_کتی،_جاجن،_وزتلک_و_فرام_لک،_ازارون،_تیرکن،_ممرزکن،_چهره،_بالف_کلا_و_کلاری_کلا،_کبریاکلا،_امیر_کلا', '2026-08-08', TRUE, '15:00', '17:00', '165- درازکلا تا انتهای منطقه جنگلی تیرکن، ریگ چشمه، شالیکش، همه کتن، مس دره، هلی کتی، بلکرون، موزی کتی، جاجن، وزتلک و فرام لک، ازارون، تیرکن، ممرزکن، چهره، بالف کلا و کلاری کلا، کبریاکلا، امیر کلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|214-_کرکنار،_یزدان_آباد،_شانه_تراش_،_شاه_سیب_کلا،_عالی_زمین،_معلم_کلا_و_قسمتی_از_قمی_کلا،_شوبکلا', '2026-08-08', TRUE, '15:00', '17:00', '214- کرکنار، یزدان آباد، شانه تراش ، شاه سیب کلا، عالی زمین، معلم کلا و قسمتی از قمی کلا، شوبکلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|008-_روستاهای_متکه_،_امین_اباد_جنوبی،_کروکلا_(بالا_و_پایین)،_هلال_کلا_جنوبی،_نوایی_کلا،_مصیر_محله،_اندی_کلا،_تاری_محله', '2026-08-08', TRUE, '15:00', '17:00', '008- روستاهای متکه ، امین اباد جنوبی، کروکلا (بالا و پایین)، هلال کلا جنوبی، نوایی کلا، مصیر محله، اندی کلا، تاری محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|212-_شهر_خشرودپی_تا_کارخانه_آسفالت،_مقریکلا،_پنبه_جار،_تسکا،_کاردیکلای_غربی،_کامی_کلا،_پلنگ_دره،_شهنه_پشته،_فریدون_کلا_تا_انجیلک،_بورا،_ولیک،_افراسیاب_کلا،_پازمین،_لمسوکلا،_موزکتی،_مچکتی،_پولادسی،_ازارسی', '2026-08-08', TRUE, '15:00', '17:00', '212- شهر خشرودپی تا کارخانه آسفالت، مقریکلا، پنبه جار، تسکا، کاردیکلای غربی، کامی کلا، پلنگ دره، شهنه پشته، فریدون کلا تا انجیلک، بورا، ولیک، افراسیاب کلا، پازمین، لمسوکلا، موزکتی، مچکتی، پولادسی، ازا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|407-_جاده_بابلسر_به_بابل_روستاهای_پایین_نقیب_-_راه_کلا_و_نی_کلا_-_درزی_نقیب_-_بالانقیب_-_فولادکلا_-_رکون_-_سادات_محله_-_رضاکلا_-_اسی_کلا_-_چوپانکلا_-_تاجدوله_-_پیچ_قریشی', '2026-08-08', TRUE, '15:00', '17:00', '407- جاده بابلسر به بابل روستاهاي پايين نقيب - راه کلا و ني کلا - درزي نقيب - بالانقيب - فولادکلا - رکون - سادات محله - رضاکلا - اسي کلا - چوپانکلا - تاجدوله - پيچ قريشي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|507-_حد_فاصل_پست_نکا_2روستا_اسرم_وصفر_اباد_جامخانه_وروستا_پیله_کوه', '2026-08-08', TRUE, '15:00', '17:00', '507- حد فاصل پست نکا 2روستا اسرم وصفر اباد جامخانه وروستا پیله کوه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|082-_ثامن_4_و_6_و_8_و_5-اسپیاری_از_آگاهی_تا_نبش_ثامن_8-بلوار_آیت_از_آیت_3_تا_13_و_آیت_12_و_14_-بلوار_جانبازان_ایثار_8/1', '2026-08-08', TRUE, '15:00', '17:00', '082- ثامن 4 و 6 و 8 و 5-اسپیاری از آگاهی تا نبش ثامن 8-بلوار آیت از آیت 3 تا 13 و آیت 12 و 14 -بلوار جانبازان ایثار 8/1', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|085-_از_بیمارستان_17_شهریور_تا_میدان_طبری_-_از_طبری_5_تا_بانک_سپه_مرکزی_-_خیابان_فرهنگ_-بلوار_طالقانی_از_اباذر_14_تا_اباذر_22', '2026-08-08', TRUE, '15:00', '17:00', '085- از بیمارستان 17 شهریور تا میدان طبری - از طبری 5 تا بانک سپه مرکزی - خیابان فرهنگ -بلوار طالقانی از اباذر 14 تا اباذر 22', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|059-_آفتاب_45-_آفتاب_34_و_36_تا_میدان_حر-_میدان_حر_الی_کوچه_جهاد_-_میدان_حر_بطرف_فرهنگ_شهر_-_کوچه_های_مزین_تبار_انتهای_آفتاب_46_شهرک_رجایی_الی_چهار_راه_مسجد_غریب_الغربا', '2026-08-08', TRUE, '15:00', '17:00', '059- آفتاب 45- آفتاب 34 و 36 تا میدان حر- میدان حر الی کوچه جهاد - میدان حر بطرف فرهنگ شهر - کوچه های مزین تبار انتهای آفتاب 46 شهرک رجایی الی چهار راه مسجد غریب الغربا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|440-_از_سه_راه_درویش_خیل_تا_اداره_برق_و_دادگستری_سمت_چپ_و_راست_جاده_درویش_خیل', '2026-08-08', TRUE, '15:00', '17:00', '440- از سه راه درویش خیل تا اداره برق و دادگستری سمت چپ و راست جاده درویش خیل', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|051-_ابتدای_کمربندی_هراز_به_سمت_هزارسنگر_سمت_راست_-_ترک_کلا_تا_روستای_پاسکی_محله_-_رودباردشت_-_بزمینان_-_کمکلا_-_روستای_پاسکی_محله_-کته_پشت_علیا_-_میان_محله', '2026-08-08', TRUE, '15:00', '17:00', '051- ابتدای کمربندی هراز به سمت هزارسنگر سمت راست - ترک کلا تا روستای پاسکی محله - رودباردشت - بزمینان - کمکلا - روستای پاسکی محله -کته پشت علیا - میان محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|071-_خیابان_امام_رضا-_رضوان2_الی_رضوان24-_رضوان9_الی_رضوان21-_کوچه_دادگستری', '2026-08-08', TRUE, '15:00', '17:00', '071- خیابان امام رضا- رضوان2 الی رضوان24- رضوان9 الی رضوان21- کوچه دادگستری', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|471-_جاده_قدیم_آمل_به_بابل_-_مبله_-_نوده_-_تیرکلا_-_خرمن_کلا_-_نظام_آبادو_داوود_کلا', '2026-08-08', TRUE, '15:00', '17:00', '471- جاده قديم آمل به بابل - مبله - نوده - تيركلا - خرمن كلا - نظام آبادو داوود كلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|076-_بلوار_منفرد-_شهرک_پارسیان-_اداره_مالیات-_امیر35-_امیر48_-_امیر25-_امیر46_الی_امیر64-_خیابان_امام_رضا_رضوان54_الی_رضوان56.1-_بلوار_مطهری_تربیت11و_تربیت15', '2026-08-08', TRUE, '15:00', '17:00', '076- بلوار منفرد- شهرک پارسیان- اداره مالیات- امیر35- امیر48 - امیر25- امیر46 الی امیر64- خیابان امام رضا رضوان54 الی رضوان56.1- بلوار مطهری تربیت11و تربیت15', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|538-از_سه_راه_واسکس_الی_روستاهای_مریج_محله_و_کچپ_تا_پایان_حوزه_استحفاظی_سرخرود', '2026-08-08', TRUE, '15:00', '17:00', '538-از سه راه واسکس الی روستاهای مریج محله و کچپ تا پایان حوزه استحفاظی سرخرود', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|412-_خیابان_شهید_محمد_زاده_از_بیمارستان_شفا_الی_جنب_درب_دوم_امام_زاده_ابراهیم_-_و_خیابان_کهن_تا_چهار_راه_باشگاه_تختی_-_شریفی_13-قسمتی_از_ضلع_شرقی_جاده_بابلسر_به_بابل_و_قسمتی_از_ضلع_شرقی_روستای_بابلپشت_-', '2026-08-08', TRUE, '15:00', '17:00', '412- خیابان شهید محمد زاده از بیمارستان شفا الی جنب درب دوم امام زاده ابراهیم - و خیابان کهن تا چهار راه باشگاه تختی - شریفی 13-قسمتی از ضلع شرقی جاده بابلسر به بابل و قسمتی از ضلع شرقی روستای بابلپشت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|217-_بلوار_شهید_علیزاده_پارکینک_های_و_7و8و9-_خیابان_شهید_محبوبی-شهرک_شهید_میرزایی_-_شهرک_ساحلی_-_خیابان_شریعتی_از_شریعتی_8_الی_شریعتی_26_و_میدان_شیلات_-_میدان_شیلات-_کوچه_مرجان-_انتهای_خیابان_اول_شهرک_دریاکنار_جنب_سی_ساید', '2026-08-08', TRUE, '15:00', '17:00', '217- بلوار شهيد عليزاده پاركينك هاي و 7و8و9- خيابان شهيد محبوبي-شهرك شهيد ميرزايي - شهرك ساحلي - خيابان شريعتي از شريعتي 8 الي شريعتي 26 و ميدان شيلات - ميدان شيلات- كوچه مرجان- انتهاي خيابان اول شهرك', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|411-_ضلع_شمالی_هادی_شهر_حد_فاصل_ورودی_الی_سه_راه_کیخامحله-_روستاهای_کیخامحله-_درزی_محله-_لاری_محله-_رودبست-_سادات_محله-_اسفندیار_محله_-_خشکرود', '2026-08-08', TRUE, '15:00', '17:00', '411- ضلع شمالي هادي شهر حد فاصل ورودي الي سه راه كيخامحله- روستاهاي كيخامحله- درزي محله- لاري محله- رودبست- سادات محله- اسفنديار محله - خشكرود', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|528-_سمت_چپ_جاده_نیروگاه_بسمت_میدان_جانبازان،_کوچه_های_شمیرانی،قالیشویی،روستاهای_چاله_پل_،_چناربن،_میانگاله،_درزی_محله،_ندافخیل،_گل_خیل،_دوراب،پمپ_بنزین_تیموری،کمیشان،شورابسر_و_اراضی،پایانه_حمل_و_نقل،اراضی_روبروی_عبورکمیشان_بسمت_دانشگاه_آزاد_و_بخشی_از_روستای_کلت', '2026-08-08', TRUE, '15:00', '17:00', '528- سمت چپ جاده نیروگاه بسمت میدان جانبازان، کوچه های شمیرانی،قالیشویی،روستاهای چاله پل ، چناربن، میانگاله، درزی محله، ندافخیل، گل خیل، دوراب،پمپ بنزین تیموری،کمیشان،شورابسر و اراضی،پایانه حمل و نقل،', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|518-_جاده_نیروگاه_از_سه_راه_الغدیر_بسمت_جاده_اطرب،_بخشی_از_روستای_طوسکلا_بسمت_جاده_قدیم_شهاب_الدین،_روستاهای_شهاب_الدین،_ولاشد،_بهزادکلا،_اطرب_و_اراضی_ولاشد_بسمت_مسیر_درزی_محله', '2026-08-08', TRUE, '15:00', '17:00', '518- جاده نیروگاه از سه راه الغدیر بسمت جاده اطرب، بخشی از روستای طوسکلا بسمت جاده قدیم شهاب الدین، روستاهای شهاب الدین، ولاشد، بهزادکلا، اطرب و اراضی ولاشد بسمت مسیر درزی محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|534-_روستاهای_زیارتکلا،لایی_رودبار،_کلارودبار،_شیت،_درزی_کلا،_ایویم،_درم،_سارم،_استخرپشت،_حسین_آباد،_اریم،_پجت', '2026-08-08', TRUE, '15:00', '17:00', '534- روستاهای زیارتکلا،لایی رودبار، کلارودبار، شیت، درزی کلا، ایویم، درم، سارم، استخرپشت، حسین آباد، اریم، پجت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|512-_روبروی_نودهک_از_سایپا_یدک_بسمت_میدان_امام_حسین_و_ابتدای_پل_مرکز_شهر(بخشی_از_صفائیان،کوچه_های_نظامزاده،_رفیعی،_فرمانداری،_رضایی،مجتمع_مسکونی_بهارنارنج_و_کارخانه_یخ_سابق،_کوچه_نیایش_ابتدای_کوچه_تا_مسجد_حضرت_ابوالفضل،شریفی،_8متری،_ابتدای_هادوی،_مخابرات_شماره2،_اداره_پست،علامه_طباطبایی،_اداره_اصناف،_فرهنگیان،_مصباحی)', '2026-08-08', TRUE, '15:00', '17:00', '512- روبروی نودهک از سایپا یدک بسمت میدان امام حسین و ابتدای پل مرکز شهر(بخشی از صفائیان،کوچه های نظامزاده، رفیعی، فرمانداری، رضایی،مجتمع مسکونی بهارنارنج و کارخانه یخ سابق، کوچه نیایش ابتدای کوچه تا ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|بابلسر_-_بخش_هادی_شهر_-_روبروی_افق_کوروش', '2026-08-08', TRUE, '16:00', '18:00', 'بابلسر - بخش هادي شهر - روبروي افق كوروش', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|483-_منطقه_چهاردانگه_-_از_روستای_جمال_الدین_کلا_بسمت_روستاهای_ارا_-_اروست_-_مالخواست_-_دهستان_پشتکوه', '2026-08-08', TRUE, '17:00', '19:00', '483- منطقه چهاردانگه - از روستاي جمال الدين کلا بسمت روستاهاي ارا - اروست - مالخواست - دهستان پشتکوه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|264-_ضلع_غربی_بلوار_کشاورز_از_پل_سردار_نبوی_تا_پل_کمربندی_جنوبی_-_خیابان_پژمان_و_سروینه_باغ_-_براری-_شربتی_-_قدس_-_صاحب_زمان_-خیابانهای_پژمان_و_سروینه_باغ', '2026-08-08', TRUE, '17:00', '19:00', '264- ضلع غربی بلوار کشاورز از پل سردار نبوی تا پل کمربندی جنوبی - خیابان پژمان و سروینه باغ - براری- شربتی - قدس - صاحب زمان -خيابانهاي پژمان و سروينه باغ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|485-_چهاردانگه_شهر_کیاسر', '2026-08-08', TRUE, '17:00', '19:00', '485- چهاردانگه شهر کياسر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|323-_ضلع_جنوبی_بلوار_پاسداران_-_از_ترمینال_غرب_تا_میدان_امام_-_کوچه_های_مهدوی-_مقدم_فر_-_شهید_بهرامی_-_شهید_یوسفی', '2026-08-08', TRUE, '17:00', '19:00', '323- ضلع جنوبی بلوار پاسداران - از ترمینال غرب تا میدان امام - کوچه های مهدوی- مقدم فر - شهید بهرامی - شهید یوسفی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|267-_ضلع_جنوبی_بلوار_سلیم_بهرامی_تا_جاده_قائمشهر_کلیه_مناطق_تحت_پوشش_از_جمله-_گلچینی_1و2-_روستای_میانرود-_پایین_سنگریزه_-_بالا_سنگریزه-_-خیابان_آهی_دشت_و_خیابان_میرجانی', '2026-08-08', TRUE, '17:00', '19:00', '267- ضلع جنوبی بلوار سلیم بهرامی تا جاده قائمشهر كليه مناطق تحت پوشش از جمله- گلچيني 1و2- روستاي ميانرود- پايين سنگريزه - بالا سنگريزه- -خيابان آهي دشت و خیابان میرجانی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- گلوگاه | گلوگاه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|galugah|گلوگاه|496-_حدفاصل_پل_هزارجریب_الی_توسکا_چشمه-روستاهای_نیالا،_رمدان،_اوارد،_مصیب_محله،_همچان،_وزوار،_آغوزدره،_چین_پارچ،_ویوا،_دهی،_کلکت،_لت_کومه،_بارکلا-روستاهای_دهستان_شهدای_بخش_یانه_سر_شامل_سفید_چاه_،سرخ_گریوه_،یانه_سر،_اندرات_،_الارز_،_الارزبوم_،_پیته_نو،_ارضت_،_پارسا_،_کلیا_،_عبداللهی،_بادله_دره_،_غلامی_،_پابند_،_لند_،_استارم_،_ونشید_،_سنگروچ_،_کفترکار_،_گت_چشمه_-روستاهای_یخکش_،_پجیم_،_زلت', '2026-08-08', TRUE, '17:00', '19:00', '496- حدفاصل پل هزارجریب الی توسکا چشمه-روستاهای نیالا، رمدان، اوارد، مصیب محله، همچان، وزوار، آغوزدره، چین پارچ، ویوا، دهی، کلکت، لت کومه، بارکلا-روستاهای دهستان شهدای بخش یانه سر شامل سفید چاه ،سرخ گ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|446-_تمام_شهر_رستم_کلا_(_ضلع_جنوبی_بلوار_سراسری_)_به_سمت_معدن', '2026-08-08', TRUE, '17:00', '19:00', '446- تمام شهر رستم كلا ( ضلع جنوبي بلوار سراسري ) به سمت معدن', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|191-_میدان_قدس_از_ابتدای_خیابان_شهید_مدنی_تا_چهارراه_گرگان-_خیابان_پیشوا_-پاسداران_-_انتهای_گرجی_محله_-سورک_محله_-_شهید_ریاحی_-_جاده_کنت_-_کوچه_سراج', '2026-08-08', TRUE, '17:00', '19:00', '191- ميدان قدس از ابتداي خيابان شهيد مدني تا چهارراه گرگان- خيابان پيشوا -پاسداران - انتهای گرجي محله -سورک محله - شهید ریاحی - جاده کنت - کوچه سراج', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|183-_حدفاصل_میدان_بهزیستی_الی_نبش_خ_سازگار_-_منطقه_کشتارگاه_-_شهید_باقری_-_شهیدان_رضیعی_-گلشهر_-_کوایی_محله_-_کوچه_اصغرپور', '2026-08-08', TRUE, '17:00', '19:00', '183- حدفاصل میدان بهزیستی الی نبش خ سازگار - منطقه کشتارگاه - شهید باقری - شهیدان رضیعی -گلشهر - کوایی محله - کوچه اصغرپور', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|184-_خیابان_مطهر-_خیابان_ابوعمار-_حدفاصل_میدان_قائم_تا_مسجد_رضویه(خیابان_مفتح)_-_نقاش_محله_-_انتهای_شهید_نجفی-_انتهای_شهیدلیوانی-شهیدشفاهی_-_انتهای_شهید_برفامی_-_شهید_صدقی_تا_باشگاه_توحید_و_محیط_زیست', '2026-08-08', TRUE, '17:00', '19:00', '184- خيابان مطهر- خيابان ابوعمار- حدفاصل ميدان قائم تا مسجد رضويه(خيابان مفتح) - نقاش محله - انتهاي شهيد نجفي- انتهاي شهيدليواني-شهيدشفاهي - انتهاي شهيد برفامي - شهيد صدقي تا باشگاه توحيد و محيط زيست', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|294-_کمربندی_شزقی_تا_انتهای_معلم_-_خیابان_معلم_-_سمت_چپ_بلوار_پرستار_-_بخشی_از_خیابان_مهیار_-_قسمتی_از_خیابان_قائم', '2026-08-08', TRUE, '17:00', '19:00', '294- کمربندي شزقي تا انتهاي معلم - خيابان معلم - سمت چپ بلوار پرستار - بخشي از خيابان مهيار - قسمتي از خيابان قائم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|290-_کمربندی_سمسکنده_کوچه_نیما_-_شهدای_گمنام_-_جاده_گلما_(شهدای_شمال_پل_تجن)_-_باغ_بهارستان_تا_اواسط_روستای_معلم_کلای_سفلی_روستای_اردشیر_محله_-_ولشکلا_-_حسین_آباد_-_گلما', '2026-08-08', TRUE, '17:00', '19:00', '290- كمربندي سمسكنده كوچه نيما - شهداي گمنام - جاده گلما (شهدای شمال پل تجن) - باغ بهارستان تا اواسط روستاي معلم كلاي سفلي روستاي اردشير محله - ولشكلا - حسين آباد - گلما', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|291-_کمربندی_شرقی_از_کنار_گذر_سی_ان_جی_شهرداری_تا_پمپ_بنزین_محبتی_-خیابان_ولیعصر_9-_کوچه_ولیعصر_8_-_کوچه_ولیعصر_5-_خیابان_شهید_قلیان_-_کوچه_شهید_عباسی_-_شهید_ندافی_-_پنج_تن_-مجتمع_صدا_و_سیما_-بلوار_شهید_تقوی_پشت_بیمارستان_شفا_-کوچه_شهید_نوروزی_-_شهید_سنجابی_-شهید_محمودی_-_ترنج-_انتهای_اندر_خورا_-_کل_خیابان_مهیار_-زینبیه_8_-_انتهای_قائم_6_-قائم_4_-_انتهای_بلوار_پرستار_کوچه_شهید_احمدیان-', '2026-08-08', TRUE, '17:00', '19:00', '291- كمربندي شرقي از كنار گذر سي ان جي شهرداري تا پمپ بنزين محبتي -خيابان وليعصر 9- كوچه وليعصر 8 - كوچه وليعصر 5- خيابان شهيد قليان - كوچه شهيد عباسي - شهيد ندافي - پنج تن -مجتمع صدا و سيما -بلوار شه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|256-_سمت_راست_بلوار_فرح_آباد،_از_کوی_دانشگاه_2_الی_ماهفروز_محله_(_کلیه_روستاهای_مسیر)_فیروزکنده،_تا_عبور_دوم_روبروی_دانشگاه_کشاورزی', '2026-08-08', TRUE, '17:00', '19:00', '256- سمت راست بلوار فرح آباد، از کوی دانشگاه 2 الی ماهفروز محله ( کلیه روستاهای مسیر) فیروزکنده، تا عبور دوم روبروي دانشگاه کشاورزي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|369-_ابوخیل_-بورخیل-قاسم_خیل_-کفشگرکلا-جوجاده-افراتخت', '2026-08-08', TRUE, '17:00', '19:00', '369- ابوخیل -بورخیل-قاسم خیل -کفشگرکلا-جوجاده-افراتخت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|370-_اتوبان_ساری_قائمشهر_از_رستوران_ماسوله_تا_شرکت_فولاد_طبرستان_-_از_شرکت_فرش_ساوین_تا_عبور_تخته_فشرده_-_روستاهای_المشیر-_افراپل-_پائین_جاده', '2026-08-08', TRUE, '17:00', '19:00', '370- اتوبان ساری قائمشهر از رستوران ماسوله تا شرکت فولاد طبرستان - از شرکت فرش ساوین تا عبور تخته فشرده - روستاهای المشیر- افراپل- پائین جاده', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|390-_خیابان_تهران_حد_فاصل_مهتاب_تا_جنگلبانی_سمت_راست_خیابان،_کوی_طالقانی،_رینگ_داخلی_تا_پمپ_بنزین_امیری،_حد_فاصل_سه_راه_فیروزکوه_تا_البرز_106،_کوی_آرش_و_حافظ', '2026-08-08', TRUE, '17:00', '19:00', '390- خیابان تهران حد فاصل مهتاب تا جنگلبانی سمت راست خیابان، کوی طالقانی، رینگ داخلی تا پمپ بنزین امیری، حد فاصل سه راه فیروزکوه تا البرز 106، کوی آرش و حافظ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|358-_کمربندی_شمالی_حد_فاصل_شانزده_متری_اول_تا_چهاراه_جویبار_سمت_راست_-_خیابان_کوچکسرا_از_شقایق_2_تا_مسجد_الرسول_و_خیابان_سینا_-وحدت_-شهید_احمدی', '2026-08-08', TRUE, '17:00', '19:00', '358- کمربندی شمالی حد فاصل شانزده متری اول تا چهاراه جویبار سمت راست - خیابان کوچکسرا از شقایق 2 تا مسجد الرسول و خیابان سینا -وحدت -شهید احمدی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|428-_جاده_بابل_از_عبور_جاده_نظامی_به_سمت_بابل_سمت_چپ_خیابان_-_قراخیل_-گزنه_کلا_-پمپ_بنزین_توت_فرنگی_-پمپ_بنزین_عنایت_زاده_-ابتدای_جاده_نظامی_تا_نساجی_سمت_راست_خیابان_-فرماندهی_نیروی_انتظامی', '2026-08-08', TRUE, '17:00', '19:00', '428- جاده بابل از عبور جاده نظامی به سمت بابل سمت چپ خیابان - قراخیل -گزنه کلا -پمپ بنزین توت فرنگی -پمپ بنزین عنایت زاده -ابتدای جاده نظامی تا نساجی سمت راست خیابان -فرماندهی نیروی انتظامی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|363-_کمربندی_شمالی_از_16_متری_اول_تاچهار_راه_جویبار_-_خیابان_جویبار_حد_فاصل_ظرافت_تا_کمربندی_شمالی_-_خیابان_جویبار_از_ظرافت_تا_ایثار_16', '2026-08-08', TRUE, '17:00', '19:00', '363- كمربندي شمالي از 16 متري اول تاچهار راه جويبار - خيابان جويبار حد فاصل ظرافت تا كمربندي شمالي - خيابان جويبار از ظرافت تا ايثار 16', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|380-_خیابان_ساری_کوی_مهمانسرا', '2026-08-08', TRUE, '17:00', '19:00', '380- خيابان ساري كوي مهمانسرا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|392-_خیابان_تهران_از_شرکت_نفت_چهارراه_حسن_آباد_-ارکیده_-کوی_شهید_نوریان_کفشگرکلا_-پشت_مصلی_-کوی_خرم_-کوچه_مهتاب', '2026-08-08', TRUE, '17:00', '19:00', '392- خیابان تهران از شرکت نفت چهارراه حسن آباد -ارکیده -کوی شهید نوریان کفشگرکلا -پشت مصلی -کوی خرم -کوچه مهتاب', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|402-_خیابان_ساری_از_زیرگذر_ترک_محله_به_سمت_خیابان_مولوی،_کوی_ورزش،_شهید_پلنگی،_مسکن_مهر_ترک_محله،_کارخانه_نساجی_شماره_1', '2026-08-08', TRUE, '17:00', '19:00', '402- خیابان ساری از زیرگذر ترک محله به سمت خیابان مولوی، کوی ورزش، شهید پلنگی، مسکن مهر ترک محله، کارخانه نساجی شماره 1', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سیمرغ | سيمرغ
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|simorgh|سیمرغ|454-_جاده_زیارکلا___سراهی_دوک___روستاهای_دوک___ذیلت___زیارکلا___شیرخوارکلا___صلحدارکلا___لاله_زارکتی', '2026-08-08', TRUE, '17:00', '19:00', '454- جاده زیارکلا _ سراهی دوک _ روستاهای دوک _ ذیلت _ زیارکلا _ شیرخوارکلا _ صلحدارکلا _ لاله زارکتی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سیمرغ | سيمرغ
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|simorgh|سیمرغ|453-_قسمتی_از_روستاهای_اخته_چی_و_سنگتاب___کوشیکلا___گرجی_محله___رضوان_کلا___دشتیون___کارتیج_کلا___میدان_صمصام_طور__بلوار_صالحی___بلوار_معلم___میدان_شهید_کشوری___جاده_بهنمیر___روستاهای_پایین_دسته___رکن_کلا___برج_خیل___پهناجی___جمال_کلا___نجارکلا_جدید___تنبلا___دینه_سر', '2026-08-08', TRUE, '17:00', '19:00', '453- قسمتی از روستاهای اخته چی و سنگتاب _ کوشیکلا _ گرجی محله _ رضوان کلا _ دشتیون _ کارتیج کلا _ میدان صمصام طور_ بلوار صالحی _ بلوار معلم _ میدان شهید کشوری _ جاده بهنمیر _ روستاهای پایین دسته _ رکن', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه | سوادکوه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh|سوادکوه|465-_شهر_آلاشت_-_روستاهای_کارمزد_-_لیند_–_گلیان_-_چرات_و_انند_–_روستاهای_سرین_و_لرزنه_تا_امامزاده_حسن_–_روستاهای_گردنه_سر_به_سمت_اسپرز_و_سوادرودبار', '2026-08-08', TRUE, '17:00', '19:00', '465- شهر آلاشت - روستاهاي کارمزد - ليند – گلیان - چرات و انند – روستاهای سرين و لرزنه تا امامزاده حسن – روستاهای گردنه سر به سمت اسپرز و سوادرودبار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|034-_بارفروش7،_شهرک_فرهنگیان،_کوچه_های_(اتحاد_1_تا_14)_و_(گلستان_1_تا_15)_و_(بوستان_2_تا_16)،_موزیرج_قسمتی_از_ارشاد_5_،ازورودی_ارشاد_15_تا_تا_آستانه_سر_و_تا_قبل_تالار_کریم_پور،_کشاورزی_انتهای_آستانه_سر_بسمت_پشت_آب_بند', '2026-08-08', TRUE, '17:00', '19:00', '034- بارفروش7، شهرک فرهنگیان، کوچه های (اتحاد 1 تا 14) و (گلستان 1 تا 15) و (بوستان 2 تا 16)، موزیرج قسمتی از ارشاد 5 ،ازورودی ارشاد 15 تا تا آستانه سر و تا قبل تالار کریم پور، کشاورزی انتهای آستانه س', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|037-_ازبار_فروش_9قبل_میدان_مادر_تا_پل_موزیرج_جاده_ساحلی،_مجتمع_بنیاد_مسکن،_از_ترمینال_غرب_تا_بسیج_مالک_اشتر،_شرکت_آب_بند،_برسمنان_و_کمانگر_و_کتی_سر', '2026-08-08', TRUE, '17:00', '19:00', '037- ازبار فروش 9قبل میدان مادر تا پل موزیرج جاده ساحلی، مجتمع بنیاد مسکن، از ترمینال غرب تا بسیج مالک اشتر، شرکت آب بند، برسمنان و کمانگر و کتی سر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|150-_چهار_راه_شهدا_تا_چهار_راه_نواب_(_اشرفی_2_تا_22_و_1_تا_27_)_اشرفی10_(شیخ_کبیر_24_تا_46_)_و_(ایثار_21_تا_35)_و_حوالی_مسجد_محدثین', '2026-08-08', TRUE, '17:00', '19:00', '150- چهار راه شهدا تا چهار راه نواب ( اشرفی 2 تا 22 و 1 تا 27 ) اشرفی10 (شیخ کبیر 24 تا 46 ) و (ایثار 21 تا 35) و حوالی مسجد محدثین', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|110-_میدان_کشوری_از_سرداران_1_تا_اشرفی_21_،_محله_بعثت_و_کوچه_های_بعثت،_مدرسه_صبوری_و_فهیما،_کوچه_نصیرایی7،_قسمتی_از_کوچه_امیرالمومنین_و_جنب_پاساژ_مرجان', '2026-08-08', TRUE, '17:00', '19:00', '110- میدان کشوری از سرداران 1 تا اشرفی 21 ، محله بعثت و کوچه های بعثت، مدرسه صبوری و فهیما، کوچه نصیرایی7، قسمتی از کوچه امیرالمومنین و جنب پاساژ مرجان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|114-_میدان_کشوری_تا_میدان_هادی_نوروزی_(_خداداد_6_تا_36_)،_فاز_1_و_2_فرهنگ_شهر،_کتی_شرقی،_شهرک_مالک،_شهرک_شهرداری،_شهرک_یاسین_،_بعثت2_تا_6_کوچه_های_(شمس،_قدر_،فجر)', '2026-08-08', TRUE, '17:00', '19:00', '114- میدان کشوری تا میدان هادی نوروزی ( خداداد 6 تا 36 )، فاز 1 و 2 فرهنگ شهر، کتی شرقی، شهرک مالک، شهرک شهرداری، شهرک یاسین ، بعثت2 تا 6 کوچه های (شمس، قدر ،فجر)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|096-_حوالی_پاساژ_عبدالهی_(فیضیه_1_تا_21)،_میدان_بزاز_تا_سه_راه_سنگ_پل_و_تا_میدان_آستانه،_کوچه_های_(ایثار_26_تا_56_و_27_تا_51)_و_(هادی_14_تا_22_و_9_تا_19)_و-_ایثار_34کوچه_شفق_-و_ایثار_29_بسمت_مدرسه_صبوری_گوچه_های_شیخ_کبیر_2تا_12_و_ملانصیرایی_1تا_13', '2026-08-08', TRUE, '17:00', '19:00', '096- حوالی پاساژ عبدالهی (فیضیه 1 تا 21)، میدان بزاز تا سه راه سنگ پل و تا میدان آستانه، کوچه های (ایثار 26 تا 56 و 27 تا 51) و (هادی 14 تا 22 و 9 تا 19) و- ایثار 34کوچه شفق -و ایثار 29 بسمت مدرسه صبو', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|142-_چهار_راه_شهربانی_تا_چهار_راه_گله_محله_و_چهار_راه_گله_محله_تا_کشتار_گاه_کوچه_های(_نیایش_3_تا_11_و_2_تا_12_)_و_(اریحی_1_تا_31)_و_محله_درزی_کتی_(انقلاب_1_تا_20)', '2026-08-08', TRUE, '17:00', '19:00', '142- چهار راه شهربانی تا چهار راه گله محله و چهار راه گله محله تا کشتار گاه کوچه های( نیایش 3 تا 11 و 2 تا 12 ) و (اریحی 1 تا 31) و محله درزی کتی (انقلاب 1 تا 20)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|213-_شهیدآباد،_صلحدارکلا،_فکچال_و_فیروزآباد،_قنبرزاده،_بزرودپی_تا_پمپ_بنزین_شهر_خشرودپی', '2026-08-08', TRUE, '17:00', '19:00', '213- شهیدآباد، صلحدارکلا، فکچال و فیروزآباد، قنبرزاده، بزرودپی تا پمپ بنزین شهر خشرودپی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|501-_گری_محله_تا_انتهای_روستای_ولیک،_ادملا_تا_پل_دیوا،_شیاده،_میاندره،_کشتارگاه،_دولت_رودبار_و_قسمتی_از_تشون_وقسمتی_از_تهمتن_کلا', '2026-08-08', TRUE, '17:00', '19:00', '501- گری محله تا انتهای روستای ولیک، ادملا تا پل دیوا، شیاده، میاندره، کشتارگاه، دولت رودبار و قسمتی از تشون وقسمتی از تهمتن کلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|125-_ضلع_شمالی_کمربندی_امیرکلا_از_میدان_نماز_تا_میدان_مقریکلا_و_روستاهای_مقریکلا_-_کبوتردان_-_خرد_مرد_و_عزیزک_(_میان_محله_و_پایین_محله)-_فارابی_18_و_فارابی_16_کوچه_پنجم', '2026-08-08', TRUE, '17:00', '19:00', '125- ضلع شمالي کمربندي اميرکلا از ميدان نماز تا ميدان مقريکلا و روستاهاي مقريکلا - کبوتردان - خرد مرد و عزيزک ( میان محله و پایین محله)- فارابی 18 و فارابی 16 کوچه پنجم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|123-_شهرک_های_بهزاد_و_22_بهمن_وکوچه_های_فارابی_-ولیعصر_-_فتح_-_نبوت_-_عادل_-_میخک_-_گلستان_و_اطراف_میدان_حائری', '2026-08-08', TRUE, '17:00', '19:00', '123- شهرک هاي بهزاد و 22 بهمن وکوچه هاي فارابي -وليعصر - فتح - نبوت - عادل - ميخک - گلستان و اطراف ميدان حائري', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|506-_مسیر_کشاورزی_روستای_اسرم_-_الی_روستاهای_بزمین_آباد_و_ماکران_و_حلمسر', '2026-08-08', TRUE, '17:00', '19:00', '506- مسیر کشاورزی روستای اسرم - الی روستاهای بزمین آباد و ماکران و حلمسر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|049-_بلوار_جانبازان_ایثار_3-بلوار_طبرسی_امین_7_-خیابان_شهید_بهشتی_اندیشه_19_تا_مسجد_حاج_علی_کوچک', '2026-08-08', TRUE, '17:00', '19:00', '049- بلوار جانبازان ایثار 3-بلوار طبرسی امین 7 -خیابان شهید بهشتی اندیشه 19 تا مسجد حاج علی کوچک', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|084-_خیابان_نور_-_از_ولایت_26_تا_انتهای_بلوار_ولایت_و_ابتدای_فجر_24_-_ولایت_40_تا_نائیجیان_14', '2026-08-08', TRUE, '17:00', '19:00', '084- خيابان نور - از ولايت 26 تا انتهاي بلوار ولايت و ابتداي فجر 24 - ولايت 40 تا نائيجيان 14', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|080-_خیابان_شهید_بهشتی_از_اندیشه_1_تا_میدان_چاکسر_-_ثامن_10_-_از_ابتدای_بلوار_آیت_تا_آیت_6_و_8-_بلوار_طبرسی_-_کوچه_های_امین_1_تا_5_و_امین_2_و_4', '2026-08-08', TRUE, '17:00', '19:00', '080- خیابان شهید بهشتی از اندیشه 1 تا میدان چاکسر - ثامن 10 - از ابتدای بلوار آیت تا آیت 6 و 8- بلوار طبرسی - کوچه های امین 1 تا 5 و امین 2 و 4', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|093-بلوار_طالقانی_اباذر_6_و8_و12_و_16-_از_آفتاب_38_تا_آفتاب_44_-', '2026-08-08', TRUE, '17:00', '19:00', '093-بلوار طالقاني اباذر 6 و8 و12 و 16- از آفتاب 38 تا آفتاب 44 -', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|306-_جاده_هراز_-_لاریجان_-_از_رستوران_سالاری_تا_ابتدای_روستای_پلور_-_فرعی_های_ایراء_-_نیاک_-_کنارانجام_-_آب_اسک_-_امام_زاده_علی', '2026-08-08', TRUE, '17:00', '19:00', '306- جاده هراز - لاریجان - از رستوران سالاری تا ابتدای روستای پلور - فرعی های ایراء - نیاک - کنارانجام - آب اسک - امام زاده علی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|310-_جاده_هراز_از_پلیس_راه_بایجان_تا_ورودی_رینه_(_رستوران_سالاری_)_-_شهر_گزنک_-_فرعی_های_آبگرم_-_هفت_تن_-_امیری_-_تینه_کرف', '2026-08-08', TRUE, '17:00', '19:00', '310- جاده هراز از پلیس راه بایجان تا ورودی رینه ( رستوران سالاری ) - شهر گزنک - فرعی های آبگرم - هفت تن - امیری - تینه کرف', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|092-_خیابان_نور_-_از_فجر_2_تا_فجر_25_-_فجر_28', '2026-08-08', TRUE, '17:00', '19:00', '092- خيابان نور - از فجر 2 تا فجر 25 - فجر 28', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|074-_بلوارمنفرد_امیر2_الی_امیر48_-_بلوار_آزادگان_شهرک_آزادگان_فاز1_و_کوچه_آزادگان10الی18', '2026-08-08', TRUE, '17:00', '19:00', '074- بلوارمنفرد امیر2 الی امیر48 - بلوار آزادگان شهرک آزادگان فاز1 و کوچه آزادگان10الی18', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|473-_از_پل_هوایی_شاد_محل_بلوار_مطهری_تربیت17_الی_تربیت_39_-_تربیت16_الی_تربیت42-_تربیت20_پلک_علیا', '2026-08-08', TRUE, '17:00', '19:00', '473- از پل هوایی شاد محل بلوار مطهری تربیت17 الی تربیت 39 - تربیت16 الی تربیت42- تربیت20 پلک علیا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|078-_بلوار_آزادگان(آزادگان_6_الی_آزادگان8)-_بلوار_منفرد_امیر4_و_امیر8-_سیکاپل-_شهرک_مروارید_و_بلوار_شهید_قاسمی', '2026-08-08', TRUE, '17:00', '19:00', '078- بلوار آزادگان(آزادگان 6 الی آزادگان8)- بلوار منفرد امیر4 و امیر8- سیکاپل- شهرک مروارید و بلوار شهید قاسمی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|521-_سمت_راست_جاده_نیروگاه_بسمت_میدان_جانبازان،_بخشی_از_کوچه_مدرسه_شاهد،_کوچه_های(_تفکیکی_عبادی،ته_چال_از_سمت_جاده_نیروگاه_و_کلانتری11،بخشی_ازکوچه_فرزین،چوب_بری_یزدانی،_انقلاب1،_3700،بخشی_ازکوچه_شورلت،اداره_مخابرات_شماره1،ناهید،مسجدتوفیق،اسماعیلی)،بخشی_از_خیابان_راه_آهن_و_از_پل_بسمت_اداره_برق', '2026-08-08', TRUE, '17:00', '19:00', '521- سمت راست جاده نیروگاه بسمت میدان جانبازان، بخشی از کوچه مدرسه شاهد، کوچه های( تفکیکی عبادی،ته چال از سمت جاده نیروگاه و کلانتری11،بخشی ازکوچه فرزین،چوب بری یزدانی، انقلاب1، 3700،بخشی ازکوچه شورلت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|326-_منطقه_دخانیات_-_قسمتی_از_خیابان_اتحاد_و_پشت_هتل_بعداز_ریل_-_خیابان_طراوت-جاده_قدیم_میانرود', '2026-08-08', TRUE, '19:00', '21:00', '326- منطقه دخانیات - قسمتی از خیابان اتحاد و پشت هتل بعداز ریل - خیابان طراوت-جاده قديم ميانرود', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|486-_منطقه_چهاردانگه_-_روستای_وری_-_روستاهای_مسیر_به_سمت_ساری_تا_کارنام_-_ششک_-_مزده', '2026-08-08', TRUE, '19:00', '21:00', '486- منطقه چهاردانگه - روستاي وري - روستاهاي مسير به سمت ساري تا کارنام - ششک - مزده', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|482-_جاده_ساری_تاکام_از_تلمبه_خانه_سلیم_بهرام_-_روستاهای_پهنه_کلای_جنوبی_و_شمالی_تا_شکتا-_روستاهای_سنگتراشان_و_ترم', '2026-08-08', TRUE, '19:00', '21:00', '482- جاده ساری تاکام از تلمبه خانه سليم بهرام - روستاهاي پهنه کلای جنوبي و شمالي تا شکتا- روستاهاي سنگتراشان و ترم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|487-_منطقه_چهاردانگه_-_روستای_لالا_و_خلرد', '2026-08-08', TRUE, '19:00', '21:00', '487- منطقه چهاردانگه - روستاي لالا و خلرد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|284-_از_میدان_هلال_احمر_تا_نبش_باغ_سنگ_-_بلوار_طالقانی_خیابان_زینبیه_1_تا_سه_راه_-_خیابان_قائم_1_تا_4_-_خیابان_شهابی_تا_چهار_راه_15_خرداد_-بلوار_پرستار_از_آژانس_مادر_به_سمت_ابتدای_قائم', '2026-08-08', TRUE, '19:00', '21:00', '284- از میدان هلال احمر تا نبش باغ سنگ - بلوار طالقانی خیابان زینبیه 1 تا سه راه - خیابان قائم 1 تا 4 - خیابان شهابی تا چهار راه 15 خرداد -بلوار پرستار از آژانس مادر به سمت ابتدای قائم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|286-_بلوار_امام_رضا_-_از_بازار_امام_رضا_بسمت_نکا_-روبروی_هولا-شهرک_شقایق_-بیمارستان_شهید_زارع_-روستاهای_اسپورز_-_خارکش_-_بندافروز_-_زرین_آباد_سفلی_-_زرین_آباد_علیا_-_مرمت_-_آبندانسر-_آبندانکش_-_نقارچی_محله_و_قسمتی_از_لاکدشت', '2026-08-08', TRUE, '19:00', '21:00', '286- بلوار امام رضا - از بازار امام رضا بسمت نکا -روبروی هولا-شهرک شقایق -بیمارستان شهید زارع -روستاهای اسپورز - خارکش - بندافروز - زرین آباد سفلی - زرین آباد علیا - مرمت - آبندانسر- آبندانکش - نقارچی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|189-_خیابان_قائم_(_از_میدان_قائم_تا_انتها_)_-_خیابان_شهید_ساداتی_-_خیابان_اشرفی_اصفهانی_-_خیابان_شهید_سازگار_-_شهید_آشکاران_-_منطقه_گرجی_آئیش', '2026-08-08', TRUE, '19:00', '21:00', '189- خيابان قائم ( از ميدان قائم تا انتها ) - خيابان شهيد ساداتي - خيابان اشرفي اصفهاني - خيابان شهيد سازگار - شهيد آشکاران - منطقه گرجی آئیش', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|231-_روستاهای_عسگرآباد_-_امیرآباد_-_زینوند_-_مهدی_آباد_-_یعقوب_لنگه_-_نمکچال_-_بندر_امیرآباد_از_میدان_شهید_هاشمی_نژاد_تا_میانکاله', '2026-08-08', TRUE, '19:00', '21:00', '231- روستاهاي عسگرآباد - اميرآباد - زينوند - مهدي آباد - يعقوب لنگه - نمكچال - بندر اميرآباد از ميدان شهيد هاشمي نژاد تا ميانكاله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|457-_جاده_جویبار_روستاهای_مفتی_کلا،_آغورکش،_تیرکلا_و_کشاورزی_های_سمت_غرب_جاده_جویبار_از_روبروی_عبور_رگندشت_تا_انتها،_روستاهای_آبکسر،_حاجی_آباد،_گرزمون،_خوشاب_و_قمستی_از_روستای_شهاب_لیلم_از_مسجد_بسمت_انتهای_محل_،_گله_کلا_و_کارکنده_و_دولت_آباد', '2026-08-08', TRUE, '19:00', '21:00', '457- جاده جویبار روستاهای مفتی کلا، آغورکش، تیرکلا و کشاورزی های سمت غرب جاده جویبار از روبروی عبور رگندشت تا انتها، روستاهای آبکسر، حاجی آباد، گرزمون، خوشاب و قمستی از روستای شهاب لیلم از مسجد بسمت ا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|249-_جاده_دریا_-_از_روبروی_عبور_دازمیرکنده_سمت_چپ_فرح_آباد_-_حمید_آباد_-_طاهر_آباد_-_تا_انتهای_جاده_پلاژها_روستای_شیرین_بول', '2026-08-08', TRUE, '19:00', '21:00', '249- جاده دریا - از روبروی عبور دازمیرکنده سمت چپ فرح آباد - حمید آباد - طاهر آباد - تا انتهاي جاده پلاژها روستای شیرین بول', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|329-_کمربندی_غربی_تا_روبروی_زعفرانیه_-_قسمتی_از_بلوار_آزادی-_خیابان_های_اندیشه_-_چیندکا-خیابان_شهید_ابراهیمی-_قسمتی_از_خیابان_شهیدان_عبوری_-_سه_راه_جویبار_به_سمت_کمربندی_سمت_راست_-_خیابان_فلسطین', '2026-08-08', TRUE, '19:00', '21:00', '329- کمربندی غربی تا روبروی زعفرانیه - قسمتی از بلوار آزادی- خیابان های اندیشه - چیندکا-خیابان شهید ابراهیمی- قسمتی از خیابان شهیدان عبوری - سه راه جویبار به سمت کمربندی سمت راست - خیابان فلسطین', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|243-_جاده_دریا_-_از_روبروی_عبور_دازمیرکنده_تا_ابتدای_ماهفروز_محله_سفلی-_بهار_آباد_-_صالح_آباد_-_شهر_آکند', '2026-08-08', TRUE, '19:00', '21:00', '243- جاده دریا - از روبروی عبور دازمیرکنده تا ابتداي ماهفروز محله سفلی- بهار آباد - صالح آباد - شهر آکند', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|245-_جاده_دریا_-_روستاهای_اسفندان_-_سوته_-_سمت_راست_فرح_آباد_تا_پلاژ_شهرداری_تا_انتهای_جاده_پلاژ_روستای_قاجارخیل', '2026-08-08', TRUE, '19:00', '21:00', '245- جاده دريا - روستاهای اسفندان - سوته - سمت راست فرح آباد تا پلاژ شهرداری تا انتهاي جاده پلاژ روستای قاجارخیل', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|389-_کمربندی_غربی_سمت_راست_خیابان_تا_عبور_کفشگرکلا-کوچه_رجایی-کفشگرکلا_بزرگ_-میدان_ولایت_تاکوچه_سجاد', '2026-08-08', TRUE, '19:00', '21:00', '389- كمربندي غربي سمت راست خيابان تا عبور كفشگركلا-كوچه رجايي-كفشگركلا بزرگ -ميدان ولايت تاكوچه سجاد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|381-_خیابان_ساری_میدان_جانبازان_کوچه_جنب_بانک_سپه_-خیابان_ساری_حد_فاصل_راهبند_تا_ظرافت_سمت_راست_-خیابان_کنسرو-پشت_بیمارستان_ولیعصر_ابتدای_کوی_کشاورزی-کارخانه_کنسرو-کوچه_نیرو', '2026-08-08', TRUE, '19:00', '21:00', '381- خیابان ساری میدان جانبازان کوچه جنب بانک سپه -خیابان ساری حد فاصل راهبند تا ظرافت سمت راست -خیابان کنسرو-پشت بیمارستان ولیعصر ابتدای کوی کشاورزی-کارخانه کنسرو-کوچه نیرو', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|365-_کمربندی_شمالی_حد_فاصل_میدان_امام_تا_کوی_آزاده_سمت_چپ_-کوی_کهنسال_-کوچکسرا_قائم8_تا_سه_راه_هردرود_-کوی_آزمایشگاه_-روستاهای_کروا_و_هردرود_-_شانزده_متری_دوم_تا_جاده_کیاکلا_سمت_چپ_خیابان', '2026-08-08', TRUE, '19:00', '21:00', '365- کمربندی شمالی حد فاصل میدان امام تا کوی آزاده سمت چپ -کوی کهنسال -کوچکسرا قائم8 تا سه راه هردرود -کوی آزمایشگاه -روستاهای کروا و هردرود - شانزده متری دوم تا جاده کیاکلا سمت چپ خیابان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|364-خیابان_بابل_حد_فاصل_میدان_امام_تا_پل_تلار_دانشگاه_آزاد-ابتدای_کوچه_توحید-کوچه_شهید_صالحی-قائمیه_اول_ودوم', '2026-08-08', TRUE, '19:00', '21:00', '364-خيابان بابل حد فاصل ميدان امام تا پل تلار دانشگاه آزاد-ابتداي كوچه توحيد-كوچه شهيد صالحي-قائميه اول ودوم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|368-_جاده_بابل_کوی_صاحب_الزمان_و_انتهای_کوی_توحید،_سراج_کلا،_سنگتی،_ولوند،_استرآباد_محله،_افراکتی،_جنید_و_لاک_پل،_بیمارستان_قائم_جنب_پل_تلار،_شهرک_نیکان', '2026-08-08', TRUE, '19:00', '21:00', '368- جاده بابل کوی صاحب الزمان و انتهای کوی توحید، سراج کلا، سنگتی، ولوند، استرآباد محله، افراکتی، جنید و لاک پل، بیمارستان قائم جنب پل تلار، شهرک نیکان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|374-خیابان_ساری_-حریم_راه_آهن_عبورچشمه_سرتاشهرک_یثرب_-روستاهای_ساروکلا_و_کوتنا_تا_سیدابوصالح_و_روستای_میانرود_و_مسیر_امام_زاده_مهدی', '2026-08-08', TRUE, '19:00', '21:00', '374-خيابان ساري -حريم راه آهن عبورچشمه سرتاشهرك يثرب -روستاهاي ساروكلا و كوتنا تا سيدابوصالح و روستاي ميانرود و مسير امام زاده مهدي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|372-_کمربندی_شمالی،_از_میدان_جانبازان_تا_کوی_آزاده_سمت_راست_خیابان،_خیابان_ساری_از_نبش_مهمانسرا_تا_سر_کوچه_ایران_گاز،_کوی_بصیرت_وپاریاب،_20_متری_مهمانسرا،_میدان_علاالدینی،_بخشی_از_کوی_کشاورزی', '2026-08-08', TRUE, '19:00', '21:00', '372- کمربندی شمالی، از میدان جانبازان تا کوی آزاده سمت راست خیابان، خیابان ساری از نبش مهمانسرا تا سر کوچه ایران گاز، کوی بصیرت وپاریاب، 20 متری مهمانسرا، میدان علاالدینی، بخشی از کوی کشاورزی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|387_-_جاده_نظامی_حد_فاصل_پمپ_بنزین_تا_پارک_جنگلی-عبورخرماکلا_تا_انتهای_روستای_فندری_سه_راه_افرا_تا_شامیرکلا(روستای_افرا-شیخ_گلی_-طارسی_کلا)-کمربندی_غربی_حد_فاصل_پل_قلزم_کلا_تا_سه_راه_فیروزکوه-روستای_اسکندر_کلاغربی_حد_فاصل_پل_قلزم_کلا_تا_سه_راه_فیروزکوه-روستای_اسکندر_کلا', '2026-08-08', TRUE, '19:00', '21:00', '387 - جاده نظامي حد فاصل پمپ بنزين تا پارك جنگلي-عبورخرماكلا تا انتهاي روستاي فندري سه راه افرا تا شاميركلا(روستاي افرا-شيخ گلي -طارسي كلا)-كمربندي غربي حد فاصل پل قلزم كلا تا سه راه فيروزكوه-روستاي ا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|197-_بلوار_ورداسبی_سمت_راست_–_بلوار_معلمی_سمت_راست_تا_ابتدای_پل_شیب_آبندان_-_صفرخیل_–_گلیرد-_زیارمحله_پایین_رودپشت-_قادی_محله_پایین_رودپشت_-_قوشچی_محله_–_درویش_محمد_شاه-_درکاسر-_طالش_محله_پهناب_–_آزادبن_پهناب_–_ترک_محله_پهناب-_ماندی_محله_پهناب_–_پهناب_محله_–_عشیر_سر_پهناب(مرکز_تحقیقات)_–_آییش_چناربن_–_چهارطاقبن_–_شهرک_فرهنگیان', '2026-08-08', TRUE, '19:00', '21:00', '197- بلوار ورداسبی سمت راست – بلوار معلمی سمت راست تا ابتدای پل شیب آبندان - صفرخیل – گلیرد- زیارمحله پایین رودپشت- قادی محله پایین رودپشت - قوشچی محله – درویش محمد شاه- درکاسر- طالش محله پهناب – آزاد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|109-_پشت_اداره_برق_شمال_بابل،_بلوار_کاظم_بیگی_تا_قائم_9،_کوچه_های_عادل_و_معرفت،_محله_های_اسلام_و_سادات_محله', '2026-08-08', TRUE, '19:00', '21:00', '109- پشت اداره برق شمال بابل، بلوار کاظم بیگی تا قائم 9، کوچه های عادل و معرفت، محله های اسلام و سادات محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|010-_کمربندی_احمدچاله_پی_تا_روبروی_بسیج_مالک_اشتر،_ورودی_سپاه_دانش_تا_ارچی،_کارون،_مرزبال،_بصرا،_پیچاکلا،_تلیگران_و_قادی_کلا', '2026-08-08', TRUE, '19:00', '21:00', '010- کمربندی احمدچاله پی تا روبروی بسیج مالک اشتر، ورودی سپاه دانش تا ارچی، کارون، مرزبال، بصرا، پیچاکلا، تلیگران و قادی کلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|148-_میدان_17_شهریور_کوچه_هابی_هادی_-_چهار_راه_شهربانی_تا_چهاراه_فرهنگ،_عدنانی_18_،_کوچه_شش_دری،از_چهارراه_گنجینه_تا_بهاران_19_محله_برج،_بانک_ملت_و_جهانیان_،خیابان_مصطفی_خمینی_تا_میدان_سجودی_(خورشید_1_تا_17_و_2_تا_6)،_بیمارستان_یحیی_نژاد', '2026-08-08', TRUE, '19:00', '21:00', '148- میدان 17 شهریور کوچه هابی هادی - چهار راه شهربانی تا چهاراه فرهنگ، عدنانی 18 ، کوچه شش دری،از چهارراه گنجینه تا بهاران 19 محله برج، بانک ملت و جهانیان ،خیابان مصطفی خمینی تا میدان سجودی (خورشید 1', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|031-_مهدی_آباد_کوچه_های_ارکیده_1_تا_8،_کوچه_های_زیتون_7_تا_16،_کوچه_دکتر_باوند،_شهرک_تندست،_توحید_28_تا_باغ_سراج،_مهتاب_2،_توحید_16_و_اتوکاپ،_حر_15_کوچه_های_شریعت', '2026-08-08', TRUE, '19:00', '21:00', '031- مهدی آباد کوچه های ارکیده 1 تا 8، کوچه های زیتون 7 تا 16، کوچه دکتر باوند، شهرک تندست، توحید 28 تا باغ سراج، مهتاب 2، توحید 16 و اتوکاپ، حر 15 کوچه های شریعت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|002-_جاده_جدید_بابل_به_آمل_(ضلع_شمالی)،_کمربندی_احمدچاله_پی_از_ابتدای_روستای_متیکه_تا_علیشاه،_امین_آباد_شمالی،_میاندسته،_هلال_کلا_شمالی،_درزیکلای_کوچک_و_بزرگ،_سنگچی،_بیجی_کلا،_نودهک_،_روستای_سورن_محله', '2026-08-08', TRUE, '19:00', '21:00', '002- جاده جدید بابل به آمل (ضلع شمالی)، کمربندی احمدچاله پی از ابتدای روستای متیکه تا علیشاه، امین آباد شمالی، میاندسته، هلال کلا شمالی، درزیکلای کوچک و بزرگ، سنگچی، بیجی کلا، نودهک ، روستاي سورن محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|166-_از_شهر_مرزیکلا_تا_بالا_گنج_افروز،_سیادرکا،_پیتکا،_رئیس_کلا،_درونکلای(_شرقی_و_غربی)_گاوزن_محله_و_شاه_رضا،_مرزناک،_بزچفت،_شهرک_صنعتی_درونکلا،_داردکاشت،_قسمتی_از_هلیدشت_و_انارستان', '2026-08-08', TRUE, '19:00', '21:00', '166- از شهر مرزیکلا تا بالا گنج افروز، سیادرکا، پیتکا، رئیس کلا، درونکلای( شرقی و غربی) گاوزن محله و شاه رضا، مرزناک، بزچفت، شهرک صنعتی درونکلا، داردکاشت، قسمتی از هلیدشت و انارستان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|003-_پایین_احمد_چاله_پی_تا_مظفرکلا،_چناربن،_زاهد_کلا،_للوک،_خطیب_و_طراقچی_کلا_،_روستاهای_آقاملک_،_درزیکلای_آقا_شفیع_و_ورمتون', '2026-08-08', TRUE, '19:00', '21:00', '003- پایین احمد چاله پی تا مظفرکلا، چناربن، زاهد کلا، للوک، خطیب و طراقچی کلا ، روستاهاي آقاملك ، درزيكلاي آقا شفيع و ورمتون', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|104-_ازعبور_هریکنده_تا_روبروی_مازیار_صنعت،_روستاهای_هتکه_پشت،_نقیب_کلا،دیودشت،_تراجیکلا_و_پشت_سیم،_قسمتی_از_شهرک_بذری', '2026-08-08', TRUE, '19:00', '21:00', '104- ازعبور هریکنده تا روبروی مازیار صنعت، روستاهای هتکه پشت، نقیب کلا،دیودشت، تراجیکلا و پشت سیم، قسمتی از شهرک بذری', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|505-_تهمتن_کلا،_حوزه_شهری_گلیا_،_پاشا_امیر،_گنج_کلا_(بالا_و_پایین)،_ادملا،_کیمیون_و_خرطوسی،_هشتَری_و_چالرز', '2026-08-08', TRUE, '19:00', '21:00', '505- تهمتن کلا، حوزه شهری گلیا ، پاشا امیر، گنج کلا (بالا و پایین)، ادملا، کیمیون و خرطوسی، هشتَری و چالرز', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|121-_خیابان_امام_از_میدان_انقلاب_(_ساعت)_تا_سه_را_ه_سجادی_-_بلوار_ناصری_از_میدان_منبع_آب_تا_میدان_شهدا_دیوکلا_کوچه_های_بهشتی_یک_تا_بهشتی_یازده_-_رزاقیان_-_باقرنسب_-_اطراف_مسجد_امام_حسین_و_مخابرات_و_اداره_برق_-کوچه_های_صفائیان_-گلستان_-_حافظ_و_حمام_قدیمی_دیوکلا_و_ابتدای_خیابان_مصطفی_خمینی', '2026-08-08', TRUE, '19:00', '21:00', '121- خيابان امام از ميدان انقلاب ( ساعت) تا سه را ه سجادي - بلوار ناصري از ميدان منبع آب تا ميدان شهدا ديوکلا کوچه هاي بهشتي يک تا بهشتي يازده - رزاقيان - باقرنسب - اطراف مسجد امام حسين و مخابرات و اد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|119-_جاده_بابل_به_بهنمیر_روستاهای_بالا_و_پایین_بیشه_سر_و_لنگور_و_کوچه_های_امام_رضا_روستای_آغوزبن_و_اطراف_تالار_پالیز_-_روستای_عزیزک_کوچه_های_لاله_یک_تا_لاله_20_-_گلزار_شهدا_بالا_محل_و_بهداری', '2026-08-08', TRUE, '19:00', '21:00', '119- جاده بابل به بهنمير روستاهاي بالا و پايين بيشه سر و لنگور و کوچه هاي امام رضا روستاي آغوزبن و اطراف تالار پاليز - روستای عزیزک کوچه های لاله یک تا لاله 20 - گلزار شهدا بالا محل و بهداری', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|116-_قسمت_انتهایی_شهرک_فاطری_از_طرف_کمربندی_-شهرک_عسگریان_-_کوچه_های_پورعباسی_-_تفکیکی_پرفسور_نوری_-_کوچه_های_حافظ_یک_و_دو_-_کرامت_-_بهشتی_9_تا_بهشتی_41_-_امیر-_دلگشا_-_20_متری_-_ولیگدان_-شهید_الیاسی_-_ابن_سینا_و_مصطفی_خمینی_و_ملامحله_-_شهاب_الدین_کلا_-_و_پشت_بیمارستان_کودکان', '2026-08-08', TRUE, '19:00', '21:00', '116- قسمت انتهايي شهرک فاطري از طرف کمربندي -شهرک عسگریان - کوچه هاي پورعباسي - تفکيکي پرفسور نوري - کوچه هاي حافظ يک و دو - کرامت - بهشتي 9 تا بهشتي 41 - امير- دلگشا - 20 متري - وليگدان -شهيد الياسي ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|030-_روستاهای_گله_کلا_-شمشیرمحله_-_مشهدی_کلا_-_باریکلا_-_بوله_کلا_-_میانرود-_درویش_خیل_-منطقه_شهری_حاجی_کلای_رودبار_و_امیرکبیر', '2026-08-08', TRUE, '19:00', '21:00', '030- روستاهاي گله کلا -شمشيرمحله - مشهدي کلا - باريکلا - بوله کلا - ميانرود- درويش خيل -منطقه شهري حاجي کلاي رودبار و اميرکبير', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|014-_حد_فاصل_پست_اسلام_آباد_قسمت_غربی_جاده_گهرباران_مسیر_روستاهای_اسلام_آباد_و_زید_علیا', '2026-08-08', TRUE, '19:00', '21:00', '014- حد فاصل پست اسلام آباد قسمت غربی جاده گهرباران مسیر روستاهای اسلام آباد و زید علیا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|013-_حد_فاصل_پست_اسلام_آباد_قسمتی_از_روستاهای_شهریارکنده_اسلام_اباد_زید_سفلی_و_قسمت_غربی_جاده_گهرباران_شهرک_صنعتی_گهرباران_تا_روستای_محمد_آباد_برگه', '2026-08-08', TRUE, '19:00', '21:00', '013- حد فاصل پست اسلام آباد قسمتی از روستاهای شهریارکنده اسلام اباد زید سفلی و قسمت غربی جاده گهرباران شهرک صنعتی گهرباران تا روستای محمد آباد برگه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|058-_خیابان_هراز_از_آفتاب_25_و_38_تا_میدان_قائم_-_پشت_کوچه_آموزش_و_پرورش_و_کوچه_های_ملک_شاهدخت_و_داخل_آقالب_31_و_33_از_آفتاب_31_تا_روبروی_ایران_خودرو_پهلوان_زاده_کوچه_های_فرد_آفتاب_به_جز_آفتاب_45', '2026-08-08', TRUE, '19:00', '21:00', '058- خيابان هراز از آفتاب 25 و 38 تا ميدان قائم - پشت كوچه آموزش و پرورش و كوچه هاي ملك شاهدخت و داخل آقالب 31 و 33 از آفتاب 31 تا روبروي ايران خودرو پهلوان زاده كوچه هاي فرد آفتاب به جز آفتاب 45', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|087-_دم_پل_-هتل_شهر_-شرقی_شهرداری_-بلوار_طالقانی_اباذر_2-خیابان_هراز_میدان_قائم_جنب_اداره_آبیاری-خیابان_اصلی_نبش_آفتاب_48_تا_آفتاب_50_و_از_آفتاب_58_تا_62_-_انتهای_آفتاب_50_درزی_27', '2026-08-08', TRUE, '19:00', '21:00', '087- دم پل -هتل شهر -شرقی شهرداری -بلوار طالقانی اباذر 2-خیابان هراز میدان قائم جنب اداره آبیاری-خیابان اصلی نبش آفتاب 48 تا آفتاب 50 و از آفتاب 58 تا 62 - انتهای آفتاب 50 درزی 27', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|048-_از_ابتدای_پل_جانبازان_تا_ابتدای_کمربندی_محمودآباد_-_مسیر_سمت_راست_و_دریای_67_و_71', '2026-08-08', TRUE, '19:00', '21:00', '048- از ابتدای پل جانبازان تا ابتدای کمربندی محمودآباد - مسیر سمت راست و دریای 67 و 71', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|086-_خیابان_طالب_آملی_از_دریای_2_تا_میدان_17شهریور_و_خیابان_هراز-_از_آفتاب_2_تا_آفتاب_32_و_آفتاب_23_و_به_غیر_از_آفتاب_10_و17_و_انتهای_آفتاب_12', '2026-08-08', TRUE, '19:00', '21:00', '086- خیابان طالب آملی از دریای 2 تا میدان 17شهریور و خیابان هراز- از آفتاب 2 تا آفتاب 32 و آفتاب 23 و به غیر از آفتاب 10 و17 و انتهای آفتاب 12', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|207-_جاده_چمستان_بیمارستان_امام_علی_(ع)_-_روستاهای_شیرکاج_-_نرم_-_اسکان_دام_پشت_بیمارستان_-_ساییچ_محله_-_انجپل_-_آغوزبن_-_ستگ_کوبی_-_روستای_ولیسده_-_زغال_شویی_و_اسکان_دام', '2026-08-08', TRUE, '19:00', '21:00', '207- جاده چمستان بيمارستان امام علي (ع) - روستاهاي شيركاج - نرم - اسكان دام پشت بيمارستان - ساييچ محله - انجپل - آغوزبن - ستگ كوبي - روستاي وليسده - زغال شويي و اسكان دام', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|053-_خیابان_هراز_از_آفتاب_64_تا_آفتاب_72_-_آفتاب_76_تا_84', '2026-08-08', TRUE, '19:00', '21:00', '053- خیابان هراز از آفتاب 64 تا آفتاب 72 - آفتاب 76 تا 84', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|060-_جاده_هراز_از_کارخانه_سرکه_اطمینان_تا_پمپ_بنزین_گلستان_و_رستوران_های_مسیر_-نوگردن-_هلومسر', '2026-08-08', TRUE, '19:00', '21:00', '060- جاده هراز از کارخانه سرکه اطمینان تا پمپ بنزین گلستان و رستوران های مسیر -نوگردن- هلومسر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|075-_کمربندی_هزار_سنگر_به_محمود_آباد_از_زیر_گذر_شرم_کلا_ابتدای_جاده_سورک_تا_سه_راه_واسکس_-_سورک_-_یوسف_آباد_-_اوجاک_-_بور_محله_-_دوتیره_-_شاکتی-اشکارکلا_-_تیرویجان', '2026-08-08', TRUE, '19:00', '21:00', '075- کمربندی هزار سنگر به محمود آباد از زیر گذر شرم کلا ابتدای جاده سورک تا سه راه واسکس - سورک - یوسف آباد - اوجاک - بور محله - دوتیره - شاکتی-اشکارکلا - تیرویجان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|061-_شهر_بابکان(_هارون_کلا_-_نفرخیل_-_خونین_سر_-_نجار_محله)_الی_منطقه_سه_پل_جنب_نساجی', '2026-08-08', TRUE, '19:00', '21:00', '061- شهر بابكان( هارون كلا - نفرخيل - خونين سر - نجار محله) الي منطقه سه پل جنب نساجي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|069-_جاده_جدید_آمل_به_بابل_-_از_سه_راه_درویشخیل_تا_مطهر_و_علی_شا_-_قلعه_کش_-_اله_کاج_-وسکل_-_رستم_دار_محله_-_باغبانکلا', '2026-08-08', TRUE, '19:00', '21:00', '069- جاده جدید آمل به بابل - از سه راه درویشخیل تا مطهر و علی شا - قلعه کش - اله کاج -وسکل - رستم دار محله - باغبانکلا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|064-_از_سه_راه_درویش_خیل_به_سمت_ابتدای_جاده_فریدونکنار_جنب_خیابان_اصلی_الی_دادگستری_و_اداره_برق', '2026-08-08', TRUE, '19:00', '21:00', '064- از سه راه درويش خيل به سمت ابتداي جاده فريدونكنار جنب خيابان اصلي الي دادگستري و اداره برق', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|216-ضلع_جنوبی_جاده_دریاکنار_-_اجاکسر_کوچه_شهید_مسیبی_تا_شرکت_پیشرو-خیابان_مولانا-خیابان_20متری_اول_ودوم_شهرک_قائم_-خیابان_شهید_صاحب_سالار-_خیابان_شهید_نورانی', '2026-08-08', TRUE, '19:00', '21:00', '216-ضلع جنوبي جاده درياكنار - اجاكسر كوچه شهيد مسيبي تا شركت پيشرو-خيابان مولانا-خيابان 20متري اول ودوم شهرك قائم -خيابان شهيد صاحب سالار- خيابان شهيد نوراني', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|219-_خیابان_پاسداران_از_کلانتری_12_تا_میدان_معلم-_خیابان_فلسطین_تا_پل_کابلی-_ابتدای_خیابان_شریعتی_و_کمربندی_از_میدان_معلم_الی_cng_و_قسمتی_از_خیابان_شهید_طالبی15', '2026-08-08', TRUE, '19:00', '21:00', '219- خيابان پاسداران از كلانتري 12 تا ميدان معلم- خيابان فلسطين تا پل كابلي- ابتداي خيابان شريعتي و كمربندي از ميدان معلم الي CNG و قسمتي از خيابان شهيد طالبي15', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|158-_باقرتنگه_کوچه_تالار_ضیافت_-_ذوالفقاری_18-_بلوارشریفی_-_بسیج_10_-_بسیج_8_(_کوچه_نانوایی_انقلاب_)-مصلی-_از_میدان_بسیج_الی_میدان_شهدا_(_گل_)_و_خیابان_پاسداران_از_میدان_بسیج_تا_پل_قدیم_و_خیابان_طالقانی_الی_پل_دوم_خیابان_دادگاه_و_دادگستری_انتهای_خیابان_فلسطین_و_میدان_شیلات_و_بیمارستان_شهید_رجایی', '2026-08-08', TRUE, '19:00', '21:00', '158- باقرتنگه كوچه تالار ضيافت - ذوالفقاري 18- بلوارشريفي - بسيج 10 - بسيج 8 ( كوچه نانوايي انقلاب )-مصلي- از ميدان بسيج الي ميدان شهدا ( گل ) و خيابان پاسداران از ميدان بسيج تا پل قديم و خيابان طالقا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|509-_میدان_امام_حسین_بسمت_جاده_اومال،_کوچه_های_مدرسه_شهیدبهشتی،فنی_و_حرفه_ای،دادگستری،_بیمارستان_بوعلی،_روستاهای_اومال،_ولیجی_محله،_بریجان،_قلعه_سر_بالا_و_پایین،_کوهسارکنده_،_مسیر_جنگلی_جاده_کوهسارکنده،چاه_آب_خیرآباد_و_قلعه_سر', '2026-08-08', TRUE, '19:00', '21:00', '509- میدان امام حسین بسمت جاده اومال، کوچه های مدرسه شهیدبهشتی،فنی و حرفه ای،دادگستری، بیمارستان بوعلی، روستاهای اومال، ولیجی محله، بریجان، قلعه سر بالا و پایین، کوهسارکنده ، مسیر جنگلی جاده کوهسارکند', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|270-_ضلع_شرقی_بلوار_کشاورز_-_از_کوچه_خانفرد_بسمت_بلوار_داراب_-_خیابان_پیوندی_-مفتح-_توکل-فدک-_بخشی_از_خیابان_سعدی', '2026-08-08', TRUE, '21:00', '23:00', '270- ضلع شرقي بلوار كشاورز - از كوچه خانفرد بسمت بلوار داراب - خيابان پيوندي -مفتح- توكل-فدك- بخشي از خيابان سعدي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|424-_جاده_کیاسر_-_روستاهای_ورند_-_علمدارده_-_گردشی_-_روستاهای_مسیر', '2026-08-08', TRUE, '21:00', '23:00', '424- جاده کیاسر - روستاهاي ورند - علمدارده - گردشي - روستاهاي مسير', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|281-_خیابان_مازیار_تا_میدان_راه_آهن_-_چهار_راه_آزادی_-_خیابان_بقیه_الله_-_سالخورده_-_خیابان_کارمندان_-_خیابان_فارابی_-_خیابان_امیر_کبیر_تا_قبل_از_چهارراه_-_خیابان_خاقانی_تا_انتهای_ملت_و_انتهای_ورزش', '2026-08-08', TRUE, '21:00', '23:00', '281- خیابان مازیار تا میدان راه آهن - چهار راه آزادی - خیابان بقیه الله - سالخورده - خیابان کارمندان - خیابان فارابی - خیابان امیر کبیر تا قبل از چهارراه - خیابان خاقانی تا انتهای ملت و انتهای ورزش', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|304-_انتهای_پل_گردن_-_اواسط_لسانی_خیابان_ملل_-_خیابان_پیروزی_از_زندان_تا_بلوار_داراب-_بلوار_داراب_از_پیروزی_تا_پیام_نور_-_صبا_3', '2026-08-08', TRUE, '21:00', '23:00', '304- انتهای پل گردن - اواسط لسانی خیابان ملل - خیابان پیروزی از زندان تا بلوار داراب- بلوار داراب از پیروزی تا پیام نور - صبا 3', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|262-_ضلع_شمالی_کمربندی_جنوبی_-_روبروی_کوچه_نیک_مهر-کلیه_مناطق_تحت_پوشش_-_سه_راهی_میانرود_بسمت_دخانیات_-کوچه_تقوی-_طبری-_کوچه_ارشاد-_کوچه_شهید_صدرایی-_کوی_اتحاد-_کوچه_نوذری-_اداره_دخانیات-انتهای_کوی_صاحب_زمان_بسمت_حسینیه_ارشاد', '2026-08-08', TRUE, '21:00', '23:00', '262- ضلع شمالی كمربندي جنوبي - روبروی کوچه نيك مهر-كليه مناطق تحت پوشش - سه راهي ميانرود بسمت دخانيات -كوچه تقوي- طبري- كوچه ارشاد- كوچه شهيد صدرايي- كوي اتحاد- كوچه نوذري- اداره دخانیات-انتهاي كوي صا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|322-_ضلع_جنوبی_جاده_قائمشهر-_روستاهای_صاحب_الزمان-_گرجی_کلا_-_شهرک_نوبنیاد-_شهرک_فرهنگیان-_کردخیل_-باریک_آبسر-گیله_کلا-_سرخکلا_-رودپشت_و_تلوباغ', '2026-08-08', TRUE, '21:00', '23:00', '322- ضلع جنوبی جاده قائمشهر- روستاهای صاحب الزمان- گرجي كلا - شهرك نوبنياد- شهرک فرهنگیان- كردخيل -باریک آبسر-گیله کلا- سرخکلا -رودپشت و تلوباغ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|275-_خیابان_فرهنگ_-_کوچه_دومهری_-_شهید_مستشرق_-_فرهنگ_21-_بانک_صادرات_-_میدان_شهدا_راسته_بلوار_طالقانی_بسمت_ابتدای_باغ_سنگ_تا_چهار_راه_باغ_سنگ', '2026-08-08', TRUE, '21:00', '23:00', '275- خيابان فرهنگ - كوچه دومهري - شهيد مستشرق - فرهنگ 21- بانك صادرات - ميدان شهدا راسته بلوار طالقاني بسمت ابتداي باغ سنگ تا چهار راه باغ سنگ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- گلوگاه | گلوگاه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|galugah|گلوگاه|494-_ضلع_جنوبی_بلوار_امام_رضا_-حدفاصل_باربری_اوان_تا_مرکز_انتقال_خون-بلوار_شهید_رجائی-خیابان_17شهریور_حد_فاصل_مسجد_ملاعباس_تا_تقاطع_بلوار_شهید_رجائی-خیابان_شهید_زاهدی_حدفاصل_شرکت_گاز_تا_اداره_پست-خیابان_شهید_پهلوان-خیابان_امام-', '2026-08-08', TRUE, '21:00', '23:00', '494- ضلع جنوبی بلوار امام رضا -حدفاصل باربری اوان تا مرکز انتقال خون-بلوار شهید رجائی-خیابان 17شهریور حد فاصل مسجد ملاعباس تا تقاطع بلوار شهید رجائی-خیابان شهید زاهدی حدفاصل شرکت گاز تا اداره پست-خیاب', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- گلوگاه | گلوگاه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|galugah|گلوگاه|490-_ضلع_شمالی_بلوار_امام_رضا-حد_فاصل_شرکت_بردنا_الی_رستوران_اکبر_جوجه_ستاری-هشتکه-جاده_دریا-اراضی_کشاورزی_هشتیکه_خیابان_راه_آهن-جاده_لمال', '2026-08-08', TRUE, '21:00', '23:00', '490- ضلع شمالی بلوار امام رضا-حد فاصل شرکت بردنا الی رستوران اکبر جوجه ستاری-هشتکه-جاده دریا-اراضی کشاورزی هشتیکه خیابان راه آهن-جاده لمال', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- گلوگاه | گلوگاه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|galugah|گلوگاه|491-_ضلع_شمالی_محوری_گلوگاه_به_بهشهر-روستاهای_ریحان_آباد،_قلعه_پایان،_سنکیابسر-اراضی_کشاورزی_خورشید_کلا،تیله_نو،_سراج_محله،_تیرتاش،_لمراسک،_ریحان_آباد', '2026-08-08', TRUE, '21:00', '23:00', '491- ضلع شمالی محوری گلوگاه به بهشهر-روستاهای ریحان آباد، قلعه پایان، سنکیابسر-اراضی کشاورزی خورشید کلا،تیله نو، سراج محله، تیرتاش، لمراسک، ریحان آباد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|449-_روستای_گرجی_محله', '2026-08-08', TRUE, '21:00', '23:00', '449- روستاي گرجي محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|188-_روستاهای_سارو_-_پاسند-_تازه_آباد_-کل_شهر_خلیل_شهر', '2026-08-08', TRUE, '21:00', '23:00', '188- روستاهاي سارو - پاسند- تازه آباد -كل شهر خليل شهر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|185-_ضلع_جنوبی_عبور_عباس_آباد_تا_چهارراه_گرگان_-_خیابان_شاهد-_سجاد_-_قوام_-_دماوندی-حسنی_-جنت-_الغدیر_-_آزادی-_سنگ_شکن_-_ابتدای_گرجی_محله_-_مجتمع_دارالسلام_-_فراش_محله_-_پارک_ملت', '2026-08-08', TRUE, '21:00', '23:00', '185- ضلع جنوبي عبور عباس آباد تا چهارراه گرگان - خيابان شاهد- سجاد - قوام - دماوندي-حسني -جنت- الغدير - آزادي- سنگ شكن - ابتداي گرجي محله - مجتمع دارالسلام - فراش محله - پارك ملت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|175-_کل_خیابان_هنر_-_کوچه_میرصابر_-_پل_سنگ_ذغال_-_حد_فاصل_مسجد_نصیرخان_تا_پارک_22_بهمن_ضلع_شمالی_-_مغازه_های_ضلع_جنوبی_چهارشنبه_بازار', '2026-08-08', TRUE, '21:00', '23:00', '175- كل خيابان هنر - كوچه ميرصابر - پل سنگ ذغال - حد فاصل مسجد نصيرخان تا پارك 22 بهمن ضلع شمالي - مغازه هاي ضلع جنوبي چهارشنبه بازار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|448-_روستاهای_حسین_آباد_-_لله_مرز_-_مسیر_جاده_پالایشگاه_حسین_آباد-_صحرای_رستمکلا_-_مشترکین_جنب_ریل_راه_آهن_بندر_تا_ایستگاه_گاز_نکا', '2026-08-08', TRUE, '21:00', '23:00', '448- روستاهاي حسين آباد - لله مرز - مسير جاده پالايشگاه حسين آباد- صحراي رستمكلا - مشتركين جنب ريل راه آهن بندر تا ايستگاه گاز نكا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|186-_ضلع_شمالی_جاده_سراسری_خلیل_شهر_-_محله_کلاک_-محله_رکاوند_-صحراهای_کلاک_-رکاوند-امامزاده_یوسف-سارو-پاسند_-التپه-_دانشگاه_پیام_نور-مرکز_فنی_و_حرفه_ای', '2026-08-08', TRUE, '21:00', '23:00', '186- ضلع شمالي جاده سراسري خليل شهر - محله كلاك -محله ركاوند -صحراهاي كلاك -ركاوند-امامزاده يوسف-سارو-پاسند -التپه- دانشگاه پيام نور-مركز فني و حرفه اي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|170-_از_ضلع_شمالی_کمربندی_بهشهر_(میدان_شیر)_تا_روستای_امامده_-_صحرای_امامده', '2026-08-08', TRUE, '21:00', '23:00', '170- از ضلع شمالي كمربندي بهشهر (ميدان شير) تا روستاي امامده - صحراي امامده', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بهشهر | بهشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|behshahr|بهشهر|182-_جاده_دانشگاه_علم_وصنعت_(_مسکن_مهر_شهرک_امام_)_-_جاده_زاغمرز_تا_انتهای_روستای_قره_تپه_-_کوچه_های_صنوبر_1تا4_-', '2026-08-08', TRUE, '21:00', '23:00', '182- جاده دانشگاه علم وصنعت ( مسکن مهر شهرک امام ) - جاده زاغمرز تا انتهاي روستاي قره تپه - کوچه هاي صنوبر 1تا4 -', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|462-_کل_خیابان_سیدالشهدا،_کوچه_صدف،_کوچه_های_بهار_و_هشت_بهشت،_کوی_توانیر،_باشگاه_برق،_روستا_های_دریک_و_دیوکتی', '2026-08-08', TRUE, '21:00', '23:00', '462- کل خيابان سيدالشهدا، کوچه صدف، کوچه های بهار و هشت بهشت، كوي توانير، باشگاه برق، روستا هاي دريك و ديوكتي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|330-_میدان_امام_-_ظلع_شمالی_بلوار_دانشگاه_کوچه_های_شهید_آبیان_-_تا_سراه_جویبار_و_کوی_پاسدار-_گاردجنگل_-_گلشن_-_لاله_-_مطهری_-رفیعی_-_بهار_و_-_بیمارستان_نیمه_شعبان-_خیابان_شهید_ابراهیمی_و_اشرفی', '2026-08-08', TRUE, '21:00', '23:00', '330- میدان امام - ظلع شمالی بلوار دانشگاه کوچه های شهید آبیان - تا سراه جویبار و کوی پاسدار- گاردجنگل - گلشن - لاله - مطهری -رفیعی - بهار و - بیمارستان نیمه شعبان- خیابان شهید ابراهیمی و اشرفی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|255-_بلوار_خزر_-_روبروی_اداره_برق_شمال_تا_سه_راه_ارامگاه_خیابان_اصلی_سمت_راست_خیابان_طبرستان_-_ساری_کنار', '2026-08-08', TRUE, '21:00', '23:00', '255- بلوار خزر - روبروي اداره برق شمال تا سه راه ارامگاه خيابان اصلي سمت راست خیابان طبرستان - ساري کنار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|460-_جاده_جویبار_سمت_غرب_جاده_کنار_جاده_اصلی،_رگندشت،_چناربن،_حاجی_آباد_قسمتی_از_انتهای_محل،_بسمت_مرغداری_شیخی،_کشاورزی_پشت_کشتارگاه،_روستای_میارکلا_و_مسکن_مهر.', '2026-08-08', TRUE, '21:00', '23:00', '460- جاده جویبار سمت غرب جاده کنار جاده اصلی، رگندشت، چناربن، حاجی آباد قسمتی از انتهای محل، بسمت مرغداری شیخی، کشاورزی پشت کشتارگاه، روستای میارکلا و مسکن مهر.', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|251-_بلوار_خزر_دریا_13-_دریا_15-_دریا_17-_میدان_خزر_به_سمت_مسجد_محمد_رسول_الله_-_ابتدای_خیابان_معلم_کوچه_های_مدیریت_تا_انتها_-_کوچه_خادم_پور-_کوچه_قربانی_-_کوچه_صداقت_-_انتهای_کوچه_فرهنگیان_-_انتهای_کوچه_امام_هادی_4_-_کوچه_پری_نژاد', '2026-08-08', TRUE, '21:00', '23:00', '251- بلوار خزر دريا 13- دريا 15- دريا 17- ميدان خزر به سمت مسجد محمد رسول الله - ابتداي خيابان معلم كوچه هاي مديريت تا انتها - كوچه خادم پور- كوچه قرباني - كوچه صداقت - انتهاي كوچه فرهنگيان - انتهاي ك', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- ساری | ساري
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|sari|ساری|288-_کمربندی_شرقی_-_کوچه_شهید_رضایی_-_بلوار_طالقانی_کوی_امام_حسین_و_بخشی_از_خیابان_سنجابی', '2026-08-08', TRUE, '21:00', '23:00', '288- کمربندي شرقي - کوچه شهید رضايي - بلوار طالقانی کوی امام حسين و بخشی از خیابان سنجابی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|376-_از_میدان_جانبازان_تا_چهار_راه_جویبار_سمت_راست_خیابان_-_روستای_پرچیکلا_-_روستای_بالالموک_-_روستای_کاسگرکلا_-_روستای_لهمال_-_کوچه_فجر', '2026-08-08', TRUE, '21:00', '23:00', '376- از ميدان جانبازان تا چهار راه جويبار سمت راست خيابان - روستاي پرچيكلا - روستاي بالالموك - روستاي كاسگركلا - روستاي لهمال - كوچه فجر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|386-_پشت_ترمینال،_خیابان_مرحوم_علیپور،_درزی_کلا،_المهدی_2_تا_المهدی_28،_بخشی_از_کمربندی_غربی،_روستای_ملک_کلا،_رینگ_داخلی_تا_میدان_ولایت', '2026-08-08', TRUE, '21:00', '23:00', '386- پشت ترمينال، خيابان مرحوم عليپور، درزي كلا، المهدی 2 تا المهدی 28، بخشي از كمربندی غربي، روستای ملک كلا، رينگ داخلي تا ميدان ولايت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|396-_شانزده_متری_اول_حد_فاصل_کوی_سیدین_تا_میدان_علی،_خیابان_چمران_به_سمت_باغ_جهاندیده،_مرحوم_جوادی_(لیلی_آباد)،_اداره_آموزش_و_پرورش،_کوی_کبیری،_خیابان_بابل_حد_فاصل_کوچه_دستوریان_تا_کوچه_کبیری', '2026-08-08', TRUE, '21:00', '23:00', '396- شانزده متری اول حد فاصل کوی سیدین تا میدان علی، خیابان چمران به سمت باغ جهاندیده، مرحوم جوادی (لیلی آباد)، اداره آموزش و پرورش، کوی کبیری، خیابان بابل حد فاصل کوچه دستوریان تا کوچه کبیری', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|403-_ابتدای_خیابان_کفشگرکلا_تا_کوی_سجاد،_شهید_محسنی،_کوی_آرش،_کوی_سجاد،_کوی_دستوریان،_چهارشنبه_بازار،_کوی_افتخاری_و_روان', '2026-08-08', TRUE, '21:00', '23:00', '403- ابتدای خیابان کفشگرکلا تا کوی سجاد، شهید محسنی، کوی آرش، کوی سجاد، کوی دستوریان، چهارشنبه بازار، کوی افتخاری و روان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|397-_خیابان_ساری_سید_محله،_پشت_ورزشگاه_شهید_وطنی_،_مسجد_صبوری،_کوی_ابریشم،_المانیها', '2026-08-08', TRUE, '21:00', '23:00', '397- خیابان ساری سید محله، پشت ورزشگاه شهید وطنی ، مسجد صبوری، کوی ابریشم، المانیها', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|367-بخشی_ازدور_میدان_امام_(_نبش_رینگ_داخلی)-کوچه_شهید_متانی-شهید_گراییلی-کوچه_مشهدبان-شهرک_میلاد_نور-(خیابان_بابل_ابتدای_ارغوان_تا_رینگ_داخلی', '2026-08-08', TRUE, '21:00', '23:00', '367-بخشي ازدور ميدان امام ( نبش رينگ داخلي)-كوچه شهيد متاني-شهيد گراييلي-كوچه مشهدبان-شهرك ميلاد نور-(خيابان بابل ابتداي ارغوان تا رينگ داخلي', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- قائم‌شهر | قائمشهر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|qaemshahr|قائمشهر|371-_قادیکلا_ارطه-_شهر_ارطه-بخشی_از_قاسم_خیل', '2026-08-08', TRUE, '21:00', '23:00', '371- قادیکلا ارطه- شهر ارطه-بخشی از قاسم خیل', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- سوادکوه | سوادکوه
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|savadkuh|سوادکوه|240-_زیراب_منطقه1:_منطقه_بالازیراب_از_کرچمپورتا_اداره_برق_-_خیابان_آزادی_از_روبروی_بیمارستان_سمت_راست_بلوار_بسمت_میدان_امام_تا_فرماندهی_نیروی_انتظامی_-_بانک_کشاورزی_بسمت_میدان_فهمیده_وخیابان_شهید_قرنی_-_خیابان_جانبازان_و20_متری_تا_دمزنون_-_کوچه_های_ایثارگران،_سنگ_فروشی_شعبانی_،_شهید_غضنفری_وکوچه_ونوشه_-_شرکت_نفت_قدیم_بسمت_خواجکلا_ومنطقه_ولیکچال_-عباسکتی_بسمت_چندلا-_روستاهای_مته_کلا_تا_سنگ_نیشت،_کچید_تا_پیرنعیم،_امیرکلا_و_بهمنان،_اتوتا_لاجیم_وتلمبه_خانه_مرزبان', '2026-08-08', TRUE, '21:00', '23:00', '240- زیراب منطقه1: منطقه بالازيراب از كرچمپورتا اداره برق - خيابان آزادی از روبروی بیمارستان سمت راست بلوار بسمت ميدان امام تا فرماندهی نيروي انتظامي - بانك كشاورزي بسمت ميدان فهميده وخيابان شهيد قرني', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|193-_قسمتی_از_بلوار_منتظری_-_سید_زین_العابدین_-_آستانه_سر_-_شورکاء_-_حیدر_آباد_-_خیابان_شهید_تبریزی_(بحر_خزر)_-_خیابان_آب_فاضلاب_-_پمپ_بنزین_ورشوئی_2_-_اداره_برق_-_بانک_صادرات', '2026-08-08', TRUE, '21:00', '23:00', '193- قسمتي از بلوار منتظري - سيد زين العابدين - آستانه سر - شوركاء - حيدر آباد - خيابان شهيد تبريزي (بحر خزر) - خيابان آب فاضلاب - پمپ بنزين ورشوئي 2 - اداره برق - بانك صادرات', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|199-_سمت_چپ_ابتدای_جاده_کیاکلا_تا_سه_راه_خدمات_–_سمت_چپ_سه_راه_خدمات_تا_پل_شیب_ابندان-صفرخیل-گلیرد', '2026-08-08', TRUE, '21:00', '23:00', '199- سمت چپ ابتداي جاده کياکلا تا سه راه خدمات – سمت چپ سه راه خدمات تا پل شيب ابندان-صفرخیل-گلیرد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|195-_خیابان_امام_از_میدان_کشتی_تامیدان_سپاه_–بالا_محله_–کرد_محله_–_سمت_چپ_بلوارورداسبی–بیمارستان_عزیزی-کوچه_دادگستری-فقیه_محله', '2026-08-08', TRUE, '21:00', '23:00', '195- خيابان امام از ميدان کشتي تاميدان سپاه –بالا محله –کرد محله – سمت چپ بلوارورداسبي–بيمارستان عزيزي-کوچه دادگستري-فقيه محله', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- جویبار | جويبار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|juybar|جویبار|433-_روستاهای_علی_آباد-_خرده_لاریم_-_سه_راه_قدس_لاریم_الی_سه_راهی_مشک_آباد_-_رنگریز_محله_مشک_آباد–_ایزدخیل_مشک_آباد-_کردخیل_مشک_آباد-_کیامحله_مشک_آباد-_بالا_مشک_آباد_–_پایین_مشک_آباد-_چهارشنبه_مشک_آباد_-_شاه_رضا_–_مهرآباد_–_آباده', '2026-08-08', TRUE, '21:00', '23:00', '433- روستاهای علی آباد- خرده لاریم - سه راه قدس لاریم الی سه راهی مشک آباد - رنگریز محله مشک آباد– ایزدخیل مشک آباد- کردخیل مشک آباد- کیامحله مشک آباد- بالا مشک آباد – پایین مشک آباد- چهارشنبه مشک آبا', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|113-_کوچه_های_بوستان_1_و_هتل_مرجان_(بوستان_13_تا_21)_و_(بوستان_12_تا_18)،_انتقال_خون_تا_مدرسه_صبوری،_(شیخ_کبیرهای_16_تا_24)،_(ملانصیرا_15_تا_19)', '2026-08-08', TRUE, '21:00', '23:00', '113- کوچه های بوستان 1 و هتل مرجان (بوستان 13 تا 21) و (بوستان 12 تا 18)، انتقال خون تا مدرسه صبوری، (شیخ کبیرهای 16 تا 24)، (ملانصیرا 15 تا 19)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|032-_چهار_راه_گله_محله_تا_چهار_راه_امیرکبیر_(توحید_1_تا_40)،_خورشیدکلا_کوچه_های_(معراج_1_تا_16)', '2026-08-08', TRUE, '21:00', '23:00', '032- چهار راه گله محله تا چهار راه امیرکبیر (توحید 1 تا 40)، خورشیدکلا کوچه های (معراج 1 تا 16)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|140-_نقیب_کلا_کوچه_های_(هادی_4_تا_8)،_محله_های_قصاب_کلا،_پل_پیش_و_حوالی_مخابرات_استان_تا_میدان_اوقاف_و_جنب_پاساژ_بزرگ', '2026-08-08', TRUE, '21:00', '23:00', '140- نقیب کلا کوچه های (هادی 4 تا 8)، محله های قصاب کلا، پل پیش و حوالی مخابرات استان تا میدان اوقاف و جنب پاساژ بزرگ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|099-_میدان_فاضل_تا_سلطان_محمد_طاهر_سمت_چپ،_محمود_اباد،_شهرک_ولیعصر،روستای_رمنت_(کوچه_های_فیضیه_و_گلزار_)', '2026-08-08', TRUE, '21:00', '23:00', '099- میدان فاضل تا سلطان محمد طاهر سمت چپ، محمود اباد، شهرک ولیعصر،روستای رمنت (کوچه های فیضیه و گلزار )', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|147-_میدان_سجودی_(قاضی_کتی)_تا_پمپ_بنزین_ایستگاه_آمل،_کوچه_های_(بهاران_2_تا_16_و_1_تا_7)_و_از_پاسداران_13_تا_انتهای_ترمینال_موزیرج_از_(ارشاد_1_تا_31)_،_شهرک_طالقانی_و_قسمتی_از_شهرک_اندیشه', '2026-08-08', TRUE, '21:00', '23:00', '147- میدان سجودی (قاضی کتی) تا پمپ بنزین ایستگاه آمل، کوچه های (بهاران 2 تا 16 و 1 تا 7) و از پاسداران 13 تا انتهای ترمینال موزیرج از (ارشاد 1 تا 31) ، شهرک طالقانی و قسمتی از شهرک اندیشه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|129-_پارک_نوشیروانی_تا_میدان_سردار_سلیمانی،_(بسیج_1_تا_21)_و_(بسیج_2_تا_6)،_خیابان_وحدت_تا_مبلمان_مرکزی،_توحید_61_کوچه_های_حمزء،_خیابان_شریعتی_از_(معلم_2_تا_18)،_خیابان_گل،_محله_صد_دستگاه،_روبروی_پارک_گل،حوالی_پارک_شادی', '2026-08-08', TRUE, '21:00', '23:00', '129- پارک نوشیروانی تا میدان سردار سلیمانی، (بسیج 1 تا 21) و (بسیج 2 تا 6)، خیابان وحدت تا مبلمان مرکزی، توحید 61 کوچه های حمزء، خیابان شریعتی از (معلم 2 تا 18)، خیابان گل، محله صد دستگاه، روبروی پارک', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|095-_جاده_کیاکلا_از_میدان_فاضل_تا_انتها_حوزه_بابل_روستای_کپورچال(شهرک_کیا_مهر_و_مهر_دشت،_اخوان،_کلمدان،_نخ_کلا،_سلیمان_کلا،_قائمیه،_کپور_چال)_و_از_جاده_قایمشهر_محله_استردیکلا_تا_ورودی_جاده_کیاکلا_منصور_کنده', '2026-08-08', TRUE, '21:00', '23:00', '095- جاده کیاکلا از میدان فاضل تا انتها حوزه بابل روستای کپورچال(شهرک کیا مهر و مهر دشت، اخوان، کلمدان، نخ کلا، سلیمان کلا، قائمیه، کپور چال) و از جاده قایمشهر محله استردیکلا تا ورودی جاده کیاکلا منصو', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|500-_از_امام_زاده_عباس_بسمت_لدار_و_شاه_رضا،_پوستکلا،_زوارده،_کلاگرکلا،_آخمن،_لیاردن،_گرد_رودبار،_امیرده_و_قسمتی_از_بالا_مرزناک', '2026-08-08', TRUE, '21:00', '23:00', '500- از امام زاده عباس بسمت لدار و شاه رضا، پوستکلا، زوارده، کلاگرکلا، آخمن، لیاردن، گرد رودبار، امیرده و قسمتی از بالا مرزناک', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|503-_ناریوران_تا_سه_راهی_میر_کتی،_رحمانی_محله،_سفیدطور،_پاریکلا،_سنگرودپی،_کاردیکلای_شرقی،_پایین_پنبه_جار_ازارکل،_مسک', '2026-08-08', TRUE, '21:00', '23:00', '503- ناریوران تا سه راهی میر کتی، رحمانی محله، سفیدطور، پاریکلا، سنگرودپی، کاردیکلای شرقی، پایین پنبه جار ازارکل، مسک', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابل | بابل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babol|بابل|108-_میدان_کشوری_تا_کارگر،_قسمتی_از_بحرارم_شرقی،_کوچه_های_(سرداران_2_تا_18)،_(ارشاد_2_تا_10)،_ورودی_شهرک_آزادگان_و_هشت_متری،_(پاسداران_7_تا_17)', '2026-08-08', TRUE, '21:00', '23:00', '108- میدان کشوری تا کارگر، قسمتی از بحرارم شرقی، کوچه های (سرداران 2 تا 18)، (ارشاد 2 تا 10)، ورودی شهرک آزادگان و هشت متری، (پاسداران 7 تا 17)', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|018-_حد_فاصل_پست_اسلام_آباد_روستاهای_ورکلا_و_ورندان_و_قندارخیل_و_قسمت_شرقی_جاده_گهرباران_بعد_از_سراه_پنبه_چوله_شهر_طبقده_تا_دریای_گهرباران_و_مسیر_ساحلی', '2026-08-08', TRUE, '21:00', '23:00', '018- حد فاصل پست اسلام آباد روستاهای ورکلا و ورندان و قندارخیل و قسمت شرقی جاده گهرباران بعد از سراه پنبه چوله شهر طبقده تا دریای گهرباران و مسیر ساحلی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|508-_میاندرود-روستاهای_دارابکلا،_اوسا_،_مرسم-بلوار_آیت_الله_دارابکلایی', '2026-08-08', TRUE, '21:00', '23:00', '508- میاندرود-روستاهای دارابکلا، اوسا ، مرسم-بلوار آیت الله دارابکلایی', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- میاندورود | مياندرود
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amlash_maz|میاندرود|345-_روستاهای_تازه_آباد_جهاد_و_بیشه_سر_و_پلنگ_آزاد_و_چفت_سر', '2026-08-08', TRUE, '21:00', '23:00', '345- روستاهای تازه آباد جهاد و بیشه سر و پلنگ آزاد و چفت سر', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|530-_از_پل_هردورود_تا_پلیس_راه_بایجان_-_اندوار', '2026-08-08', TRUE, '21:00', '23:00', '530- از پل هردورود تا پلیس راه بایجان - اندوار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|083-_بلوار_طالقانی_از_جلوی_پارک_طلایی_تا_میدان_قائم_مسیر_شرقی_-دم_پل_مجتمع_های_تجاری_پردیس_و_بزرگ_-کوچه_آموزش_و_پرورش_و_شهرک_دیزل_و_مرجان', '2026-08-08', TRUE, '21:00', '23:00', '083- بلوار طالقاني از جلوي پارك طلايي تا ميدان قائم مسير شرقي -دم پل مجتمع هاي تجاري پرديس و بزرگ -كوچه آموزش و پرورش و شهرك ديزل و مرجان', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|309-_شهر_رینه', '2026-08-08', TRUE, '21:00', '23:00', '309- شهر رینه', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|347-_جاده_هراز_آب_معدنی_پلور_و_روستای_پلور_و_مناطق_منظریه_و_مفت_آباد', '2026-08-08', TRUE, '21:00', '23:00', '347- جاده هراز آب معدنی پلور و روستای پلور و مناطق منظریه و مفت آباد', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|311-_جاده_هراز_-روستاهای_زیار_و_لاسم', '2026-08-08', TRUE, '21:00', '23:00', '311- جاده هراز -روستاهای زیار و لاسم', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|478-_مسیر_روستاهای_چنگمیان-_تمسک-_سرخ_کلا_-_گلمزار', '2026-08-08', TRUE, '21:00', '23:00', '478- مسير روستاهاي چنگميان- تمسك- سرخ كلا - گلمزار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- آمل | آمل
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|amol|آمل|070-_بلوار_آزادگان_آزادگان4(کوچه_های_گلچوبی_و_زابلی)-_انتهای_رضوان21_و_سیکاپل_جنب_مسجد_ابوالفضل-_رضوان27', '2026-08-08', TRUE, '21:00', '23:00', '070- بلوار آزادگان آزادگان4(کوچه های گلچوبی و زابلی)- انتهای رضوان21 و سیکاپل جنب مسجد ابوالفضل- رضوان27', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|220-_شریعتی_22_و_کتی_بن_-بلوار_شهید_علیزاده_پارکینگ_های_صفرو_1و2و3و4و5و6_-_خیابان_اول_دریاکنار', '2026-08-08', TRUE, '21:00', '23:00', '220- شريعتي 22 و كتي بن -بلوار شهيد عليزاده پاركينگ هاي صفرو 1و2و3و4و5و6 - خيابان اول درياكنار', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|151-_ضلع_جنوبی_شهر_بهنمیر_تا_میدان_-_ضلع_جنوبی_روستای_کاله_-_ضلع_جنوبی_روستای_کریم_کلا_-_بازار_سر-_همت_آباد_-_حاجی_کلا_-_سرحمام', '2026-08-08', TRUE, '21:00', '23:00', '151- ضلع جنوبی شهر بهنمیر تا میدان - ضلع جنوبی روستای کاله - ضلع جنوبی روستای کریم کلا - بازار سر- همت آباد - حاجی کلا - سرحمام', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|157-_بلوار_نیروی_هوایی_-روستای_اوکسر-چهارصدمتری_باقرتنگه-کوی_سازمانی_نیروی_هوایی-_روستای_کهنه_محله_میرود_(_شهید_سرا_)_-_روستای_عربخیل-_روستای_کاله_-_روستای_افراتخت', '2026-08-08', TRUE, '21:00', '23:00', '157- بلوار نيروي هوايي -روستاي اوكسر-چهارصدمتري باقرتنگه-كوي سازماني نيروي هوايي- روستاي كهنه محله ميرود ( شهيد سرا ) - روستاي عربخيل- روستاي كاله - روستاي افراتخت', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- بابلسر | بابلسر
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|babolsar|بابلسر|159-_بلوار_نیروهوایی_شهدا_7_-شهرک_صنعتی_میرود-_روستاهای_میرود-_میرود_سر+کرفون-_نفت_چال', '2026-08-08', TRUE, '21:00', '23:00', '159- بلوار نيروهوايي شهدا 7 -شهرك صنعتي ميرود- روستاهاي ميرود- ميرود سر+كرفون- نفت چال', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- فریدونکنار | فريدون کنار
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|fereydunkenar|فریدون_کنار|350-_خیابان_بهشتی_از_پمپ_بنزین_الی_میدان_ماهی_و_شهرک_رجایی-ابتدای_بلوار_بهشتی_(کوچه_های_1_و_3_و_5_و_7و2_و4_و6_و_8_)و_کوچه_های_اول_تا_سوم_هلال_احمر-_بلوار_شهدا_حد_فاصل_میدان_ماهی_الی_شهدا_9_-_شهدا_4', '2026-08-08', TRUE, '21:00', '23:00', '350- خيابان بهشتي از پمپ بنزين الي ميدان ماهي و شهرک رجايي-ابتدای بلوار بهشتی (کوچه های 1 و 3 و 5 و 7و2 و4 و6 و 8 )و کوچه های اول تا سوم هلال احمر- بلوار شهدا حد فاصل میدان ماهی الي شهدا 9 - شهدا 4', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|522-_خیابان_سی_متری_غربی،کوچه_های(آژانس_فروغ،بخشی_ازعزیزی،مدرسه_ایثارگران_بسمت_ارتباطی_3700،_رضایی،فغانی،_ترنج،مجتمع_مسکونی_شهرک_سیمان،_فرزین)،چهارراه_آزادگان_بسمت_ایستگاه_راه_آهن،کوچه_های_تاراسی،میرگل_رمضانی،حبیبی،_خدامی،_منطقه_ترک_محله_بسمت_اداره_برق_و_سپاه_پاسداران', '2026-08-08', TRUE, '21:00', '23:00', '522- خیابان سی متری غربی،کوچه های(آژانس فروغ،بخشی ازعزیزی،مدرسه ایثارگران بسمت ارتباطی 3700، رضایی،فغانی، ترنج،مجتمع مسکونی شهرک سیمان، فرزین)،چهارراه آزادگان بسمت ایستگاه راه آهن،کوچه های تاراسی،میرگ', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|536-_روستاهای_واودین،_سورک،_محسن_آباد،_کفکور،_ارزگ،_لایی_پاسند،شیرکلا،لاکتراش،_گلورد_کوچک،_کارکم،_گلورد_بزرگ،للرد،_رمدانخیل،_گرگتج،_خرم_چماز،_بندبنی،_یعقوب_محله،_درویش_خیلک_،دوآب_،_پوروا_،_ملاخیل_پوروا_،_صفرمیان_،_،_اوکرکا_،_کرداب_،_سه_کیله_،_درویشان_و_اراضی_و_سد_گلورد-_روستاهای_بخش_بهشهر_(کنت،محمدآباد،_رودبار_،ولم،شیرداری،چالکده،غریب_محله،گالش_محله)', '2026-08-08', TRUE, '21:00', '23:00', '536- روستاهای واودین، سورک، محسن آباد، کفکور، ارزگ، لایی پاسند،شیرکلا،لاکتراش، گلورد کوچک، کارکم، گلورد بزرگ،للرد، رمدانخیل، گرگتج، خرم چماز، بندبنی، یعقوب محله، درویش خیلک ،دوآب ، پوروا ، ملاخیل پورو', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

-- نکا | نكا
INSERT INTO outage_cache (region_key, date, found, start_time, end_time, note, updated_at)
VALUES ('mazandaran|neka|نکا|519-_سمت_راست_جاده_نیروگاه،cngشهرداری،_روستاهای_نیم_چاه_و_اراضی_نیم_چاه،طوسکلا_ضلع_شرقی_لب_جاده_اصلی،_نیرآباد،خورشید_،_چوپان_بنه_خورشید_و_تازه_آباد،،امامیه،بایع_کلا_و_اراضی_بایع_کلا_،_اراضی_مسیرباغ_تهرانی_تا_نرسیده_به_سورتینگ_محمدی_و_اراضی_طوسکلا_جاده_امامزاده_اسماعیل_بسمت_پل_حلمسر', '2026-08-08', TRUE, '21:00', '23:00', '519- سمت راست جاده نیروگاه،CNGشهرداری، روستاهای نیم چاه و اراضی نیم چاه،طوسکلا ضلع شرقی لب جاده اصلی، نیرآباد،خورشید ، چوپان بنه خورشید و تازه آباد،،امامیه،بایع کلا و اراضی بایع کلا ، اراضی مسیرباغ ته', NOW())
ON CONFLICT (region_key, date)
DO UPDATE SET
    found = EXCLUDED.found,
    start_time = EXCLUDED.start_time,
    end_time = EXCLUDED.end_time,
    note = EXCLUDED.note,
    updated_at = NOW();

COMMIT;

-- ✅ مجموع ردیف‌ها: 399