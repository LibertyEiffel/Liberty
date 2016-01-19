-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSPINBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_spin_button_configure (a_spin_button: POINTER; an_adjustment: POINTER; a_climb_rate: REAL; a_digits: NATURAL) is
 		-- gtk_spin_button_configure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_configure"
		}"
		end

	gtk_spin_button_get_adjustment (a_spin_button: POINTER): POINTER is
 		-- gtk_spin_button_get_adjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_adjustment"
		}"
		end

	gtk_spin_button_get_digits (a_spin_button: POINTER): NATURAL is
 		-- gtk_spin_button_get_digits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_digits"
		}"
		end

	gtk_spin_button_get_increments (a_spin_button: POINTER; a_step: POINTER; a_page: POINTER) is
 		-- gtk_spin_button_get_increments
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_increments"
		}"
		end

	gtk_spin_button_get_numeric (a_spin_button: POINTER): INTEGER is
 		-- gtk_spin_button_get_numeric
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_numeric"
		}"
		end

	gtk_spin_button_get_range (a_spin_button: POINTER; a_min: POINTER; a_max: POINTER) is
 		-- gtk_spin_button_get_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_range"
		}"
		end

	gtk_spin_button_get_snap_to_ticks (a_spin_button: POINTER): INTEGER is
 		-- gtk_spin_button_get_snap_to_ticks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_snap_to_ticks"
		}"
		end

	gtk_spin_button_get_type: like long_unsigned is
 		-- gtk_spin_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_type()"
		}"
		end

	gtk_spin_button_get_update_policy (a_spin_button: POINTER): INTEGER is
 		-- gtk_spin_button_get_update_policy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_update_policy"
		}"
		end

	gtk_spin_button_get_value (a_spin_button: POINTER): REAL is
 		-- gtk_spin_button_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_value"
		}"
		end

	gtk_spin_button_get_value_as_int (a_spin_button: POINTER): INTEGER is
 		-- gtk_spin_button_get_value_as_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_value_as_int"
		}"
		end

	gtk_spin_button_get_wrap (a_spin_button: POINTER): INTEGER is
 		-- gtk_spin_button_get_wrap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_wrap"
		}"
		end

	gtk_spin_button_new (an_adjustment: POINTER; a_climb_rate: REAL; a_digits: NATURAL): POINTER is
 		-- gtk_spin_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_new"
		}"
		end

	gtk_spin_button_new_with_range (a_min: REAL; a_max: REAL; a_step: REAL): POINTER is
 		-- gtk_spin_button_new_with_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_new_with_range"
		}"
		end

	gtk_spin_button_set_adjustment (a_spin_button: POINTER; an_adjustment: POINTER) is
 		-- gtk_spin_button_set_adjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_adjustment"
		}"
		end

	gtk_spin_button_set_digits (a_spin_button: POINTER; a_digits: NATURAL) is
 		-- gtk_spin_button_set_digits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_digits"
		}"
		end

	gtk_spin_button_set_increments (a_spin_button: POINTER; a_step: REAL; a_page: REAL) is
 		-- gtk_spin_button_set_increments
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_increments"
		}"
		end

	gtk_spin_button_set_numeric (a_spin_button: POINTER; a_numeric: INTEGER) is
 		-- gtk_spin_button_set_numeric
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_numeric"
		}"
		end

	gtk_spin_button_set_range (a_spin_button: POINTER; a_min: REAL; a_max: REAL) is
 		-- gtk_spin_button_set_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_range"
		}"
		end

	gtk_spin_button_set_snap_to_ticks (a_spin_button: POINTER; a_snap_to_ticks: INTEGER) is
 		-- gtk_spin_button_set_snap_to_ticks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_snap_to_ticks"
		}"
		end

	gtk_spin_button_set_update_policy (a_spin_button: POINTER; a_policy: INTEGER) is
 		-- gtk_spin_button_set_update_policy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_update_policy"
		}"
		end

	gtk_spin_button_set_value (a_spin_button: POINTER; a_value: REAL) is
 		-- gtk_spin_button_set_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_value"
		}"
		end

	gtk_spin_button_set_wrap (a_spin_button: POINTER; a_wrap: INTEGER) is
 		-- gtk_spin_button_set_wrap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_wrap"
		}"
		end

	gtk_spin_button_spin (a_spin_button: POINTER; a_direction: INTEGER; an_increment: REAL) is
 		-- gtk_spin_button_spin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_spin"
		}"
		end

	gtk_spin_button_update (a_spin_button: POINTER) is
 		-- gtk_spin_button_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_update"
		}"
		end


end -- class GTKSPINBUTTON_EXTERNALS
