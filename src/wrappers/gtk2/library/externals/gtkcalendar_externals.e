-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCALENDAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_calendar_unmark_day (a_calendar: POINTER; a_day: NATURAL_32): INTEGER_32 is
 		-- gtk_calendar_unmark_day (node at line 128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_unmark_day"
		}"
		end

	gtk_calendar_new: POINTER is
 		-- gtk_calendar_new (node at line 4512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_new()"
		}"
		end

	gtk_calendar_get_detail_height_rows (a_calendar: POINTER): INTEGER_32 is
 		-- gtk_calendar_get_detail_height_rows (node at line 6192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_detail_height_rows"
		}"
		end

	gtk_calendar_set_detail_height_rows (a_calendar: POINTER; a_rows: INTEGER_32) is
 		-- gtk_calendar_set_detail_height_rows (node at line 8911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_height_rows"
		}"
		end

	gtk_calendar_clear_marks (a_calendar: POINTER) is
 		-- gtk_calendar_clear_marks (node at line 15907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_clear_marks"
		}"
		end

	gtk_calendar_get_display_options (a_calendar: POINTER): INTEGER is
 		-- gtk_calendar_get_display_options (node at line 21961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_display_options"
		}"
		end

	gtk_calendar_mark_day (a_calendar: POINTER; a_day: NATURAL_32): INTEGER_32 is
 		-- gtk_calendar_mark_day (node at line 25100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_mark_day"
		}"
		end

	gtk_calendar_select_month (a_calendar: POINTER; a_month: NATURAL_32; a_year: NATURAL_32): INTEGER_32 is
 		-- gtk_calendar_select_month (node at line 25952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_select_month"
		}"
		end

	gtk_calendar_set_detail_func (a_calendar: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_calendar_set_detail_func (node at line 26262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_func"
		}"
		end

	gtk_calendar_get_date (a_calendar: POINTER; a_year: POINTER; a_month: POINTER; a_day: POINTER) is
 		-- gtk_calendar_get_date (node at line 32677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_date"
		}"
		end

	gtk_calendar_get_type: NATURAL_64 is
 		-- gtk_calendar_get_type (node at line 35389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_type()"
		}"
		end

	gtk_calendar_set_detail_width_chars (a_calendar: POINTER; a_chars: INTEGER_32) is
 		-- gtk_calendar_set_detail_width_chars (node at line 35705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_width_chars"
		}"
		end

	gtk_calendar_select_day (a_calendar: POINTER; a_day: NATURAL_32) is
 		-- gtk_calendar_select_day (node at line 37929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_select_day"
		}"
		end

	gtk_calendar_set_display_options (a_calendar: POINTER; a_flags: INTEGER) is
 		-- gtk_calendar_set_display_options (node at line 39121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_display_options"
		}"
		end

	gtk_calendar_get_detail_width_chars (a_calendar: POINTER): INTEGER_32 is
 		-- gtk_calendar_get_detail_width_chars (node at line 41143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_detail_width_chars"
		}"
		end


end -- class GTKCALENDAR_EXTERNALS
