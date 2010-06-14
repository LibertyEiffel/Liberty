-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_button_get_title (a_button: POINTER): POINTER is
 		-- gtk_file_chooser_button_get_title (node at line 313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_title"
		}"
		end

	gtk_file_chooser_button_set_title (a_button: POINTER; a_title: POINTER) is
 		-- gtk_file_chooser_button_set_title (node at line 2924)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_set_title"
		}"
		end

	gtk_file_chooser_button_set_width_chars (a_button: POINTER; a_n_chars: INTEGER_32) is
 		-- gtk_file_chooser_button_set_width_chars (node at line 4616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_set_width_chars"
		}"
		end

	gtk_file_chooser_button_get_width_chars (a_button: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_button_get_width_chars (node at line 5988)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_width_chars"
		}"
		end

	gtk_file_chooser_button_new (a_title: POINTER; an_action: INTEGER): POINTER is
 		-- gtk_file_chooser_button_new (node at line 13162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_new"
		}"
		end

	gtk_file_chooser_button_set_focus_on_click (a_button: POINTER; a_focus_on_click: INTEGER_32) is
 		-- gtk_file_chooser_button_set_focus_on_click (node at line 16651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_set_focus_on_click"
		}"
		end

	gtk_file_chooser_button_new_with_dialog (a_dialog: POINTER): POINTER is
 		-- gtk_file_chooser_button_new_with_dialog (node at line 16947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_new_with_dialog"
		}"
		end

	gtk_file_chooser_button_get_type: NATURAL_32 is
 		-- gtk_file_chooser_button_get_type (node at line 19025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_type()"
		}"
		end

	gtk_file_chooser_button_get_focus_on_click (a_button: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_button_get_focus_on_click (node at line 22675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_get_focus_on_click"
		}"
		end

	gtk_file_chooser_button_new_with_backend (a_title: POINTER; an_action: INTEGER; a_backend: POINTER): POINTER is
 		-- gtk_file_chooser_button_new_with_backend (node at line 35430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_button_new_with_backend"
		}"
		end


end -- class GTKFILECHOOSERBUTTON_EXTERNALS
