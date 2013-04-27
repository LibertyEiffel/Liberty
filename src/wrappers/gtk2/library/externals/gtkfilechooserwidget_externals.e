-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERWIDGET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_widget_get_type: like long_unsigned is
 		-- gtk_file_chooser_widget_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_widget_get_type()"
		}"
		end

	gtk_file_chooser_widget_new (an_action: INTEGER): POINTER is
 		-- gtk_file_chooser_widget_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_widget_new"
		}"
		end


end -- class GTKFILECHOOSERWIDGET_EXTERNALS
