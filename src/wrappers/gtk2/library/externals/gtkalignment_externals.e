-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKALIGNMENT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_alignment_get_padding (an_alignment: POINTER; a_padding_top: POINTER; a_padding_bottom: POINTER; a_padding_left: POINTER; a_padding_right: POINTER) is
 		-- gtk_alignment_get_padding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_get_padding"
		}"
		end

	gtk_alignment_get_type: like long_unsigned is
 		-- gtk_alignment_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_get_type()"
		}"
		end

	gtk_alignment_new (a_xalign: REAL_32; a_yalign: REAL_32; a_xscale: REAL_32; a_yscale: REAL_32): POINTER is
 		-- gtk_alignment_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_new"
		}"
		end

	gtk_alignment_set (an_alignment: POINTER; a_xalign: REAL_32; a_yalign: REAL_32; a_xscale: REAL_32; a_yscale: REAL_32) is
 		-- gtk_alignment_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_set"
		}"
		end

	gtk_alignment_set_padding (an_alignment: POINTER; a_padding_top: NATURAL; a_padding_bottom: NATURAL; a_padding_left: NATURAL; a_padding_right: NATURAL) is
 		-- gtk_alignment_set_padding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_set_padding"
		}"
		end


end -- class GTKALIGNMENT_EXTERNALS
