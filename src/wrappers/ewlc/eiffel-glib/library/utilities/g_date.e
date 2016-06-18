note
	description: " Date  - calendrical calculations."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	wrapping_details: "When a call can leave the GDate into an incosistent state (`invalid date') no preconditions (requires) have been written"

			-- Todo: Implement G_DATES that holds all the constants
			-- (weekdays, month names etc)

							 
class G_DATE
	-- The GDate data structure represents a day between January 1,
	-- Year 1, and sometime a few thousand years in the future (right
	-- now it will go to the year 65535 or so, but g_date_set_parse()
	-- only parses up to the year 8000 or so - just count on "a few
	-- thousand"). GDate is meant to represent everyday dates, not
	-- astronomical dates or historical dates or ISO timestamps or the
	-- like. It extrapolates the current Gregorian calendar forward and
	-- backward in time; there is no attempt to change the calendar to
	-- match time periods or locations. GDate does not store time
	-- information; it represents a day.

	-- The GDate implementation has several nice features; it is only a
	-- 64-bit struct, so storing large numbers of dates is very
	-- efficient. It can keep both a Julian and day-month-year
	-- representation of the date, since some calculations are much
	-- easier with one representation or the other.  A Julian
	-- representation is simply a count of days since some fixed day in
	-- the past; for GDate the fixed day is January 1, 1 AD. ("Julian"
	-- dates in the GDate API aren't really Julian dates in the
	-- technical sense; technically, Julian dates count from the start
	-- of the Julian period, Jan 1, 4713 BC).

	-- GDate is simple to use. First you need a "blank" date; you can
	-- get a dynamically allocated date from g_date_new(), or you can
	-- declare an automatic variable or array and initialize it to a
	-- sane state by calling g_date_clear(). A cleared date is sane;
	-- it's safe to call g_date_set_dmy() and the other mutator
	-- functions to initialize the value of a cleared date. However, a
	-- cleared date is initially invalid, meaning that it doesn't
	-- represent a day that exists. It is undefined to call any of the
	-- date calculation routines on an invalid date. If you obtain a
	-- date from a user or other unpredictable source, you should check
	-- its validity with the g_date_valid() predicate. g_date_valid()
	-- is also used to check for errors with g_date_set_parse() and
	-- other functions that can fail. Dates can be invalidated by
	-- calling g_date_clear() again.

	-- It is very important to use the API to access the GDate
	-- struct. Often only the day-month-year or only the Julian
	-- representation is valid.  Sometimes neither is valid. Use the
	-- API.

	-- GLib doesn't contain any time-manipulation functions; however,
	-- there is a GTime typedef and a GTimeVal struct which represents
	-- a more precise time (with microseconds). You can request the
	-- current time as a GTimeVal with g_get_current_time().
	
inherit
	COMPARABLE_C_STRUCT
      undefine
         from_external_pointer
      redefine
         compare, free
      end
	GLOBALLY_CACHED
      redefine
         free
      end
	
create {ANY} make_dmy, from_tuple, make
   
create {WRAPPER} from_external_pointer
   
feature {} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GDate)"
		end

