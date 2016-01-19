-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHSEPARATOR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hseparator_get_type: like long_unsigned is
 		-- gtk_hseparator_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hseparator_get_type()"
		}"
		end

	gtk_hseparator_new: POINTER is
 		-- gtk_hseparator_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hseparator_new()"
		}"
		end


end -- class GTKHSEPARATOR_EXTERNALS
