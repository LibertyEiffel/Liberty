-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GDATETIME_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_date_time_add (a_datetime: POINTER; a_timespan: like long): POINTER 
               -- g_date_time_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add"
               }"
               end

	g_date_time_add_days (a_datetime: POINTER; a_days: INTEGER): POINTER 
               -- g_date_time_add_days
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_days"
               }"
               end

	g_date_time_add_full (a_datetime: POINTER; a_years: INTEGER; a_months: INTEGER; a_days: INTEGER; a_hours: INTEGER; a_minutes: INTEGER; a_seconds: REAL): POINTER 
               -- g_date_time_add_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_full"
               }"
               end

	g_date_time_add_hours (a_datetime: POINTER; a_hours: INTEGER): POINTER 
               -- g_date_time_add_hours
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_hours"
               }"
               end

	g_date_time_add_minutes (a_datetime: POINTER; a_minutes: INTEGER): POINTER 
               -- g_date_time_add_minutes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_minutes"
               }"
               end

	g_date_time_add_months (a_datetime: POINTER; a_months: INTEGER): POINTER 
               -- g_date_time_add_months
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_months"
               }"
               end

	g_date_time_add_seconds (a_datetime: POINTER; a_seconds: REAL): POINTER 
               -- g_date_time_add_seconds
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_seconds"
               }"
               end

	g_date_time_add_weeks (a_datetime: POINTER; a_weeks: INTEGER): POINTER 
               -- g_date_time_add_weeks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_weeks"
               }"
               end

	g_date_time_add_years (a_datetime: POINTER; a_years: INTEGER): POINTER 
               -- g_date_time_add_years
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_add_years"
               }"
               end

	g_date_time_compare (a_dt1: POINTER; a_dt2: POINTER): INTEGER 
               -- g_date_time_compare
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_compare"
               }"
               end

	g_date_time_difference (an_end_external: POINTER; a_begin: POINTER): like long 
               -- g_date_time_difference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_difference"
               }"
               end

	g_date_time_equal (a_dt1: POINTER; a_dt2: POINTER): INTEGER 
               -- g_date_time_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_equal"
               }"
               end

	g_date_time_format (a_datetime: POINTER; a_format: POINTER): POINTER 
               -- g_date_time_format
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_format"
               }"
               end

	g_date_time_get_day_of_month (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_day_of_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_day_of_month"
               }"
               end

	g_date_time_get_day_of_week (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_day_of_week
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_day_of_week"
               }"
               end

	g_date_time_get_day_of_year (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_day_of_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_day_of_year"
               }"
               end

	g_date_time_get_hour (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_hour
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_hour"
               }"
               end

	g_date_time_get_microsecond (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_microsecond
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_microsecond"
               }"
               end

	g_date_time_get_minute (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_minute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_minute"
               }"
               end

	g_date_time_get_month (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_month"
               }"
               end

	g_date_time_get_second (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_second
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_second"
               }"
               end

	g_date_time_get_seconds (a_datetime: POINTER): REAL 
               -- g_date_time_get_seconds
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_seconds"
               }"
               end

	g_date_time_get_timezone_abbreviation (a_datetime: POINTER): POINTER 
               -- g_date_time_get_timezone_abbreviation
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_timezone_abbreviation"
               }"
               end

	g_date_time_get_utc_offset (a_datetime: POINTER): like long 
               -- g_date_time_get_utc_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_utc_offset"
               }"
               end

	g_date_time_get_week_numbering_year (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_week_numbering_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_week_numbering_year"
               }"
               end

	g_date_time_get_week_of_year (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_week_of_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_week_of_year"
               }"
               end

	g_date_time_get_year (a_datetime: POINTER): INTEGER 
               -- g_date_time_get_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_year"
               }"
               end

	g_date_time_get_ymd (a_datetime: POINTER; a_year: POINTER; a_month: POINTER; a_day: POINTER) 
               -- g_date_time_get_ymd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_get_ymd"
               }"
               end

	g_date_time_hash (a_datetime: POINTER): NATURAL 
               -- g_date_time_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_hash"
               }"
               end

	g_date_time_is_daylight_savings (a_datetime: POINTER): INTEGER 
               -- g_date_time_is_daylight_savings
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_is_daylight_savings"
               }"
               end

	g_date_time_new (a_tz: POINTER; a_year: INTEGER; a_month: INTEGER; a_day: INTEGER; a_hour: INTEGER; a_minute: INTEGER; a_seconds: REAL): POINTER 
               -- g_date_time_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new"
               }"
               end

	g_date_time_new_from_timeval_local (a_tv: POINTER): POINTER 
               -- g_date_time_new_from_timeval_local
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_from_timeval_local"
               }"
               end

	g_date_time_new_from_timeval_utc (a_tv: POINTER): POINTER 
               -- g_date_time_new_from_timeval_utc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_from_timeval_utc"
               }"
               end

	g_date_time_new_from_unix_local (a_t: like long): POINTER 
               -- g_date_time_new_from_unix_local
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_from_unix_local"
               }"
               end

	g_date_time_new_from_unix_utc (a_t: like long): POINTER 
               -- g_date_time_new_from_unix_utc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_from_unix_utc"
               }"
               end

	g_date_time_new_local (a_year: INTEGER; a_month: INTEGER; a_day: INTEGER; a_hour: INTEGER; a_minute: INTEGER; a_seconds: REAL): POINTER 
               -- g_date_time_new_local
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_local"
               }"
               end

	g_date_time_new_now (a_tz: POINTER): POINTER 
               -- g_date_time_new_now
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_now"
               }"
               end

	g_date_time_new_now_local: POINTER 
               -- g_date_time_new_now_local
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_now_local"
               }"
               end

	g_date_time_new_now_utc: POINTER 
               -- g_date_time_new_now_utc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_now_utc"
               }"
               end

	g_date_time_new_utc (a_year: INTEGER; a_month: INTEGER; a_day: INTEGER; a_hour: INTEGER; a_minute: INTEGER; a_seconds: REAL): POINTER 
               -- g_date_time_new_utc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_new_utc"
               }"
               end

	g_date_time_ref (a_datetime: POINTER): POINTER 
               -- g_date_time_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_ref"
               }"
               end

	g_date_time_to_local (a_datetime: POINTER): POINTER 
               -- g_date_time_to_local
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_to_local"
               }"
               end

	g_date_time_to_timeval (a_datetime: POINTER; a_tv: POINTER): INTEGER 
               -- g_date_time_to_timeval
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_to_timeval"
               }"
               end

	g_date_time_to_timezone (a_datetime: POINTER; a_tz: POINTER): POINTER 
               -- g_date_time_to_timezone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_to_timezone"
               }"
               end

	g_date_time_to_unix (a_datetime: POINTER): like long 
               -- g_date_time_to_unix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_to_unix"
               }"
               end

	g_date_time_to_utc (a_datetime: POINTER): POINTER 
               -- g_date_time_to_utc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_to_utc"
               }"
               end

	g_date_time_unref (a_datetime: POINTER) 
               -- g_date_time_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_time_unref"
               }"
               end


end -- class GDATETIME_EXTERNALS
