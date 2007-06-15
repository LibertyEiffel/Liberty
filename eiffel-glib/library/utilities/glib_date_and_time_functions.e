deferred class GLIB_DATE_AND_TIME_FUNCTIONS
	
--    Top  |  Description

--    Date and Time Functions

--    Date and Time Functions -- calendrical calculations and miscellaneous time
--    stuff.

-- Synopsis


--  #include <glib.h>


--  #define     G_USEC_PER_SEC
--              GTimeVal;
--  void        g_get_current_time              (GTimeVal *result);
--  void        g_usleep                        (gulong microseconds);
--  void        g_time_val_add                  (GTimeVal *time_,
--                                               glong microseconds);
--  gboolean    g_time_val_from_iso8601         (const gchar *iso_date,
--                                               GTimeVal *time_);
--  gchar*      g_time_val_to_iso8601           (GTimeVal *time_);

--              GDate;
--  typedef     GTime;
--  enum        GDateDMY;
--  typedef     GDateDay;
--  enum        GDateMonth;
--  typedef     GDateYear;
--  enum        GDateWeekday;

--  #define     G_DATE_BAD_DAY
--  #define     G_DATE_BAD_JULIAN
--  #define     G_DATE_BAD_YEAR

--  GDate*      g_date_new                      (void);
--  GDate*      g_date_new_dmy                  (GDateDay day,
--                                               GDateMonth month,
--                                               GDateYear year);
--  GDate*      g_date_new_julian               (guint32 julian_day);
--  void        g_date_clear                    (GDate *date,
--                                               guint n_dates);
--  void        g_date_free                     (GDate *date);

--  void        g_date_set_day                  (GDate *date,
--                                               GDateDay day);
--  void        g_date_set_month                (GDate *date,
--                                               GDateMonth month);
--  void        g_date_set_year                 (GDate *date,
--                                               GDateYear year);
--  void        g_date_set_dmy                  (GDate *date,
--                                               GDateDay day,
--                                               GDateMonth month,
--                                               GDateYear y);
--  void        g_date_set_julian               (GDate *date,
--                                               guint32 julian_date);
--  void        g_date_set_time                 (GDate *date,
--                                               GTime time_);
--  void        g_date_set_time_t               (GDate *date,
--                                               time_t timet);
--  void        g_date_set_time_val             (GDate *date,
--                                               GTimeVal *timeval);
--  void        g_date_set_parse                (GDate *date,
--                                               const gchar *str);

--  void        g_date_add_days                 (GDate *date,
--                                               guint n_days);
--  void        g_date_subtract_days            (GDate *date,
--                                               guint n_days);
--  void        g_date_add_months               (GDate *date,
--                                               guint n_months);
--  void        g_date_subtract_months          (GDate *date,
--                                               guint n_months);
--  void        g_date_add_years                (GDate *date,
--                                               guint n_years);
--  void        g_date_subtract_years           (GDate *date,
--                                               guint n_years);
--  gint        g_date_days_between             (const GDate *date1,
--                                               const GDate *date2);
--  gint        g_date_compare                  (const GDate *lhs,
--                                               const GDate *rhs);
--  void        g_date_clamp                    (GDate *date,
--                                               const GDate *min_date,
--                                               const GDate *max_date);
--  void        g_date_order                    (GDate *date1,
--                                               GDate *date2);

--  GDateDay    g_date_get_day                  (const GDate *date);
--  GDateMonth  g_date_get_month                (const GDate *date);
--  GDateYear   g_date_get_year                 (const GDate *date);
--  guint32     g_date_get_julian               (const GDate *date);
--  GDateWeekday g_date_get_weekday             (const GDate *date);
--  guint       g_date_get_day_of_year          (const GDate *date);

--  guint8      g_date_get_days_in_month        (GDateMonth month,
--                                               GDateYear year);
--  gboolean    g_date_is_first_of_month        (const GDate *date);
--  gboolean    g_date_is_last_of_month         (const GDate *date);
--  gboolean    g_date_is_leap_year             (GDateYear year);
--  guint       g_date_get_monday_week_of_year  (const GDate *date);
--  guint8      g_date_get_monday_weeks_in_year (GDateYear year);
--  guint       g_date_get_sunday_week_of_year  (const GDate *date);
--  guint8      g_date_get_sunday_weeks_in_year (GDateYear year);
--  guint       g_date_get_iso8601_week_of_year (const GDate *date);

