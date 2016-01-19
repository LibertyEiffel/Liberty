-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_alternative_dialog_button_order (a_screen: POINTER): INTEGER is
 		-- gtk_alternative_dialog_button_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alternative_dialog_button_order"
		}"
		end

	gtk_dialog_add_action_widget (a_dialog: POINTER; a_child: POINTER; a_response_id: INTEGER) is
 		-- gtk_dialog_add_action_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_add_action_widget"
		}"
		end

	gtk_dialog_add_button (a_dialog: POINTER; a_button_text: POINTER; a_response_id: INTEGER): POINTER is
 		-- gtk_dialog_add_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_add_button"
		}"
		end

	gtk_dialog_add_buttons (a_dialog: POINTER; a_first_button_text: POINTER) is
 		-- gtk_dialog_add_buttons (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_add_buttons"
		}"
		end

	gtk_dialog_get_action_area (a_dialog: POINTER): POINTER is
 		-- gtk_dialog_get_action_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_action_area"
		}"
		end

	gtk_dialog_get_content_area (a_dialog: POINTER): POINTER is
 		-- gtk_dialog_get_content_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_content_area"
		}"
		end

	gtk_dialog_get_response_for_widget (a_dialog: POINTER; a_widget: POINTER): INTEGER is
 		-- gtk_dialog_get_response_for_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_response_for_widget"
		}"
		end

	gtk_dialog_get_type: like long_unsigned is
 		-- gtk_dialog_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_type()"
		}"
		end

	gtk_dialog_get_widget_for_response (a_dialog: POINTER; a_response_id: INTEGER): POINTER is
 		-- gtk_dialog_get_widget_for_response
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_get_widget_for_response"
		}"
		end

	gtk_dialog_new: POINTER is
 		-- gtk_dialog_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_new()"
		}"
		end

	gtk_dialog_new_with_buttons (a_title: POINTER; a_parent: POINTER; a_flags: INTEGER; a_first_button_text: POINTER): POINTER is
 		-- gtk_dialog_new_with_buttons (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_new_with_buttons"
		}"
		end

	gtk_dialog_response (a_dialog: POINTER; a_response_id: INTEGER) is
 		-- gtk_dialog_response
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_response"
		}"
		end

	gtk_dialog_run (a_dialog: POINTER): INTEGER is
 		-- gtk_dialog_run
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_run"
		}"
		end

	gtk_dialog_set_alternative_button_order (a_dialog: POINTER; a_first_response_id: INTEGER) is
 		-- gtk_dialog_set_alternative_button_order (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_alternative_button_order"
		}"
		end

	gtk_dialog_set_alternative_button_order_from_array (a_dialog: POINTER; a_n_params: INTEGER; a_new_order: POINTER) is
 		-- gtk_dialog_set_alternative_button_order_from_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_alternative_button_order_from_array"
		}"
		end

	gtk_dialog_set_default_response (a_dialog: POINTER; a_response_id: INTEGER) is
 		-- gtk_dialog_set_default_response
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_default_response"
		}"
		end

	-- `hidden' function _gtk_dialog_set_ignore_separator skipped.
	gtk_dialog_set_response_sensitive (a_dialog: POINTER; a_response_id: INTEGER; a_setting: INTEGER) is
 		-- gtk_dialog_set_response_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_dialog_set_response_sensitive"
		}"
		end


end -- class GTKDIALOG_EXTERNALS
