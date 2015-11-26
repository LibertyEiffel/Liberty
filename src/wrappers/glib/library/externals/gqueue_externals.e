-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GQUEUE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_queue_clear (a_queue: POINTER) 
               -- g_queue_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_clear"
               }"
               end

	g_queue_copy (a_queue: POINTER): POINTER 
               -- g_queue_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_copy"
               }"
               end

	g_queue_delete_link (a_queue: POINTER; a_link: POINTER) 
               -- g_queue_delete_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_delete_link"
               }"
               end

	g_queue_find (a_queue: POINTER; a_data: POINTER): POINTER 
               -- g_queue_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_find"
               }"
               end

	g_queue_find_custom (a_queue: POINTER; a_data: POINTER; a_func: POINTER): POINTER 
               -- g_queue_find_custom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_find_custom"
               }"
               end

	g_queue_foreach (a_queue: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_queue_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_foreach"
               }"
               end

	g_queue_free (a_queue: POINTER) 
               -- g_queue_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_free"
               }"
               end

	g_queue_free_full (a_queue: POINTER; a_free_func: POINTER) 
               -- g_queue_free_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_free_full"
               }"
               end

	g_queue_get_length (a_queue: POINTER): NATURAL 
               -- g_queue_get_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_get_length"
               }"
               end

	g_queue_index (a_queue: POINTER; a_data: POINTER): INTEGER 
               -- g_queue_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_index"
               }"
               end

	g_queue_init (a_queue: POINTER) 
               -- g_queue_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_init"
               }"
               end

	g_queue_insert_after (a_queue: POINTER; a_sibling: POINTER; a_data: POINTER) 
               -- g_queue_insert_after
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_insert_after"
               }"
               end

	g_queue_insert_before (a_queue: POINTER; a_sibling: POINTER; a_data: POINTER) 
               -- g_queue_insert_before
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_insert_before"
               }"
               end

	g_queue_insert_sorted (a_queue: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_queue_insert_sorted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_insert_sorted"
               }"
               end

	g_queue_is_empty (a_queue: POINTER): INTEGER 
               -- g_queue_is_empty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_is_empty"
               }"
               end

	g_queue_link_index (a_queue: POINTER; a_link: POINTER): INTEGER 
               -- g_queue_link_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_link_index"
               }"
               end

	g_queue_new: POINTER 
               -- g_queue_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_new"
               }"
               end

	g_queue_peek_head (a_queue: POINTER): POINTER 
               -- g_queue_peek_head
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_peek_head"
               }"
               end

	g_queue_peek_head_link (a_queue: POINTER): POINTER 
               -- g_queue_peek_head_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_peek_head_link"
               }"
               end

	g_queue_peek_nth (a_queue: POINTER; a_n: NATURAL): POINTER 
               -- g_queue_peek_nth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_peek_nth"
               }"
               end

	g_queue_peek_nth_link (a_queue: POINTER; a_n: NATURAL): POINTER 
               -- g_queue_peek_nth_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_peek_nth_link"
               }"
               end

	g_queue_peek_tail (a_queue: POINTER): POINTER 
               -- g_queue_peek_tail
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_peek_tail"
               }"
               end

	g_queue_peek_tail_link (a_queue: POINTER): POINTER 
               -- g_queue_peek_tail_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_peek_tail_link"
               }"
               end

	g_queue_pop_head (a_queue: POINTER): POINTER 
               -- g_queue_pop_head
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_pop_head"
               }"
               end

	g_queue_pop_head_link (a_queue: POINTER): POINTER 
               -- g_queue_pop_head_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_pop_head_link"
               }"
               end

	g_queue_pop_nth (a_queue: POINTER; a_n: NATURAL): POINTER 
               -- g_queue_pop_nth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_pop_nth"
               }"
               end

	g_queue_pop_nth_link (a_queue: POINTER; a_n: NATURAL): POINTER 
               -- g_queue_pop_nth_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_pop_nth_link"
               }"
               end

	g_queue_pop_tail (a_queue: POINTER): POINTER 
               -- g_queue_pop_tail
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_pop_tail"
               }"
               end

	g_queue_pop_tail_link (a_queue: POINTER): POINTER 
               -- g_queue_pop_tail_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_pop_tail_link"
               }"
               end

	g_queue_push_head (a_queue: POINTER; a_data: POINTER) 
               -- g_queue_push_head
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_push_head"
               }"
               end

	g_queue_push_head_link (a_queue: POINTER; a_link: POINTER) 
               -- g_queue_push_head_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_push_head_link"
               }"
               end

	g_queue_push_nth (a_queue: POINTER; a_data: POINTER; a_n: INTEGER) 
               -- g_queue_push_nth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_push_nth"
               }"
               end

	g_queue_push_nth_link (a_queue: POINTER; a_n: INTEGER; a_link: POINTER) 
               -- g_queue_push_nth_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_push_nth_link"
               }"
               end

	g_queue_push_tail (a_queue: POINTER; a_data: POINTER) 
               -- g_queue_push_tail
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_push_tail"
               }"
               end

	g_queue_push_tail_link (a_queue: POINTER; a_link: POINTER) 
               -- g_queue_push_tail_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_push_tail_link"
               }"
               end

	g_queue_remove (a_queue: POINTER; a_data: POINTER): INTEGER 
               -- g_queue_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_remove"
               }"
               end

	g_queue_remove_all (a_queue: POINTER; a_data: POINTER): NATURAL 
               -- g_queue_remove_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_remove_all"
               }"
               end

	g_queue_reverse (a_queue: POINTER) 
               -- g_queue_reverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_reverse"
               }"
               end

	g_queue_sort (a_queue: POINTER; a_compare_func: POINTER; an_user_data: POINTER) 
               -- g_queue_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_sort"
               }"
               end

	g_queue_unlink (a_queue: POINTER; a_link: POINTER) 
               -- g_queue_unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_queue_unlink"
               }"
               end


end -- class GQUEUE_EXTERNALS
