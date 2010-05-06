-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GLIST_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_list_insert_sorted (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- g_list_insert_sorted (node at line 197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_insert_sorted"
		}"
		end

	g_list_copy (a_list: POINTER): POINTER is
 		-- g_list_copy (node at line 400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_copy"
		}"
		end

	g_list_first (a_list: POINTER): POINTER is
 		-- g_list_first (node at line 767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_first"
		}"
		end

	g_list_sort_with_data (a_list: POINTER; a_compare_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_list_sort_with_data (node at line 986)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_sort_with_data"
		}"
		end

	g_list_remove (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_list_remove (node at line 1718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_remove"
		}"
		end

	g_list_insert_before (a_list: POINTER; a_sibling: POINTER; a_data: POINTER): POINTER is
 		-- g_list_insert_before (node at line 1744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_insert_before"
		}"
		end

	g_list_remove_all (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_list_remove_all (node at line 2219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_remove_all"
		}"
		end

	g_list_position (a_list: POINTER; a_llink: POINTER): INTEGER_32 is
 		-- g_list_position (node at line 2284)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_position"
		}"
		end

	g_list_foreach (a_list: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_list_foreach (node at line 2431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_foreach"
		}"
		end

	g_list_length (a_list: POINTER): NATURAL_32 is
 		-- g_list_length (node at line 2519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_length"
		}"
		end

	g_list_find (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_list_find (node at line 3262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_find"
		}"
		end

	g_list_push_allocator (an_allocator: POINTER) is
 		-- g_list_push_allocator (node at line 3757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_push_allocator"
		}"
		end

	g_list_prepend (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_list_prepend (node at line 3957)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_prepend"
		}"
		end

	g_list_pop_allocator is
 		-- g_list_pop_allocator (node at line 4026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_pop_allocator()"
		}"
		end

	g_list_concat (a_list1: POINTER; a_list2: POINTER): POINTER is
 		-- g_list_concat (node at line 4406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_concat"
		}"
		end

	g_list_append (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_list_append (node at line 4418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_append"
		}"
		end

	g_list_index (a_list: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_list_index (node at line 4466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_index"
		}"
		end

	g_list_nth_prev (a_list: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_list_nth_prev (node at line 4540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_nth_prev"
		}"
		end

	g_list_insert (a_list: POINTER; a_data: POINTER; a_position: INTEGER_32): POINTER is
 		-- g_list_insert (node at line 4747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_insert"
		}"
		end

	g_list_reverse (a_list: POINTER): POINTER is
 		-- g_list_reverse (node at line 4822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_reverse"
		}"
		end

	g_list_nth (a_list: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_list_nth (node at line 4929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_nth"
		}"
		end

	g_list_last (a_list: POINTER): POINTER is
 		-- g_list_last (node at line 5074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_last"
		}"
		end

	g_list_sort (a_list: POINTER; a_compare_func: POINTER): POINTER is
 		-- g_list_sort (node at line 5340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_sort"
		}"
		end

	g_list_alloc: POINTER is
 		-- g_list_alloc (node at line 6149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_alloc()"
		}"
		end

	g_list_find_custom (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- g_list_find_custom (node at line 6204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_find_custom"
		}"
		end

	g_list_remove_link (a_list: POINTER; a_llink: POINTER): POINTER is
 		-- g_list_remove_link (node at line 6230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_remove_link"
		}"
		end

	g_list_delete_link (a_list: POINTER; a_link: POINTER): POINTER is
 		-- g_list_delete_link (node at line 6266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_delete_link"
		}"
		end

	g_list_free (a_list: POINTER) is
 		-- g_list_free (node at line 6297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_free"
		}"
		end

	g_list_nth_data (a_list: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_list_nth_data (node at line 6497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_nth_data"
		}"
		end

	g_list_insert_sorted_with_data (a_list: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_list_insert_sorted_with_data (node at line 6711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_insert_sorted_with_data"
		}"
		end

	g_list_free_1 (a_list: POINTER) is
 		-- g_list_free_1 (node at line 6849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_list_free_1"
		}"
		end


end -- class GLIST_EXTERNALS
