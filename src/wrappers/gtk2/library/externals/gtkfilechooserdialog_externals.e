-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_dialog_get_type: like long_unsigned is
 		-- gtk_file_chooser_dialog_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_get_type()"
		}"
		end

	gtk_file_chooser_dialog_new (a_title: POINTER; a_parent: POINTER; an_action: INTEGER; a_first_button_text: POINTER): POINTER is
 		-- gtk_file_chooser_dialog_new (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_dialog_new"
		}"
		end


end -- class GTKFILECHOOSERDIALOG_EXTERNALS
