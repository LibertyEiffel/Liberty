-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMESSAGEDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_message_dialog_format_secondary_markup (a_message_dialog: POINTER; a_message_format: POINTER) is
 		-- gtk_message_dialog_format_secondary_markup (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_format_secondary_markup"
		}"
		end

	gtk_message_dialog_format_secondary_text (a_message_dialog: POINTER; a_message_format: POINTER) is
 		-- gtk_message_dialog_format_secondary_text (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_format_secondary_text"
		}"
		end

	gtk_message_dialog_get_image (a_dialog: POINTER): POINTER is
 		-- gtk_message_dialog_get_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_get_image"
		}"
		end

	gtk_message_dialog_get_message_area (a_message_dialog: POINTER): POINTER is
 		-- gtk_message_dialog_get_message_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_get_message_area"
		}"
		end

	gtk_message_dialog_get_type: like long_unsigned is
 		-- gtk_message_dialog_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_get_type()"
		}"
		end

	gtk_message_dialog_new (a_parent: POINTER; a_flags: INTEGER; a_type: INTEGER; a_buttons: INTEGER; a_message_format: POINTER): POINTER is
 		-- gtk_message_dialog_new (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_new"
		}"
		end

	gtk_message_dialog_new_with_markup (a_parent: POINTER; a_flags: INTEGER; a_type: INTEGER; a_buttons: INTEGER; a_message_format: POINTER): POINTER is
 		-- gtk_message_dialog_new_with_markup (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_new_with_markup"
		}"
		end

	gtk_message_dialog_set_image (a_dialog: POINTER; an_image: POINTER) is
 		-- gtk_message_dialog_set_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_set_image"
		}"
		end

	gtk_message_dialog_set_markup (a_message_dialog: POINTER; a_str: POINTER) is
 		-- gtk_message_dialog_set_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_message_dialog_set_markup"
		}"
		end


end -- class GTKMESSAGEDIALOG_EXTERNALS