feature {} -- Creation
	make
			-- Create a GDate and initializes it to a sane state. The new
			-- date will be cleared (`clear') but invalid (it won't
			-- represent an existing day).
		do
			from_external_pointer(g_date_new)
		end

	make_dmy (a_day: INTEGER_8; a_month: INTEGER; an_year: INTEGER_16)
			-- Create and initialize a new GDate; it sets the value of
			-- the date. Assuming the day-month-year triplet you pass in
			-- represents an existing day, the returned date will be
			-- valid.
		do
			from_external_pointer(g_date_new_dmy (a_day, a_month, an_year))
		end

	from_tuple (a_tuple: TUPLE[INTEGER_8,INTEGER_8,INTEGER_16])
			-- Create and initialize a new GDate, assuming the
			-- day-month-year triplet you pass in represents an existing
			-- day, the returned date will be valid.
		do
			from_external_pointer(g_date_new_dmy (a_tuple.item_1, a_tuple.item_2, a_tuple.item_3))
		end

	make_julian (a_julian_day: INTEGER_32)
			-- Create, initialize and sets the value of a new
			-- GDate. Assuming the Julian day number you pass in is valid
			-- (greater than 0, less than an unreasonably large number),
			-- the returned date will be valid.
		
			-- `a_julian_day': days since January 1, Year 1.
		do
			from_external_pointer(g_date_new_julian (a_julian_day))
		end

feature {ANY}
	clear
			-- Initializes Current to a sane but invalid state. The
			-- cleared dates will not represent an existing date, but
			-- will not contain garbage.
		do
			g_date_clear (handle,1)
		end

feature {ANY} -- Setters 
	set_day (a_day: INTEGER_8)
			-- Sets the day of the month for a GDate. If the resulting
			-- day-month-year triplet is invalid, the date will be
			-- invalid.
		do
			g_date_set_day (handle, a_day)
		end

	set_month (a_month: INTEGER)
			-- Sets the month of the year for a GDate. If the resulting
			-- day-month-year triplet is invalid, the date will be
			-- invalid.
		do
			g_date_set_month (handle, a_month)
		end

	set_year (an_year: INTEGER_16)
			-- Sets the year for a GDate. If the resulting day-month-year
			-- triplet is invalid, the date will be invalid.
		do
			g_date_set_year (handle, an_year)
		end

	set_dmy (a_day, a_month, an_year: INTEGER)
			-- Sets the value of a GDate from a day, month, and year. The
			-- day-month-year triplet must be valid; if you aren't sure
			-- it is, call `is_valid_dmy' to check before you set it.
		
		do
			g_date_set_dmy (handle, a_day.to_integer_8, a_month, an_year.to_integer_16)
		end

	set_julian (a_julian_date: INTEGER_32)
			-- Sets the value of a GDate from a Julian day number.
		
			-- `a_julian_date' : Julian day number (days since January 1,
			-- Year 1).
		require positive_date: a_julian_date > 0
		do
			g_date_set_julian (handle, a_julian_date)
		end

	-- TODO: wrap void g_date_set_time (GDate *date,
	-- GTime time_);
	
	-- Sets the value of a date from a GTime (time_t) value. To set the value
	-- of a date to the current day, you could write:
	
	-- g_date_set_time (date, time (NULL));
	
	-- date : a GDate. 
	-- time_ : GTime value to set. 

	-- -------------------------------------------------------------------

	parse (a_string: STRING)
			-- Parses user-inputted `a_string', and try to figure out
			-- what date it represents, taking the current locale into
			-- account. If the string is successfully parsed, the date
			-- will be valid after the call. Otherwise, it will be
			-- invalid. You should check using `is_valid' to see whether
			-- the parsing succeeded.

			-- This function is not appropriate for file formats and the
			-- like; it isn't very precise, and its exact behavior varies
			-- with the locale. It's intended to be a heuristic routine
			-- that guesses what the user means by a given string (and it
			-- does work pretty well in that capacity).
		require valid_string: a_string /= Void
		do
			g_date_set_parse (handle, a_string.to_external)
		end

feature {ANY} -- Getters
	day: INTEGER
			-- the day of the month. The date must be valid.
		require valid: is_valid
		do
			Result := g_date_get_day (handle)
		end

	month: INTEGER
			-- the month of the year. The date must be valid.
		require valid: is_valid
		do
			Result := g_date_get_month (handle)
		end

	year: INTEGER
			-- the year of Current. The date must be valid.
		require valid: is_valid
		do
			Result := g_date_get_year (handle)
		end

	julian: INTEGER_32
			-- the Julian day or "serial number" of the GDate. The Julian
			-- day is simply the number of days since January 1, Year 1;
			-- i.e., January 1, Year 1 is Julian day 1; January 2, Year 1
			-- is Julian day 2, etc. The date must be valid.
		require valid: is_valid
		do
			Result := g_date_get_julian (handle)
		end

	weekday: INTEGER
			-- the day of the week for a GDate. The date must be valid.
		require valid: is_valid
		do
			Result := g_date_get_weekday (handle)
		end

	day_of_year: INTEGER
			-- the day of the year, where Jan 1 is the first day of the
			-- year. Shall be a NATURAL
		require valid: is_valid
		do
			Result := g_date_get_day_of_year (handle)
		end

	days_in_month: INTEGER_8
			-- The days in the month of Current G_DATE. See also
			-- G_DATES.days_in_month
		require valid: is_valid
		do
			Result := g_date_get_days_in_month (month, year.to_integer_16).to_integer_8
		end

	-- TODO: put this into G_DATES g_date_get_days_in_month ()

	-- guint8 g_date_get_days_in_month (GDateMonth month,
	-- GDateYear year);
	
	-- Returns the number of days in a month, taking leap years into account.
	
	-- month : month. 
	-- year : year. 
	-- Returns : number of days in month during the year. 

