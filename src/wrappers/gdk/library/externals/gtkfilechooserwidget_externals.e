-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERWIDGET_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_widget_new_with_backend (an_action: INTEGER; a_backend: POINTER): POINTER is
 		-- gtk_file_chooser_widget_new_with_backend (node at line 10167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_widget_new_with_backend"
		}"
		end

	gtk_file_chooser_widget_get_type: NATURAL_32 is
 		-- gtk_file_chooser_widget_get_type (node at line 14517)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_widget_get_type()"
		}"
		end

	gtk_file_chooser_widget_new (an_action: INTEGER): POINTER is
 		-- gtk_file_chooser_widget_new (node at line 26415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_widget_new"
		}"
		end


end -- class GTKFILECHOOSERWIDGET_EXTERNALS
