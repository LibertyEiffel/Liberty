-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLISTSTORE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_list_store_insert_before (a_list_store: POINTER; an_iter: POINTER; a_sibling: POINTER) is
 		-- gtk_list_store_insert_before (node at line 706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_before"
		}"
		end

	gtk_list_store_insert_after (a_list_store: POINTER; an_iter: POINTER; a_sibling: POINTER) is
 		-- gtk_list_store_insert_after (node at line 1129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_after"
		}"
		end

	gtk_list_store_remove (a_list_store: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_list_store_remove (node at line 2617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_remove"
		}"
		end

	gtk_list_store_insert_with_values (a_list_store: POINTER; an_iter: POINTER; a_position: INTEGER_32) is
 		-- gtk_list_store_insert_with_values (variadic call)  (node at line 2640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_with_values"
		}"
		end

	gtk_list_store_get_type: NATURAL_32 is
 		-- gtk_list_store_get_type (node at line 3349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_get_type()"
		}"
		end

	gtk_list_store_set_value (a_list_store: POINTER; an_iter: POINTER; a_column: INTEGER_32; a_value: POINTER) is
 		-- gtk_list_store_set_value (node at line 7048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_value"
		}"
		end

	gtk_list_store_prepend (a_list_store: POINTER; an_iter: POINTER) is
 		-- gtk_list_store_prepend (node at line 8373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_prepend"
		}"
		end

	gtk_list_store_set_column_types (a_list_store: POINTER; a_n_columns: INTEGER_32; a_types: POINTER) is
 		-- gtk_list_store_set_column_types (node at line 11070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_column_types"
		}"
		end

	gtk_list_store_reorder (a_store: POINTER; a_new_order: POINTER) is
 		-- gtk_list_store_reorder (node at line 12464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_reorder"
		}"
		end

	gtk_list_store_clear (a_list_store: POINTER) is
 		-- gtk_list_store_clear (node at line 13487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_clear"
		}"
		end

	gtk_list_store_set_valist (a_list_store: POINTER; an_iter: POINTER; a_var_args: POINTER) is
 		-- gtk_list_store_set_valist (node at line 17627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_valist"
		}"
		end

	gtk_list_store_newv (a_n_columns: INTEGER_32; a_types: POINTER): POINTER is
 		-- gtk_list_store_newv (node at line 18519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_newv"
		}"
		end

	gtk_list_store_move_after (a_store: POINTER; an_iter: POINTER; a_position: POINTER) is
 		-- gtk_list_store_move_after (node at line 21594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_move_after"
		}"
		end

	gtk_list_store_set_valuesv (a_list_store: POINTER; an_iter: POINTER; a_columns: POINTER; a_values: POINTER; a_n_values: INTEGER_32) is
 		-- gtk_list_store_set_valuesv (node at line 23414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_valuesv"
		}"
		end

	gtk_list_store_new (a_n_columns: INTEGER_32): POINTER is
 		-- gtk_list_store_new (variadic call)  (node at line 23947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_new"
		}"
		end

	gtk_list_store_swap (a_store: POINTER; an_a: POINTER; a_b: POINTER) is
 		-- gtk_list_store_swap (node at line 24028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_swap"
		}"
		end

	gtk_list_store_iter_is_valid (a_list_store: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_list_store_iter_is_valid (node at line 25077)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_iter_is_valid"
		}"
		end

	gtk_list_store_append (a_list_store: POINTER; an_iter: POINTER) is
 		-- gtk_list_store_append (node at line 29758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_append"
		}"
		end

	gtk_list_store_insert (a_list_store: POINTER; an_iter: POINTER; a_position: INTEGER_32) is
 		-- gtk_list_store_insert (node at line 29825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert"
		}"
		end

	gtk_list_store_insert_with_valuesv (a_list_store: POINTER; an_iter: POINTER; a_position: INTEGER_32; a_columns: POINTER; a_values: POINTER; a_n_values: INTEGER_32) is
 		-- gtk_list_store_insert_with_valuesv (node at line 31866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_with_valuesv"
		}"
		end

	gtk_list_store_move_before (a_store: POINTER; an_iter: POINTER; a_position: POINTER) is
 		-- gtk_list_store_move_before (node at line 36069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_move_before"
		}"
		end

	gtk_list_store_set (a_list_store: POINTER; an_iter: POINTER) is
 		-- gtk_list_store_set (variadic call)  (node at line 36317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set"
		}"
		end


end -- class GTKLISTSTORE_EXTERNALS