-- -------------------------------------------------------------------

feature {ANY} -- Date arithmetics
	add_days (some_days: INTEGER)
			-- Increments a date some number of days. To move forward by
			-- weeks, add weeks*7 days. The date must be valid.
		
			-- some_days : number of days to move the date forward. 
		require
			positive: some_days>0 -- some_days shall be NATURAL
			valid_date: is_valid
		do
			g_date_add_days (handle, some_days)
		end

	subtract_days (some_days: INTEGER)
			-- Moves a date some number of days into the past. To move by
			-- weeks, just move by weeks*7 days. The date must be valid.
		require
			positive: some_days>0 -- some_days shall be NATURAL
			valid_date: is_valid
		do
			g_date_subtract_days (handle, some_days)
		end

	add_months (some_months: INTEGER)
			-- Increments a date by `some_months' number of months. If
			-- the day of the month is greater than 28, this routine may
			-- change the day of the month (because the destination month
			-- may not have the current day in it). The date must be
			-- valid.
		require
			valid_date: is_valid
			positive_months: some_months>0
		do
			g_date_add_months (handle, some_months)
		end

	subtract_months (some_months: INTEGER)
			-- Moves a date some number of months into the past. If the
			-- current day of the month doesn't exist in the destination
			-- month, the day of the month may change. The date must be
			-- valid.
		require
			valid_date: is_valid
			positive_months: some_months>0
		do
			g_date_subtract_months (handle, some_months)
		end

	add_years (some_years: INTEGER)
			-- Increments a date by some number of years. If the date is
			-- February 29, and the destination year is not a leap year,
			-- the date will be changed to February 28. The date must be
			-- valid.
		require
			valid_date: is_valid
			positive_years: some_years>0
		do
			g_date_add_years (handle, some_years)
		end

	subtract_years (some_years: INTEGER)
			-- Moves a date some number of years into the past. If the
			-- current day doesn't exist in the destination year
			-- (i.e. it's February 29 and you move to a non-leap-year)
			-- then the day is changed to February 29. The date must be
			-- valid.
		do
			g_date_subtract_years (handle, some_years)
		end

	days_between (another: like Current): INTEGER
			-- Computes the number of days between two dates. If date2 is
			-- prior to date1, the returned value is negative. Both dates
			-- must be valid.
		require
			valid_date: is_valid
			valid_another_date: another /= Void and then another.is_valid
		do
			Result :=  g_date_days_between (handle, another.handle)
		end

	is_equal (another: like Current): BOOLEAN
		do
			Result:=(compare(another)=0)
		end
	
	infix "<"(another: like Current): BOOLEAN
		do
			Result:=(compare(another)<0)
		end
	
	compare (another: like Current): INTEGER
			-- qsort()-style comparsion function for dates; i.e.: 0 for
			-- equal, less than zero if Current is less than another,
			-- greater than zero if Current is greater than another.
			-- Both dates must be valid.
		require else
			valid_date: is_valid
			valid_another_date: another /= Void and then another.is_valid
		do
			Result := g_date_compare (handle, another.handle)
		end

	clamp (a_min, a_max: like Current)
			-- If date is prior to min_date, sets date equal to min_date. If date
			-- falls after max_date, sets date equal to max_date. Either min_date and
			-- max_date may be NULL. All non-NULL dates must be valid.
		
			-- date : a GDate to clamp. 
			-- min_date : minimum accepted value for date. 
			-- max_date : maximum accepted value for date.
		require
			valid_min: a_min/=Void implies a_min.is_valid
			valid_max: a_max/=Void implies a_max.is_valid
			valid_dates: (a_min=Void implies a_max/=Void) and
							 (a_max=Void implies a_min/=Void)
		local min_ptr, max_ptr: POINTER
		do
			if a_min/=Void then min_ptr := a_min.handle end
			if a_max/=Void then max_ptr := a_max.handle end
			g_date_clamp (handle, min_ptr, max_ptr)
		end

	order (another: like Current)
			-- Checks if Current is less than or equal to `another', and swap the values if
			-- this is not the case.
		require valid_other: another /= Void
		do
			g_date_order (handle, another.handle)
		end
	
