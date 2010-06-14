-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKADJUSTMENT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_adjustment_set_step_increment (an_adjustment: POINTER; a_step_increment: REAL_64) is
 		-- gtk_adjustment_set_step_increment (node at line 376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_step_increment"
		}"
		end

	gtk_adjustment_set_upper (an_adjustment: POINTER; an_upper: REAL_64) is
 		-- gtk_adjustment_set_upper (node at line 477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_upper"
		}"
		end

	gtk_adjustment_clamp_page (an_adjustment: POINTER; a_lower: REAL_64; an_upper: REAL_64) is
 		-- gtk_adjustment_clamp_page (node at line 4808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_clamp_page"
		}"
		end

	gtk_adjustment_get_value (an_adjustment: POINTER): REAL_64 is
 		-- gtk_adjustment_get_value (node at line 6848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_value"
		}"
		end

	gtk_adjustment_get_page_size (an_adjustment: POINTER): REAL_64 is
 		-- gtk_adjustment_get_page_size (node at line 11375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_page_size"
		}"
		end

	gtk_adjustment_new (a_value: REAL_64; a_lower: REAL_64; an_upper: REAL_64; a_step_increment: REAL_64; a_page_increment: REAL_64; a_page_size: REAL_64): POINTER is
 		-- gtk_adjustment_new (node at line 11482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_new"
		}"
		end

	gtk_adjustment_changed (an_adjustment: POINTER) is
 		-- gtk_adjustment_changed (node at line 13475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_changed"
		}"
		end

	gtk_adjustment_get_lower (an_adjustment: POINTER): REAL_64 is
 		-- gtk_adjustment_get_lower (node at line 13682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_lower"
		}"
		end

	gtk_adjustment_set_page_size (an_adjustment: POINTER; a_page_size: REAL_64) is
 		-- gtk_adjustment_set_page_size (node at line 15553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_page_size"
		}"
		end

	gtk_adjustment_set_value (an_adjustment: POINTER; a_value: REAL_64) is
 		-- gtk_adjustment_set_value (node at line 16034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_value"
		}"
		end

	gtk_adjustment_get_type: NATURAL_32 is
 		-- gtk_adjustment_get_type (node at line 17822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_type()"
		}"
		end

	gtk_adjustment_get_page_increment (an_adjustment: POINTER): REAL_64 is
 		-- gtk_adjustment_get_page_increment (node at line 18998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_page_increment"
		}"
		end

	gtk_adjustment_configure (an_adjustment: POINTER; a_value: REAL_64; a_lower: REAL_64; an_upper: REAL_64; a_step_increment: REAL_64; a_page_increment: REAL_64; a_page_size: REAL_64) is
 		-- gtk_adjustment_configure (node at line 21073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_configure"
		}"
		end

	gtk_adjustment_set_lower (an_adjustment: POINTER; a_lower: REAL_64) is
 		-- gtk_adjustment_set_lower (node at line 22263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_lower"
		}"
		end

	gtk_adjustment_get_step_increment (an_adjustment: POINTER): REAL_64 is
 		-- gtk_adjustment_get_step_increment (node at line 25835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_step_increment"
		}"
		end

	gtk_adjustment_set_page_increment (an_adjustment: POINTER; a_page_increment: REAL_64) is
 		-- gtk_adjustment_set_page_increment (node at line 26966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_page_increment"
		}"
		end

	gtk_adjustment_get_upper (an_adjustment: POINTER): REAL_64 is
 		-- gtk_adjustment_get_upper (node at line 30098)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_upper"
		}"
		end

	gtk_adjustment_value_changed (an_adjustment: POINTER) is
 		-- gtk_adjustment_value_changed (node at line 33158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_value_changed"
		}"
		end


end -- class GTKADJUSTMENT_EXTERNALS
