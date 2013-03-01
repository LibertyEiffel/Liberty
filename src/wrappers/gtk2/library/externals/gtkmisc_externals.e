-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMISC_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_misc_get_padding (a_misc: POINTER; a_xpad: POINTER; a_ypad: POINTER) is
 		-- gtk_misc_get_padding (node at line 29633)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_get_padding"
		}"
		end

	gtk_misc_set_alignment (a_misc: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_misc_set_alignment (node at line 35170)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_set_alignment"
		}"
		end

	gtk_misc_set_padding (a_misc: POINTER; a_xpad: INTEGER_32; a_ypad: INTEGER_32) is
 		-- gtk_misc_set_padding (node at line 36211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_set_padding"
		}"
		end

	gtk_misc_get_type: NATURAL_64 is
 		-- gtk_misc_get_type (node at line 37831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_get_type()"
		}"
		end

	gtk_misc_get_alignment (a_misc: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_misc_get_alignment (node at line 41188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_get_alignment"
		}"
		end


end -- class GTKMISC_EXTERNALS
