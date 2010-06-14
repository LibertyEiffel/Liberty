-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSPINBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_spin_button_get_update_policy (a_spin_button: POINTER): INTEGER is
 		-- gtk_spin_button_get_update_policy (node at line 2704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_update_policy"
		}"
		end

	gtk_spin_button_get_numeric (a_spin_button: POINTER): INTEGER_32 is
 		-- gtk_spin_button_get_numeric (node at line 2991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_numeric"
		}"
		end

	gtk_spin_button_get_wrap (a_spin_button: POINTER): INTEGER_32 is
 		-- gtk_spin_button_get_wrap (node at line 4672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_wrap"
		}"
		end

	gtk_spin_button_set_range (a_spin_button: POINTER; a_min: REAL_64; a_max: REAL_64) is
 		-- gtk_spin_button_set_range (node at line 5867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_range"
		}"
		end

	gtk_spin_button_get_increments (a_spin_button: POINTER; a_step: POINTER; a_page: POINTER) is
 		-- gtk_spin_button_get_increments (node at line 6566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_increments"
		}"
		end

	gtk_spin_button_set_wrap (a_spin_button: POINTER; a_wrap: INTEGER_32) is
 		-- gtk_spin_button_set_wrap (node at line 6866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_wrap"
		}"
		end

	gtk_spin_button_get_adjustment (a_spin_button: POINTER): POINTER is
 		-- gtk_spin_button_get_adjustment (node at line 7267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_adjustment"
		}"
		end

	gtk_spin_button_get_snap_to_ticks (a_spin_button: POINTER): INTEGER_32 is
 		-- gtk_spin_button_get_snap_to_ticks (node at line 7439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_snap_to_ticks"
		}"
		end

	gtk_spin_button_set_update_policy (a_spin_button: POINTER; a_policy: INTEGER) is
 		-- gtk_spin_button_set_update_policy (node at line 8661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_update_policy"
		}"
		end

	gtk_spin_button_set_numeric (a_spin_button: POINTER; a_numeric: INTEGER_32) is
 		-- gtk_spin_button_set_numeric (node at line 9753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_numeric"
		}"
		end

	gtk_spin_button_spin (a_spin_button: POINTER; a_direction: INTEGER; an_increment: REAL_64) is
 		-- gtk_spin_button_spin (node at line 10752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_spin"
		}"
		end

	gtk_spin_button_set_increments (a_spin_button: POINTER; a_step: REAL_64; a_page: REAL_64) is
 		-- gtk_spin_button_set_increments (node at line 12430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_increments"
		}"
		end

	gtk_spin_button_get_value (a_spin_button: POINTER): REAL_64 is
 		-- gtk_spin_button_get_value (node at line 17121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_value"
		}"
		end

	gtk_spin_button_update (a_spin_button: POINTER) is
 		-- gtk_spin_button_update (node at line 17452)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_update"
		}"
		end

	gtk_spin_button_new (an_adjustment: POINTER; a_climb_rate: REAL_64; a_digits: NATURAL_32): POINTER is
 		-- gtk_spin_button_new (node at line 18226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_new"
		}"
		end

	gtk_spin_button_set_digits (a_spin_button: POINTER; a_digits: NATURAL_32) is
 		-- gtk_spin_button_set_digits (node at line 21123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_digits"
		}"
		end

	gtk_spin_button_new_with_range (a_min: REAL_64; a_max: REAL_64; a_step: REAL_64): POINTER is
 		-- gtk_spin_button_new_with_range (node at line 27552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_new_with_range"
		}"
		end

	gtk_spin_button_set_adjustment (a_spin_button: POINTER; an_adjustment: POINTER) is
 		-- gtk_spin_button_set_adjustment (node at line 28213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_adjustment"
		}"
		end

	gtk_spin_button_get_range (a_spin_button: POINTER; a_min: POINTER; a_max: POINTER) is
 		-- gtk_spin_button_get_range (node at line 29971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_range"
		}"
		end

	gtk_spin_button_get_value_as_int (a_spin_button: POINTER): INTEGER_32 is
 		-- gtk_spin_button_get_value_as_int (node at line 30367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_value_as_int"
		}"
		end

	gtk_spin_button_set_value (a_spin_button: POINTER; a_value: REAL_64) is
 		-- gtk_spin_button_set_value (node at line 31329)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_value"
		}"
		end

	gtk_spin_button_get_type: NATURAL_32 is
 		-- gtk_spin_button_get_type (node at line 32101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_type()"
		}"
		end

	gtk_spin_button_configure (a_spin_button: POINTER; an_adjustment: POINTER; a_climb_rate: REAL_64; a_digits: NATURAL_32) is
 		-- gtk_spin_button_configure (node at line 35942)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_configure"
		}"
		end

	gtk_spin_button_get_digits (a_spin_button: POINTER): NATURAL_32 is
 		-- gtk_spin_button_get_digits (node at line 35990)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_get_digits"
		}"
		end

	gtk_spin_button_set_snap_to_ticks (a_spin_button: POINTER; a_snap_to_ticks: INTEGER_32) is
 		-- gtk_spin_button_set_snap_to_ticks (node at line 36188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spin_button_set_snap_to_ticks"
		}"
		end


end -- class GTKSPINBUTTON_EXTERNALS
