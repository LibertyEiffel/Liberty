-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class HISTORY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	add_history (an_argument_l2214_c7: POINTER) 

		-- function add_history (in `/usr/include/readline/history.h')
               -- add_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "add_history"
               }"
               end

	add_history_time (an_argument_l2217_c7: POINTER) 

		-- function add_history_time (in `/usr/include/readline/history.h')
               -- add_history_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "add_history_time"
               }"
               end

	append_history (an_argument_l2276_c7: INTEGER; an_argument_l2277_c7: POINTER): INTEGER 

		-- function append_history (in `/usr/include/readline/history.h')
               -- append_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "append_history"
               }"
               end

	clear_history 

		-- function clear_history (in `/usr/include/readline/history.h')
               -- clear_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clear_history"
               }"
               end

	current_history: POINTER 

		-- function current_history (in `/usr/include/readline/history.h')
               -- current_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "current_history"
               }"
               end

	free_history_entry (an_argument_l2223_c7: POINTER): POINTER 

		-- function free_history_entry (in `/usr/include/readline/history.h')
               -- free_history_entry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "free_history_entry"
               }"
               end

	get_history_event (an_argument_l2293_c7: POINTER; an_argument_l2294_c7: POINTER; an_argument_l2295_c7: INTEGER): POINTER 

		-- function get_history_event (in `/usr/include/readline/history.h')
               -- get_history_event
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "get_history_event"
               }"
               end

	history_arg_extract (an_argument_l2288_c7: INTEGER; an_argument_l2289_c7: INTEGER; an_argument_l2290_c7: POINTER): POINTER 

		-- function history_arg_extract (in `/usr/include/readline/history.h')
               -- history_arg_extract
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_arg_extract"
               }"
               end

	history_base: INTEGER
               -- history_base
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_base"
               }"
               end

       address_of_history_base: POINTER
               -- Address of history_base
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_base"
               }"
               end

       set_history_base (a_value: INTEGER)
               -- Set variable history_base value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_base"
               }"
               end

	history_comment_char: CHARACTER
               -- history_comment_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_comment_char"
               }"
               end

       address_of_history_comment_char: POINTER
               -- Address of history_comment_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_comment_char"
               }"
               end

       set_history_comment_char (a_value: CHARACTER)
               -- Set variable history_comment_char value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_comment_char"
               }"
               end

	history_expand (an_argument_l2284_c7: POINTER; an_argument_l2285_c7: POINTER): INTEGER 

		-- function history_expand (in `/usr/include/readline/history.h')
               -- history_expand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_expand"
               }"
               end

	history_expansion_char: CHARACTER
               -- history_expansion_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_expansion_char"
               }"
               end

       address_of_history_expansion_char: POINTER
               -- Address of history_expansion_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_expansion_char"
               }"
               end

       set_history_expansion_char (a_value: CHARACTER)
               -- Set variable history_expansion_char value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_expansion_char"
               }"
               end

	history_get (an_argument_l2240_c7: INTEGER): POINTER 

		-- function history_get (in `/usr/include/readline/history.h')
               -- history_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_get"
               }"
               end

	history_get_history_state: POINTER 

		-- function history_get_history_state (in `/usr/include/readline/history.h')
               -- history_get_history_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_get_history_state"
               }"
               end

	history_get_time (an_argument_l2243_c7: POINTER): like long 

		-- function history_get_time (in `/usr/include/readline/history.h')
               -- history_get_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_get_time"
               }"
               end

	history_inhibit_expansion_function: POINTER
               -- history_inhibit_expansion_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_inhibit_expansion_function"
               }"
               end

       address_of_history_inhibit_expansion_function: POINTER
               -- Address of history_inhibit_expansion_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_inhibit_expansion_function"
               }"
               end

       set_history_inhibit_expansion_function (a_value: POINTER)
               -- Set variable history_inhibit_expansion_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_inhibit_expansion_function"
               }"
               end

	history_is_stifled: INTEGER 

		-- function history_is_stifled (in `/usr/include/readline/history.h')
               -- history_is_stifled
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_is_stifled"
               }"
               end

	history_length: INTEGER
               -- history_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_length"
               }"
               end

       address_of_history_length: POINTER
               -- Address of history_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_length"
               }"
               end

       set_history_length (a_value: INTEGER)
               -- Set variable history_length value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_length"
               }"
               end

	history_list: POINTER 

		-- function history_list (in `/usr/include/readline/history.h')
               -- history_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_list"
               }"
               end

	history_max_entries: INTEGER
               -- history_max_entries
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_max_entries"
               }"
               end

       address_of_history_max_entries: POINTER
               -- Address of history_max_entries
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_max_entries"
               }"
               end

       set_history_max_entries (a_value: INTEGER)
               -- Set variable history_max_entries value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_max_entries"
               }"
               end

	history_no_expand_chars: POINTER
               -- history_no_expand_chars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_no_expand_chars"
               }"
               end

       address_of_history_no_expand_chars: POINTER
               -- Address of history_no_expand_chars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_no_expand_chars"
               }"
               end

       set_history_no_expand_chars (a_value: POINTER)
               -- Set variable history_no_expand_chars value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_no_expand_chars"
               }"
               end

	history_quotes_inhibit_expansion: INTEGER
               -- history_quotes_inhibit_expansion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_quotes_inhibit_expansion"
               }"
               end

       address_of_history_quotes_inhibit_expansion: POINTER
               -- Address of history_quotes_inhibit_expansion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_quotes_inhibit_expansion"
               }"
               end

       set_history_quotes_inhibit_expansion (a_value: INTEGER)
               -- Set variable history_quotes_inhibit_expansion value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_quotes_inhibit_expansion"
               }"
               end

	history_search (an_argument_l2252_c7: POINTER; an_argument_l2253_c7: INTEGER): INTEGER 

		-- function history_search (in `/usr/include/readline/history.h')
               -- history_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_search"
               }"
               end

	history_search_delimiter_chars: POINTER
               -- history_search_delimiter_chars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_search_delimiter_chars"
               }"
               end

       address_of_history_search_delimiter_chars: POINTER
               -- Address of history_search_delimiter_chars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_search_delimiter_chars"
               }"
               end

       set_history_search_delimiter_chars (a_value: POINTER)
               -- Set variable history_search_delimiter_chars value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_search_delimiter_chars"
               }"
               end

	history_search_pos (an_argument_l2260_c7: POINTER; an_argument_l2261_c7: INTEGER; an_argument_l2262_c7: INTEGER): INTEGER 

		-- function history_search_pos (in `/usr/include/readline/history.h')
               -- history_search_pos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_search_pos"
               }"
               end

	history_search_prefix (an_argument_l2256_c7: POINTER; an_argument_l2257_c7: INTEGER): INTEGER 

		-- function history_search_prefix (in `/usr/include/readline/history.h')
               -- history_search_prefix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_search_prefix"
               }"
               end

	history_set_history_state (an_argument_l2211_c7: POINTER) 

		-- function history_set_history_state (in `/usr/include/readline/history.h')
               -- history_set_history_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_set_history_state"
               }"
               end

	history_set_pos (an_argument_l2247_c7: INTEGER): INTEGER 

		-- function history_set_pos (in `/usr/include/readline/history.h')
               -- history_set_pos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_set_pos"
               }"
               end

	history_subst_char: CHARACTER
               -- history_subst_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_subst_char"
               }"
               end

       address_of_history_subst_char: POINTER
               -- Address of history_subst_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_subst_char"
               }"
               end

       set_history_subst_char (a_value: CHARACTER)
               -- Set variable history_subst_char value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_subst_char"
               }"
               end

	history_tokenize (an_argument_l2298_c7: POINTER): POINTER 

		-- function history_tokenize (in `/usr/include/readline/history.h')
               -- history_tokenize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_tokenize"
               }"
               end

	history_total_bytes: INTEGER 

		-- function history_total_bytes (in `/usr/include/readline/history.h')
               -- history_total_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_total_bytes"
               }"
               end

	history_truncate_file (an_argument_l2280_c7: POINTER; an_argument_l2281_c7: INTEGER): INTEGER 

		-- function history_truncate_file (in `/usr/include/readline/history.h')
               -- history_truncate_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_truncate_file"
               }"
               end

	history_word_delimiters: POINTER
               -- history_word_delimiters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_word_delimiters"
               }"
               end

       address_of_history_word_delimiters: POINTER
               -- Address of history_word_delimiters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_word_delimiters"
               }"
               end

       set_history_word_delimiters (a_value: POINTER)
               -- Set variable history_word_delimiters value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_word_delimiters"
               }"
               end

	history_write_timestamps: INTEGER
               -- history_write_timestamps
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "history_write_timestamps"
               }"
               end

       address_of_history_write_timestamps: POINTER
               -- Address of history_write_timestamps
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&history_write_timestamps"
               }"
               end

       set_history_write_timestamps (a_value: INTEGER)
               -- Set variable history_write_timestamps value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_history_write_timestamps"
               }"
               end

	max_input_history: INTEGER
               -- max_input_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "max_input_history"
               }"
               end

       address_of_max_input_history: POINTER
               -- Address of max_input_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&max_input_history"
               }"
               end

       set_max_input_history (a_value: INTEGER)
               -- Set variable max_input_history value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_max_input_history"
               }"
               end

	next_history: POINTER 

		-- function next_history (in `/usr/include/readline/history.h')
               -- next_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "next_history"
               }"
               end

	previous_history: POINTER 

		-- function previous_history (in `/usr/include/readline/history.h')
               -- previous_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "previous_history"
               }"
               end

	read_history (an_argument_l2265_c7: POINTER): INTEGER 

		-- function read_history (in `/usr/include/readline/history.h')
               -- read_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "read_history"
               }"
               end

	read_history_range (an_argument_l2268_c7: POINTER; an_argument_l2269_c7: INTEGER; an_argument_l2270_c7: INTEGER): INTEGER 

		-- function read_history_range (in `/usr/include/readline/history.h')
               -- read_history_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "read_history_range"
               }"
               end

	remove_history (an_argument_l2220_c7: INTEGER): POINTER 

		-- function remove_history (in `/usr/include/readline/history.h')
               -- remove_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "remove_history"
               }"
               end

	replace_history_entry (an_argument_l2226_c7: INTEGER; an_argument_l2227_c7: POINTER; an_argument_l2228_c7: POINTER): POINTER 

		-- function replace_history_entry (in `/usr/include/readline/history.h')
               -- replace_history_entry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "replace_history_entry"
               }"
               end

	stifle_history (an_argument_l2232_c7: INTEGER) 

		-- function stifle_history (in `/usr/include/readline/history.h')
               -- stifle_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stifle_history"
               }"
               end

	unstifle_history: INTEGER 

		-- function unstifle_history (in `/usr/include/readline/history.h')
               -- unstifle_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unstifle_history"
               }"
               end

	using_history 

		-- function using_history (in `/usr/include/readline/history.h')
               -- using_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "using_history"
               }"
               end

	where_history: INTEGER 

		-- function where_history (in `/usr/include/readline/history.h')
               -- where_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "where_history"
               }"
               end

	write_history (an_argument_l2273_c7: POINTER): INTEGER 

		-- function write_history (in `/usr/include/readline/history.h')
               -- write_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "write_history"
               }"
               end


end -- class HISTORY_EXTERNALS
