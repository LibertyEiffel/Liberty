-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKALIGNMENT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_alignment_get_padding (an_alignment: POINTER; a_padding_top: POINTER; a_padding_bottom: POINTER; a_padding_left: POINTER; a_padding_right: POINTER) is
 		-- gtk_alignment_get_padding (node at line 13502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_get_padding"
		}"
		end

	gtk_alignment_new (a_xalign: REAL_32; a_yalign: REAL_32; a_xscale: REAL_32; a_yscale: REAL_32): POINTER is
 		-- gtk_alignment_new (node at line 19406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_new"
		}"
		end

	gtk_alignment_set_padding (an_alignment: POINTER; a_padding_top: NATURAL_32; a_padding_bottom: NATURAL_32; a_padding_left: NATURAL_32; a_padding_right: NATURAL_32) is
 		-- gtk_alignment_set_padding (node at line 20220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_set_padding"
		}"
		end

	gtk_alignment_set (an_alignment: POINTER; a_xalign: REAL_32; a_yalign: REAL_32; a_xscale: REAL_32; a_yscale: REAL_32) is
 		-- gtk_alignment_set (node at line 33460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_set"
		}"
		end

	gtk_alignment_get_type: NATURAL_64 is
 		-- gtk_alignment_get_type (node at line 34804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_get_type()"
		}"
		end


end -- class GTKALIGNMENT_EXTERNALS
