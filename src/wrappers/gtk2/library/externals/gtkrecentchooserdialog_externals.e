-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSERDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_dialog_get_type: like long_unsigned is
 		-- gtk_recent_chooser_dialog_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_dialog_get_type()"
		}"
		end

	gtk_recent_chooser_dialog_new (a_title: POINTER; a_parent: POINTER; a_first_button_text: POINTER): POINTER is
 		-- gtk_recent_chooser_dialog_new (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_dialog_new"
		}"
		end

	gtk_recent_chooser_dialog_new_for_manager (a_title: POINTER; a_parent: POINTER; a_manager: POINTER; a_first_button_text: POINTER): POINTER is
 		-- gtk_recent_chooser_dialog_new_for_manager (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_dialog_new_for_manager"
		}"
		end


end -- class GTKRECENTCHOOSERDIALOG_EXTERNALS
