-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCALENDAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_calendar_clear_marks (a_calendar: POINTER) is
 		-- gtk_calendar_clear_marks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_clear_marks"
		}"
		end

	gtk_calendar_get_date (a_calendar: POINTER; a_year: POINTER; a_month: POINTER; a_day: POINTER) is
 		-- gtk_calendar_get_date
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_date"
		}"
		end

	gtk_calendar_get_detail_height_rows (a_calendar: POINTER): INTEGER is
 		-- gtk_calendar_get_detail_height_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_detail_height_rows"
		}"
		end

	gtk_calendar_get_detail_width_chars (a_calendar: POINTER): INTEGER is
 		-- gtk_calendar_get_detail_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_detail_width_chars"
		}"
		end

	gtk_calendar_get_display_options (a_calendar: POINTER): INTEGER is
 		-- gtk_calendar_get_display_options
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_display_options"
		}"
		end

	gtk_calendar_get_type: like long_unsigned is
 		-- gtk_calendar_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_type()"
		}"
		end

	gtk_calendar_mark_day (a_calendar: POINTER; a_day: NATURAL): INTEGER is
 		-- gtk_calendar_mark_day
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_mark_day"
		}"
		end

	gtk_calendar_new: POINTER is
 		-- gtk_calendar_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_new()"
		}"
		end

	gtk_calendar_select_day (a_calendar: POINTER; a_day: NATURAL) is
 		-- gtk_calendar_select_day
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_select_day"
		}"
		end

	gtk_calendar_select_month (a_calendar: POINTER; a_month: NATURAL; a_year: NATURAL): INTEGER is
 		-- gtk_calendar_select_month
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_select_month"
		}"
		end

	gtk_calendar_set_detail_func (a_calendar: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_calendar_set_detail_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_func"
		}"
		end

	gtk_calendar_set_detail_height_rows (a_calendar: POINTER; a_rows: INTEGER) is
 		-- gtk_calendar_set_detail_height_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_height_rows"
		}"
		end

	gtk_calendar_set_detail_width_chars (a_calendar: POINTER; a_chars: INTEGER) is
 		-- gtk_calendar_set_detail_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_width_chars"
		}"
		end

	gtk_calendar_set_display_options (a_calendar: POINTER; a_flags: INTEGER) is
 		-- gtk_calendar_set_display_options
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_display_options"
		}"
		end

	gtk_calendar_unmark_day (a_calendar: POINTER; a_day: NATURAL): INTEGER is
 		-- gtk_calendar_unmark_day
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_unmark_day"
		}"
		end


end -- class GTKCALENDAR_EXTERNALS
