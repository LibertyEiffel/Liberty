-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERDIALOG_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_dialog_new (a_title: POINTER; a_parent: POINTER; an_action: INTEGER; a_first_button_text: POINTER): POINTER is
 		-- gtk_file_chooser_dialog_new (variadic call)  (node at line 1572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_new"
		}"
		end

	gtk_file_chooser_dialog_get_type: NATURAL_32 is
 		-- gtk_file_chooser_dialog_get_type (node at line 18068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_get_type()"
		}"
		end

	gtk_file_chooser_dialog_new_with_backend (a_title: POINTER; a_parent: POINTER; an_action: INTEGER; a_backend: POINTER; a_first_button_text: POINTER): POINTER is
 		-- gtk_file_chooser_dialog_new_with_backend (variadic call)  (node at line 20646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_new_with_backend"
		}"
		end


end -- class GTKFILECHOOSERDIALOG_EXTERNALS
