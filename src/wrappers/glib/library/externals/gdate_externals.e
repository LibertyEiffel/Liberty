-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GDATE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_date_add_days (a_date: POINTER; a_n_days: NATURAL) 
               -- g_date_add_days
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_add_days"
               }"
               end

	g_date_add_months (a_date: POINTER; a_n_months: NATURAL) 
               -- g_date_add_months
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_add_months"
               }"
               end

	g_date_add_years (a_date: POINTER; a_n_years: NATURAL) 
               -- g_date_add_years
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_add_years"
               }"
               end

	g_date_clamp (a_date: POINTER; a_min_date: POINTER; a_max_date: POINTER) 
               -- g_date_clamp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_clamp"
               }"
               end

	g_date_clear (a_date: POINTER; a_n_dates: NATURAL) 
               -- g_date_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_clear"
               }"
               end

	g_date_compare (a_lhs: POINTER; a_rhs: POINTER): INTEGER 
               -- g_date_compare
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_compare"
               }"
               end

	g_date_days_between (a_date1: POINTER; a_date2: POINTER): INTEGER 
               -- g_date_days_between
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_days_between"
               }"
               end

	g_date_free (a_date: POINTER) 
               -- g_date_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_free"
               }"
               end

	g_date_get_day (a_date: POINTER): CHARACTER 
               -- g_date_get_day
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_day"
               }"
               end

	g_date_get_day_of_year (a_date: POINTER): NATURAL 
               -- g_date_get_day_of_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_day_of_year"
               }"
               end

	g_date_get_days_in_month (a_month: INTEGER; a_year: NATURAL_16): CHARACTER 
               -- g_date_get_days_in_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_days_in_month"
               }"
               end

	g_date_get_iso8601_week_of_year (a_date: POINTER): NATURAL 
               -- g_date_get_iso8601_week_of_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_iso8601_week_of_year"
               }"
               end

	g_date_get_julian (a_date: POINTER): NATURAL 
               -- g_date_get_julian
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_julian"
               }"
               end

	g_date_get_monday_week_of_year (a_date: POINTER): NATURAL 
               -- g_date_get_monday_week_of_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_monday_week_of_year"
               }"
               end

	g_date_get_monday_weeks_in_year (a_year: NATURAL_16): CHARACTER 
               -- g_date_get_monday_weeks_in_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_monday_weeks_in_year"
               }"
               end

	g_date_get_month (a_date: POINTER): INTEGER 
               -- g_date_get_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_month"
               }"
               end

	g_date_get_sunday_week_of_year (a_date: POINTER): NATURAL 
               -- g_date_get_sunday_week_of_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_sunday_week_of_year"
               }"
               end

	g_date_get_sunday_weeks_in_year (a_year: NATURAL_16): CHARACTER 
               -- g_date_get_sunday_weeks_in_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_sunday_weeks_in_year"
               }"
               end

	g_date_get_weekday (a_date: POINTER): INTEGER 
               -- g_date_get_weekday
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_weekday"
               }"
               end

	g_date_get_year (a_date: POINTER): NATURAL_16 
               -- g_date_get_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_get_year"
               }"
               end

	g_date_is_first_of_month (a_date: POINTER): INTEGER 
               -- g_date_is_first_of_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_is_first_of_month"
               }"
               end

	g_date_is_last_of_month (a_date: POINTER): INTEGER 
               -- g_date_is_last_of_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_is_last_of_month"
               }"
               end

	g_date_is_leap_year (a_year: NATURAL_16): INTEGER 
               -- g_date_is_leap_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_is_leap_year"
               }"
               end

	g_date_new: POINTER 
               -- g_date_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_new"
               }"
               end

	g_date_new_dmy (a_day: CHARACTER; a_month: INTEGER; a_year: NATURAL_16): POINTER 
               -- g_date_new_dmy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_new_dmy"
               }"
               end

	g_date_new_julian (a_julian_day: NATURAL): POINTER 
               -- g_date_new_julian
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_new_julian"
               }"
               end

	g_date_order (a_date1: POINTER; a_date2: POINTER) 
               -- g_date_order
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_order"
               }"
               end

	g_date_set_day (a_date: POINTER; a_day: CHARACTER) 
               -- g_date_set_day
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_day"
               }"
               end

	g_date_set_dmy (a_date: POINTER; a_day: CHARACTER; a_month: INTEGER; a_y: NATURAL_16) 
               -- g_date_set_dmy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_dmy"
               }"
               end

	g_date_set_julian (a_date: POINTER; a_julian_date: NATURAL) 
               -- g_date_set_julian
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_julian"
               }"
               end

	g_date_set_month (a_date: POINTER; a_month: INTEGER) 
               -- g_date_set_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_month"
               }"
               end

	g_date_set_parse (a_date: POINTER; a_str: POINTER) 
               -- g_date_set_parse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_parse"
               }"
               end

	g_date_set_time (a_date: POINTER; a_time: INTEGER) 
               -- g_date_set_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_time"
               }"
               end

	g_date_set_time_t (a_date: POINTER; a_timet: like long) 
               -- g_date_set_time_t
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_time_t"
               }"
               end

	g_date_set_time_val (a_date: POINTER; a_timeval: POINTER) 
               -- g_date_set_time_val
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_time_val"
               }"
               end

	g_date_set_year (a_date: POINTER; a_year: NATURAL_16) 
               -- g_date_set_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_set_year"
               }"
               end

	g_date_strftime (a_s: POINTER; a_slen: like long_unsigned; a_format: POINTER; a_date: POINTER): like long_unsigned 
               -- g_date_strftime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_strftime"
               }"
               end

	g_date_subtract_days (a_date: POINTER; a_n_days: NATURAL) 
               -- g_date_subtract_days
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_subtract_days"
               }"
               end

	g_date_subtract_months (a_date: POINTER; a_n_months: NATURAL) 
               -- g_date_subtract_months
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_subtract_months"
               }"
               end

	g_date_subtract_years (a_date: POINTER; a_n_years: NATURAL) 
               -- g_date_subtract_years
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_subtract_years"
               }"
               end

	g_date_to_struct_tm (a_date: POINTER; a_tm: POINTER) 
               -- g_date_to_struct_tm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_to_struct_tm"
               }"
               end

	g_date_valid (a_date: POINTER): INTEGER 
               -- g_date_valid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid"
               }"
               end

	g_date_valid_day (a_day: CHARACTER): INTEGER 
               -- g_date_valid_day
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid_day"
               }"
               end

	g_date_valid_dmy (a_day: CHARACTER; a_month: INTEGER; a_year: NATURAL_16): INTEGER 
               -- g_date_valid_dmy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid_dmy"
               }"
               end

	g_date_valid_julian (a_julian_date: NATURAL): INTEGER 
               -- g_date_valid_julian
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid_julian"
               }"
               end

	g_date_valid_month (a_month: INTEGER): INTEGER 
               -- g_date_valid_month
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid_month"
               }"
               end

	g_date_valid_weekday (a_weekday: INTEGER): INTEGER 
               -- g_date_valid_weekday
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid_weekday"
               }"
               end

	g_date_valid_year (a_year: NATURAL_16): INTEGER 
               -- g_date_valid_year
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_date_valid_year"
               }"
               end


end -- class GDATE_EXTERNALS
