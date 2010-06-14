-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRANGE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_range_set_flippable (a_range: POINTER; a_flippable: INTEGER_32) is
 		-- gtk_range_set_flippable (node at line 501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_flippable"
		}"
		end

	gtk_range_get_value (a_range: POINTER): REAL_64 is
 		-- gtk_range_get_value (node at line 3252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_value"
		}"
		end

	gtk_range_get_restrict_to_fill_level (a_range: POINTER): INTEGER_32 is
 		-- gtk_range_get_restrict_to_fill_level (node at line 7420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_restrict_to_fill_level"
		}"
		end

	gtk_range_get_type: NATURAL_32 is
 		-- gtk_range_get_type (node at line 11374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_type()"
		}"
		end

	gtk_range_get_slider_size_fixed (a_range: POINTER): INTEGER_32 is
 		-- gtk_range_get_slider_size_fixed (node at line 12009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_slider_size_fixed"
		}"
		end

	gtk_range_set_value (a_range: POINTER; a_value: REAL_64) is
 		-- gtk_range_set_value (node at line 12637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_value"
		}"
		end

	gtk_range_set_restrict_to_fill_level (a_range: POINTER; a_restrict_to_fill_level: INTEGER_32) is
 		-- gtk_range_set_restrict_to_fill_level (node at line 12781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_restrict_to_fill_level"
		}"
		end

	gtk_range_get_fill_level (a_range: POINTER): REAL_64 is
 		-- gtk_range_get_fill_level (node at line 13296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_fill_level"
		}"
		end

	gtk_range_set_show_fill_level (a_range: POINTER; a_show_fill_level: INTEGER_32) is
 		-- gtk_range_set_show_fill_level (node at line 13819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_show_fill_level"
		}"
		end

	gtk_range_get_range_rect (a_range: POINTER; a_range_rect: POINTER) is
 		-- gtk_range_get_range_rect (node at line 14041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_range_rect"
		}"
		end

	gtk_range_get_adjustment (a_range: POINTER): POINTER is
 		-- gtk_range_get_adjustment (node at line 14126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_adjustment"
		}"
		end

	gtk_range_set_slider_size_fixed (a_range: POINTER; a_size_fixed: INTEGER_32) is
 		-- gtk_range_set_slider_size_fixed (node at line 16580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_slider_size_fixed"
		}"
		end

	gtk_range_get_inverted (a_range: POINTER): INTEGER_32 is
 		-- gtk_range_get_inverted (node at line 17280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_inverted"
		}"
		end

	gtk_range_set_fill_level (a_range: POINTER; a_fill_level: REAL_64) is
 		-- gtk_range_set_fill_level (node at line 18684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_fill_level"
		}"
		end

	-- `hidden' function _gtk_range_get_wheel_delta skipped.
	gtk_range_get_slider_range (a_range: POINTER; a_slider_start: POINTER; a_slider_end: POINTER) is
 		-- gtk_range_get_slider_range (node at line 19708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_slider_range"
		}"
		end

	gtk_range_set_upper_stepper_sensitivity (a_range: POINTER; a_sensitivity: INTEGER) is
 		-- gtk_range_set_upper_stepper_sensitivity (node at line 20822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_upper_stepper_sensitivity"
		}"
		end

	gtk_range_set_increments (a_range: POINTER; a_step: REAL_64; a_page: REAL_64) is
 		-- gtk_range_set_increments (node at line 21146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_increments"
		}"
		end

	gtk_range_set_inverted (a_range: POINTER; a_setting: INTEGER_32) is
 		-- gtk_range_set_inverted (node at line 21707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_inverted"
		}"
		end

	gtk_range_set_range (a_range: POINTER; a_min: REAL_64; a_max: REAL_64) is
 		-- gtk_range_set_range (node at line 22457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_range"
		}"
		end

	-- `hidden' function _gtk_range_set_stop_values skipped.
	gtk_range_set_min_slider_size (a_range: POINTER; a_min_size: INTEGER_32) is
 		-- gtk_range_set_min_slider_size (node at line 24735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_min_slider_size"
		}"
		end

	gtk_range_get_show_fill_level (a_range: POINTER): INTEGER_32 is
 		-- gtk_range_get_show_fill_level (node at line 24886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_show_fill_level"
		}"
		end

	-- `hidden' function _gtk_range_get_stop_positions skipped.
	gtk_range_get_upper_stepper_sensitivity (a_range: POINTER): INTEGER is
 		-- gtk_range_get_upper_stepper_sensitivity (node at line 27355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_upper_stepper_sensitivity"
		}"
		end

	gtk_range_get_update_policy (a_range: POINTER): INTEGER is
 		-- gtk_range_get_update_policy (node at line 29566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_update_policy"
		}"
		end

	gtk_range_set_lower_stepper_sensitivity (a_range: POINTER; a_sensitivity: INTEGER) is
 		-- gtk_range_set_lower_stepper_sensitivity (node at line 31462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_lower_stepper_sensitivity"
		}"
		end

	gtk_range_set_update_policy (a_range: POINTER; a_policy: INTEGER) is
 		-- gtk_range_set_update_policy (node at line 32958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_update_policy"
		}"
		end

	gtk_range_get_flippable (a_range: POINTER): INTEGER_32 is
 		-- gtk_range_get_flippable (node at line 34436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_flippable"
		}"
		end

	gtk_range_set_adjustment (a_range: POINTER; an_adjustment: POINTER) is
 		-- gtk_range_set_adjustment (node at line 35637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_adjustment"
		}"
		end

	gtk_range_get_min_slider_size (a_range: POINTER): INTEGER_32 is
 		-- gtk_range_get_min_slider_size (node at line 35868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_min_slider_size"
		}"
		end

	gtk_range_get_lower_stepper_sensitivity (a_range: POINTER): INTEGER is
 		-- gtk_range_get_lower_stepper_sensitivity (node at line 37553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_lower_stepper_sensitivity"
		}"
		end


end -- class GTKRANGE_EXTERNALS
