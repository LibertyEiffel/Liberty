-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCALENDAR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_calendar_unmark_day (a_calendar: POINTER; a_day: NATURAL_32): INTEGER_32 is
 		-- gtk_calendar_unmark_day (node at line 135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_unmark_day"
		}"
		end

	gtk_calendar_freeze (a_calendar: POINTER) is
 		-- gtk_calendar_freeze (node at line 1485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_freeze"
		}"
		end

	gtk_calendar_new: POINTER is
 		-- gtk_calendar_new (node at line 4330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_new()"
		}"
		end

	gtk_calendar_get_detail_height_rows (a_calendar: POINTER): INTEGER_32 is
 		-- gtk_calendar_get_detail_height_rows (node at line 5896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_detail_height_rows"
		}"
		end

	gtk_calendar_set_detail_height_rows (a_calendar: POINTER; a_rows: INTEGER_32) is
 		-- gtk_calendar_set_detail_height_rows (node at line 8236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_height_rows"
		}"
		end

	gtk_calendar_clear_marks (a_calendar: POINTER) is
 		-- gtk_calendar_clear_marks (node at line 14703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_clear_marks"
		}"
		end

	gtk_calendar_thaw (a_calendar: POINTER) is
 		-- gtk_calendar_thaw (node at line 15233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_thaw"
		}"
		end

	gtk_calendar_display_options (a_calendar: POINTER; a_flags: INTEGER) is
 		-- gtk_calendar_display_options (node at line 18093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_display_options"
		}"
		end

	gtk_calendar_mark_day (a_calendar: POINTER; a_day: NATURAL_32): INTEGER_32 is
 		-- gtk_calendar_mark_day (node at line 18845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_mark_day"
		}"
		end

	gtk_calendar_get_display_options (a_calendar: POINTER): INTEGER is
 		-- gtk_calendar_get_display_options (node at line 20010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_display_options"
		}"
		end

	gtk_calendar_set_display_options (a_calendar: POINTER; a_flags: INTEGER) is
 		-- gtk_calendar_set_display_options (node at line 22309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_display_options"
		}"
		end

	gtk_calendar_select_month (a_calendar: POINTER; a_month: NATURAL_32; a_year: NATURAL_32): INTEGER_32 is
 		-- gtk_calendar_select_month (node at line 23587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_select_month"
		}"
		end

	gtk_calendar_set_detail_func (a_calendar: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_calendar_set_detail_func (node at line 23793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_func"
		}"
		end

	gtk_calendar_get_date (a_calendar: POINTER; a_year: POINTER; a_month: POINTER; a_day: POINTER) is
 		-- gtk_calendar_get_date (node at line 29624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_date"
		}"
		end

	gtk_calendar_get_type: NATURAL_32 is
 		-- gtk_calendar_get_type (node at line 32038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_type()"
		}"
		end

	gtk_calendar_set_detail_width_chars (a_calendar: POINTER; a_chars: INTEGER_32) is
 		-- gtk_calendar_set_detail_width_chars (node at line 32332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_set_detail_width_chars"
		}"
		end

	gtk_calendar_select_day (a_calendar: POINTER; a_day: NATURAL_32) is
 		-- gtk_calendar_select_day (node at line 34430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_select_day"
		}"
		end

	gtk_calendar_get_detail_width_chars (a_calendar: POINTER): INTEGER_32 is
 		-- gtk_calendar_get_detail_width_chars (node at line 37457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_calendar_get_detail_width_chars"
		}"
		end


end -- class GTKCALENDAR_EXTERNALS
