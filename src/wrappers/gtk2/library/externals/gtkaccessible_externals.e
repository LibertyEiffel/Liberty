-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCESSIBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accessible_connect_widget_destroyed (an_accessible: POINTER) is
 		-- gtk_accessible_connect_widget_destroyed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_connect_widget_destroyed"
		}"
		end

	gtk_accessible_get_type: like long_unsigned is
 		-- gtk_accessible_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_get_type()"
		}"
		end

	gtk_accessible_get_widget (an_accessible: POINTER): POINTER is
 		-- gtk_accessible_get_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_get_widget"
		}"
		end

	gtk_accessible_set_widget (an_accessible: POINTER; a_widget: POINTER) is
 		-- gtk_accessible_set_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_set_widget"
		}"
		end


end -- class GTKACCESSIBLE_EXTERNALS
