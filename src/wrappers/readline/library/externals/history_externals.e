-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class HISTORY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	add_history (an_argument_l2165_c7: POINTER) is
 		-- add_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "add_history"
		}"
		end

	add_history_time (an_argument_l2852_c7: POINTER) is
 		-- add_history_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "add_history_time"
		}"
		end

	append_history (an_argument_l2348_c7: INTEGER; an_argument_l2349_c7: POINTER): INTEGER is
 		-- append_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "append_history"
		}"
		end

	clear_history is
 		-- clear_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clear_history()"
		}"
		end

	current_history: POINTER is
 		-- current_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "current_history()"
		}"
		end

	free_history_entry (an_argument_l2464_c7: POINTER): POINTER is
 		-- free_history_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "free_history_entry"
		}"
		end

	get_history_event (an_argument_l2240_c7: POINTER; an_argument_l2241_c7: POINTER; an_argument_l2242_c7: INTEGER): POINTER is
 		-- get_history_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "get_history_event"
		}"
		end

	history_arg_extract (an_argument_l2195_c7: INTEGER; an_argument_l2196_c7: INTEGER; an_argument_l2197_c7: POINTER): POINTER is
 		-- history_arg_extract
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_arg_extract"
		}"
		end

	history_base: INTEGER is
 		-- history_base
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_base"
		}"
		end

	address_of_history_base: POINTER is
 		-- Address of history_base
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_base"
		}"
		end

	set_history_base (a_value: INTEGER) is
		-- Set variable history_base value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_base"
		}"
		end

	history_comment_char: CHARACTER is
 		-- history_comment_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_comment_char"
		}"
		end

	address_of_history_comment_char: POINTER is
 		-- Address of history_comment_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_comment_char"
		}"
		end

	set_history_comment_char (a_value: CHARACTER) is
		-- Set variable history_comment_char value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_comment_char"
		}"
		end

	history_expand (an_argument_l1942_c7: POINTER; an_argument_l1943_c7: POINTER): INTEGER is
 		-- history_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_expand"
		}"
		end

	history_expansion_char: CHARACTER is
 		-- history_expansion_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_expansion_char"
		}"
		end

	address_of_history_expansion_char: POINTER is
 		-- Address of history_expansion_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_expansion_char"
		}"
		end

	set_history_expansion_char (a_value: CHARACTER) is
		-- Set variable history_expansion_char value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_expansion_char"
		}"
		end

	history_get (an_argument_l2626_c7: INTEGER): POINTER is
 		-- history_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_get"
		}"
		end

	history_get_history_state: POINTER is
 		-- history_get_history_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_get_history_state()"
		}"
		end

	history_get_time (an_argument_l2409_c7: POINTER): like long is
 		-- history_get_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_get_time"
		}"
		end

	history_inhibit_expansion_function: POINTER is
 		-- history_inhibit_expansion_function
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_inhibit_expansion_function"
		}"
		end

	address_of_history_inhibit_expansion_function: POINTER is
 		-- Address of history_inhibit_expansion_function
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_inhibit_expansion_function"
		}"
		end

	set_history_inhibit_expansion_function (a_value: POINTER) is
		-- Set variable history_inhibit_expansion_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_inhibit_expansion_function"
		}"
		end

	history_is_stifled: INTEGER is
 		-- history_is_stifled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_is_stifled()"
		}"
		end

	history_length: INTEGER is
 		-- history_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_length"
		}"
		end

	address_of_history_length: POINTER is
 		-- Address of history_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_length"
		}"
		end

	set_history_length (a_value: INTEGER) is
		-- Set variable history_length value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_length"
		}"
		end

	history_list: POINTER is
 		-- history_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_list()"
		}"
		end

	history_max_entries: INTEGER is
 		-- history_max_entries
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_max_entries"
		}"
		end

	address_of_history_max_entries: POINTER is
 		-- Address of history_max_entries
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_max_entries"
		}"
		end

	set_history_max_entries (a_value: INTEGER) is
		-- Set variable history_max_entries value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_max_entries"
		}"
		end

	history_no_expand_chars: POINTER is
 		-- history_no_expand_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_no_expand_chars"
		}"
		end

	address_of_history_no_expand_chars: POINTER is
 		-- Address of history_no_expand_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_no_expand_chars"
		}"
		end

	set_history_no_expand_chars (a_value: POINTER) is
		-- Set variable history_no_expand_chars value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_no_expand_chars"
		}"
		end

	history_quotes_inhibit_expansion: INTEGER is
 		-- history_quotes_inhibit_expansion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_quotes_inhibit_expansion"
		}"
		end

	address_of_history_quotes_inhibit_expansion: POINTER is
 		-- Address of history_quotes_inhibit_expansion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_quotes_inhibit_expansion"
		}"
		end

	set_history_quotes_inhibit_expansion (a_value: INTEGER) is
		-- Set variable history_quotes_inhibit_expansion value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_quotes_inhibit_expansion"
		}"
		end

	history_search (an_argument_l263_c7: POINTER; an_argument_l264_c7: INTEGER): INTEGER is
 		-- history_search
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search"
		}"
		end

	history_search_delimiter_chars: POINTER is
 		-- history_search_delimiter_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search_delimiter_chars"
		}"
		end

	address_of_history_search_delimiter_chars: POINTER is
 		-- Address of history_search_delimiter_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_search_delimiter_chars"
		}"
		end

	set_history_search_delimiter_chars (a_value: POINTER) is
		-- Set variable history_search_delimiter_chars value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_search_delimiter_chars"
		}"
		end

	history_search_pos (an_argument_l2607_c7: POINTER; an_argument_l2608_c7: INTEGER; an_argument_l2609_c7: INTEGER): INTEGER is
 		-- history_search_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search_pos"
		}"
		end

	history_search_prefix (an_argument_l2001_c7: POINTER; an_argument_l2002_c7: INTEGER): INTEGER is
 		-- history_search_prefix
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_search_prefix"
		}"
		end

	history_set_history_state (an_argument_l838_c7: POINTER) is
 		-- history_set_history_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_set_history_state"
		}"
		end

	history_set_pos (an_argument_l1819_c7: INTEGER): INTEGER is
 		-- history_set_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_set_pos"
		}"
		end

	history_subst_char: CHARACTER is
 		-- history_subst_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_subst_char"
		}"
		end

	address_of_history_subst_char: POINTER is
 		-- Address of history_subst_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_subst_char"
		}"
		end

	set_history_subst_char (a_value: CHARACTER) is
		-- Set variable history_subst_char value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_subst_char"
		}"
		end

	history_tokenize (an_argument_l2792_c7: POINTER): POINTER is
 		-- history_tokenize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_tokenize"
		}"
		end

	history_total_bytes: INTEGER is
 		-- history_total_bytes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_total_bytes()"
		}"
		end

	history_truncate_file (an_argument_l1925_c7: POINTER; an_argument_l1926_c7: INTEGER): INTEGER is
 		-- history_truncate_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_truncate_file"
		}"
		end

	history_word_delimiters: POINTER is
 		-- history_word_delimiters
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_word_delimiters"
		}"
		end

	address_of_history_word_delimiters: POINTER is
 		-- Address of history_word_delimiters
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_word_delimiters"
		}"
		end

	set_history_word_delimiters (a_value: POINTER) is
		-- Set variable history_word_delimiters value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_word_delimiters"
		}"
		end

	history_write_timestamps: INTEGER is
 		-- history_write_timestamps
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_write_timestamps"
		}"
		end

	address_of_history_write_timestamps: POINTER is
 		-- Address of history_write_timestamps
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&history_write_timestamps"
		}"
		end

	set_history_write_timestamps (a_value: INTEGER) is
		-- Set variable history_write_timestamps value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_history_write_timestamps"
		}"
		end

	max_input_history: INTEGER is
 		-- max_input_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "max_input_history"
		}"
		end

	address_of_max_input_history: POINTER is
 		-- Address of max_input_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&max_input_history"
		}"
		end

	set_max_input_history (a_value: INTEGER) is
		-- Set variable max_input_history value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_max_input_history"
		}"
		end

	next_history: POINTER is
 		-- next_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "next_history()"
		}"
		end

	previous_history: POINTER is
 		-- previous_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "previous_history()"
		}"
		end

	read_history (an_argument_l2147_c7: POINTER): INTEGER is
 		-- read_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "read_history"
		}"
		end

	read_history_range (an_argument_l66_c7: POINTER; an_argument_l67_c7: INTEGER; an_argument_l68_c7: INTEGER): INTEGER is
 		-- read_history_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "read_history_range"
		}"
		end

	remove_history (an_argument_l2282_c7: INTEGER): POINTER is
 		-- remove_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remove_history"
		}"
		end

	replace_history_entry (an_argument_l2252_c7: INTEGER; an_argument_l2253_c7: POINTER; an_argument_l2254_c7: POINTER): POINTER is
 		-- replace_history_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "replace_history_entry"
		}"
		end

	stifle_history (an_argument_l2836_c7: INTEGER) is
 		-- stifle_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stifle_history"
		}"
		end

	unstifle_history: INTEGER is
 		-- unstifle_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unstifle_history()"
		}"
		end

	using_history is
 		-- using_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "using_history()"
		}"
		end

	where_history: INTEGER is
 		-- where_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "where_history()"
		}"
		end

	write_history (an_argument_l2758_c7: POINTER): INTEGER is
 		-- write_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "write_history"
		}"
		end


end -- class HISTORY_EXTERNALS
