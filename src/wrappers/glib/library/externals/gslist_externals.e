-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSLIST_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_slist_alloc: POINTER 
               -- g_slist_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_alloc"
               }"
               end

	g_slist_append (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_slist_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_append"
               }"
               end

	g_slist_concat (a_list1: POINTER; a_list2: POINTER): POINTER 
               -- g_slist_concat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_concat"
               }"
               end

	g_slist_copy (a_list: POINTER): POINTER 
               -- g_slist_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_copy"
               }"
               end

	g_slist_copy_deep (a_list: POINTER; a_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_slist_copy_deep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_copy_deep"
               }"
               end

	g_slist_delete_link (a_list: POINTER; a_link: POINTER): POINTER 
               -- g_slist_delete_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_delete_link"
               }"
               end

	g_slist_find (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_slist_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_find"
               }"
               end

	g_slist_find_custom (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER 
               -- g_slist_find_custom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_find_custom"
               }"
               end

	g_slist_foreach (a_list: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_slist_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_foreach"
               }"
               end

	g_slist_free (a_list: POINTER) 
               -- g_slist_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_free"
               }"
               end

	g_slist_free_1 (a_list: POINTER) 
               -- g_slist_free_1
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_free_1"
               }"
               end

	g_slist_free_full (a_list: POINTER; a_free_func: POINTER) 
               -- g_slist_free_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_free_full"
               }"
               end

	g_slist_index (a_list: POINTER; a_data: POINTER): INTEGER 
               -- g_slist_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_index"
               }"
               end

	g_slist_insert (a_list: POINTER; a_data: POINTER; a_position: INTEGER): POINTER 
               -- g_slist_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_insert"
               }"
               end

	g_slist_insert_before (a_slist: POINTER; a_sibling: POINTER; a_data: POINTER): POINTER 
               -- g_slist_insert_before
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_insert_before"
               }"
               end

	g_slist_insert_sorted (a_list: POINTER; a_data: POINTER; a_func: POINTER): POINTER 
               -- g_slist_insert_sorted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_insert_sorted"
               }"
               end

	g_slist_insert_sorted_with_data (a_list: POINTER; a_data: POINTER; a_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_slist_insert_sorted_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_insert_sorted_with_data"
               }"
               end

	g_slist_last (a_list: POINTER): POINTER 
               -- g_slist_last
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_last"
               }"
               end

	g_slist_length (a_list: POINTER): NATURAL 
               -- g_slist_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_length"
               }"
               end

	g_slist_nth (a_list: POINTER; a_n: NATURAL): POINTER 
               -- g_slist_nth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_nth"
               }"
               end

	g_slist_nth_data (a_list: POINTER; a_n: NATURAL): POINTER 
               -- g_slist_nth_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_nth_data"
               }"
               end

	g_slist_position (a_list: POINTER; a_llink: POINTER): INTEGER 
               -- g_slist_position
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_position"
               }"
               end

	g_slist_prepend (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_slist_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_prepend"
               }"
               end

	g_slist_remove (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_slist_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_remove"
               }"
               end

	g_slist_remove_all (a_list: POINTER; a_data: POINTER): POINTER 
               -- g_slist_remove_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_remove_all"
               }"
               end

	g_slist_remove_link (a_list: POINTER; a_link: POINTER): POINTER 
               -- g_slist_remove_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_remove_link"
               }"
               end

	g_slist_reverse (a_list: POINTER): POINTER 
               -- g_slist_reverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_reverse"
               }"
               end

	g_slist_sort (a_list: POINTER; a_compare_func: POINTER): POINTER 
               -- g_slist_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_sort"
               }"
               end

	g_slist_sort_with_data (a_list: POINTER; a_compare_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_slist_sort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slist_sort_with_data"
               }"
               end


end -- class GSLIST_EXTERNALS
