-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSEQUENCE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_sequence_append (a_seq: POINTER; a_data: POINTER): POINTER 
               -- g_sequence_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_append"
               }"
               end

	g_sequence_foreach (a_seq: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_sequence_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_foreach"
               }"
               end

	g_sequence_foreach_range (a_begin: POINTER; an_end_external: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_sequence_foreach_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_foreach_range"
               }"
               end

	g_sequence_free (a_seq: POINTER) 
               -- g_sequence_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_free"
               }"
               end

	g_sequence_get (an_iter: POINTER): POINTER 
               -- g_sequence_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_get"
               }"
               end

	g_sequence_get_begin_iter (a_seq: POINTER): POINTER 
               -- g_sequence_get_begin_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_get_begin_iter"
               }"
               end

	g_sequence_get_end_iter (a_seq: POINTER): POINTER 
               -- g_sequence_get_end_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_get_end_iter"
               }"
               end

	g_sequence_get_iter_at_pos (a_seq: POINTER; a_pos: INTEGER): POINTER 
               -- g_sequence_get_iter_at_pos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_get_iter_at_pos"
               }"
               end

	g_sequence_get_length (a_seq: POINTER): INTEGER 
               -- g_sequence_get_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_get_length"
               }"
               end

	g_sequence_insert_before (an_iter: POINTER; a_data: POINTER): POINTER 
               -- g_sequence_insert_before
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_insert_before"
               }"
               end

	g_sequence_insert_sorted (a_seq: POINTER; a_data: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER): POINTER 
               -- g_sequence_insert_sorted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_insert_sorted"
               }"
               end

	g_sequence_insert_sorted_iter (a_seq: POINTER; a_data: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER): POINTER 
               -- g_sequence_insert_sorted_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_insert_sorted_iter"
               }"
               end

	g_sequence_iter_compare (an_a: POINTER; a_b: POINTER): INTEGER 
               -- g_sequence_iter_compare
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_compare"
               }"
               end

	g_sequence_iter_get_position (an_iter: POINTER): INTEGER 
               -- g_sequence_iter_get_position
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_get_position"
               }"
               end

	g_sequence_iter_get_sequence (an_iter: POINTER): POINTER 
               -- g_sequence_iter_get_sequence
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_get_sequence"
               }"
               end

	g_sequence_iter_is_begin (an_iter: POINTER): INTEGER 
               -- g_sequence_iter_is_begin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_is_begin"
               }"
               end

	g_sequence_iter_is_end (an_iter: POINTER): INTEGER 
               -- g_sequence_iter_is_end
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_is_end"
               }"
               end

	g_sequence_iter_move (an_iter: POINTER; a_delta: INTEGER): POINTER 
               -- g_sequence_iter_move
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_move"
               }"
               end

	g_sequence_iter_next (an_iter: POINTER): POINTER 
               -- g_sequence_iter_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_next"
               }"
               end

	g_sequence_iter_prev (an_iter: POINTER): POINTER 
               -- g_sequence_iter_prev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_iter_prev"
               }"
               end

	g_sequence_lookup (a_seq: POINTER; a_data: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER): POINTER 
               -- g_sequence_lookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_lookup"
               }"
               end

	g_sequence_lookup_iter (a_seq: POINTER; a_data: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER): POINTER 
               -- g_sequence_lookup_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_lookup_iter"
               }"
               end

	g_sequence_move (a_src: POINTER; a_dest: POINTER) 
               -- g_sequence_move
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_move"
               }"
               end

	g_sequence_move_range (a_dest: POINTER; a_begin: POINTER; an_end_external: POINTER) 
               -- g_sequence_move_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_move_range"
               }"
               end

	g_sequence_new (a_data_destroy: POINTER): POINTER 
               -- g_sequence_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_new"
               }"
               end

	g_sequence_prepend (a_seq: POINTER; a_data: POINTER): POINTER 
               -- g_sequence_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_prepend"
               }"
               end

	g_sequence_range_get_midpoint (a_begin: POINTER; an_end_external: POINTER): POINTER 
               -- g_sequence_range_get_midpoint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_range_get_midpoint"
               }"
               end

	g_sequence_remove (an_iter: POINTER) 
               -- g_sequence_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_remove"
               }"
               end

	g_sequence_remove_range (a_begin: POINTER; an_end_external: POINTER) 
               -- g_sequence_remove_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_remove_range"
               }"
               end

	g_sequence_search (a_seq: POINTER; a_data: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER): POINTER 
               -- g_sequence_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_search"
               }"
               end

	g_sequence_search_iter (a_seq: POINTER; a_data: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER): POINTER 
               -- g_sequence_search_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_search_iter"
               }"
               end

	g_sequence_set (an_iter: POINTER; a_data: POINTER) 
               -- g_sequence_set
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_set"
               }"
               end

	g_sequence_sort (a_seq: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER) 
               -- g_sequence_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_sort"
               }"
               end

	g_sequence_sort_changed (an_iter: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER) 
               -- g_sequence_sort_changed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_sort_changed"
               }"
               end

	g_sequence_sort_changed_iter (an_iter: POINTER; an_iter_cmp: POINTER; a_cmp_data: POINTER) 
               -- g_sequence_sort_changed_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_sort_changed_iter"
               }"
               end

	g_sequence_sort_iter (a_seq: POINTER; a_cmp_func: POINTER; a_cmp_data: POINTER) 
               -- g_sequence_sort_iter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_sort_iter"
               }"
               end

	g_sequence_swap (an_a: POINTER; a_b: POINTER) 
               -- g_sequence_swap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_sequence_swap"
               }"
               end


end -- class GSEQUENCE_EXTERNALS
