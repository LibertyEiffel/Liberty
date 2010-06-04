-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class HISTORY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	read_history_range (an_argument_l64_c7: POINTER; an_argument_l65_c7: INTEGER_32; an_argument_l66_c7: INTEGER_32): INTEGER_32 is
 		-- read_history_range (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "read_history_range"
		}"
		end

	where_history: INTEGER_32 is
 		-- where_history (node at line 185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "where_history()"
		}"
		end

	history_search (an_argument_l247_c7: POINTER; an_argument_l248_c7: INTEGER_32): INTEGER_32 is
 		-- history_search (node at line 246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search"
		}"
		end

	next_history: POINTER is
 		-- next_history (node at line 381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "next_history()"
		}"
		end

	using_history is
 		-- using_history (node at line 473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "using_history()"
		}"
		end

	history_is_stifled: INTEGER_32 is
 		-- history_is_stifled (node at line 788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_is_stifled()"
		}"
		end

	history_set_history_state (an_argument_l825_c7: POINTER) is
 		-- history_set_history_state (node at line 824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_set_history_state"
		}"
		end

	clear_history is
 		-- clear_history (node at line 1102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clear_history()"
		}"
		end

	history_total_bytes: INTEGER_32 is
 		-- history_total_bytes (node at line 1245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_total_bytes()"
		}"
		end

	history_list: POINTER is
 		-- history_list (node at line 1524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_list()"
		}"
		end

	history_set_pos (an_argument_l1796_c7: INTEGER_32): INTEGER_32 is
 		-- history_set_pos (node at line 1795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_set_pos"
		}"
		end

	history_truncate_file (an_argument_l1906_c7: POINTER; an_argument_l1907_c7: INTEGER_32): INTEGER_32 is
 		-- history_truncate_file (node at line 1905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_truncate_file"
		}"
		end

	history_expand (an_argument_l1923_c7: POINTER; an_argument_l1924_c7: POINTER): INTEGER_32 is
 		-- history_expand (node at line 1922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_expand"
		}"
		end

	current_history: POINTER is
 		-- current_history (node at line 1939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "current_history()"
		}"
		end

	history_get_history_state: POINTER is
 		-- history_get_history_state (node at line 1958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_get_history_state()"
		}"
		end

	history_search_prefix (an_argument_l1979_c7: POINTER; an_argument_l1980_c7: INTEGER_32): INTEGER_32 is
 		-- history_search_prefix (node at line 1978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search_prefix"
		}"
		end

	read_history (an_argument_l2126_c7: POINTER): INTEGER_32 is
 		-- read_history (node at line 2125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "read_history"
		}"
		end

	add_history (an_argument_l2144_c7: POINTER) is
 		-- add_history (node at line 2143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "add_history"
		}"
		end

	history_arg_extract (an_argument_l2174_c7: INTEGER_32; an_argument_l2175_c7: INTEGER_32; an_argument_l2176_c7: POINTER): POINTER is
 		-- history_arg_extract (node at line 2173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_arg_extract"
		}"
		end

	get_history_event (an_argument_l2215_c7: POINTER; an_argument_l2216_c7: POINTER; an_argument_l2217_c7: INTEGER_32): POINTER is
 		-- get_history_event (node at line 2214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "get_history_event"
		}"
		end

	replace_history_entry (an_argument_l2232_c7: INTEGER_32; an_argument_l2233_c7: POINTER; an_argument_l2234_c7: POINTER): POINTER is
 		-- replace_history_entry (node at line 2231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "replace_history_entry"
		}"
		end

	remove_history (an_argument_l2261_c7: INTEGER_32): POINTER is
 		-- remove_history (node at line 2260)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remove_history"
		}"
		end

	append_history (an_argument_l2331_c7: INTEGER_32; an_argument_l2332_c7: POINTER): INTEGER_32 is
 		-- append_history (node at line 2330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "append_history"
		}"
		end

	unstifle_history: INTEGER_32 is
 		-- unstifle_history (node at line 2356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unstifle_history()"
		}"
		end

	history_get_time (an_argument_l2392_c7: POINTER): INTEGER_32 is
 		-- history_get_time (node at line 2391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_get_time"
		}"
		end

	free_history_entry (an_argument_l2451_c7: POINTER): POINTER is
 		-- free_history_entry (node at line 2450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "free_history_entry"
		}"
		end

	history_search_pos (an_argument_l2594_c7: POINTER; an_argument_l2595_c7: INTEGER_32; an_argument_l2596_c7: INTEGER_32): INTEGER_32 is
 		-- history_search_pos (node at line 2593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search_pos"
		}"
		end

	history_get (an_argument_l2613_c7: INTEGER_32): POINTER is
 		-- history_get (node at line 2612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_get"
		}"
		end

	write_history (an_argument_l2745_c7: POINTER): INTEGER_32 is
 		-- write_history (node at line 2744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "write_history"
		}"
		end

	previous_history: POINTER is
 		-- previous_history (node at line 2775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "previous_history()"
		}"
		end

	history_tokenize (an_argument_l2781_c7: POINTER): POINTER is
 		-- history_tokenize (node at line 2780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_tokenize"
		}"
		end

	stifle_history (an_argument_l2825_c7: INTEGER_32) is
 		-- stifle_history (node at line 2824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stifle_history"
		}"
		end

	add_history_time (an_argument_l2841_c7: POINTER) is
 		-- add_history_time (node at line 2840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "add_history_time"
		}"
		end

feature {} -- Variables
	history_word_delimiters: POINTER is
 		-- history_word_delimiters (node at line 247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_word_delimiters"
		}"
		end

	history_search_delimiter_chars: POINTER is
 		-- history_search_delimiter_chars (node at line 250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search_delimiter_chars"
		}"
		end

	max_input_history: INTEGER_32 is
 		-- max_input_history (node at line 256)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "max_input_history"
		}"
		end

	history_base: INTEGER_32 is
 		-- history_base (node at line 242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_base"
		}"
		end

	history_subst_char: CHARACTER is
 		-- history_subst_char (node at line 246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_subst_char"
		}"
		end

	history_max_entries: INTEGER_32 is
 		-- history_max_entries (node at line 244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_max_entries"
		}"
		end

	history_inhibit_expansion_function: POINTER is
 		-- history_inhibit_expansion_function (node at line 261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_inhibit_expansion_function"
		}"
		end

	history_length: INTEGER_32 is
 		-- history_length (node at line 243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_length"
		}"
		end

	history_expansion_char: CHARACTER is
 		-- history_expansion_char (node at line 245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_expansion_char"
		}"
		end

	history_no_expand_chars: POINTER is
 		-- history_no_expand_chars (node at line 249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_no_expand_chars"
		}"
		end

	history_write_timestamps: INTEGER_32 is
 		-- history_write_timestamps (node at line 253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_write_timestamps"
		}"
		end

	history_comment_char: CHARACTER is
 		-- history_comment_char (node at line 248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_comment_char"
		}"
		end

	history_quotes_inhibit_expansion: INTEGER_32 is
 		-- history_quotes_inhibit_expansion (node at line 251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_quotes_inhibit_expansion"
		}"
		end


end -- class HISTORY_EXTERNALS
