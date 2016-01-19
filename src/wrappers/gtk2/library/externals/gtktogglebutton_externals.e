-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toggle_button_get_active (a_toggle_button: POINTER): INTEGER is
 		-- gtk_toggle_button_get_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_active"
		}"
		end

	gtk_toggle_button_get_inconsistent (a_toggle_button: POINTER): INTEGER is
 		-- gtk_toggle_button_get_inconsistent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_inconsistent"
		}"
		end

	gtk_toggle_button_get_mode (a_toggle_button: POINTER): INTEGER is
 		-- gtk_toggle_button_get_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_mode"
		}"
		end

	gtk_toggle_button_get_type: like long_unsigned is
 		-- gtk_toggle_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_type()"
		}"
		end

	gtk_toggle_button_new: POINTER is
 		-- gtk_toggle_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_new()"
		}"
		end

	gtk_toggle_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_toggle_button_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_new_with_label"
		}"
		end

	gtk_toggle_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_toggle_button_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_new_with_mnemonic"
		}"
		end

	gtk_toggle_button_set_active (a_toggle_button: POINTER; an_is_active: INTEGER) is
 		-- gtk_toggle_button_set_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_set_active"
		}"
		end

	gtk_toggle_button_set_inconsistent (a_toggle_button: POINTER; a_setting: INTEGER) is
 		-- gtk_toggle_button_set_inconsistent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_set_inconsistent"
		}"
		end

	gtk_toggle_button_set_mode (a_toggle_button: POINTER; a_draw_indicator: INTEGER) is
 		-- gtk_toggle_button_set_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_set_mode"
		}"
		end

	gtk_toggle_button_toggled (a_toggle_button: POINTER) is
 		-- gtk_toggle_button_toggled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_toggled"
		}"
		end


end -- class GTKTOGGLEBUTTON_EXTERNALS
