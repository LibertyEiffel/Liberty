-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALEBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_scale_button_new (a_size: INTEGER; a_min: REAL_64; a_max: REAL_64; a_step: REAL_64; an_icons: POINTER): POINTER is
 		-- gtk_scale_button_new (node at line 3470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_new"
		}"
		end

	gtk_scale_button_get_type: NATURAL_64 is
 		-- gtk_scale_button_get_type (node at line 13831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_type()"
		}"
		end

	gtk_scale_button_get_plus_button (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_plus_button (node at line 14092)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_plus_button"
		}"
		end

	gtk_scale_button_get_value (a_button: POINTER): REAL_64 is
 		-- gtk_scale_button_get_value (node at line 22833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_value"
		}"
		end

	gtk_scale_button_get_adjustment (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_adjustment (node at line 23157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_adjustment"
		}"
		end

	gtk_scale_button_get_minus_button (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_minus_button (node at line 25214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_minus_button"
		}"
		end

	gtk_scale_button_set_value (a_button: POINTER; a_value: REAL_64) is
 		-- gtk_scale_button_set_value (node at line 32348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_set_value"
		}"
		end

	gtk_scale_button_set_adjustment (a_button: POINTER; an_adjustment: POINTER) is
 		-- gtk_scale_button_set_adjustment (node at line 35459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_set_adjustment"
		}"
		end

	gtk_scale_button_get_popup (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_popup (node at line 36233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_popup"
		}"
		end

	gtk_scale_button_set_icons (a_button: POINTER; an_icons: POINTER) is
 		-- gtk_scale_button_set_icons (node at line 36773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_set_icons"
		}"
		end


end -- class GTKSCALEBUTTON_EXTERNALS
