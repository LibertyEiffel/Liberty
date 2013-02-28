-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREESTORE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_store_clear (a_tree_store: POINTER) is
 		-- gtk_tree_store_clear (node at line 345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_clear"
		}"
		end

	gtk_tree_store_prepend (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER) is
 		-- gtk_tree_store_prepend (node at line 1389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_prepend"
		}"
		end

	gtk_tree_store_set (a_tree_store: POINTER; an_iter: POINTER) is
 		-- gtk_tree_store_set (variadic call)  (node at line 2106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_set"
		}"
		end

	gtk_tree_store_insert_with_valuesv (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER; a_position: INTEGER_32; a_columns: POINTER; a_values: POINTER; a_n_values: INTEGER_32) is
 		-- gtk_tree_store_insert_with_valuesv (node at line 5169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_insert_with_valuesv"
		}"
		end

	gtk_tree_store_insert_after (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER; a_sibling: POINTER) is
 		-- gtk_tree_store_insert_after (node at line 8450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_insert_after"
		}"
		end

	gtk_tree_store_reorder (a_tree_store: POINTER; a_parent: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_store_reorder (node at line 9474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_reorder"
		}"
		end

	gtk_tree_store_set_column_types (a_tree_store: POINTER; a_n_columns: INTEGER_32; a_types: POINTER) is
 		-- gtk_tree_store_set_column_types (node at line 11065)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_set_column_types"
		}"
		end

	gtk_tree_store_newv (a_n_columns: INTEGER_32; a_types: POINTER): POINTER is
 		-- gtk_tree_store_newv (node at line 14818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_newv"
		}"
		end

	gtk_tree_store_iter_is_valid (a_tree_store: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_store_iter_is_valid (node at line 16261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_iter_is_valid"
		}"
		end

	gtk_tree_store_swap (a_tree_store: POINTER; an_a: POINTER; a_b: POINTER) is
 		-- gtk_tree_store_swap (node at line 21478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_swap"
		}"
		end

	gtk_tree_store_set_valuesv (a_tree_store: POINTER; an_iter: POINTER; a_columns: POINTER; a_values: POINTER; a_n_values: INTEGER_32) is
 		-- gtk_tree_store_set_valuesv (node at line 22358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_set_valuesv"
		}"
		end

	gtk_tree_store_move_after (a_tree_store: POINTER; an_iter: POINTER; a_position: POINTER) is
 		-- gtk_tree_store_move_after (node at line 22656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_move_after"
		}"
		end

	gtk_tree_store_insert_with_values (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER; a_position: INTEGER_32) is
 		-- gtk_tree_store_insert_with_values (variadic call)  (node at line 22862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_insert_with_values"
		}"
		end

	gtk_tree_store_set_value (a_tree_store: POINTER; an_iter: POINTER; a_column: INTEGER_32; a_value: POINTER) is
 		-- gtk_tree_store_set_value (node at line 23075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_set_value"
		}"
		end

	gtk_tree_store_append (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER) is
 		-- gtk_tree_store_append (node at line 25218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_append"
		}"
		end

	gtk_tree_store_insert (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER; a_position: INTEGER_32) is
 		-- gtk_tree_store_insert (node at line 25310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_insert"
		}"
		end

	gtk_tree_store_get_type: NATURAL_64 is
 		-- gtk_tree_store_get_type (node at line 25805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_get_type()"
		}"
		end

	gtk_tree_store_move_before (a_tree_store: POINTER; an_iter: POINTER; a_position: POINTER) is
 		-- gtk_tree_store_move_before (node at line 26792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_move_before"
		}"
		end

	gtk_tree_store_insert_before (a_tree_store: POINTER; an_iter: POINTER; a_parent: POINTER; a_sibling: POINTER) is
 		-- gtk_tree_store_insert_before (node at line 31428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_insert_before"
		}"
		end

	gtk_tree_store_set_valist (a_tree_store: POINTER; an_iter: POINTER; a_var_args: POINTER) is
 		-- gtk_tree_store_set_valist (node at line 32621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_set_valist"
		}"
		end

	gtk_tree_store_new (a_n_columns: INTEGER_32): POINTER is
 		-- gtk_tree_store_new (variadic call)  (node at line 32775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_new"
		}"
		end

	gtk_tree_store_is_ancestor (a_tree_store: POINTER; an_iter: POINTER; a_descendant: POINTER): INTEGER_32 is
 		-- gtk_tree_store_is_ancestor (node at line 36841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_is_ancestor"
		}"
		end

	gtk_tree_store_remove (a_tree_store: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_store_remove (node at line 36943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_remove"
		}"
		end

	gtk_tree_store_iter_depth (a_tree_store: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_store_iter_depth (node at line 37984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_store_iter_depth"
		}"
		end


end -- class GTKTREESTORE_EXTERNALS
