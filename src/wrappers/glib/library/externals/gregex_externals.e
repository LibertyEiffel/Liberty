-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GREGEX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_match_info_is_partial_match (a_match_info: POINTER): INTEGER_32 is
 		-- g_match_info_is_partial_match (node at line 12)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_is_partial_match"
		}"
		end

	g_regex_split_simple (a_pattern: POINTER; a_string: POINTER; a_compile_options: INTEGER; a_match_options: INTEGER): POINTER is
 		-- g_regex_split_simple (node at line 68)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_split_simple"
		}"
		end

	g_regex_get_string_number (a_regex: POINTER; a_name: POINTER): INTEGER_32 is
 		-- g_regex_get_string_number (node at line 229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_get_string_number"
		}"
		end

	g_match_info_get_regex (a_match_info: POINTER): POINTER is
 		-- g_match_info_get_regex (node at line 403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_get_regex"
		}"
		end

	g_regex_split (a_regex: POINTER; a_string: POINTER; a_match_options: INTEGER): POINTER is
 		-- g_regex_split (node at line 422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_split"
		}"
		end

	g_match_info_next (a_match_info: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_match_info_next (node at line 893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_next"
		}"
		end

	g_regex_match_full (a_regex: POINTER; a_string: POINTER; a_string_len: INTEGER_32; a_start_position: INTEGER_32; a_match_options: INTEGER; a_match_info: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_regex_match_full (node at line 1696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_match_full"
		}"
		end

	g_regex_escape_string (a_string: POINTER; a_length: INTEGER_32): POINTER is
 		-- g_regex_escape_string (node at line 1849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_escape_string"
		}"
		end

	g_regex_get_max_backref (a_regex: POINTER): INTEGER_32 is
 		-- g_regex_get_max_backref (node at line 1907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_get_max_backref"
		}"
		end

	g_regex_replace_literal (a_regex: POINTER; a_string: POINTER; a_string_len: INTEGER_32; a_start_position: INTEGER_32; a_replacement: POINTER; a_match_options: INTEGER; an_error: POINTER): POINTER is
 		-- g_regex_replace_literal (node at line 1926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_replace_literal"
		}"
		end

	g_regex_check_replacement (a_replacement: POINTER; a_has_references: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_regex_check_replacement (node at line 1964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_check_replacement"
		}"
		end

	g_regex_match (a_regex: POINTER; a_string: POINTER; a_match_options: INTEGER; a_match_info: POINTER): INTEGER_32 is
 		-- g_regex_match (node at line 2128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_match"
		}"
		end

	g_regex_error_quark: NATURAL_32 is
 		-- g_regex_error_quark (node at line 2262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_error_quark()"
		}"
		end

	g_regex_new (a_pattern: POINTER; a_compile_options: INTEGER; a_match_options: INTEGER; an_error: POINTER): POINTER is
 		-- g_regex_new (node at line 2385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_new"
		}"
		end

	g_regex_match_all (a_regex: POINTER; a_string: POINTER; a_match_options: INTEGER; a_match_info: POINTER): INTEGER_32 is
 		-- g_regex_match_all (node at line 2451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_match_all"
		}"
		end

	g_match_info_get_string (a_match_info: POINTER): POINTER is
 		-- g_match_info_get_string (node at line 2647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_get_string"
		}"
		end

	g_match_info_get_match_count (a_match_info: POINTER): INTEGER_32 is
 		-- g_match_info_get_match_count (node at line 2757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_get_match_count"
		}"
		end

	g_regex_replace (a_regex: POINTER; a_string: POINTER; a_string_len: INTEGER_32; a_start_position: INTEGER_32; a_replacement: POINTER; a_match_options: INTEGER; an_error: POINTER): POINTER is
 		-- g_regex_replace (node at line 2953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_replace"
		}"
		end

	g_match_info_expand_references (a_match_info: POINTER; a_string_to_expand: POINTER; an_error: POINTER): POINTER is
 		-- g_match_info_expand_references (node at line 4231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_expand_references"
		}"
		end

	g_regex_match_all_full (a_regex: POINTER; a_string: POINTER; a_string_len: INTEGER_32; a_start_position: INTEGER_32; a_match_options: INTEGER; a_match_info: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_regex_match_all_full (node at line 4593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_match_all_full"
		}"
		end

	g_match_info_fetch_all (a_match_info: POINTER): POINTER is
 		-- g_match_info_fetch_all (node at line 4655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_fetch_all"
		}"
		end

	g_match_info_matches (a_match_info: POINTER): INTEGER_32 is
 		-- g_match_info_matches (node at line 4856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_matches"
		}"
		end

	g_regex_get_pattern (a_regex: POINTER): POINTER is
 		-- g_regex_get_pattern (node at line 4934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_get_pattern"
		}"
		end

	g_match_info_free (a_match_info: POINTER) is
 		-- g_match_info_free (node at line 5143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_free"
		}"
		end

	g_regex_replace_eval (a_regex: POINTER; a_string: POINTER; a_string_len: INTEGER_32; a_start_position: INTEGER_32; a_match_options: INTEGER; an_eval: POINTER; an_user_data: POINTER; an_error: POINTER): POINTER is
 		-- g_regex_replace_eval (node at line 5235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_replace_eval"
		}"
		end

	g_match_info_fetch_named_pos (a_match_info: POINTER; a_name: POINTER; a_start_pos: POINTER; an_end_pos: POINTER): INTEGER_32 is
 		-- g_match_info_fetch_named_pos (node at line 5331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_fetch_named_pos"
		}"
		end

	g_regex_split_full (a_regex: POINTER; a_string: POINTER; a_string_len: INTEGER_32; a_start_position: INTEGER_32; a_match_options: INTEGER; a_max_tokens: INTEGER_32; an_error: POINTER): POINTER is
 		-- g_regex_split_full (node at line 5445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_split_full"
		}"
		end

	g_regex_unref (a_regex: POINTER) is
 		-- g_regex_unref (node at line 5702)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_unref"
		}"
		end

	g_regex_match_simple (a_pattern: POINTER; a_string: POINTER; a_compile_options: INTEGER; a_match_options: INTEGER): INTEGER_32 is
 		-- g_regex_match_simple (node at line 6007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_match_simple"
		}"
		end

	g_match_info_fetch (a_match_info: POINTER; a_match_num: INTEGER_32): POINTER is
 		-- g_match_info_fetch (node at line 6128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_fetch"
		}"
		end

	g_match_info_fetch_named (a_match_info: POINTER; a_name: POINTER): POINTER is
 		-- g_match_info_fetch_named (node at line 6314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_fetch_named"
		}"
		end

	g_regex_get_capture_count (a_regex: POINTER): INTEGER_32 is
 		-- g_regex_get_capture_count (node at line 6750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_get_capture_count"
		}"
		end

	g_match_info_fetch_pos (a_match_info: POINTER; a_match_num: INTEGER_32; a_start_pos: POINTER; an_end_pos: POINTER): INTEGER_32 is
 		-- g_match_info_fetch_pos (node at line 6817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_match_info_fetch_pos"
		}"
		end

	g_regex_ref (a_regex: POINTER): POINTER is
 		-- g_regex_ref (node at line 6885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_ref"
		}"
		end


end -- class GREGEX_EXTERNALS
