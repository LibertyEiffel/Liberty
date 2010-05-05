-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDATE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_date_valid (a_date: POINTER): INTEGER_32 is
 		-- g_date_valid (node at line 109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid"
		}"
		end

	g_date_valid_day (a_day: CHARACTER): INTEGER_32 is
 		-- g_date_valid_day (node at line 429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid_day"
		}"
		end

	g_date_is_first_of_month (a_date: POINTER): INTEGER_32 is
 		-- g_date_is_first_of_month (node at line 554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_is_first_of_month"
		}"
		end

	g_date_order (a_date1: POINTER; a_date2: POINTER) is
 		-- g_date_order (node at line 749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_order"
		}"
		end

	g_date_days_between (a_date1: POINTER; a_date2: POINTER): INTEGER_32 is
 		-- g_date_days_between (node at line 776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_days_between"
		}"
		end

	g_date_valid_year (a_year: NATURAL_16): INTEGER_32 is
 		-- g_date_valid_year (node at line 792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid_year"
		}"
		end

	g_date_valid_dmy (a_day: CHARACTER; a_month: INTEGER; a_year: NATURAL_16): INTEGER_32 is
 		-- g_date_valid_dmy (node at line 800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid_dmy"
		}"
		end

	g_date_get_weekday (a_date: POINTER): INTEGER is
 		-- g_date_get_weekday (node at line 820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_weekday"
		}"
		end

	g_date_get_year (a_date: POINTER): NATURAL_16 is
 		-- g_date_get_year (node at line 946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_year"
		}"
		end

	g_date_free (a_date: POINTER) is
 		-- g_date_free (node at line 1069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_free"
		}"
		end

	g_date_get_day_of_year (a_date: POINTER): NATURAL_32 is
 		-- g_date_get_day_of_year (node at line 1263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_day_of_year"
		}"
		end

	g_date_set_time_val (a_date: POINTER; a_timeval: POINTER) is
 		-- g_date_set_time_val (node at line 1295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_time_val"
		}"
		end

	g_date_set_julian (a_date: POINTER; a_julian_date: NATURAL_32) is
 		-- g_date_set_julian (node at line 1684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_julian"
		}"
		end

	g_date_set_time (a_date: POINTER; a_time: INTEGER_32) is
 		-- g_date_set_time (node at line 2057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_time"
		}"
		end

	g_date_set_time_t (a_date: POINTER; a_timet: INTEGER_32) is
 		-- g_date_set_time_t (node at line 2316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_time_t"
		}"
		end

	g_date_clamp (a_date: POINTER; a_min_date: POINTER; a_max_date: POINTER) is
 		-- g_date_clamp (node at line 2333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_clamp"
		}"
		end

	g_date_subtract_years (a_date: POINTER; a_n_years: NATURAL_32) is
 		-- g_date_subtract_years (node at line 2578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_subtract_years"
		}"
		end

	g_date_new_julian (a_julian_day: NATURAL_32): POINTER is
 		-- g_date_new_julian (node at line 2590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_new_julian"
		}"
		end

	g_date_new: POINTER is
 		-- g_date_new (node at line 2712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_new()"
		}"
		end

	g_date_add_months (a_date: POINTER; a_n_months: NATURAL_32) is
 		-- g_date_add_months (node at line 2713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_add_months"
		}"
		end

	g_date_to_struct_tm (a_date: POINTER; a_tm: POINTER) is
 		-- g_date_to_struct_tm (node at line 2802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_to_struct_tm"
		}"
		end

	g_date_valid_julian (a_julian_date: NATURAL_32): INTEGER_32 is
 		-- g_date_valid_julian (node at line 3259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid_julian"
		}"
		end

	g_date_valid_month (a_month: INTEGER): INTEGER_32 is
 		-- g_date_valid_month (node at line 3266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid_month"
		}"
		end

	g_date_get_iso8601_week_of_year (a_date: POINTER): NATURAL_32 is
 		-- g_date_get_iso8601_week_of_year (node at line 3357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_iso8601_week_of_year"
		}"
		end

	g_date_subtract_months (a_date: POINTER; a_n_months: NATURAL_32) is
 		-- g_date_subtract_months (node at line 3473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_subtract_months"
		}"
		end

	g_date_clear (a_date: POINTER; a_n_dates: NATURAL_32) is
 		-- g_date_clear (node at line 4022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_clear"
		}"
		end

	g_date_compare (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32 is
 		-- g_date_compare (node at line 4037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_compare"
		}"
		end

	g_date_subtract_days (a_date: POINTER; a_n_days: NATURAL_32) is
 		-- g_date_subtract_days (node at line 4239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_subtract_days"
		}"
		end

	g_date_set_day (a_date: POINTER; a_day: CHARACTER) is
 		-- g_date_set_day (node at line 4303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_day"
		}"
		end

	g_date_set_dmy (a_date: POINTER; a_day: CHARACTER; a_month: INTEGER; a_y: NATURAL_16) is
 		-- g_date_set_dmy (node at line 4635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_dmy"
		}"
		end

	g_date_get_sunday_weeks_in_year (a_year: NATURAL_16): CHARACTER is
 		-- g_date_get_sunday_weeks_in_year (node at line 4686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_sunday_weeks_in_year"
		}"
		end

	g_date_valid_weekday (a_weekday: INTEGER): INTEGER_32 is
 		-- g_date_valid_weekday (node at line 4811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_valid_weekday"
		}"
		end

	g_date_add_days (a_date: POINTER; a_n_days: NATURAL_32) is
 		-- g_date_add_days (node at line 4814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_add_days"
		}"
		end

	g_date_get_monday_weeks_in_year (a_year: NATURAL_16): CHARACTER is
 		-- g_date_get_monday_weeks_in_year (node at line 4886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_monday_weeks_in_year"
		}"
		end

	g_date_is_last_of_month (a_date: POINTER): INTEGER_32 is
 		-- g_date_is_last_of_month (node at line 5245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_is_last_of_month"
		}"
		end

	g_date_set_parse (a_date: POINTER; a_str: POINTER) is
 		-- g_date_set_parse (node at line 5426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_parse"
		}"
		end

	g_date_get_sunday_week_of_year (a_date: POINTER): NATURAL_32 is
 		-- g_date_get_sunday_week_of_year (node at line 5508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_sunday_week_of_year"
		}"
		end

	g_date_is_leap_year (a_year: NATURAL_16): INTEGER_32 is
 		-- g_date_is_leap_year (node at line 5622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_is_leap_year"
		}"
		end

	g_date_add_years (a_date: POINTER; a_n_years: NATURAL_32) is
 		-- g_date_add_years (node at line 5870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_add_years"
		}"
		end

	g_date_set_year (a_date: POINTER; a_year: NATURAL_16) is
 		-- g_date_set_year (node at line 6209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_year"
		}"
		end

	g_date_get_julian (a_date: POINTER): NATURAL_32 is
 		-- g_date_get_julian (node at line 6259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_julian"
		}"
		end

	g_date_get_days_in_month (a_month: INTEGER; a_year: NATURAL_16): CHARACTER is
 		-- g_date_get_days_in_month (node at line 6327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_days_in_month"
		}"
		end

	g_date_set_month (a_date: POINTER; a_month: INTEGER) is
 		-- g_date_set_month (node at line 6431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_set_month"
		}"
		end

	g_date_strftime (a_s: POINTER; a_slen: NATURAL_32; a_format: POINTER; a_date: POINTER): NATURAL_32 is
 		-- g_date_strftime (node at line 6562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_strftime"
		}"
		end

	g_date_get_day (a_date: POINTER): CHARACTER is
 		-- g_date_get_day (node at line 6677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_day"
		}"
		end

	g_date_get_monday_week_of_year (a_date: POINTER): NATURAL_32 is
 		-- g_date_get_monday_week_of_year (node at line 6832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_monday_week_of_year"
		}"
		end

	g_date_get_month (a_date: POINTER): INTEGER is
 		-- g_date_get_month (node at line 6913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_month"
		}"
		end

	g_date_new_dmy (a_day: CHARACTER; a_month: INTEGER; a_year: NATURAL_16): POINTER is
 		-- g_date_new_dmy (node at line 6947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_new_dmy"
		}"
		end


end -- class GDATE_EXTERNALS