feature {ANY} -- Queries
	is_first_of_month: BOOLEAN
			-- Is the date on the first of a month?
		require valid: is_valid
		do
			Result:= g_date_is_first_of_month(handle).to_boolean
		end

	is_last_of_month: BOOLEAN
			-- Is the date the last day of the month?
		require valid: is_valid
		do
			Result := g_date_is_last_of_month (handle).to_boolean
		end
	
-- g_date_is_leap_year ()

-- gboolean g_date_is_leap_year (GDateYear year);

-- Returns TRUE if the year is a leap year.

-- year : year to check. 
-- Returns : TRUE if the year is a leap year. 

-- -------------------------------------------------------------------

-- g_date_get_monday_week_of_year ()

-- guint g_date_get_monday_week_of_year (const GDate *date);

-- Returns the week of the year, where weeks are understood to start on
-- Monday. If the date is before the first Monday of the year, return 0.
-- The date must be valid.

-- date : a GDate. 
-- Returns : week of the year. 

-- -------------------------------------------------------------------

-- g_date_get_monday_weeks_in_year ()

-- guint8 g_date_get_monday_weeks_in_year (GDateYear year);

-- Returns the number of weeks in the year, where weeks are taken to start
-- on Monday. Will be 52 or 53. The date must be valid. (Years always have
-- 52 7-day periods, plus 1 or 2 extra days depending on whether it's a
-- leap year. This function is basically telling you how many Mondays are
-- in the year, i.e. there are 53 Mondays if one of the extra days happens
-- to be a Monday.)

-- year : a year. 
-- Returns : number of Mondays in the year. 

-- -------------------------------------------------------------------

-- g_date_get_sunday_week_of_year ()

-- guint g_date_get_sunday_week_of_year (const GDate *date);

-- Returns the week of the year during which this date falls, if weeks are
-- understood to being on Sunday. The date must be valid. Can return 0 if
-- the day is before the first Sunday of the year.

-- date : a GDate. 
-- Returns : week number. 

-- -------------------------------------------------------------------

-- g_date_get_sunday_weeks_in_year ()

-- guint8 g_date_get_sunday_weeks_in_year (GDateYear year);

-- Returns the number of weeks in the year, where weeks are taken to start
-- on Sunday. Will be 52 or 53. The date must be valid. (Years always have
-- 52 7-day periods, plus 1 or 2 extra days depending on whether it's a
-- leap year. This function is basically telling you how many Sundays are
-- in the year, i.e. there are 53 Sundays if one of the extra days happens
-- to be a Sunday.)

-- year : year to count weeks in. 
-- Returns : number of weeks. 

-- -------------------------------------------------------------------

-- g_date_get_iso8601_week_of_year ()

-- guint g_date_get_iso8601_week_of_year (const GDate *date);

-- Returns the week of the year, where weeks are interpreted according to
-- ISO 8601.

-- date : a valid GDate 
-- Returns : ISO 8601 week number of the year. 

-- Since 2.6

