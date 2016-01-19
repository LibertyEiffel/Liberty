-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GREGEX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_match_info_expand_references (a_match_info: POINTER; a_string_to_expand: POINTER; an_error: POINTER): POINTER 
               -- g_match_info_expand_references
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_expand_references"
               }"
               end

	g_match_info_fetch (a_match_info: POINTER; a_match_num: INTEGER): POINTER 
               -- g_match_info_fetch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_fetch"
               }"
               end

	g_match_info_fetch_all (a_match_info: POINTER): POINTER 
               -- g_match_info_fetch_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_fetch_all"
               }"
               end

	g_match_info_fetch_named (a_match_info: POINTER; a_name: POINTER): POINTER 
               -- g_match_info_fetch_named
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_fetch_named"
               }"
               end

	g_match_info_fetch_named_pos (a_match_info: POINTER; a_name: POINTER; a_start_pos: POINTER; an_end_pos: POINTER): INTEGER 
               -- g_match_info_fetch_named_pos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_fetch_named_pos"
               }"
               end

	g_match_info_fetch_pos (a_match_info: POINTER; a_match_num: INTEGER; a_start_pos: POINTER; an_end_pos: POINTER): INTEGER 
               -- g_match_info_fetch_pos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_fetch_pos"
               }"
               end

	g_match_info_free (a_match_info: POINTER) 
               -- g_match_info_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_free"
               }"
               end

	g_match_info_get_match_count (a_match_info: POINTER): INTEGER 
               -- g_match_info_get_match_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_get_match_count"
               }"
               end

	g_match_info_get_regex (a_match_info: POINTER): POINTER 
               -- g_match_info_get_regex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_get_regex"
               }"
               end

	g_match_info_get_string (a_match_info: POINTER): POINTER 
               -- g_match_info_get_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_get_string"
               }"
               end

	g_match_info_is_partial_match (a_match_info: POINTER): INTEGER 
               -- g_match_info_is_partial_match
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_is_partial_match"
               }"
               end

	g_match_info_matches (a_match_info: POINTER): INTEGER 
               -- g_match_info_matches
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_matches"
               }"
               end

	g_match_info_next (a_match_info: POINTER; an_error: POINTER): INTEGER 
               -- g_match_info_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_next"
               }"
               end

	g_match_info_ref (a_match_info: POINTER): POINTER 
               -- g_match_info_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_ref"
               }"
               end

	g_match_info_unref (a_match_info: POINTER) 
               -- g_match_info_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_match_info_unref"
               }"
               end

	g_regex_check_replacement (a_replacement: POINTER; a_has_references: POINTER; an_error: POINTER): INTEGER 
               -- g_regex_check_replacement
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_check_replacement"
               }"
               end

	g_regex_error_quark: NATURAL 
               -- g_regex_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_error_quark"
               }"
               end

	g_regex_escape_nul (a_string: POINTER; a_length: INTEGER): POINTER 
               -- g_regex_escape_nul
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_escape_nul"
               }"
               end

	g_regex_escape_string (a_string: POINTER; a_length: INTEGER): POINTER 
               -- g_regex_escape_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_escape_string"
               }"
               end

	g_regex_get_capture_count (a_regex: POINTER): INTEGER 
               -- g_regex_get_capture_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_capture_count"
               }"
               end

	g_regex_get_compile_flags (a_regex: POINTER): INTEGER 
               -- g_regex_get_compile_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_compile_flags"
               }"
               end

	g_regex_get_has_cr_or_lf (a_regex: POINTER): INTEGER 
               -- g_regex_get_has_cr_or_lf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_has_cr_or_lf"
               }"
               end

	g_regex_get_match_flags (a_regex: POINTER): INTEGER 
               -- g_regex_get_match_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_match_flags"
               }"
               end

	g_regex_get_max_backref (a_regex: POINTER): INTEGER 
               -- g_regex_get_max_backref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_max_backref"
               }"
               end

	g_regex_get_max_lookbehind (a_regex: POINTER): INTEGER 
               -- g_regex_get_max_lookbehind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_max_lookbehind"
               }"
               end

	g_regex_get_pattern (a_regex: POINTER): POINTER 
               -- g_regex_get_pattern
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_pattern"
               }"
               end

	g_regex_get_string_number (a_regex: POINTER; a_name: POINTER): INTEGER 
               -- g_regex_get_string_number
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_get_string_number"
               }"
               end

	g_regex_match (a_regex: POINTER; a_string: POINTER; a_match_options: INTEGER; a_match_info: POINTER): INTEGER 
               -- g_regex_match
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_match"
               }"
               end

	g_regex_match_all (a_regex: POINTER; a_string: POINTER; a_match_options: INTEGER; a_match_info: POINTER): INTEGER 
               -- g_regex_match_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_match_all"
               }"
               end

	g_regex_match_all_full (a_regex: POINTER; a_string: POINTER; a_string_len: like long; a_start_position: INTEGER; a_match_options: INTEGER; a_match_info: POINTER; an_error: POINTER): INTEGER 
               -- g_regex_match_all_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_match_all_full"
               }"
               end

	g_regex_match_full (a_regex: POINTER; a_string: POINTER; a_string_len: like long; a_start_position: INTEGER; a_match_options: INTEGER; a_match_info: POINTER; an_error: POINTER): INTEGER 
               -- g_regex_match_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_match_full"
               }"
               end

	g_regex_match_simple (a_pattern: POINTER; a_string: POINTER; a_compile_options: INTEGER; a_match_options: INTEGER): INTEGER 
               -- g_regex_match_simple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_match_simple"
               }"
               end

	g_regex_new (a_pattern: POINTER; a_compile_options: INTEGER; a_match_options: INTEGER; an_error: POINTER): POINTER 
               -- g_regex_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_new"
               }"
               end

	g_regex_ref (a_regex: POINTER): POINTER 
               -- g_regex_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_ref"
               }"
               end

	g_regex_replace (a_regex: POINTER; a_string: POINTER; a_string_len: like long; a_start_position: INTEGER; a_replacement: POINTER; a_match_options: INTEGER; an_error: POINTER): POINTER 
               -- g_regex_replace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_replace"
               }"
               end

	g_regex_replace_eval (a_regex: POINTER; a_string: POINTER; a_string_len: like long; a_start_position: INTEGER; a_match_options: INTEGER; an_eval: POINTER; an_user_data: POINTER; an_error: POINTER): POINTER 
               -- g_regex_replace_eval
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_replace_eval"
               }"
               end

	g_regex_replace_literal (a_regex: POINTER; a_string: POINTER; a_string_len: like long; a_start_position: INTEGER; a_replacement: POINTER; a_match_options: INTEGER; an_error: POINTER): POINTER 
               -- g_regex_replace_literal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_replace_literal"
               }"
               end

	g_regex_split (a_regex: POINTER; a_string: POINTER; a_match_options: INTEGER): POINTER 
               -- g_regex_split
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_split"
               }"
               end

	g_regex_split_full (a_regex: POINTER; a_string: POINTER; a_string_len: like long; a_start_position: INTEGER; a_match_options: INTEGER; a_max_tokens: INTEGER; an_error: POINTER): POINTER 
               -- g_regex_split_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_split_full"
               }"
               end

	g_regex_split_simple (a_pattern: POINTER; a_string: POINTER; a_compile_options: INTEGER; a_match_options: INTEGER): POINTER 
               -- g_regex_split_simple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_split_simple"
               }"
               end

	g_regex_unref (a_regex: POINTER) 
               -- g_regex_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_regex_unref"
               }"
               end


end -- class GREGEX_EXTERNALS
