-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSERWIDGET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_widget_get_type: like long_unsigned is
 		-- gtk_recent_chooser_widget_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_widget_get_type()"
		}"
		end

	gtk_recent_chooser_widget_new: POINTER is
 		-- gtk_recent_chooser_widget_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_widget_new()"
		}"
		end

	gtk_recent_chooser_widget_new_for_manager (a_manager: POINTER): POINTER is
 		-- gtk_recent_chooser_widget_new_for_manager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_widget_new_for_manager"
		}"
		end


end -- class GTKRECENTCHOOSERWIDGET_EXTERNALS
