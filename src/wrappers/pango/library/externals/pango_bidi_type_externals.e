-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_BIDI_TYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_unichar_direction (a_ch: NATURAL_32): INTEGER is
 		-- pango_unichar_direction (node at line 2729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_unichar_direction"
		}"
		end

	pango_get_mirror_char (a_ch: NATURAL_32; a_mirrored_ch: POINTER): INTEGER_32 is
 		-- pango_get_mirror_char (node at line 4136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_get_mirror_char"
		}"
		end

	pango_bidi_type_for_unichar (a_ch: NATURAL_32): INTEGER is
 		-- pango_bidi_type_for_unichar (node at line 4597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_bidi_type_for_unichar"
		}"
		end

	pango_find_base_dir (a_text: POINTER; a_length: INTEGER_32): INTEGER is
 		-- pango_find_base_dir (node at line 7382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_find_base_dir"
		}"
		end


end -- class PANGO_BIDI_TYPE_EXTERNALS
