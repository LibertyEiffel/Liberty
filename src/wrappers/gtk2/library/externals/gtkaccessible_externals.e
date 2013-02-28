-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCESSIBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accessible_get_widget (an_accessible: POINTER): POINTER is
 		-- gtk_accessible_get_widget (node at line 1565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_get_widget"
		}"
		end

	gtk_accessible_set_widget (an_accessible: POINTER; a_widget: POINTER) is
 		-- gtk_accessible_set_widget (node at line 26545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_set_widget"
		}"
		end

	gtk_accessible_connect_widget_destroyed (an_accessible: POINTER) is
 		-- gtk_accessible_connect_widget_destroyed (node at line 36313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_connect_widget_destroyed"
		}"
		end

	gtk_accessible_get_type: NATURAL_64 is
 		-- gtk_accessible_get_type (node at line 39981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_get_type()"
		}"
		end


end -- class GTKACCESSIBLE_EXTERNALS
