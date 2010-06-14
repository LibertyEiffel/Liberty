-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hbox_get_type: NATURAL_32 is
 		-- gtk_hbox_get_type (node at line 6143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbox_get_type()"
		}"
		end

	gtk_hbox_new (a_homogeneous: INTEGER_32; a_spacing: INTEGER_32): POINTER is
 		-- gtk_hbox_new (node at line 6841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbox_new"
		}"
		end


end -- class GTKHBOX_EXTERNALS
