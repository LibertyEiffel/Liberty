-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPROGRESS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_progress_set_percentage (a_progress: POINTER; a_percentage: REAL_64) is
 		-- gtk_progress_set_percentage (node at line 2621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_percentage"
		}"
		end

	gtk_progress_configure (a_progress: POINTER; a_value: REAL_64; a_min: REAL_64; a_max: REAL_64) is
 		-- gtk_progress_configure (node at line 2918)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_configure"
		}"
		end

	gtk_progress_set_value (a_progress: POINTER; a_value: REAL_64) is
 		-- gtk_progress_set_value (node at line 6379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_value"
		}"
		end

	gtk_progress_set_text_alignment (a_progress: POINTER; a_x_align: REAL_32; a_y_align: REAL_32) is
 		-- gtk_progress_set_text_alignment (node at line 8277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_text_alignment"
		}"
		end

	gtk_progress_set_adjustment (a_progress: POINTER; an_adjustment: POINTER) is
 		-- gtk_progress_set_adjustment (node at line 14092)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_adjustment"
		}"
		end

	gtk_progress_get_type: NATURAL_32 is
 		-- gtk_progress_get_type (node at line 14212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_get_type()"
		}"
		end

	gtk_progress_set_format_string (a_progress: POINTER; a_format: POINTER) is
 		-- gtk_progress_set_format_string (node at line 16871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_format_string"
		}"
		end

	gtk_progress_get_percentage_from_value (a_progress: POINTER; a_value: REAL_64): REAL_64 is
 		-- gtk_progress_get_percentage_from_value (node at line 17087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_get_percentage_from_value"
		}"
		end

	gtk_progress_set_activity_mode (a_progress: POINTER; an_activity_mode: INTEGER_32) is
 		-- gtk_progress_set_activity_mode (node at line 21099)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_activity_mode"
		}"
		end

	gtk_progress_get_text_from_value (a_progress: POINTER; a_value: REAL_64): POINTER is
 		-- gtk_progress_get_text_from_value (node at line 24038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_get_text_from_value"
		}"
		end

	gtk_progress_get_current_text (a_progress: POINTER): POINTER is
 		-- gtk_progress_get_current_text (node at line 28230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_get_current_text"
		}"
		end

	gtk_progress_get_current_percentage (a_progress: POINTER): REAL_64 is
 		-- gtk_progress_get_current_percentage (node at line 30611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_get_current_percentage"
		}"
		end

	gtk_progress_set_show_text (a_progress: POINTER; a_show_text: INTEGER_32) is
 		-- gtk_progress_set_show_text (node at line 30849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_set_show_text"
		}"
		end

	gtk_progress_get_value (a_progress: POINTER): REAL_64 is
 		-- gtk_progress_get_value (node at line 34859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_get_value"
		}"
		end


end -- class GTKPROGRESS_EXTERNALS
