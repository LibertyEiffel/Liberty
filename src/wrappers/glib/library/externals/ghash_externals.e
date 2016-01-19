-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GHASH_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_direct_equal (a_v1: POINTER; a_v2: POINTER): INTEGER 
               -- g_direct_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_direct_equal"
               }"
               end

	g_direct_hash (a_v: POINTER): NATURAL 
               -- g_direct_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_direct_hash"
               }"
               end

	g_double_equal (a_v1: POINTER; a_v2: POINTER): INTEGER 
               -- g_double_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_double_equal"
               }"
               end

	g_double_hash (a_v: POINTER): NATURAL 
               -- g_double_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_double_hash"
               }"
               end

	g_hash_table_add (a_hash_table: POINTER; a_key: POINTER): INTEGER 
               -- g_hash_table_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_add"
               }"
               end

	g_hash_table_contains (a_hash_table: POINTER; a_key: POINTER): INTEGER 
               -- g_hash_table_contains
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_contains"
               }"
               end

	g_hash_table_destroy (a_hash_table: POINTER) 
               -- g_hash_table_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_destroy"
               }"
               end

	g_hash_table_find (a_hash_table: POINTER; a_predicate: POINTER; an_user_data: POINTER): POINTER 
               -- g_hash_table_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_find"
               }"
               end

	g_hash_table_foreach (a_hash_table: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_hash_table_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_foreach"
               }"
               end

	g_hash_table_foreach_remove (a_hash_table: POINTER; a_func: POINTER; an_user_data: POINTER): NATURAL 
               -- g_hash_table_foreach_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_foreach_remove"
               }"
               end

	g_hash_table_foreach_steal (a_hash_table: POINTER; a_func: POINTER; an_user_data: POINTER): NATURAL 
               -- g_hash_table_foreach_steal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_foreach_steal"
               }"
               end

	g_hash_table_get_keys (a_hash_table: POINTER): POINTER 
               -- g_hash_table_get_keys
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_get_keys"
               }"
               end

	g_hash_table_get_keys_as_array (a_hash_table: POINTER; a_length: POINTER): POINTER 
               -- g_hash_table_get_keys_as_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_get_keys_as_array"
               }"
               end

	g_hash_table_get_values (a_hash_table: POINTER): POINTER 
               -- g_hash_table_get_values
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_get_values"
               }"
               end

	g_hash_table_insert (a_hash_table: POINTER; a_key: POINTER; a_value: POINTER): INTEGER 
               -- g_hash_table_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_insert"
               }"
               end

	g_hash_table_iter_get_hash_table (an_iter: POINTER): POINTER 
               -- g_hash_table_iter_get_hash_table
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_iter_get_hash_table"
               }"
               end

	g_hash_table_iter_init (an_iter: POINTER; a_hash_table: POINTER) 
               -- g_hash_table_iter_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_iter_init"
               }"
               end

	g_hash_table_iter_next (an_iter: POINTER; a_key: POINTER; a_value: POINTER): INTEGER 
               -- g_hash_table_iter_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_iter_next"
               }"
               end

	g_hash_table_iter_remove (an_iter: POINTER) 
               -- g_hash_table_iter_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_iter_remove"
               }"
               end

	g_hash_table_iter_replace (an_iter: POINTER; a_value: POINTER) 
               -- g_hash_table_iter_replace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_iter_replace"
               }"
               end

	g_hash_table_iter_steal (an_iter: POINTER) 
               -- g_hash_table_iter_steal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_iter_steal"
               }"
               end

	g_hash_table_lookup (a_hash_table: POINTER; a_key: POINTER): POINTER 
               -- g_hash_table_lookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_lookup"
               }"
               end

	g_hash_table_lookup_extended (a_hash_table: POINTER; a_lookup_key: POINTER; an_orig_key: POINTER; a_value: POINTER): INTEGER 
               -- g_hash_table_lookup_extended
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_lookup_extended"
               }"
               end

	g_hash_table_new (a_hash_func: POINTER; a_key_equal_func: POINTER): POINTER 
               -- g_hash_table_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_new"
               }"
               end

	g_hash_table_new_full (a_hash_func: POINTER; a_key_equal_func: POINTER; a_key_destroy_func: POINTER; a_value_destroy_func: POINTER): POINTER 
               -- g_hash_table_new_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_new_full"
               }"
               end

	g_hash_table_ref (a_hash_table: POINTER): POINTER 
               -- g_hash_table_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_ref"
               }"
               end

	g_hash_table_remove (a_hash_table: POINTER; a_key: POINTER): INTEGER 
               -- g_hash_table_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_remove"
               }"
               end

	g_hash_table_remove_all (a_hash_table: POINTER) 
               -- g_hash_table_remove_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_remove_all"
               }"
               end

	g_hash_table_replace (a_hash_table: POINTER; a_key: POINTER; a_value: POINTER): INTEGER 
               -- g_hash_table_replace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_replace"
               }"
               end

	g_hash_table_size (a_hash_table: POINTER): NATURAL 
               -- g_hash_table_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_size"
               }"
               end

	g_hash_table_steal (a_hash_table: POINTER; a_key: POINTER): INTEGER 
               -- g_hash_table_steal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_steal"
               }"
               end

	g_hash_table_steal_all (a_hash_table: POINTER) 
               -- g_hash_table_steal_all
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_steal_all"
               }"
               end

	g_hash_table_unref (a_hash_table: POINTER) 
               -- g_hash_table_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hash_table_unref"
               }"
               end

	g_int64_equal (a_v1: POINTER; a_v2: POINTER): INTEGER 
               -- g_int64_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_int64_equal"
               }"
               end

	g_int64_hash (a_v: POINTER): NATURAL 
               -- g_int64_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_int64_hash"
               }"
               end

	g_int_equal (a_v1: POINTER; a_v2: POINTER): INTEGER 
               -- g_int_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_int_equal"
               }"
               end

	g_int_hash (a_v: POINTER): NATURAL 
               -- g_int_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_int_hash"
               }"
               end

	g_str_equal (a_v1: POINTER; a_v2: POINTER): INTEGER 
               -- g_str_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_equal"
               }"
               end

	g_str_hash (a_v: POINTER): NATURAL 
               -- g_str_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_str_hash"
               }"
               end


end -- class GHASH_EXTERNALS
