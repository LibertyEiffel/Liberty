-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDRAWINGAREA_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_drawing_area_size (a_darea: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_drawing_area_size (node at line 1545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drawing_area_size"
		}"
		end

	gtk_drawing_area_get_type: NATURAL_32 is
 		-- gtk_drawing_area_get_type (node at line 7248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drawing_area_get_type()"
		}"
		end

	gtk_drawing_area_new: POINTER is
 		-- gtk_drawing_area_new (node at line 14454)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drawing_area_new()"
		}"
		end


end -- class GTKDRAWINGAREA_EXTERNALS
