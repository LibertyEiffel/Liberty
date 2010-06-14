-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHRULER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hruler_get_type: NATURAL_32 is
 		-- gtk_hruler_get_type (node at line 4556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hruler_get_type()"
		}"
		end

	gtk_hruler_new: POINTER is
 		-- gtk_hruler_new (node at line 37507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hruler_new()"
		}"
		end


end -- class GTKHRULER_EXTERNALS