-- -------------------------------------------------------------------

	to_string: STRING
		require is_valid
		local written_characters: INTEGER -- TODO: shall be NATURAL
		do
			create Result.make_filled(' ',11)
			written_characters:= (g_date_strftime
										 (Result.to_external, Result.count,
										  to_string_format.to_external, handle))
			check buffer_big_enought: written_characters/=0 end
			-- debug print("G_DATE.to_string after trimming is ")
			-- print(Result.count.out) print(" characters long%N") end
		end
	
	-- g_date_strftime ()
	
	-- gsize g_date_strftime (gchar *s,
	-- gsize slen,
	-- const gchar *format,
	-- const GDate *date);

	-- Generates a printed representation of the date, in a locale-specific
	-- way. Works just like the standard C strftime() function, but only
	-- accepts date-related formats; time-related formats give undefined
	-- results. Date must be valid.

	-- s : destination buffer. 
	-- slen : buffer size. 
	-- format : format string. 
	-- date : valid GDate. 
	-- Returns : number of characters written to the buffer, or 0 the buffer 
	-- was too small. 

	-- -------------------------------------------------------------------

	-- g_date_to_struct_tm ()

	-- void g_date_to_struct_tm (const GDate *date,
	-- struct tm *tm);

	-- Fills in the date-related bits of a struct tm using the date value.
	-- Initializes the non-date parts with something sane but meaningless.

	-- date : a GDate to set the struct tm from. 
	-- tm : struct tm to fill. 

	-- -------------------------------------------------------------------

	is_valid: BOOLEAN
			-- Does the GDate represents an existing day?

			-- Note: For Eiffel user those should always be true "The date must not
			-- contain garbage; it should have been initialized with `clear' if
			-- it wasn't allocated by one of the `make' variants."

			-- TODO: check the above note using an invariant.
		do
			Result := g_date_valid (handle).to_boolean
		end
	

	-- -------------------------------------------------------------------

	-- g_date_valid_day ()

	-- gboolean g_date_valid_day (GDateDay day);

	-- Returns TRUE if the day of the month is valid (a day is valid if it's
	-- between 1 and 31 inclusive).

	-- day : day to check. 
	-- Returns : TRUE if the day is valid. 

	-- -------------------------------------------------------------------

	-- g_date_valid_month ()

	-- gboolean g_date_valid_month (GDateMonth month);

	-- Returns TRUE if the month value is valid. The 12 GDateMonth enumeration
	-- values are the only valid months.

	-- month : month. 
	-- Returns : TRUE if the month is valid. 

	-- -------------------------------------------------------------------

	-- g_date_valid_year ()

	-- gboolean g_date_valid_year (GDateYear year);

	-- Returns TRUE if the year is valid. Any year greater than 0 is valid,
	-- though there is a 16-bit limit to what GDate will understand.

	-- year : year. 
	-- Returns : TRUE if the year is valid. 

	-- -------------------------------------------------------------------

	-- g_date_valid_dmy ()

	-- gboolean g_date_valid_dmy (GDateDay day,
	-- GDateMonth month,
	-- GDateYear year);

	-- Returns TRUE if the day-month-year triplet forms a valid, existing day
	-- in the range of days GDate understands (Year 1 or later, no more than a
	-- few thousand years in the future).

	-- day : day. 
	-- month : month. 
	-- year : year. 
	-- Returns : TRUE if the date is a valid one. 

	-- -------------------------------------------------------------------

	-- g_date_valid_julian ()

	-- gboolean g_date_valid_julian (guint32 julian_date);

	-- Returns TRUE if the Julian day is valid. Anything greater than zero is
	-- basically a valid Julian, though there is a 32-bit limit.

	-- julian_date : Julian day to check. 
	-- Returns : TRUE if the Julian day is valid. 

	-- -------------------------------------------------------------------

	-- g_date_valid_weekday ()

	-- gboolean g_date_valid_weekday (GDateWeekday weekday);

	-- Returns TRUE if the weekday is valid. The 7 GDateWeekday enumeration
	-- values are the only valid weekdays.

	-- weekday : weekday. 
	-- Returns : TRUE if the weekday is valid. 

