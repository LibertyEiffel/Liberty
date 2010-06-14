-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVSEPARATOR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vseparator_get_type: NATURAL_32 is
 		-- gtk_vseparator_get_type (node at line 10265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vseparator_get_type()"
		}"
		end

	gtk_vseparator_new: POINTER is
 		-- gtk_vseparator_new (node at line 12595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vseparator_new()"
		}"
		end


end -- class GTKVSEPARATOR_EXTERNALS
