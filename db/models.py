import datetime as dt
from sqlalchemy import Text
from sqlalchemy import (
    BigInteger,
    Boolean,
    Date,
    DateTime,
    ForeignKey,
    Index,
    String,
    Time,
    UniqueConstraint,
)
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship


class Base(DeclarativeBase):
    pass


class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(primary_key=True)
    telegram_id: Mapped[int] = mapped_column(BigInteger, unique=True, index=True)
    first_name: Mapped[str] = mapped_column(String(255), nullable=True)
    # آیا کاربر می‌خواد ساعت ۲۲ همون شب، خلاصه‌ی قطعی فردا رو هم از قبل بهش بگیم؟
    nightly_summary_enabled: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[dt.datetime] = mapped_column(
        DateTime, default=dt.datetime.utcnow
    )

    locations: Mapped[list["Location"]] = relationship(
        back_populates="user", cascade="all, delete-orphan"
    )


class Location(Base):
    __tablename__ = "locations"
    __table_args__ = (
        # ایندکس‌های fuzzy search برای پیدا کردن مکان‌های مشابه (نیاز به extension: pg_trgm)
        Index(
            "ix_locations_city_trgm",
            "city_fa",
            postgresql_using="gin",
            postgresql_ops={"city_fa": "gin_trgm_ops"},
        ),
        Index(
            "ix_locations_district_trgm",
            "district_fa",
            postgresql_using="gin",
            postgresql_ops={"district_fa": "gin_trgm_ops"},
        ),
    )

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(
        ForeignKey("users.id", ondelete="CASCADE"),
        index=True,
    )

    province_code: Mapped[str] = mapped_column(String(64))
    province_fa: Mapped[str] = mapped_column(String(128))
    county_code: Mapped[str] = mapped_column(String(64))
    county_fa: Mapped[str] = mapped_column(String(128))
    city_fa: Mapped[str] = mapped_column(String(255))
    district_fa: Mapped[str] = mapped_column(String(255))

    # کلید یکتای منطقه که برای کش استفاده میشه (نرمالایز شده، مستقل از کاربر)
    region_key: Mapped[str] = mapped_column(Text, index=True)
    created_at: Mapped[dt.datetime] = mapped_column(
        DateTime, default=dt.datetime.utcnow
    )

    user: Mapped["User"] = relationship(back_populates="locations")


class OutageCache(Base):
    """
    نتیجه‌ی جست‌وجوی هرمس ایجنت برای یک منطقه در یک روز مشخص.
    قبل از هر جست‌وجوی جدید (چه توسط هرمس، چه در آینده)، این جدول چک میشه
    تا کوئری تکراری برای یک منطقه‌ی از قبل جست‌وجوشده زده نشه.
    """

    __tablename__ = "outage_cache"
    __table_args__ = (
        UniqueConstraint("region_key", "date", name="uq_region_date"),
        Index(
            "ix_outage_cache_note_trgm",
            "note",
            postgresql_using="gin",
            postgresql_ops={"note": "gin_trgm_ops"},
        ),
    )

    id: Mapped[int] = mapped_column(primary_key=True)
    region_key: Mapped[str] = mapped_column(String(512), index=True)
    date: Mapped[dt.date] = mapped_column(Date, index=True)

    found: Mapped[bool] = mapped_column(default=False)
    start_time: Mapped[dt.time] = mapped_column(Time, nullable=True)
    end_time: Mapped[dt.time] = mapped_column(Time, nullable=True)
    note: Mapped[str] = mapped_column(String(1024), nullable=True)

    updated_at: Mapped[dt.datetime] = mapped_column(
        DateTime, default=dt.datetime.utcnow, onupdate=dt.datetime.utcnow
    )


class NotificationSent(Base):
    """جلوگیری از ارسال تکراری هشدار برای یک مکان در یک روز مشخص"""

    __tablename__ = "notifications_sent"
    __table_args__ = (
        UniqueConstraint("location_id", "date", name="uq_location_date"),
    )

    id: Mapped[int] = mapped_column(primary_key=True)
    location_id: Mapped[int] = mapped_column(
    ForeignKey("locations.id", ondelete="CASCADE"),
    index=True,
)
    date: Mapped[dt.date] = mapped_column(Date, index=True)
    sent_at: Mapped[dt.datetime] = mapped_column(
        DateTime, default=dt.datetime.utcnow
    )


class NightlySummarySent(Base):
    """
    جلوگیری از ارسال تکراری خلاصه‌ی شبانه برای یک کاربر در یک شب مشخص.
    date برابر با تاریخِ «فردا»ی موضوع خلاصه است، نه تاریخ ارسال.
    """

    __tablename__ = "nightly_summaries_sent"
    __table_args__ = (
        UniqueConstraint("user_id", "date", name="uq_nightly_user_date"),
    )

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(
        ForeignKey("users.id", ondelete="CASCADE"),
        index=True,
    )
    date: Mapped[dt.date] = mapped_column(Date, index=True)
    sent_at: Mapped[dt.datetime] = mapped_column(
        DateTime, default=dt.datetime.utcnow
    )
