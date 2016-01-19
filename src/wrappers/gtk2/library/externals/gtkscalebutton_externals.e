-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALEBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_scale_button_get_adjustment (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_adjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_adjustment"
		}"
		end

	gtk_scale_button_get_minus_button (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_minus_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_minus_button"
		}"
		end

	gtk_scale_button_get_plus_button (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_plus_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_plus_button"
		}"
		end

	gtk_scale_button_get_popup (a_button: POINTER): POINTER is
 		-- gtk_scale_button_get_popup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_popup"
		}"
		end

	gtk_scale_button_get_type: like long_unsigned is
 		-- gtk_scale_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_type()"
		}"
		end

	gtk_scale_button_get_value (a_button: POINTER): REAL is
 		-- gtk_scale_button_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_get_value"
		}"
		end

	gtk_scale_button_new (a_size: INTEGER; a_min: REAL; a_max: REAL; a_step: REAL; an_icons: POINTER): POINTER is
 		-- gtk_scale_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_new"
		}"
		end

	gtk_scale_button_set_adjustment (a_button: POINTER; an_adjustment: POINTER) is
 		-- gtk_scale_button_set_adjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_set_adjustment"
		}"
		end

	gtk_scale_button_set_icons (a_button: POINTER; an_icons: POINTER) is
 		-- gtk_scale_button_set_icons
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_set_icons"
		}"
		end

	gtk_scale_button_set_value (a_button: POINTER; a_value: REAL) is
 		-- gtk_scale_button_set_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_button_set_value"
		}"
		end


end -- class GTKSCALEBUTTON_EXTERNALS
