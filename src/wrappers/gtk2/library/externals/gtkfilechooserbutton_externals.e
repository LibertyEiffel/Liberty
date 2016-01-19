-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_button_get_focus_on_click (a_button: POINTER): INTEGER is
 		-- gtk_file_chooser_button_get_focus_on_click
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_focus_on_click"
		}"
		end

	gtk_file_chooser_button_get_title (a_button: POINTER): POINTER is
 		-- gtk_file_chooser_button_get_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_title"
		}"
		end

	gtk_file_chooser_button_get_type: like long_unsigned is
 		-- gtk_file_chooser_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_type()"
		}"
		end

	gtk_file_chooser_button_get_width_chars (a_button: POINTER): INTEGER is
 		-- gtk_file_chooser_button_get_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_width_chars"
		}"
		end

	gtk_file_chooser_button_new (a_title: POINTER; an_action: INTEGER): POINTER is
 		-- gtk_file_chooser_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_new"
		}"
		end

	gtk_file_chooser_button_new_with_dialog (a_dialog: POINTER): POINTER is
 		-- gtk_file_chooser_button_new_with_dialog
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_new_with_dialog"
		}"
		end

	gtk_file_chooser_button_set_focus_on_click (a_button: POINTER; a_focus_on_click: INTEGER) is
 		-- gtk_file_chooser_button_set_focus_on_click
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_set_focus_on_click"
		}"
		end

	gtk_file_chooser_button_set_title (a_button: POINTER; a_title: POINTER) is
 		-- gtk_file_chooser_button_set_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_set_title"
		}"
		end

	gtk_file_chooser_button_set_width_chars (a_button: POINTER; a_n_chars: INTEGER) is
 		-- gtk_file_chooser_button_set_width_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_set_width_chars"
		}"
		end


end -- class GTKFILECHOOSERBUTTON_EXTERNALS
