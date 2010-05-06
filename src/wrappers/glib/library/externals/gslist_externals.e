-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSLIST_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_slist_sort (a_list: POINTER; a_compare_func: POINTER): POINTER is
 		-- g_slist_sort (node at line 15)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_sort"
		}"
		end

	g_slist_insert (a_list: POINTER; a_data: POINTER; a_position: INTEGER_32): POINTER is
 		-- g_slist_insert (node at line 178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_insert"
		}"
		end

	g_slist_insert_sorted_with_data (a_list: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_slist_insert_sorted_with_data (node at line 291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_insert_sorted_with_data"
		}"
		end

	g_slist_last (a_list: POINTER): POINTER is
 		-- g_slist_last (node at line 512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_last"
		}"
		end

	g_slist_free (a_list: POINTER) is
 		-- g_slist_free (node at line 898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_free"
		}"
		end

	g_slist_length (a_list: POINTER): NATURAL_32 is
 		-- g_slist_length (node at line 1112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_length"
		}"
		end

	g_slist_remove (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_slist_remove (node at line 1122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_remove"
		}"
		end

	g_slist_reverse (a_list: POINTER): POINTER is
 		-- g_slist_reverse (node at line 1140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_reverse"
		}"
		end

	g_slist_remove_link (a_list: POINTER; a_link: POINTER): POINTER is
 		-- g_slist_remove_link (node at line 1817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_remove_link"
		}"
		end

	g_slist_position (a_list: POINTER; a_llink: POINTER): INTEGER_32 is
 		-- g_slist_position (node at line 1875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_position"
		}"
		end

	g_slist_copy (a_list: POINTER): POINTER is
 		-- g_slist_copy (node at line 1935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_copy"
		}"
		end

	g_slist_append (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_slist_append (node at line 2298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_append"
		}"
		end

	g_slist_find_custom (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- g_slist_find_custom (node at line 2374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_find_custom"
		}"
		end

	g_slist_delete_link (a_list: POINTER; a_link: POINTER): POINTER is
 		-- g_slist_delete_link (node at line 2447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_delete_link"
		}"
		end

	g_slist_alloc: POINTER is
 		-- g_slist_alloc (node at line 2457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_alloc()"
		}"
		end

	g_slist_remove_all (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_slist_remove_all (node at line 2767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_remove_all"
		}"
		end

	g_slist_insert_sorted (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- g_slist_insert_sorted (node at line 2895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_insert_sorted"
		}"
		end

	g_slist_sort_with_data (a_list: POINTER; a_compare_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_slist_sort_with_data (node at line 3601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_sort_with_data"
		}"
		end

	g_slist_nth (a_list: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_slist_nth (node at line 3844)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_nth"
		}"
		end

	g_slist_free_1 (a_list: POINTER) is
 		-- g_slist_free_1 (node at line 3862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_free_1"
		}"
		end

	g_slist_index (a_list: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_slist_index (node at line 4148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_index"
		}"
		end

	g_slist_find (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_slist_find (node at line 4837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_find"
		}"
		end

	g_slist_prepend (a_list: POINTER; a_data: POINTER): POINTER is
 		-- g_slist_prepend (node at line 5327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_prepend"
		}"
		end

	g_slist_foreach (a_list: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_slist_foreach (node at line 5747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_foreach"
		}"
		end

	g_slist_nth_data (a_list: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_slist_nth_data (node at line 5983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_nth_data"
		}"
		end

	g_slist_insert_before (a_slist: POINTER; a_sibling: POINTER; a_data: POINTER): POINTER is
 		-- g_slist_insert_before (node at line 6304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_insert_before"
		}"
		end

	g_slist_push_allocator (a_dummy: POINTER) is
 		-- g_slist_push_allocator (node at line 6376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_push_allocator"
		}"
		end

	g_slist_concat (a_list1: POINTER; a_list2: POINTER): POINTER is
 		-- g_slist_concat (node at line 6746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_concat"
		}"
		end

	g_slist_pop_allocator is
 		-- g_slist_pop_allocator (node at line 6753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slist_pop_allocator()"
		}"
		end


end -- class GSLIST_EXTERNALS