--  gsize       g_date_strftime                 (gchar *s,
--                                               gsize slen,
--                                               const gchar *format,
--                                               const GDate *date);
--  void        g_date_to_struct_tm             (const GDate *date,
--                                               struct tm *tm);

--  gboolean    g_date_valid                    (const GDate *date);
--  gboolean    g_date_valid_day                (GDateDay day);
--  gboolean    g_date_valid_month              (GDateMonth month);
--  gboolean    g_date_valid_year               (GDateYear year);
--  gboolean    g_date_valid_dmy                (GDateDay day,
--                                               GDateMonth month,
--                                               GDateYear year);
--  gboolean    g_date_valid_julian             (guint32 julian_date);
--  gboolean    g_date_valid_weekday            (GDateWeekday weekday);


-- Description

--    The GDate data structure represents a day between January 1, Year 1, and sometime
--    a few thousand years in the future (right now it will go to the year 65535 or so,
--    but g_date_set_parse() only parses up to the year 8000 or so - just count on "a
--    few thousand"). GDate is meant to represent everyday dates, not astronomical
--    dates or historical dates or ISO timestamps or the like. It extrapolates the
--    current Gregorian calendar forward and backward in time; there is no attempt to
--    change the calendar to match time periods or locations. GDate does not store time
--    information; it represents a day.

--    The GDate implementation has several nice features; it is only a 64-bit struct,
--    so storing large numbers of dates is very efficient. It can keep both a Julian
--    and day-month-year representation of the date, since some calculations are much
--    easier with one representation or the other. A Julian representation is simply a
--    count of days since some fixed day in the past; for GDate the fixed day is
--    January 1, 1 AD. ("Julian" dates in the GDate API aren't really Julian dates in
--    the technical sense; technically, Julian dates count from the start of the Julian
--    period, Jan 1, 4713 BC).

--    GDate is simple to use. First you need a "blank" date; you can get a dynamically
--    allocated date from g_date_new(), or you can declare an automatic variable or
--    array and initialize it to a sane state by calling g_date_clear(). A cleared date
--    is sane; it's safe to call g_date_set_dmy() and the other mutator functions to
--    initialize the value of a cleared date. However, a cleared date is initially
--    invalid, meaning that it doesn't represent a day that exists. It is undefined to
--    call any of the date calculation routines on an invalid date. If you obtain a
--    date from a user or other unpredictable source, you should check its validity
--    with the g_date_valid() predicate. g_date_valid() is also used to check for
--    errors with g_date_set_parse() and other functions that can fail. Dates can be
--    invalidated by calling g_date_clear() again.

--    It is very important to use the API to access the GDate struct. Often only the
--    day-month-year or only the Julian representation is valid. Sometimes neither is
--    valid. Use the API.

--    GLib doesn't contain any time-manipulation functions; however, there is a GTime
--    typedef and a GTimeVal struct which represents a more precise time (with
--    microseconds). You can request the current time as a GTimeVal with
--    g_get_current_time().

-- Details

--   G_USEC_PER_SEC

--  #define G_USEC_PER_SEC 1000000

--    Number of microseconds in one second (1 million). This macro is provided for code
--    readability.

--    ---------------------------------------------------------------------------------

--   GTimeVal

--  typedef struct {
--    glong tv_sec;
--    glong tv_usec;
--  } GTimeVal;

--    Represents a precise time, with seconds and microseconds. Similar to the struct
--    timeval returned by the gettimeofday() UNIX call.

--    glong tv_sec;  seconds.
--    glong tv_usec; microseconds.

--    ---------------------------------------------------------------------------------

--   g_get_current_time ()

--  void        g_get_current_time              (GTimeVal *result);

--    Equivalent to the UNIX gettimeofday() function, but portable.

--    result : GTimeVal structure in which to store current time.

--    ---------------------------------------------------------------------------------

--   g_usleep ()

--  void        g_usleep                        (gulong microseconds);

--    Pauses the current thread for the given number of microseconds. There are 1
--    million microseconds per second (represented by the G_USEC_PER_SEC macro).
--    g_usleep() may have limited precision, depending on hardware and operating
--    system; don't rely on the exact length of the sleep.

--    microseconds : number of microseconds to pause.

--    ---------------------------------------------------------------------------------

--   g_time_val_add ()

--  void        g_time_val_add                  (GTimeVal *time_,
--                                               glong microseconds);

--    Adds the given number of microseconds to time_. microseconds can also be negative
--    to decrease the value of time_.

--    time_ :        a GTimeVal
--    microseconds : number of microseconds to add to time

--    ---------------------------------------------------------------------------------

--   g_time_val_from_iso8601 ()

--  gboolean    g_time_val_from_iso8601         (const gchar *iso_date,
--                                               GTimeVal *time_);

--    Converts a string containing an ISO 8601 encoded date and time to a GTimeVal and
--    puts it into time_.

--    iso_date : a ISO 8601 encoded date string
--    time_ :    a GTimeVal
--    Returns :  TRUE if the conversion was successful.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_time_val_to_iso8601 ()

--  gchar*      g_time_val_to_iso8601           (GTimeVal *time_);

--    Converts time_ into a ISO 8601 encoded string, relative to the Coordinated
--    Universal Time (UTC).

--    time_ :   a GTimeVal
--    Returns : a newly allocated string containing a ISO 8601 date

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   GDate

--  typedef struct {
--    guint julian_days : 32; /* julian days representation - we use a
--                             *  bitfield hoping that 64 bit platforms
--                             *  will pack this whole struct in one big
--                             *  int
--                             */

--    guint julian : 1;    /* julian is valid */
--    guint dmy    : 1;    /* dmy is valid */

--    /* DMY representation */
--    guint day    : 6;
--    guint month  : 4;
--    guint year   : 16;
--  } GDate;

--    Represents a day between January 1, Year 1 and a few thousand years in the
--    future. None of its members should be accessed directly. If the GDate is obtained
--    from g_date_new(), it will be safe to mutate but invalid and thus not safe for
--    calendrical computations. If it's declared on the stack, it will contain garbage
--    so must be initialized with g_date_clear(). g_date_clear() makes the date invalid
--    but sane. An invalid date doesn't represent a day, it's "empty." A date becomes
--    valid after you set it to a Julian day or you set a day, month, and year.

--    guint julian_days : 32; the Julian representation of the date
--    guint julian : 1;       this bit is set if julian_days is valid
--    guint dmy : 1;          this is set if day, month and year are valid
--    guint day : 6;          the day of the day-month-year representation of the date,
--                            as a number between 1 and 31
--    guint month : 4;        the day of the day-month-year representation of the date,
--                            as a number between 1 and 12
--    guint year : 16;        the day of the day-month-year representation of the date

--    ---------------------------------------------------------------------------------

--   GTime

--  typedef gint32  GTime;

--    Simply a replacement for time_t. It has been deprected since it is not equivalent
--    to time_t on 64-bit platforms with a 64-bit time_t. Unrelated to GTimer.

--    Note that GTime is defined to always be a 32bit integer, unlike time_t which may
--    be 64bit on some systems. Therefore, GTime will overflow in the year 2038, and
--    you cannot use the address of a GTime variable as argument to the UNIX time()
--    function. Instead, do the following:

--  time_t ttime;
--  GTime gtime;

--  time (&ttime);
--  gtime = (GTime)ttime;

--    ---------------------------------------------------------------------------------

--   enum GDateDMY

--  typedef enum
--  {
--    G_DATE_DAY   = 0,
--    G_DATE_MONTH = 1,
--    G_DATE_YEAR  = 2
--  } GDateDMY;

--    This enumeration isn't used in the API, but may be useful if you need to mark a
--    number as a day, month, or year.

--    G_DATE_DAY   a day
--    G_DATE_MONTH a month
--    G_DATE_YEAR  a year

--    ---------------------------------------------------------------------------------

--   GDateDay

--  typedef guint8  GDateDay;   /* day of the month */

--    Integer representing a day of the month; between 1 and 31. G_DATE_BAD_DAY
--    represents an invalid day of the month.

--    ---------------------------------------------------------------------------------

--   enum GDateMonth

--  typedef enum
--  {
--    G_DATE_BAD_MONTH = 0,
--    G_DATE_JANUARY   = 1,
--    G_DATE_FEBRUARY  = 2,
--    G_DATE_MARCH     = 3,
--    G_DATE_APRIL     = 4,
--    G_DATE_MAY       = 5,
--    G_DATE_JUNE      = 6,
--    G_DATE_JULY      = 7,
--    G_DATE_AUGUST    = 8,
--    G_DATE_SEPTEMBER = 9,
--    G_DATE_OCTOBER   = 10,
--    G_DATE_NOVEMBER  = 11,
--    G_DATE_DECEMBER  = 12
--  } GDateMonth;

--    Enumeration representing a month; values are G_DATE_JANUARY, G_DATE_FEBRUARY,
--    etc. G_DATE_BAD_MONTH is the invalid value.

--    G_DATE_BAD_MONTH invalid value.
--    G_DATE_JANUARY   January.
--    G_DATE_FEBRUARY  February.
--    G_DATE_MARCH     March.
--    G_DATE_APRIL     April.
--    G_DATE_MAY       May.
--    G_DATE_JUNE      June.
--    G_DATE_JULY      July.
--    G_DATE_AUGUST    August.
--    G_DATE_SEPTEMBER September.
--    G_DATE_OCTOBER   October.
--    G_DATE_NOVEMBER  November.
--    G_DATE_DECEMBER  December.

--    ---------------------------------------------------------------------------------

--   GDateYear

--  typedef guint16 GDateYear;

--    Integer representing a year; G_DATE_BAD_YEAR is the invalid value. The year must
--    be 1 or higher; negative (BC) years are not allowed. The year is represented with
--    four digits.

--    ---------------------------------------------------------------------------------

--   enum GDateWeekday

--  typedef enum
--  {
--    G_DATE_BAD_WEEKDAY  = 0,
--    G_DATE_MONDAY       = 1,
--    G_DATE_TUESDAY      = 2,
--    G_DATE_WEDNESDAY    = 3,
--    G_DATE_THURSDAY     = 4,
--    G_DATE_FRIDAY       = 5,
--    G_DATE_SATURDAY     = 6,
--    G_DATE_SUNDAY       = 7
--  } GDateWeekday;

--    Enumeration representing a day of the week; G_DATE_MONDAY, G_DATE_TUESDAY, etc.
--    G_DATE_BAD_WEEKDAY is an invalid weekday.

--    G_DATE_BAD_WEEKDAY invalid value.
--    G_DATE_MONDAY      Monday.
--    G_DATE_TUESDAY     Tuesday.
--    G_DATE_WEDNESDAY   Wednesday.
--    G_DATE_THURSDAY    Thursday.
--    G_DATE_FRIDAY      Friday.
--    G_DATE_SATURDAY    Saturday.
--    G_DATE_SUNDAY      Sunday.

--    ---------------------------------------------------------------------------------

--   G_DATE_BAD_DAY

--  #define G_DATE_BAD_DAY    0U

--    Represents an invalid GDateDay.

--    ---------------------------------------------------------------------------------

--   G_DATE_BAD_JULIAN

--  #define G_DATE_BAD_JULIAN 0U

--    Represents an invalid Julian day number.

--    ---------------------------------------------------------------------------------

--   G_DATE_BAD_YEAR

--  #define G_DATE_BAD_YEAR   0U

--    Represents an invalid year.

--    ---------------------------------------------------------------------------------

--   g_date_new ()

--  GDate*      g_date_new                      (void);

--    Allocates a GDate and initializes it to a sane state. The new date will be
--    cleared (as if you'd called g_date_clear()) but invalid (it won't represent an
--    existing day). Free the return value with g_date_free().

--    Returns : a newly-allocated GDate.

--    ---------------------------------------------------------------------------------

--   g_date_new_dmy ()

--  GDate*      g_date_new_dmy                  (GDateDay day,
--                                               GDateMonth month,
--                                               GDateYear year);

--    Like g_date_new(), but also sets the value of the date. Assuming the
--    day-month-year triplet you pass in represents an existing day, the returned date
--    will be valid.

--    day :     day of the month.
--    month :   month of the year.
--    year :    year
--    Returns : a newly-allocated GDate initialized with day, month, and year.

--    ---------------------------------------------------------------------------------

--   g_date_new_julian ()

--  GDate*      g_date_new_julian               (guint32 julian_day);

--    Like g_date_new(), but also sets the value of the date. Assuming the Julian day
--    number you pass in is valid (greater than 0, less than an unreasonably large
--    number), the returned date will be valid.

--    julian_day : days since January 1, Year 1.
--    Returns :    a newly-allocated GDate initialized with julian_day.

--    ---------------------------------------------------------------------------------

--   g_date_clear ()

--  void        g_date_clear                    (GDate *date,
--                                               guint n_dates);

--    Initializes one or more GDate structs to a sane but invalid state. The cleared
--    dates will not represent an existing date, but will not contain garbage. Useful
--    to init a date declared on the stack. Validity can be tested with g_date_valid().

--    date :    pointer to one or more dates to clear.
--    n_dates : number of dates to clear.

--    ---------------------------------------------------------------------------------

--   g_date_free ()

--  void        g_date_free                     (GDate *date);

--    Frees a GDate returned from g_date_new().

--    date : a GDate.

--    ---------------------------------------------------------------------------------

--   g_date_set_day ()

--  void        g_date_set_day                  (GDate *date,
--                                               GDateDay day);

--    Sets the day of the month for a GDate. If the resulting day-month-year triplet is
--    invalid, the date will be invalid.

--    date : a GDate.
--    day :  day to set.

--    ---------------------------------------------------------------------------------

--   g_date_set_month ()

--  void        g_date_set_month                (GDate *date,
--                                               GDateMonth month);

--    Sets the month of the year for a GDate. If the resulting day-month-year triplet
--    is invalid, the date will be invalid.

--    date :  a GDate.
--    month : month to set.

--    ---------------------------------------------------------------------------------

--   g_date_set_year ()

--  void        g_date_set_year                 (GDate *date,
--                                               GDateYear year);

--    Sets the year for a GDate. If the resulting day-month-year triplet is invalid,
--    the date will be invalid.

--    date : a GDate.
--    year : year to set.

--    ---------------------------------------------------------------------------------

--   g_date_set_dmy ()

--  void        g_date_set_dmy                  (GDate *date,
--                                               GDateDay day,
--                                               GDateMonth month,
--                                               GDateYear y);

--    Sets the value of a GDate from a day, month, and year. The day-month-year triplet
--    must be valid; if you aren't sure it is, call g_date_valid_dmy() to check before
--    you set it.

--    date :  a GDate.
--    day :   day.
--    month : month.
--    y :     year.

--    ---------------------------------------------------------------------------------

--   g_date_set_julian ()

--  void        g_date_set_julian               (GDate *date,
--                                               guint32 julian_date);

--    Sets the value of a GDate from a Julian day number.

--    date :        a GDate.
--    julian_date : Julian day number (days since January 1, Year 1).

--    ---------------------------------------------------------------------------------

--   g_date_set_time ()

--  void        g_date_set_time                 (GDate *date,
--                                               GTime time_);

--   Warning

--    g_date_set_time is deprecated and should not be used in newly-written code.

--    Sets the value of a date from a GTime value.

--    Deprecated:2.10: Use g_date_set_time_t() instead.

--    date :  a GDate.
--    time_ : GTime value to set.

--    ---------------------------------------------------------------------------------

--   g_date_set_time_t ()

--  void        g_date_set_time_t               (GDate *date,
--                                               time_t timet);

--    Sets the value of a date from a time_t value.

--    To set the value of a date to the current day, you could write:


--   g_date_set_time_t (date, time (NULL));

--    date :  a GDate
--    timet : time_t value to set

--    Since 2.10

--    ---------------------------------------------------------------------------------

--   g_date_set_time_val ()

--  void        g_date_set_time_val             (GDate *date,
--                                               GTimeVal *timeval);

--    Sets the value of a date from a GTimeVal value. Note that the tv_usec member is
--    ignored, because GDate can't make use of the additional precision.

--    date :    a GDate
--    timeval : GTimeVal value to set

--    Since 2.10

--    ---------------------------------------------------------------------------------

--   g_date_set_parse ()

--  void        g_date_set_parse                (GDate *date,
--                                               const gchar *str);

--    Parses a user-inputted string str, and try to figure out what date it represents,
--    taking the current locale into account. If the string is successfully parsed, the
--    date will be valid after the call. Otherwise, it will be invalid. You should
--    check using g_date_valid() to see whether the parsing succeeded.

--    This function is not appropriate for file formats and the like; it isn't very
--    precise, and its exact behavior varies with the locale. It's intended to be a
--    heuristic routine that guesses what the user means by a given string (and it does
--    work pretty well in that capacity).

--    date : a GDate to fill in.
--    str :  string to parse.

--    ---------------------------------------------------------------------------------

--   g_date_add_days ()

--  void        g_date_add_days                 (GDate *date,
--                                               guint n_days);

--    Increments a date some number of days. To move forward by weeks, add weeks*7
--    days. The date must be valid.

--    date :   a GDate to increment.
--    n_days : number of days to move the date forward.

--    ---------------------------------------------------------------------------------

--   g_date_subtract_days ()

--  void        g_date_subtract_days            (GDate *date,
--                                               guint n_days);

--    Moves a date some number of days into the past. To move by weeks, just move by
--    weeks*7 days. The date must be valid.

--    date :   a GDate to decrement.
--    n_days : number of days to move.

--    ---------------------------------------------------------------------------------

--   g_date_add_months ()

--  void        g_date_add_months               (GDate *date,
--                                               guint n_months);

--    Increments a date by some number of months. If the day of the month is greater
--    than 28, this routine may change the day of the month (because the destination
--    month may not have the current day in it). The date must be valid.

--    date :     a GDate to increment.
--    n_months : number of months to move forward.

--    ---------------------------------------------------------------------------------

--   g_date_subtract_months ()

--  void        g_date_subtract_months          (GDate *date,
--                                               guint n_months);

--    Moves a date some number of months into the past. If the current day of the month
--    doesn't exist in the destination month, the day of the month may change. The date
--    must be valid.

--    date :     a GDate to decrement.
--    n_months : number of months to move.

--    ---------------------------------------------------------------------------------

--   g_date_add_years ()

--  void        g_date_add_years                (GDate *date,
--                                               guint n_years);

--    Increments a date by some number of years. If the date is February 29, and the
--    destination year is not a leap year, the date will be changed to February 28. The
--    date must be valid.

--    date :    a GDate to increment.
--    n_years : number of years to move forward.

--    ---------------------------------------------------------------------------------

--   g_date_subtract_years ()

--  void        g_date_subtract_years           (GDate *date,
--                                               guint n_years);

--    Moves a date some number of years into the past. If the current day doesn't exist
--    in the destination year (i.e. it's February 29 and you move to a non-leap-year)
--    then the day is changed to February 29. The date must be valid.

--    date :    a GDate to decrement.
--    n_years : number of years to move.

--    ---------------------------------------------------------------------------------

--   g_date_days_between ()

--  gint        g_date_days_between             (const GDate *date1,
--                                               const GDate *date2);

--    Computes the number of days between two dates. If date2 is prior to date1, the
--    returned value is negative. Both dates must be valid.

--    date1 :   the first date.
--    date2 :   the second date.
--    Returns : the number of days between date1 and date2.

--    ---------------------------------------------------------------------------------

--   g_date_compare ()

--  gint        g_date_compare                  (const GDate *lhs,
--                                               const GDate *rhs);

--    qsort()-style comparsion function for dates. Both dates must be valid.

--    lhs :     first date to compare.
--    rhs :     second date to compare.
--    Returns : 0 for equal, less than zero if lhs is less than rhs, greater than zero
--              if lhs is greater than rhs.

--    ---------------------------------------------------------------------------------

--   g_date_clamp ()

--  void        g_date_clamp                    (GDate *date,
--                                               const GDate *min_date,
--                                               const GDate *max_date);

--    If date is prior to min_date, sets date equal to min_date. If date falls after
--    max_date, sets date equal to max_date. Either min_date and max_date may be NULL.
--    All non-NULL dates must be valid.

--    date :     a GDate to clamp.
--    min_date : minimum accepted value for date.
--    max_date : maximum accepted value for date.

--    ---------------------------------------------------------------------------------

--   g_date_order ()

--  void        g_date_order                    (GDate *date1,
--                                               GDate *date2);

--    Checks if date1 is less than or equal to date2, and swap the values if this is
--    not the case.

--    date1 : the first date.
--    date2 : the second date.

--    ---------------------------------------------------------------------------------

--   g_date_get_day ()

--  GDateDay    g_date_get_day                  (const GDate *date);

--    Returns the day of the month. The date must be valid.

--    date :    a GDate to extract the day of the month from.
--    Returns : day of the month.

--    ---------------------------------------------------------------------------------

--   g_date_get_month ()

--  GDateMonth  g_date_get_month                (const GDate *date);

--    Returns the month of the year. The date must be valid.

--    date :    a GDate to get the month from.
--    Returns : month of the year as a GDateMonth.

--    ---------------------------------------------------------------------------------

--   g_date_get_year ()

--  GDateYear   g_date_get_year                 (const GDate *date);

--    Returns the year of a GDate. The date must be valid.

--    date :    a GDate.
--    Returns : year in which the date falls.

--    ---------------------------------------------------------------------------------

--   g_date_get_julian ()

--  guint32     g_date_get_julian               (const GDate *date);

--    Returns the Julian day or "serial number" of the GDate. The Julian day is simply
--    the number of days since January 1, Year 1; i.e., January 1, Year 1 is Julian day
--    1; January 2, Year 1 is Julian day 2, etc. The date must be valid.

--    date :    a GDate to extract the Julian day from.
--    Returns : Julian day.

--    ---------------------------------------------------------------------------------

--   g_date_get_weekday ()

--  GDateWeekday g_date_get_weekday             (const GDate *date);

--    Returns the day of the week for a GDate. The date must be valid.

--    date :    a GDate.
--    Returns : day of the week as a GDateWeekday.

--    ---------------------------------------------------------------------------------

--   g_date_get_day_of_year ()

--  guint       g_date_get_day_of_year          (const GDate *date);

--    Returns the day of the year, where Jan 1 is the first day of the year. The date
--    must be valid.

--    date :    a GDate to extract day of year from.
--    Returns : day of the year.

--    ---------------------------------------------------------------------------------

--   g_date_get_days_in_month ()

--  guint8      g_date_get_days_in_month        (GDateMonth month,
--                                               GDateYear year);

--    Returns the number of days in a month, taking leap years into account.

--    month :   month.
--    year :    year.
--    Returns : number of days in month during the year.

--    ---------------------------------------------------------------------------------

--   g_date_is_first_of_month ()

--  gboolean    g_date_is_first_of_month        (const GDate *date);

--    Returns TRUE if the date is on the first of a month. The date must be valid.

--    date :    a GDate to check.
--    Returns : TRUE if the date is the first of the month.

--    ---------------------------------------------------------------------------------

--   g_date_is_last_of_month ()

--  gboolean    g_date_is_last_of_month         (const GDate *date);

--    Returns TRUE if the date is the last day of the month. The date must be valid.

--    date :    a GDate to check.
--    Returns : TRUE if the date is the last day of the month.

--    ---------------------------------------------------------------------------------

--   g_date_is_leap_year ()

--  gboolean    g_date_is_leap_year             (GDateYear year);

--    Returns TRUE if the year is a leap year.

--    year :    year to check.
--    Returns : TRUE if the year is a leap year.

--    ---------------------------------------------------------------------------------

--   g_date_get_monday_week_of_year ()

--  guint       g_date_get_monday_week_of_year  (const GDate *date);

--    Returns the week of the year, where weeks are understood to start on Monday. If
--    the date is before the first Monday of the year, return 0. The date must be
--    valid.

--    date :    a GDate.
--    Returns : week of the year.

--    ---------------------------------------------------------------------------------

--   g_date_get_monday_weeks_in_year ()

--  guint8      g_date_get_monday_weeks_in_year (GDateYear year);

--    Returns the number of weeks in the year, where weeks are taken to start on
--    Monday. Will be 52 or 53. The date must be valid. (Years always have 52 7-day
--    periods, plus 1 or 2 extra days depending on whether it's a leap year. This
--    function is basically telling you how many Mondays are in the year, i.e. there
--    are 53 Mondays if one of the extra days happens to be a Monday.)

--    year :    a year.
--    Returns : number of Mondays in the year.

--    ---------------------------------------------------------------------------------

--   g_date_get_sunday_week_of_year ()

--  guint       g_date_get_sunday_week_of_year  (const GDate *date);

--    Returns the week of the year during which this date falls, if weeks are
--    understood to being on Sunday. The date must be valid. Can return 0 if the day is
--    before the first Sunday of the year.

--    date :    a GDate.
--    Returns : week number.

--    ---------------------------------------------------------------------------------

--   g_date_get_sunday_weeks_in_year ()

--  guint8      g_date_get_sunday_weeks_in_year (GDateYear year);

--    Returns the number of weeks in the year, where weeks are taken to start on
--    Sunday. Will be 52 or 53. The date must be valid. (Years always have 52 7-day
--    periods, plus 1 or 2 extra days depending on whether it's a leap year. This
--    function is basically telling you how many Sundays are in the year, i.e. there
--    are 53 Sundays if one of the extra days happens to be a Sunday.)

--    year :    year to count weeks in.
--    Returns : number of weeks.

--    ---------------------------------------------------------------------------------

--   g_date_get_iso8601_week_of_year ()

--  guint       g_date_get_iso8601_week_of_year (const GDate *date);

--    Returns the week of the year, where weeks are interpreted according to ISO 8601.

--    date :    a valid GDate
--    Returns : ISO 8601 week number of the year.

--    Since 2.6

--    ---------------------------------------------------------------------------------

--   g_date_strftime ()

--  gsize       g_date_strftime                 (gchar *s,
--                                               gsize slen,
--                                               const gchar *format,
--                                               const GDate *date);

--    Generates a printed representation of the date, in a locale-specific way. Works
--    just like the platform's C library strftime() function, but only accepts
--    date-related formats; time-related formats give undefined results. Date must be
--    valid. Unlike strftime() (which uses the locale encoding), works on a UTF-8
--    format string and stores a UTF-8 result.

--    This function does not provide any conversion specifiers in addition to those
--    implemented by the platform's C library. For example, don't expect that using
--    g_date_strftime() would make the F provided by the C99 strftime() work on Windows
--    where the C library only complies to C89.

--    s :       destination buffer.
--    slen :    buffer size.
--    format :  format string.
--    date :    valid GDate.
--    Returns : number of characters written to the buffer, or 0 the buffer was too
--              small.

--    ---------------------------------------------------------------------------------

--   g_date_to_struct_tm ()

--  void        g_date_to_struct_tm             (const GDate *date,
--                                               struct tm *tm);

--    Fills in the date-related bits of a struct tm using the date value. Initializes
--    the non-date parts with something sane but meaningless.

--    date : a GDate to set the struct tm from.
--    tm :   struct tm to fill.

--    ---------------------------------------------------------------------------------

--   g_date_valid ()

--  gboolean    g_date_valid                    (const GDate *date);

--    Returns TRUE if the GDate represents an existing day. The date must not contain
--    garbage; it should have been initialized with g_date_clear() if it wasn't
--    allocated by one of the g_date_new() variants.

--    date :    a GDate to check.
--    Returns : Whether the date is valid.

--    ---------------------------------------------------------------------------------

--   g_date_valid_day ()

--  gboolean    g_date_valid_day                (GDateDay day);

--    Returns TRUE if the day of the month is valid (a day is valid if it's between 1
--    and 31 inclusive).

--    day :     day to check.
--    Returns : TRUE if the day is valid.

--    ---------------------------------------------------------------------------------

--   g_date_valid_month ()

--  gboolean    g_date_valid_month              (GDateMonth month);

--    Returns TRUE if the month value is valid. The 12 GDateMonth enumeration values
--    are the only valid months.

--    month :   month.
--    Returns : TRUE if the month is valid.

--    ---------------------------------------------------------------------------------

--   g_date_valid_year ()

--  gboolean    g_date_valid_year               (GDateYear year);

--    Returns TRUE if the year is valid. Any year greater than 0 is valid, though there
--    is a 16-bit limit to what GDate will understand.

--    year :    year.
--    Returns : TRUE if the year is valid.

--    ---------------------------------------------------------------------------------

--   g_date_valid_dmy ()

--  gboolean    g_date_valid_dmy                (GDateDay day,
--                                               GDateMonth month,
--                                               GDateYear year);

--    Returns TRUE if the day-month-year triplet forms a valid, existing day in the
--    range of days GDate understands (Year 1 or later, no more than a few thousand
--    years in the future).

--    day :     day.
--    month :   month.
--    year :    year.
--    Returns : TRUE if the date is a valid one.

--    ---------------------------------------------------------------------------------

--   g_date_valid_julian ()

--  gboolean    g_date_valid_julian             (guint32 julian_date);

--    Returns TRUE if the Julian day is valid. Anything greater than zero is basically
--    a valid Julian, though there is a 32-bit limit.

--    julian_date : Julian day to check.
--    Returns :     TRUE if the Julian day is valid.

--    ---------------------------------------------------------------------------------

--   g_date_valid_weekday ()

--  gboolean    g_date_valid_weekday            (GDateWeekday weekday);

--    Returns TRUE if the weekday is valid. The 7 GDateWeekday enumeration values are
--    the only valid weekdays.

--    weekday : weekday.
--    Returns : TRUE if the weekday is valid.

end --  class GLIB_DATE_AND_TIME_FUNCTIONS