feature {} -- External features
	-- #define G_DATE_BAD_DAY
	-- #define G_DATE_BAD_JULIAN
	-- #define G_DATE_BAD_YEAR
	
	g_date_new : POINTER is -- GDate 
		external "C use <glib.h>"
		end
	
	g_date_new_dmy (a_day: INTEGER_8; a_month: INTEGER; an_year: INTEGER_16): POINTER is -- GDate*
			-- Note: `a_day' and `a_month' shall be NATURAL_8, `an_year' NATURAL_16
		external "C use <glib.h>"
		end
	
	g_date_new_julian (a_julian_day: INTEGER_32): POINTER is -- GDate
			-- Note: `a_julian_day' shall be a NATURAL_32
		external "C use <glib.h>"
		end
	
	g_date_clear (a_date: POINTER; n_dates: INTEGER_32)
			-- Note `n_dates' shall be a NATURAL_32
		external "C use <glib.h>"
		end
	
	free (a_date: POINTER)
		external "C use <glib.h>"
		alias "g_date_free"
		end

	g_date_set_day (a_date: POINTER; a_day: INTEGER_8)
		external "C use <glib.h>"
		end
	
	g_date_set_month (a_date: POINTER; a_month: INTEGER)
		external "C use <glib.h>"
		end
	
	g_date_set_year (a_date: POINTER; an_year: INTEGER_16)
		external "C use <glib.h>"
		end
	
	g_date_set_dmy (a_date: POINTER; a_day: INTEGER_8; a_month: INTEGER; an_year: INTEGER_16)
		external "C use <glib.h>"
		end
	
	g_date_set_julian (a_date: POINTER; a_julian_date: INTEGER_32)
			-- Note: a_julian_date shall be NATURAL
		external "C use <glib.h>"
		end
	
	g_date_set_time (a_date: POINTER; a_time: INTEGER_32)
		external "C use <glib.h>"
		end
	
	g_date_set_parse (a_date: POINTER; a_str: POINTER)
		external "C use <glib.h>"
		end

	g_date_add_days (a_date: POINTER; n_days: INTEGER)
			-- Note: `n_days' shall be NATURAL
		external "C use <glib.h>"
		end
	
	g_date_subtract_days (a_date: POINTER; n_days: INTEGER)
			-- Note: n_days shall be NATURAL
		external "C use <glib.h>"
		end
	g_date_add_months (a_date: POINTER; n_months: INTEGER)
			-- Note `n_months' shall be NATURAL
		external "C use <glib.h>"
		end
	g_date_subtract_months (a_date: POINTER; n_months: INTEGER)
			-- Note `n_months' shall be NATURAL			
		external "C use <glib.h>"
		end
	
	g_date_add_years (a_date: POINTER; n_years: INTEGER)
			-- Note `n_years' shall be NATURAL
		external "C use <glib.h>"
		end
	g_date_subtract_years (a_date: POINTER; n_years: INTEGER)
			-- Note `n_years' shall be NATURAL
		external "C use <glib.h>"
		end
	
	g_date_days_between (a_date, another_date: POINTER): INTEGER is -- gint 
		external "C use <glib.h>"
		end
	
	g_date_compare (left, right: POINTER): INTEGER is -- gint 
		external "C use <glib.h>"
		end
	
	g_date_clamp (a_date, a_min_date, a_max_date: POINTER)
		external "C use <glib.h>"
		end
	
	g_date_order (a_date, another_date: POINTER)
		external "C use <glib.h>"
		end

	g_date_get_day (a_date: POINTER): INTEGER is -- GDateDay 
		external "C use <glib.h>"
		ensure is_valid_gdate_day (Result)
		end

	g_date_get_month (a_date: POINTER): INTEGER is -- GDateMonth 
		external "C use <glib.h>"
		ensure is_valid_gdate_month (Result)
		end
	
	g_date_get_year (a_date: POINTER): INTEGER is -- GDateYear
			-- Result shall be NATURAL
		external "C use <glib.h>"
		end

	g_date_get_julian (a_date: POINTER): INTEGER_32 is -- guint32
			-- Result shall be NATURAL_32
		external "C use <glib.h>"
		ensure positive: Result > 0
		end
	
	g_date_get_weekday (a_date: POINTER): INTEGER is -- GDateWeekday 
		external "C use <glib.h>"
		ensure is_valid_gdate_weekday (Result)
		end
	
	g_date_get_day_of_year (a_date: POINTER): INTEGER is -- guint
			-- Note Result shall be NATURAL
		external "C use <glib.h>"
		ensure positive: Result > 0
		end

	g_date_get_days_in_month (a_month: INTEGER; an_year: INTEGER_16): INTEGER
			-- Result shall be a NATURAL_8 (guint8)
		external "C use <glib.h>"
		-- ensure fits_natural_8: Result.in_range (0,255)
		end
	
	g_date_is_first_of_month (a_date: POINTER): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	
	g_date_is_last_of_month (a_date: POINTER): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	g_date_is_leap_year (an_year: INTEGER_16): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end

	g_date_get_monday_week_of_year (a_date: POINTER): INTEGER is -- guint
		external "C use <glib.h>"
		ensure natural: Result >= 0
		end
	
	g_date_get_monday_weeks_in_year (an_year: INTEGER_16): INTEGER_8
		external "C use <glib.h>"
		-- TODO: ensure natural_8: Result.in_range (0,255)
		end
	
	g_date_get_sunday_week_of_year (a_date: POINTER): INTEGER is -- guint 
		external "C use <glib.h>"
		ensure natural: Result >= 0
		end
	
	g_date_get_sunday_weeks_in_year (an_year: INTEGER_16): INTEGER_8
			-- Result shall be NATURAL_8
		external "C use <glib.h>"
		-- TODO: ensure natural_8: 
		end
	
	g_date_get_iso8601_week_of_year (a_date: POINTER): INTEGER is -- guint
			-- Result shall be NATURAL
		external "C use <glib.h>"
		end

	g_date_strftime (string: POINTER; len: INTEGER; format, a_date: POINTER): INTEGER is -- gsize
			-- Note: len and Result are actually gsize
		external "C use <glib.h>"
		end
	
	g_date_to_struct_tm (a_date, a_tm_struct: POINTER)
		external "C use <glib.h>"
		end
	
	g_date_valid (a_date: POINTER): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	
	g_date_valid_day (a_day: INTEGER_8): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	
	g_date_valid_month (a_month: INTEGER): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	
	g_date_valid_year (an_year: INTEGER_16): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	
	g_date_valid_dmy (a_day: INTEGER_8; a_month: INTEGER; an_year: INTEGER_16): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	
	g_date_valid_julian (a_julian_date: INTEGER_32): INTEGER is -- gboolean
			-- Note: a_julian_date shall be NATURAL_32
		external "C use <glib.h>"
		end
	
	g_date_valid_weekday (a_weekday: INTEGER): INTEGER is -- gboolean 
		external "C use <glib.h>"
		end
	

	g_usec_per_sec: INTEGER
			-- Number of microseconds in one second (1 million). This
			-- macro is provided for code readability.
		external "C macro use <glib.h>"
		alias "G_USEC_PER_SEC"
		end	

feature {} --  enum GDateDMY
	-- This enumeration isn't used in the API, but may be useful if you
	-- need to mark a number as a day, month, or year.
	
	g_date_day: INTEGER
			-- a day 
		external "C macro use <glib.h>"
		alias "G_DATE_DAY"
		end
	
	g_date_month: INTEGER
			-- a month 
		external "C macro use <glib.h>"
		alias "G_DATE_MONTH"
		end
	
	g_date_year: INTEGER
			-- a year 
		external "C macro use <glib.h>"
		alias "G_DATE_YEAR"
		end

feature {ANY} -- GDateDay a guint8
	-- Integer representing a day of the month; between 1 and 31.
	is_valid_gdate_day (a_day: INTEGER): BOOLEAN
		do
			Result:=a_day.in_range(1,31)
		end
	
	g_date_bad_day: INTEGER
			-- represents an invalid day of the month.
		external "C macro use <glib.h>"
		alias "G_DATE_BAD_DAY"
		end

feature {} --  enum GDateMonth
	is_valid_gdate_month(a_month: INTEGER): BOOLEAN
		do
			-- Note: oh, I know it is quite a stupid implementation, but 
			-- who assure us that these values are contiguous?
			Result:=((a_month=g_date_january) or else
						(a_month=g_date_february) or else
						(a_month=g_date_march) or else
						(a_month=g_date_april) or else
						(a_month=g_date_may) or else
						(a_month=g_date_june) or else
						(a_month=g_date_july) or else
						(a_month=g_date_august) or else
						(a_month=g_date_september) or else
						(a_month=g_date_october) or else
						(a_month=g_date_november) or else
						(a_month=g_date_december))
		end

	g_date_bad_month: INTEGER
			-- invalid value. 
		external "C macro use <glib.h>"
		alias "G_DATE_BAD_MONTH"
		end
	
	g_date_january: INTEGER
			-- January. 
		external "C macro use <glib.h>"
		alias "G_DATE_JANUARY"
		end

	g_date_february: INTEGER
			-- February. 
		external "C macro use <glib.h>"
		alias "G_DATE_FEBRUARY"
		end

	g_date_march: INTEGER
			-- March. 
		external "C macro use <glib.h>"
		alias "G_DATE_MARCH"
		end

	g_date_april: INTEGER
			-- April. 
		external "C macro use <glib.h>"
		alias "G_DATE_APRIL"
		end

	g_date_may: INTEGER
			-- May. 
		external "C macro use <glib.h>"
		alias "G_DATE_MAY"
		end

	g_date_june: INTEGER
			-- June. 
		external "C macro use <glib.h>"
		alias "G_DATE_JUNE"
		end

	g_date_july: INTEGER
			-- July. 
		external "C macro use <glib.h>"
		alias "G_DATE_JULY"
		end

	g_date_august: INTEGER
			-- August. 
		external "C macro use <glib.h>"
		alias "G_DATE_AUGUST"
		end

	g_date_september: INTEGER
			-- September. 
		external "C macro use <glib.h>"
		alias "G_DATE_SEPTEMBER"
		end

	g_date_october: INTEGER
			-- October. 
		external "C macro use <glib.h>"
		alias "G_DATE_OCTOBER"
		end

	g_date_november: INTEGER
			-- November. 
		external "C macro use <glib.h>"
		alias "G_DATE_NOVEMBER"
		end

	g_date_december: INTEGER
			-- December. 
		external "C macro use <glib.h>"
		alias "G_DATE_DECEMBER"
		end


	-- typedef guint16 GDateYear: Integer representing a year;
	-- G_DATE_BAD_YEAR is the invalid value. The year must be 1 or
	-- higher; negative (BC) years are not allowed. The year is
	-- represented with four digits.
	
feature {} --  enum GDateWeekday;
	is_valid_gdate_weekday (a_weekday: INTEGER): BOOLEAN
		do
			-- Note: oh, I know it is quite a stupid implementation, but 
			-- who assure us that these values are contiguous?
			Result:=((a_weekday=g_date_monday) or else
						(a_weekday=g_date_tuesday) or else
						(a_weekday=g_date_wednesday) or else
						(a_weekday=g_date_thursday) or else
						(a_weekday=g_date_friday) or else
						(a_weekday=g_date_saturday) or else
						(a_weekday=g_date_sunday))
		end
	-- Enumeration representing a day of the week; G_DATE_MONDAY,
	-- G_DATE_TUESDAY, etc. G_DATE_BAD_WEEKDAY is an invalid weekday.

	g_date_bad_weekday: INTEGER
			-- invalid value. 
		external "C macro use <glib.h>"
		alias "G_DATE_BAD_WEEKDAY"
		end

	g_date_monday: INTEGER
			-- Monday. 
		external "C macro use <glib.h>"
		alias "G_DATE_MONDAY"
		end

	g_date_tuesday: INTEGER
			-- Tuesday. 
		external "C macro use <glib.h>"
		alias "G_DATE_TUESDAY"
		end

	g_date_wednesday: INTEGER
			-- Wednesday. 
		external "C macro use <glib.h>"
		alias "G_DATE_WEDNESDAY"
		end

	g_date_thursday: INTEGER
			-- Thursday. 
		external "C macro use <glib.h>"
		alias "G_DATE_THURSDAY"
		end

	g_date_friday: INTEGER
			-- Friday. 
		external "C macro use <glib.h>"
		alias "G_DATE_FRIDAY"
		end

	g_date_saturday: INTEGER
			-- Saturday. 
		external "C macro use <glib.h>"
		alias "G_DATE_SATURDAY"
		end

	g_date_sunday: INTEGER
			-- Sunday. 
		external "C macro use <glib.h>"
		alias "G_DATE_SUNDAY"
		end

feature {} --
	to_string_format: STRING is "%%Y-%%m-%%d"
			-- The format used in feature `to_string'; the double %% is 
			-- becuase both Eiffel and the C function use % as a special character.

