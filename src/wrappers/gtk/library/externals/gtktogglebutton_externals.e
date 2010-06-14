-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toggle_button_set_inconsistent (a_toggle_button: POINTER; a_setting: INTEGER_32) is
 		-- gtk_toggle_button_set_inconsistent (node at line 13085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_set_inconsistent"
		}"
		end

	gtk_toggle_button_set_mode (a_toggle_button: POINTER; a_draw_indicator: INTEGER_32) is
 		-- gtk_toggle_button_set_mode (node at line 13357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_set_mode"
		}"
		end

	gtk_toggle_button_get_inconsistent (a_toggle_button: POINTER): INTEGER_32 is
 		-- gtk_toggle_button_get_inconsistent (node at line 17464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_inconsistent"
		}"
		end

	gtk_toggle_button_new: POINTER is
 		-- gtk_toggle_button_new (node at line 18772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_new()"
		}"
		end

	gtk_toggle_button_set_active (a_toggle_button: POINTER; an_is_active: INTEGER_32) is
 		-- gtk_toggle_button_set_active (node at line 19077)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_set_active"
		}"
		end

	gtk_toggle_button_get_type: NATURAL_32 is
 		-- gtk_toggle_button_get_type (node at line 27006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_type()"
		}"
		end

	gtk_toggle_button_toggled (a_toggle_button: POINTER) is
 		-- gtk_toggle_button_toggled (node at line 28546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_toggled"
		}"
		end

	gtk_toggle_button_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_toggle_button_new_with_mnemonic (node at line 32493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_new_with_mnemonic"
		}"
		end

	gtk_toggle_button_get_mode (a_toggle_button: POINTER): INTEGER_32 is
 		-- gtk_toggle_button_get_mode (node at line 33410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_mode"
		}"
		end

	gtk_toggle_button_get_active (a_toggle_button: POINTER): INTEGER_32 is
 		-- gtk_toggle_button_get_active (node at line 34083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_get_active"
		}"
		end

	gtk_toggle_button_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_toggle_button_new_with_label (node at line 36298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_new_with_label"
		}"
		end


end -- class GTKTOGGLEBUTTON_EXTERNALS
