-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GQUEUE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_queue_foreach (a_queue: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_queue_foreach (node at line 113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_foreach"
		}"
		end

	g_queue_pop_tail (a_queue: POINTER): POINTER is
 		-- g_queue_pop_tail (node at line 221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_pop_tail"
		}"
		end

	g_queue_peek_tail (a_queue: POINTER): POINTER is
 		-- g_queue_peek_tail (node at line 311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_peek_tail"
		}"
		end

	g_queue_peek_tail_link (a_queue: POINTER): POINTER is
 		-- g_queue_peek_tail_link (node at line 584)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_peek_tail_link"
		}"
		end

	g_queue_pop_head_link (a_queue: POINTER): POINTER is
 		-- g_queue_pop_head_link (node at line 1225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_pop_head_link"
		}"
		end

	g_queue_peek_nth (a_queue: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_queue_peek_nth (node at line 1412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_peek_nth"
		}"
		end

	g_queue_index (a_queue: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_queue_index (node at line 1434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_index"
		}"
		end

	g_queue_sort (a_queue: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_queue_sort (node at line 1660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_sort"
		}"
		end

	g_queue_push_tail_link (a_queue: POINTER; a_link: POINTER) is
 		-- g_queue_push_tail_link (node at line 2288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_push_tail_link"
		}"
		end

	g_queue_push_head_link (a_queue: POINTER; a_link: POINTER) is
 		-- g_queue_push_head_link (node at line 2320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_push_head_link"
		}"
		end

	g_queue_init (a_queue: POINTER) is
 		-- g_queue_init (node at line 2410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_init"
		}"
		end

	g_queue_reverse (a_queue: POINTER) is
 		-- g_queue_reverse (node at line 2458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_reverse"
		}"
		end

	g_queue_push_nth_link (a_queue: POINTER; a_n: INTEGER_32; a_link: POINTER) is
 		-- g_queue_push_nth_link (node at line 2657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_push_nth_link"
		}"
		end

	g_queue_insert_sorted (a_queue: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_queue_insert_sorted (node at line 2677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_insert_sorted"
		}"
		end

	g_queue_unlink (a_queue: POINTER; a_link: POINTER) is
 		-- g_queue_unlink (node at line 2695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_unlink"
		}"
		end

	g_queue_remove (a_queue: POINTER; a_data: POINTER) is
 		-- g_queue_remove (node at line 2881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_remove"
		}"
		end

	g_queue_remove_all (a_queue: POINTER; a_data: POINTER) is
 		-- g_queue_remove_all (node at line 3217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_remove_all"
		}"
		end

	g_queue_push_head (a_queue: POINTER; a_data: POINTER) is
 		-- g_queue_push_head (node at line 3254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_push_head"
		}"
		end

	g_queue_free (a_queue: POINTER) is
 		-- g_queue_free (node at line 3407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_free"
		}"
		end

	g_queue_copy (a_queue: POINTER): POINTER is
 		-- g_queue_copy (node at line 3559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_copy"
		}"
		end

	g_queue_pop_tail_link (a_queue: POINTER): POINTER is
 		-- g_queue_pop_tail_link (node at line 3754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_pop_tail_link"
		}"
		end

	g_queue_clear (a_queue: POINTER) is
 		-- g_queue_clear (node at line 3768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_clear"
		}"
		end

	g_queue_peek_nth_link (a_queue: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_queue_peek_nth_link (node at line 4027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_peek_nth_link"
		}"
		end

	g_queue_find_custom (a_queue: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- g_queue_find_custom (node at line 4056)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_find_custom"
		}"
		end

	g_queue_push_nth (a_queue: POINTER; a_data: POINTER; a_n: INTEGER_32) is
 		-- g_queue_push_nth (node at line 4339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_push_nth"
		}"
		end

	g_queue_new: POINTER is
 		-- g_queue_new (node at line 4422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_new()"
		}"
		end

	g_queue_push_tail (a_queue: POINTER; a_data: POINTER) is
 		-- g_queue_push_tail (node at line 4833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_push_tail"
		}"
		end

	g_queue_delete_link (a_queue: POINTER; a_link: POINTER) is
 		-- g_queue_delete_link (node at line 4865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_delete_link"
		}"
		end

	g_queue_pop_head (a_queue: POINTER): POINTER is
 		-- g_queue_pop_head (node at line 4962)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_pop_head"
		}"
		end

	g_queue_peek_head_link (a_queue: POINTER): POINTER is
 		-- g_queue_peek_head_link (node at line 5004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_peek_head_link"
		}"
		end

	g_queue_is_empty (a_queue: POINTER): INTEGER_32 is
 		-- g_queue_is_empty (node at line 5158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_is_empty"
		}"
		end

	g_queue_pop_nth (a_queue: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_queue_pop_nth (node at line 5252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_pop_nth"
		}"
		end

	g_queue_link_index (a_queue: POINTER; a_link: POINTER): INTEGER_32 is
 		-- g_queue_link_index (node at line 5732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_link_index"
		}"
		end

	g_queue_peek_head (a_queue: POINTER): POINTER is
 		-- g_queue_peek_head (node at line 5768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_peek_head"
		}"
		end

	g_queue_pop_nth_link (a_queue: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_queue_pop_nth_link (node at line 5796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_pop_nth_link"
		}"
		end

	g_queue_insert_before (a_queue: POINTER; a_sibling: POINTER; a_data: POINTER) is
 		-- g_queue_insert_before (node at line 6090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_insert_before"
		}"
		end

	g_queue_find (a_queue: POINTER; a_data: POINTER): POINTER is
 		-- g_queue_find (node at line 6516)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_find"
		}"
		end

	g_queue_get_length (a_queue: POINTER): NATURAL_32 is
 		-- g_queue_get_length (node at line 6600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_get_length"
		}"
		end

	g_queue_insert_after (a_queue: POINTER; a_sibling: POINTER; a_data: POINTER) is
 		-- g_queue_insert_after (node at line 6880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_queue_insert_after"
		}"
		end


end -- class GQUEUE_EXTERNALS
