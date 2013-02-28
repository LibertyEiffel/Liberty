-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_dialog_new (a_title: POINTER; a_parent: POINTER; an_action: INTEGER; a_first_button_text: POINTER): POINTER is
 		-- gtk_file_chooser_dialog_new (variadic call)  (node at line 1520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_new"
		}"
		end

	gtk_file_chooser_dialog_get_type: NATURAL_64 is
 		-- gtk_file_chooser_dialog_get_type (node at line 19759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_get_type()"
		}"
		end


end -- class GTKFILECHOOSERDIALOG_EXTERNALS
