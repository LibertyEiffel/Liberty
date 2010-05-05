-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHASH_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_int_hash (a_v: POINTER): NATURAL_32 is
 		-- g_int_hash (node at line 6)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_int_hash"
		}"
		end

	g_int64_hash (a_v: POINTER): NATURAL_32 is
 		-- g_int64_hash (node at line 155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_int64_hash"
		}"
		end

	g_direct_equal (a_v1: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_direct_equal (node at line 160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_direct_equal"
		}"
		end

	g_hash_table_steal_all (a_hash_table: POINTER) is
 		-- g_hash_table_steal_all (node at line 575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_steal_all"
		}"
		end

	g_hash_table_lookup_extended (a_hash_table: POINTER; a_lookup_key: POINTER; an_orig_key: POINTER; a_value: POINTER): INTEGER_32 is
 		-- g_hash_table_lookup_extended (node at line 637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_lookup_extended"
		}"
		end

	g_int64_equal (a_v1: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_int64_equal (node at line 734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_int64_equal"
		}"
		end

	g_hash_table_replace (a_hash_table: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- g_hash_table_replace (node at line 1258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_replace"
		}"
		end

	g_hash_table_foreach_steal (a_hash_table: POINTER; a_func: POINTER; an_user_data: POINTER): NATURAL_32 is
 		-- g_hash_table_foreach_steal (node at line 1350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_foreach_steal"
		}"
		end

	g_hash_table_new_full (a_hash_func: POINTER; a_key_equal_func: POINTER; a_key_destroy_func: POINTER; a_value_destroy_func: POINTER): POINTER is
 		-- g_hash_table_new_full (node at line 2461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_new_full"
		}"
		end

	g_hash_table_iter_init (an_iter: POINTER; a_hash_table: POINTER) is
 		-- g_hash_table_iter_init (node at line 2496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_iter_init"
		}"
		end

	g_hash_table_remove (a_hash_table: POINTER; a_key: POINTER): INTEGER_32 is
 		-- g_hash_table_remove (node at line 2900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_remove"
		}"
		end

	g_hash_table_iter_get_hash_table (an_iter: POINTER): POINTER is
 		-- g_hash_table_iter_get_hash_table (node at line 3332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_iter_get_hash_table"
		}"
		end

	g_hash_table_iter_remove (an_iter: POINTER) is
 		-- g_hash_table_iter_remove (node at line 3901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_iter_remove"
		}"
		end

	g_hash_table_iter_steal (an_iter: POINTER) is
 		-- g_hash_table_iter_steal (node at line 3953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_iter_steal"
		}"
		end

	g_hash_table_foreach_remove (a_hash_table: POINTER; a_func: POINTER; an_user_data: POINTER): NATURAL_32 is
 		-- g_hash_table_foreach_remove (node at line 4220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_foreach_remove"
		}"
		end

	g_hash_table_size (a_hash_table: POINTER): NATURAL_32 is
 		-- g_hash_table_size (node at line 4559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_size"
		}"
		end

	g_hash_table_new (a_hash_func: POINTER; a_key_equal_func: POINTER): POINTER is
 		-- g_hash_table_new (node at line 4689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_new"
		}"
		end

	g_double_equal (a_v1: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_double_equal (node at line 4882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_double_equal"
		}"
		end

	g_hash_table_get_values (a_hash_table: POINTER): POINTER is
 		-- g_hash_table_get_values (node at line 4914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_get_values"
		}"
		end

	g_hash_table_lookup (a_hash_table: POINTER; a_key: POINTER): POINTER is
 		-- g_hash_table_lookup (node at line 4970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_lookup"
		}"
		end

	g_hash_table_iter_next (an_iter: POINTER; a_key: POINTER; a_value: POINTER): INTEGER_32 is
 		-- g_hash_table_iter_next (node at line 5091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_iter_next"
		}"
		end

	g_hash_table_ref (a_hash_table: POINTER): POINTER is
 		-- g_hash_table_ref (node at line 5324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_ref"
		}"
		end

	g_hash_table_foreach (a_hash_table: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_hash_table_foreach (node at line 5421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_foreach"
		}"
		end

	g_hash_table_get_keys (a_hash_table: POINTER): POINTER is
 		-- g_hash_table_get_keys (node at line 5505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_get_keys"
		}"
		end

	g_hash_table_destroy (a_hash_table: POINTER) is
 		-- g_hash_table_destroy (node at line 5783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_destroy"
		}"
		end

	g_hash_table_unref (a_hash_table: POINTER) is
 		-- g_hash_table_unref (node at line 5850)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_unref"
		}"
		end

	g_int_equal (a_v1: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_int_equal (node at line 5948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_int_equal"
		}"
		end

	g_hash_table_insert (a_hash_table: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- g_hash_table_insert (node at line 5995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_insert"
		}"
		end

	g_str_equal (a_v1: POINTER; a_v2: POINTER): INTEGER_32 is
 		-- g_str_equal (node at line 6023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_str_equal"
		}"
		end

	g_double_hash (a_v: POINTER): NATURAL_32 is
 		-- g_double_hash (node at line 6155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_double_hash"
		}"
		end

	g_hash_table_steal (a_hash_table: POINTER; a_key: POINTER): INTEGER_32 is
 		-- g_hash_table_steal (node at line 6300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_steal"
		}"
		end

	g_str_hash (a_v: POINTER): NATURAL_32 is
 		-- g_str_hash (node at line 6384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_str_hash"
		}"
		end

	g_hash_table_remove_all (a_hash_table: POINTER) is
 		-- g_hash_table_remove_all (node at line 6448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_remove_all"
		}"
		end

	g_hash_table_find (a_hash_table: POINTER; a_predicate: POINTER; an_user_data: POINTER): POINTER is
 		-- g_hash_table_find (node at line 6688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_find"
		}"
		end

	g_direct_hash (a_v: POINTER): NATURAL_32 is
 		-- g_direct_hash (node at line 6803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_direct_hash"
		}"
		end


end -- class GHASH_EXTERNALS
