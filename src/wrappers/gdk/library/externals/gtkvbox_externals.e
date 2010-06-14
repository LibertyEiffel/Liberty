-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vbox_new (a_homogeneous: INTEGER_32; a_spacing: INTEGER_32): POINTER is
 		-- gtk_vbox_new (node at line 17022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbox_new"
		}"
		end

	gtk_vbox_get_type: NATURAL_32 is
 		-- gtk_vbox_get_type (node at line 18586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbox_get_type()"
		}"
		end


end -- class GTKVBOX_EXTERNALS
