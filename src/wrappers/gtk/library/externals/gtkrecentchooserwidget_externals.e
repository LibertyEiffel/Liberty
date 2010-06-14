-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSERWIDGET_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_widget_new: POINTER is
 		-- gtk_recent_chooser_widget_new (node at line 11542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_widget_new()"
		}"
		end

	gtk_recent_chooser_widget_new_for_manager (a_manager: POINTER): POINTER is
 		-- gtk_recent_chooser_widget_new_for_manager (node at line 28572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_widget_new_for_manager"
		}"
		end

	gtk_recent_chooser_widget_get_type: NATURAL_32 is
 		-- gtk_recent_chooser_widget_get_type (node at line 30439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_widget_get_type()"
		}"
		end


end -- class GTKRECENTCHOOSERWIDGET_EXTERNALS
