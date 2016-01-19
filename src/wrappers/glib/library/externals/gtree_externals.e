-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTREE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_tree_destroy (a_tree: POINTER) 
               -- g_tree_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_destroy"
               }"
               end

	g_tree_foreach (a_tree: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_tree_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_foreach"
               }"
               end

	g_tree_height (a_tree: POINTER): INTEGER 
               -- g_tree_height
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_height"
               }"
               end

	g_tree_insert (a_tree: POINTER; a_key: POINTER; a_value: POINTER) 
               -- g_tree_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_insert"
               }"
               end

	g_tree_lookup (a_tree: POINTER; a_key: POINTER): POINTER 
               -- g_tree_lookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_lookup"
               }"
               end

	g_tree_lookup_extended (a_tree: POINTER; a_lookup_key: POINTER; an_orig_key: POINTER; a_value: POINTER): INTEGER 
               -- g_tree_lookup_extended
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_lookup_extended"
               }"
               end

	g_tree_new (a_key_compare_func: POINTER): POINTER 
               -- g_tree_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_new"
               }"
               end

	g_tree_new_full (a_key_compare_func: POINTER; a_key_compare_data: POINTER; a_key_destroy_func: POINTER; a_value_destroy_func: POINTER): POINTER 
               -- g_tree_new_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_new_full"
               }"
               end

	g_tree_new_with_data (a_key_compare_func: POINTER; a_key_compare_data: POINTER): POINTER 
               -- g_tree_new_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_new_with_data"
               }"
               end

	g_tree_nnodes (a_tree: POINTER): INTEGER 
               -- g_tree_nnodes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_nnodes"
               }"
               end

	g_tree_ref (a_tree: POINTER): POINTER 
               -- g_tree_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_ref"
               }"
               end

	g_tree_remove (a_tree: POINTER; a_key: POINTER): INTEGER 
               -- g_tree_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_remove"
               }"
               end

	g_tree_replace (a_tree: POINTER; a_key: POINTER; a_value: POINTER) 
               -- g_tree_replace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_replace"
               }"
               end

	g_tree_search (a_tree: POINTER; a_search_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_tree_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_search"
               }"
               end

	g_tree_steal (a_tree: POINTER; a_key: POINTER): INTEGER 
               -- g_tree_steal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_steal"
               }"
               end

	g_tree_traverse (a_tree: POINTER; a_traverse_func: POINTER; a_traverse_type: INTEGER; an_user_data: POINTER) 
               -- g_tree_traverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_traverse"
               }"
               end

	g_tree_unref (a_tree: POINTER) 
               -- g_tree_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_tree_unref"
               }"
               end


end -- class GTREE_EXTERNALS
