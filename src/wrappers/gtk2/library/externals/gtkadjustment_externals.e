-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKADJUSTMENT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_adjustment_changed (an_adjustment: POINTER) is
 		-- gtk_adjustment_changed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_changed"
		}"
		end

	gtk_adjustment_clamp_page (an_adjustment: POINTER; a_lower: REAL; an_upper: REAL) is
 		-- gtk_adjustment_clamp_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_clamp_page"
		}"
		end

	gtk_adjustment_configure (an_adjustment: POINTER; a_value: REAL; a_lower: REAL; an_upper: REAL; a_step_increment: REAL; a_page_increment: REAL; a_page_size: REAL) is
 		-- gtk_adjustment_configure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_configure"
		}"
		end

	gtk_adjustment_get_lower (an_adjustment: POINTER): REAL is
 		-- gtk_adjustment_get_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_lower"
		}"
		end

	gtk_adjustment_get_page_increment (an_adjustment: POINTER): REAL is
 		-- gtk_adjustment_get_page_increment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_page_increment"
		}"
		end

	gtk_adjustment_get_page_size (an_adjustment: POINTER): REAL is
 		-- gtk_adjustment_get_page_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_page_size"
		}"
		end

	gtk_adjustment_get_step_increment (an_adjustment: POINTER): REAL is
 		-- gtk_adjustment_get_step_increment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_step_increment"
		}"
		end

	gtk_adjustment_get_type: like long_unsigned is
 		-- gtk_adjustment_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_type()"
		}"
		end

	gtk_adjustment_get_upper (an_adjustment: POINTER): REAL is
 		-- gtk_adjustment_get_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_upper"
		}"
		end

	gtk_adjustment_get_value (an_adjustment: POINTER): REAL is
 		-- gtk_adjustment_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_get_value"
		}"
		end

	gtk_adjustment_new (a_value: REAL; a_lower: REAL; an_upper: REAL; a_step_increment: REAL; a_page_increment: REAL; a_page_size: REAL): POINTER is
 		-- gtk_adjustment_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_new"
		}"
		end

	gtk_adjustment_set_lower (an_adjustment: POINTER; a_lower: REAL) is
 		-- gtk_adjustment_set_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_lower"
		}"
		end

	gtk_adjustment_set_page_increment (an_adjustment: POINTER; a_page_increment: REAL) is
 		-- gtk_adjustment_set_page_increment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_page_increment"
		}"
		end

	gtk_adjustment_set_page_size (an_adjustment: POINTER; a_page_size: REAL) is
 		-- gtk_adjustment_set_page_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_page_size"
		}"
		end

	gtk_adjustment_set_step_increment (an_adjustment: POINTER; a_step_increment: REAL) is
 		-- gtk_adjustment_set_step_increment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_step_increment"
		}"
		end

	gtk_adjustment_set_upper (an_adjustment: POINTER; an_upper: REAL) is
 		-- gtk_adjustment_set_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_upper"
		}"
		end

	gtk_adjustment_set_value (an_adjustment: POINTER; a_value: REAL) is
 		-- gtk_adjustment_set_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_set_value"
		}"
		end

	gtk_adjustment_value_changed (an_adjustment: POINTER) is
 		-- gtk_adjustment_value_changed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_value_changed"
		}"
		end


end -- class GTKADJUSTMENT_EXTERNALS
