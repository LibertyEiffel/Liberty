-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKORIENTABLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_orientable_get_orientation (an_orientable: POINTER): INTEGER is
 		-- gtk_orientable_get_orientation (node at line 19074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_orientable_get_orientation"
		}"
		end

	gtk_orientable_set_orientation (an_orientable: POINTER; an_orientation: INTEGER) is
 		-- gtk_orientable_set_orientation (node at line 24243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_orientable_set_orientation"
		}"
		end

	gtk_orientable_get_type: NATURAL_32 is
 		-- gtk_orientable_get_type (node at line 37683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_orientable_get_type()"
		}"
		end


end -- class GTKORIENTABLE_EXTERNALS
