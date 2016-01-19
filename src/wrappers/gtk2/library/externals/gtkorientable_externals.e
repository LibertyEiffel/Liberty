-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKORIENTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_orientable_get_orientation (an_orientable: POINTER): INTEGER is
 		-- gtk_orientable_get_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_orientable_get_orientation"
		}"
		end

	gtk_orientable_get_type: like long_unsigned is
 		-- gtk_orientable_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_orientable_get_type()"
		}"
		end

	gtk_orientable_set_orientation (an_orientable: POINTER; an_orientation: INTEGER) is
 		-- gtk_orientable_set_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_orientable_set_orientation"
		}"
		end


end -- class GTKORIENTABLE_EXTERNALS
