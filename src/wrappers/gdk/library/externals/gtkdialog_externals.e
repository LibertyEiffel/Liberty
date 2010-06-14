-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDIALOG_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_alternative_dialog_button_order (a_screen: POINTER): INTEGER_32 is
 		-- gtk_alternative_dialog_button_order (node at line 1467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alternative_dialog_button_order"
		}"
		end

	gtk_dialog_get_response_for_widget (a_dialog: POINTER; a_widget: POINTER): INTEGER_32 is
 		-- gtk_dialog_get_response_for_widget (node at line 2673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_response_for_widget"
		}"
		end

	gtk_dialog_new: POINTER is
 		-- gtk_dialog_new (node at line 2913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_new()"
		}"
		end

	gtk_dialog_get_has_separator (a_dialog: POINTER): INTEGER_32 is
 		-- gtk_dialog_get_has_separator (node at line 3155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_has_separator"
		}"
		end

	gtk_dialog_set_alternative_button_order_from_array (a_dialog: POINTER; a_n_params: INTEGER_32; a_new_order: POINTER) is
 		-- gtk_dialog_set_alternative_button_order_from_array (node at line 4419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_alternative_button_order_from_array"
		}"
		end

	gtk_dialog_response (a_dialog: POINTER; a_response_id: INTEGER_32) is
 		-- gtk_dialog_response (node at line 4824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_response"
		}"
		end

	gtk_dialog_add_action_widget (a_dialog: POINTER; a_child: POINTER; a_response_id: INTEGER_32) is
 		-- gtk_dialog_add_action_widget (node at line 6699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_add_action_widget"
		}"
		end

	gtk_dialog_get_action_area (a_dialog: POINTER): POINTER is
 		-- gtk_dialog_get_action_area (node at line 9901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_action_area"
		}"
		end

	gtk_dialog_set_has_separator (a_dialog: POINTER; a_setting: INTEGER_32) is
 		-- gtk_dialog_set_has_separator (node at line 13335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_has_separator"
		}"
		end

	gtk_dialog_run (a_dialog: POINTER): INTEGER_32 is
 		-- gtk_dialog_run (node at line 14487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_run"
		}"
		end

	gtk_dialog_set_alternative_button_order (a_dialog: POINTER; a_first_response_id: INTEGER_32) is
 		-- gtk_dialog_set_alternative_button_order (variadic call)  (node at line 14594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_alternative_button_order"
		}"
		end

	gtk_dialog_set_default_response (a_dialog: POINTER; a_response_id: INTEGER_32) is
 		-- gtk_dialog_set_default_response (node at line 15196)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_default_response"
		}"
		end

	gtk_dialog_get_type: NATURAL_32 is
 		-- gtk_dialog_get_type (node at line 16126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_type()"
		}"
		end

	gtk_dialog_get_widget_for_response (a_dialog: POINTER; a_response_id: INTEGER_32): POINTER is
 		-- gtk_dialog_get_widget_for_response (node at line 18905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_widget_for_response"
		}"
		end

	-- `hidden' function _gtk_dialog_set_ignore_separator skipped.
	gtk_dialog_get_content_area (a_dialog: POINTER): POINTER is
 		-- gtk_dialog_get_content_area (node at line 30254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_content_area"
		}"
		end

	gtk_dialog_add_button (a_dialog: POINTER; a_button_text: POINTER; a_response_id: INTEGER_32): POINTER is
 		-- gtk_dialog_add_button (node at line 33656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_add_button"
		}"
		end

	gtk_dialog_set_response_sensitive (a_dialog: POINTER; a_response_id: INTEGER_32; a_setting: INTEGER_32) is
 		-- gtk_dialog_set_response_sensitive (node at line 34163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_response_sensitive"
		}"
		end

	gtk_dialog_new_with_buttons (a_title: POINTER; a_parent: POINTER; a_flags: INTEGER; a_first_button_text: POINTER): POINTER is
 		-- gtk_dialog_new_with_buttons (variadic call)  (node at line 36306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_new_with_buttons"
		}"
		end

	gtk_dialog_add_buttons (a_dialog: POINTER; a_first_button_text: POINTER) is
 		-- gtk_dialog_add_buttons (variadic call)  (node at line 37412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_add_buttons"
		}"
		end


end -- class GTKDIALOG_EXTERNALS
