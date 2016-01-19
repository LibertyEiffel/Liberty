-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBIN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_bin_get_child (a_bin: POINTER): POINTER is
 		-- gtk_bin_get_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bin_get_child"
		}"
		end

	gtk_bin_get_type: like long_unsigned is
 		-- gtk_bin_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bin_get_type()"
		}"
		end


end -- class GTKBIN_EXTERNALS
