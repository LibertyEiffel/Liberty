-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCESSIBLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accessible_connect_widget_destroyed (an_accessible: POINTER) is
 		-- gtk_accessible_connect_widget_destroyed (node at line 28857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_connect_widget_destroyed"
		}"
		end

	gtk_accessible_get_type: NATURAL_32 is
 		-- gtk_accessible_get_type (node at line 36340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_get_type()"
		}"
		end


end -- class GTKACCESSIBLE_EXTERNALS
