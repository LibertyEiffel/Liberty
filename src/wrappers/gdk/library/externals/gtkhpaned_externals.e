-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHPANED_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hpaned_new: POINTER is
 		-- gtk_hpaned_new (node at line 1699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hpaned_new()"
		}"
		end

	gtk_hpaned_get_type: NATURAL_32 is
 		-- gtk_hpaned_get_type (node at line 6845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hpaned_get_type()"
		}"
		end


end -- class GTKHPANED_EXTERNALS
