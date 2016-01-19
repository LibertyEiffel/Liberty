-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GLIST_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_list_alloc: POINTER 
               -- g_list_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_alloc"
               }"
               end

	g_list_append (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_list_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_append"
               }"
               end

	g_list_concat (a_list1: POINTER; a_list2: POINTER): POINTER 
               -- g_list_concat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_concat"
               }"
               end

	g_list_copy (a_list: POINTER): POINTER 
               -- g_list_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_copy"
               }"
               end

	g_list_copy_deep (a_list: POINTER; a_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_list_copy_deep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_copy_deep"
               }"
               end

	g_list_delete_link (a_list: POINTER; a_link: POINTER): POINTER 
               -- g_list_delete_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_delete_link"
               }"
               end

	g_list_find (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_list_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_find"
               }"
               end

	g_list_find_custom (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER 
               -- g_list_find_custom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_find_custom"
               }"
               end

	g_list_first (a_list: POINTER): POINTER 
               -- g_list_first
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_first"
               }"
               end

	g_list_foreach (a_list: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_list_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_foreach"
               }"
               end

	g_list_free (a_list: POINTER) 
               -- g_list_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_free"
               }"
               end

	g_list_free_1 (a_list: POINTER) 
               -- g_list_free_1
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_free_1"
               }"
               end

	g_list_free_full (a_list: POINTER; a_free_func: POINTER) 
               -- g_list_free_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_free_full"
               }"
               end

	g_list_index (a_list: POINTER; a_data: POINTER): INTEGER 
               -- g_list_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_index"
               }"
               end

	g_list_insert (a_list: POINTER; a_data: POINTER; a_position: INTEGER): POINTER 
               -- g_list_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_insert"
               }"
               end

	g_list_insert_before (a_list: POINTER; a_sibling: POINTER; a_data: POINTER): POINTER 
               -- g_list_insert_before
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_insert_before"
               }"
               end

	g_list_insert_sorted (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER 
               -- g_list_insert_sorted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_insert_sorted"
               }"
               end

	g_list_insert_sorted_with_data (a_list: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_list_insert_sorted_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_insert_sorted_with_data"
               }"
               end

	g_list_last (a_list: POINTER): POINTER 
               -- g_list_last
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_last"
               }"
               end

	g_list_length (a_list: POINTER): NATURAL 
               -- g_list_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_length"
               }"
               end

	g_list_nth (a_list: POINTER; a_n: NATURAL): POINTER 
               -- g_list_nth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_nth"
               }"
               end

	g_list_nth_data (a_list: POINTER; a_n: NATURAL): POINTER 
               -- g_list_nth_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_nth_data"
               }"
               end

	g_list_nth_prev (a_list: POINTER; a_n: NATURAL): POINTER 
               -- g_list_nth_prev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_nth_prev"
               }"
               end

	g_list_position (a_list: POINTER; a_llink: POINTER): INTEGER 
               -- g_list_position
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_position"
               }"
               end

	g_list_prepend (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_list_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_prepend"
               }"
               end

	g_list_remove (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_list_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_remove"
               }"
               end

	g_list_remove_all (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_list_remove_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_remove_all"
               }"
               end

	g_list_remove_link (a_list: POINTER; a_llink: POINTER): POINTER 
               -- g_list_remove_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_remove_link"
               }"
               end

	g_list_reverse (a_list: POINTER): POINTER 
               -- g_list_reverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_reverse"
               }"
               end

	g_list_sort (a_list: POINTER; a_compare_func: POINTER): POINTER 
               -- g_list_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_sort"
               }"
               end

	g_list_sort_with_data (a_list: POINTER; a_compare_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_list_sort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_list_sort_with_data"
               }"
               end


end -- class GLIST_EXTERNALS