feature {} -- GDate struct access
	-- typedef struct {
	--   guint julian_days : 32; /* julian days representation - we use a
	--                            *  bitfield hoping that 64 bit platforms
	--                            *  will pack this whole struct in one big
	--                            *  int
	--                            */

	--   guint julian : 1;    /* julian is valid */
	--   guint dmy    : 1;    /* dmy is valid */
	
	--   /* DMY representation */
	--   guint day    : 6;
	--   guint month  : 4;
	--   guint year   : 16;
	-- } GDate;

	-- Represents a day between January 1, Year 1 and a few thousand
	-- years in the future. None of its members should be accessed
	-- directly. If the GDate is obtained from g_date_new(), it will be
	-- safe to mutate but invalid and thus not safe for calendrical
	-- computations. If it's declared on the stack, it will contain
	-- garbage so must be initialized with
	-- g_date_clear(). g_date_clear() makes the date invalid but
	-- sane. An invalid date doesn't represent a day, it's "empty." A
	-- date becomes valid after you set it to a Julian day or you set a
	-- day, month, and year.
	
	-- guint julian_days : 32; 	the Julian representation of the date
	-- guint julian : 1; 	this bit is set if julian_days is valid
	-- guint dmy : 1; 	this is set if day, month and year are valid
	-- guint day : 6; 	the day of the day-month-year representation of the date, as a number between 1 and 31
	-- guint month : 4; 	the day of the day-month-year representation of the date, as a number between 1 and 12
	-- guint year : 16; 	the day of the day-month-year representation of the date
end
	
	
