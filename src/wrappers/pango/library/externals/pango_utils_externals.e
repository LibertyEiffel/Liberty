-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_UTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_version_string: POINTER is
 		-- pango_version_string (node at line 307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_version_string()"
		}"
		end

	pango_parse_weight (a_str: POINTER; a_weight: POINTER; a_warn: INTEGER_32): INTEGER_32 is
 		-- pango_parse_weight (node at line 612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_parse_weight"
		}"
		end

	pango_split_file_list (a_str: POINTER): POINTER is
 		-- pango_split_file_list (node at line 1370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_split_file_list"
		}"
		end

	pango_parse_variant (a_str: POINTER; a_variant_external: POINTER; a_warn: INTEGER_32): INTEGER_32 is
 		-- pango_parse_variant (node at line 1489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_parse_variant"
		}"
		end

	pango_scan_int (a_pos: POINTER; an_out_external: POINTER): INTEGER_32 is
 		-- pango_scan_int (node at line 1512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_scan_int"
		}"
		end

	pango_parse_enum (a_type: NATURAL_64; a_str: POINTER; a_value: POINTER; a_warn: INTEGER_32; a_possible_values: POINTER): INTEGER_32 is
 		-- pango_parse_enum (node at line 1597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_parse_enum"
		}"
		end

	pango_trim_string (a_str: POINTER): POINTER is
 		-- pango_trim_string (node at line 1973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_trim_string"
		}"
		end

	pango_read_line (a_stream: POINTER; a_str: POINTER): INTEGER_32 is
 		-- pango_read_line (node at line 2401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_read_line"
		}"
		end

	pango_quantize_line_geometry (a_thickness: POINTER; a_position: POINTER) is
 		-- pango_quantize_line_geometry (node at line 2659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_quantize_line_geometry"
		}"
		end

	pango_skip_space (a_pos: POINTER): INTEGER_32 is
 		-- pango_skip_space (node at line 3166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_skip_space"
		}"
		end

	pango_version_check (a_required_major: INTEGER_32; a_required_minor: INTEGER_32; a_required_micro: INTEGER_32): POINTER is
 		-- pango_version_check (node at line 5061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_version_check"
		}"
		end

	pango_scan_word (a_pos: POINTER; an_out_external: POINTER): INTEGER_32 is
 		-- pango_scan_word (node at line 6322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_scan_word"
		}"
		end

	pango_version: INTEGER_32 is
 		-- pango_version (node at line 7172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_version()"
		}"
		end

	pango_is_zero_width (a_ch: NATURAL_32): INTEGER_32 is
 		-- pango_is_zero_width (node at line 7376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_is_zero_width"
		}"
		end

	pango_parse_stretch (a_str: POINTER; a_stretch: POINTER; a_warn: INTEGER_32): INTEGER_32 is
 		-- pango_parse_stretch (node at line 7977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_parse_stretch"
		}"
		end

	pango_log2vis_get_embedding_levels (a_text: POINTER; a_length: INTEGER_32; a_pbase_dir: POINTER): POINTER is
 		-- pango_log2vis_get_embedding_levels (node at line 8849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_log2vis_get_embedding_levels"
		}"
		end

	pango_scan_string (a_pos: POINTER; an_out_external: POINTER): INTEGER_32 is
 		-- pango_scan_string (node at line 9715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_scan_string"
		}"
		end

	pango_parse_style (a_str: POINTER; a_style: POINTER; a_warn: INTEGER_32): INTEGER_32 is
 		-- pango_parse_style (node at line 9871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_parse_style"
		}"
		end


end -- class PANGO_UTILS_EXTERNALS
