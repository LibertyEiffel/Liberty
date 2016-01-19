-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVSEPARATOR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vseparator_get_type: like long_unsigned is
 		-- gtk_vseparator_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vseparator_get_type()"
		}"
		end

	gtk_vseparator_new: POINTER is
 		-- gtk_vseparator_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vseparator_new()"
		}"
		end


end -- class GTKVSEPARATOR_EXTERNALS
