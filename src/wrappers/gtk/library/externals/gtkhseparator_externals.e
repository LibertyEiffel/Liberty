-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHSEPARATOR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hseparator_get_type: NATURAL_32 is
 		-- gtk_hseparator_get_type (node at line 17488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hseparator_get_type()"
		}"
		end

	gtk_hseparator_new: POINTER is
 		-- gtk_hseparator_new (node at line 24613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hseparator_new()"
		}"
		end


end -- class GTKHSEPARATOR_EXTERNALS
