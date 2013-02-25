-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVPANED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vpaned_get_type: NATURAL_64 is
 		-- gtk_vpaned_get_type (node at line 30075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vpaned_get_type()"
		}"
		end

	gtk_vpaned_new: POINTER is
 		-- gtk_vpaned_new (node at line 39711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vpaned_new()"
		}"
		end


end -- class GTKVPANED_EXTERNALS
