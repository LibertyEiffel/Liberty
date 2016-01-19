-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKINFOBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_info_bar_add_action_widget (an_info_bar: POINTER; a_child: POINTER; a_response_id: INTEGER) is
 		-- gtk_info_bar_add_action_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_add_action_widget"
		}"
		end

	gtk_info_bar_add_button (an_info_bar: POINTER; a_button_text: POINTER; a_response_id: INTEGER): POINTER is
 		-- gtk_info_bar_add_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_add_button"
		}"
		end

	gtk_info_bar_add_buttons (an_info_bar: POINTER; a_first_button_text: POINTER) is
 		-- gtk_info_bar_add_buttons (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_add_buttons"
		}"
		end

	gtk_info_bar_get_action_area (an_info_bar: POINTER): POINTER is
 		-- gtk_info_bar_get_action_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_get_action_area"
		}"
		end

	gtk_info_bar_get_content_area (an_info_bar: POINTER): POINTER is
 		-- gtk_info_bar_get_content_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_get_content_area"
		}"
		end

	gtk_info_bar_get_message_type (an_info_bar: POINTER): INTEGER is
 		-- gtk_info_bar_get_message_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_get_message_type"
		}"
		end

	gtk_info_bar_get_type: like long_unsigned is
 		-- gtk_info_bar_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_get_type()"
		}"
		end

	gtk_info_bar_new: POINTER is
 		-- gtk_info_bar_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_new()"
		}"
		end

	gtk_info_bar_new_with_buttons (a_first_button_text: POINTER): POINTER is
 		-- gtk_info_bar_new_with_buttons (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_new_with_buttons"
		}"
		end

	gtk_info_bar_response (an_info_bar: POINTER; a_response_id: INTEGER) is
 		-- gtk_info_bar_response
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_response"
		}"
		end

	gtk_info_bar_set_default_response (an_info_bar: POINTER; a_response_id: INTEGER) is
 		-- gtk_info_bar_set_default_response
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_set_default_response"
		}"
		end

	gtk_info_bar_set_message_type (an_info_bar: POINTER; a_message_type: INTEGER) is
 		-- gtk_info_bar_set_message_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_set_message_type"
		}"
		end

	gtk_info_bar_set_response_sensitive (an_info_bar: POINTER; a_response_id: INTEGER; a_setting: INTEGER) is
 		-- gtk_info_bar_set_response_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_info_bar_set_response_sensitive"
		}"
		end


end -- class GTKINFOBAR_EXTERNALS
