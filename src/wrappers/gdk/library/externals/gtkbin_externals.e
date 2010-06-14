-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBIN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_bin_get_type: NATURAL_32 is
 		-- gtk_bin_get_type (node at line 18804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bin_get_type()"
		}"
		end

	gtk_bin_get_child (a_bin: POINTER): POINTER is
 		-- gtk_bin_get_child (node at line 24015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bin_get_child"
		}"
		end


end -- class GTKBIN_EXTERNALS
