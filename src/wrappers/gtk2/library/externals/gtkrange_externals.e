-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRANGE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_range_get_adjustment (a_range: POINTER): POINTER is
 		-- gtk_range_get_adjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_adjustment"
		}"
		end

	gtk_range_get_fill_level (a_range: POINTER): REAL is
 		-- gtk_range_get_fill_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_fill_level"
		}"
		end

	gtk_range_get_flippable (a_range: POINTER): INTEGER is
 		-- gtk_range_get_flippable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_flippable"
		}"
		end

	gtk_range_get_inverted (a_range: POINTER): INTEGER is
 		-- gtk_range_get_inverted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_inverted"
		}"
		end

	gtk_range_get_lower_stepper_sensitivity (a_range: POINTER): INTEGER is
 		-- gtk_range_get_lower_stepper_sensitivity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_lower_stepper_sensitivity"
		}"
		end

	gtk_range_get_min_slider_size (a_range: POINTER): INTEGER is
 		-- gtk_range_get_min_slider_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_min_slider_size"
		}"
		end

	gtk_range_get_range_rect (a_range: POINTER; a_range_rect: POINTER) is
 		-- gtk_range_get_range_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_range_rect"
		}"
		end

	gtk_range_get_restrict_to_fill_level (a_range: POINTER): INTEGER is
 		-- gtk_range_get_restrict_to_fill_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_restrict_to_fill_level"
		}"
		end

	gtk_range_get_round_digits (a_range: POINTER): INTEGER is
 		-- gtk_range_get_round_digits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_round_digits"
		}"
		end

	gtk_range_get_show_fill_level (a_range: POINTER): INTEGER is
 		-- gtk_range_get_show_fill_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_show_fill_level"
		}"
		end

	gtk_range_get_slider_range (a_range: POINTER; a_slider_start: POINTER; a_slider_end: POINTER) is
 		-- gtk_range_get_slider_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_slider_range"
		}"
		end

	gtk_range_get_slider_size_fixed (a_range: POINTER): INTEGER is
 		-- gtk_range_get_slider_size_fixed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_slider_size_fixed"
		}"
		end

	-- `hidden' function _gtk_range_get_stop_positions skipped.
	gtk_range_get_type: like long_unsigned is
 		-- gtk_range_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_type()"
		}"
		end

	gtk_range_get_upper_stepper_sensitivity (a_range: POINTER): INTEGER is
 		-- gtk_range_get_upper_stepper_sensitivity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_upper_stepper_sensitivity"
		}"
		end

	gtk_range_get_value (a_range: POINTER): REAL is
 		-- gtk_range_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_get_value"
		}"
		end

	-- `hidden' function _gtk_range_get_wheel_delta skipped.
	gtk_range_set_adjustment (a_range: POINTER; an_adjustment: POINTER) is
 		-- gtk_range_set_adjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_adjustment"
		}"
		end

	gtk_range_set_fill_level (a_range: POINTER; a_fill_level: REAL) is
 		-- gtk_range_set_fill_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_fill_level"
		}"
		end

	gtk_range_set_flippable (a_range: POINTER; a_flippable: INTEGER) is
 		-- gtk_range_set_flippable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_flippable"
		}"
		end

	gtk_range_set_increments (a_range: POINTER; a_step: REAL; a_page: REAL) is
 		-- gtk_range_set_increments
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_increments"
		}"
		end

	gtk_range_set_inverted (a_range: POINTER; a_setting: INTEGER) is
 		-- gtk_range_set_inverted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_inverted"
		}"
		end

	gtk_range_set_lower_stepper_sensitivity (a_range: POINTER; a_sensitivity: INTEGER) is
 		-- gtk_range_set_lower_stepper_sensitivity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_lower_stepper_sensitivity"
		}"
		end

	gtk_range_set_min_slider_size (a_range: POINTER; a_min_size: INTEGER) is
 		-- gtk_range_set_min_slider_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_min_slider_size"
		}"
		end

	gtk_range_set_range (a_range: POINTER; a_min: REAL; a_max: REAL) is
 		-- gtk_range_set_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_range"
		}"
		end

	gtk_range_set_restrict_to_fill_level (a_range: POINTER; a_restrict_to_fill_level: INTEGER) is
 		-- gtk_range_set_restrict_to_fill_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_restrict_to_fill_level"
		}"
		end

	gtk_range_set_round_digits (a_range: POINTER; a_round_digits: INTEGER) is
 		-- gtk_range_set_round_digits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_round_digits"
		}"
		end

	gtk_range_set_show_fill_level (a_range: POINTER; a_show_fill_level: INTEGER) is
 		-- gtk_range_set_show_fill_level
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_show_fill_level"
		}"
		end

	gtk_range_set_slider_size_fixed (a_range: POINTER; a_size_fixed: INTEGER) is
 		-- gtk_range_set_slider_size_fixed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_slider_size_fixed"
		}"
		end

	-- `hidden' function _gtk_range_set_stop_values skipped.
	gtk_range_set_upper_stepper_sensitivity (a_range: POINTER; a_sensitivity: INTEGER) is
 		-- gtk_range_set_upper_stepper_sensitivity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_upper_stepper_sensitivity"
		}"
		end

	gtk_range_set_value (a_range: POINTER; a_value: REAL) is
 		-- gtk_range_set_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_range_set_value"
		}"
		end


end -- class GTKRANGE_EXTERNALS
