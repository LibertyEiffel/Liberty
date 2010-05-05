-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSEQUENCE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_sequence_prepend (a_seq: POINTER; a_data: POINTER): POINTER is
 		-- g_sequence_prepend (node at line 92)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_prepend"
		}"
		end

	g_sequence_sort (a_seq: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER) is
 		-- g_sequence_sort (node at line 349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_sort"
		}"
		end

	g_sequence_iter_is_end (an_iter: POINTER): INTEGER_32 is
 		-- g_sequence_iter_is_end (node at line 1020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_is_end"
		}"
		end

	g_sequence_get_begin_iter (a_seq: POINTER): POINTER is
 		-- g_sequence_get_begin_iter (node at line 1026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_get_begin_iter"
		}"
		end

	g_sequence_set (an_iter: POINTER; a_data: POINTER) is
 		-- g_sequence_set (node at line 1115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_set"
		}"
		end

	g_sequence_get_iter_at_pos (a_seq: POINTER; a_pos: INTEGER_32): POINTER is
 		-- g_sequence_get_iter_at_pos (node at line 1740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_get_iter_at_pos"
		}"
		end

	g_sequence_remove_range (a_begin: POINTER; an_end_external: POINTER) is
 		-- g_sequence_remove_range (node at line 2053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_remove_range"
		}"
		end

	g_sequence_get_length (a_seq: POINTER): INTEGER_32 is
 		-- g_sequence_get_length (node at line 2100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_get_length"
		}"
		end

	g_sequence_free (a_seq: POINTER) is
 		-- g_sequence_free (node at line 2121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_free"
		}"
		end

	g_sequence_foreach (a_seq: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_sequence_foreach (node at line 2279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_foreach"
		}"
		end

	g_sequence_insert_sorted (a_seq: POINTER; a_data: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER): POINTER is
 		-- g_sequence_insert_sorted (node at line 3099)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_insert_sorted"
		}"
		end

	g_sequence_iter_next (an_iter: POINTER): POINTER is
 		-- g_sequence_iter_next (node at line 3141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_next"
		}"
		end

	g_sequence_sort_iter (a_seq: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER) is
 		-- g_sequence_sort_iter (node at line 3282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_sort_iter"
		}"
		end

	g_sequence_move_range (a_dest: POINTER; a_begin: POINTER; an_end_external: POINTER) is
 		-- g_sequence_move_range (node at line 3467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_move_range"
		}"
		end

	g_sequence_swap (an_a: POINTER; a_b: POINTER) is
 		-- g_sequence_swap (node at line 3503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_swap"
		}"
		end

	g_sequence_iter_compare (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- g_sequence_iter_compare (node at line 3657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_compare"
		}"
		end

	g_sequence_insert_sorted_iter (a_seq: POINTER; a_data: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER): POINTER is
 		-- g_sequence_insert_sorted_iter (node at line 3961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_insert_sorted_iter"
		}"
		end

	g_sequence_sort_changed (an_iter: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER) is
 		-- g_sequence_sort_changed (node at line 4143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_sort_changed"
		}"
		end

	g_sequence_remove (an_iter: POINTER) is
 		-- g_sequence_remove (node at line 4288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_remove"
		}"
		end

	g_sequence_foreach_range (a_begin: POINTER; an_end_external: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_sequence_foreach_range (node at line 4311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_foreach_range"
		}"
		end

	g_sequence_search (a_seq: POINTER; a_data: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER): POINTER is
 		-- g_sequence_search (node at line 4501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_search"
		}"
		end

	g_sequence_search_iter (a_seq: POINTER; a_data: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER): POINTER is
 		-- g_sequence_search_iter (node at line 4511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_search_iter"
		}"
		end

	g_sequence_iter_prev (an_iter: POINTER): POINTER is
 		-- g_sequence_iter_prev (node at line 4577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_prev"
		}"
		end

	g_sequence_get_end_iter (a_seq: POINTER): POINTER is
 		-- g_sequence_get_end_iter (node at line 5077)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_get_end_iter"
		}"
		end

	g_sequence_move (a_src: POINTER; a_dest: POINTER) is
 		-- g_sequence_move (node at line 5222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_move"
		}"
		end

	g_sequence_new (a_data_destroy: POINTER): POINTER is
 		-- g_sequence_new (node at line 5464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_new"
		}"
		end

	g_sequence_iter_move (an_iter: POINTER; a_delta: INTEGER_32): POINTER is
 		-- g_sequence_iter_move (node at line 5743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_move"
		}"
		end

	g_sequence_append (a_seq: POINTER; a_data: POINTER): POINTER is
 		-- g_sequence_append (node at line 5941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_append"
		}"
		end

	g_sequence_get (an_iter: POINTER): POINTER is
 		-- g_sequence_get (node at line 5945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_get"
		}"
		end

	g_sequence_sort_changed_iter (an_iter: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER) is
 		-- g_sequence_sort_changed_iter (node at line 6455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_sort_changed_iter"
		}"
		end

	g_sequence_insert_before (an_iter: POINTER; a_data: POINTER): POINTER is
 		-- g_sequence_insert_before (node at line 6551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_insert_before"
		}"
		end

	g_sequence_range_get_midpoint (a_begin: POINTER; an_end_external: POINTER): POINTER is
 		-- g_sequence_range_get_midpoint (node at line 6693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_range_get_midpoint"
		}"
		end

	g_sequence_iter_get_position (an_iter: POINTER): INTEGER_32 is
 		-- g_sequence_iter_get_position (node at line 6704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_get_position"
		}"
		end

	g_sequence_iter_get_sequence (an_iter: POINTER): POINTER is
 		-- g_sequence_iter_get_sequence (node at line 6743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_get_sequence"
		}"
		end

	g_sequence_iter_is_begin (an_iter: POINTER): INTEGER_32 is
 		-- g_sequence_iter_is_begin (node at line 6952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_sequence_iter_is_begin"
		}"
		end


end -- class GSEQUENCE_EXTERNALS
