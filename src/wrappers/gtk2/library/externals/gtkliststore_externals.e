-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLISTSTORE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_list_store_append (a_list_store: POINTER; an_iter: POINTER) is
 		-- gtk_list_store_append
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_append"
		}"
		end

	gtk_list_store_clear (a_list_store: POINTER) is
 		-- gtk_list_store_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_clear"
		}"
		end

	gtk_list_store_get_type: like long_unsigned is
 		-- gtk_list_store_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_get_type()"
		}"
		end

	gtk_list_store_insert (a_list_store: POINTER; an_iter: POINTER; a_position: INTEGER) is
 		-- gtk_list_store_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert"
		}"
		end

	gtk_list_store_insert_after (a_list_store: POINTER; an_iter: POINTER; a_sibling: POINTER) is
 		-- gtk_list_store_insert_after
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_after"
		}"
		end

	gtk_list_store_insert_before (a_list_store: POINTER; an_iter: POINTER; a_sibling: POINTER) is
 		-- gtk_list_store_insert_before
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_before"
		}"
		end

	gtk_list_store_insert_with_values (a_list_store: POINTER; an_iter: POINTER; a_position: INTEGER) is
 		-- gtk_list_store_insert_with_values (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_with_values"
		}"
		end

	gtk_list_store_insert_with_valuesv (a_list_store: POINTER; an_iter: POINTER; a_position: INTEGER; a_columns: POINTER; a_values: POINTER; a_n_values: INTEGER) is
 		-- gtk_list_store_insert_with_valuesv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_insert_with_valuesv"
		}"
		end

	gtk_list_store_iter_is_valid (a_list_store: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_list_store_iter_is_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_iter_is_valid"
		}"
		end

	gtk_list_store_move_after (a_store: POINTER; an_iter: POINTER; a_position: POINTER) is
 		-- gtk_list_store_move_after
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_move_after"
		}"
		end

	gtk_list_store_move_before (a_store: POINTER; an_iter: POINTER; a_position: POINTER) is
 		-- gtk_list_store_move_before
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_move_before"
		}"
		end

	gtk_list_store_new (a_n_columns: INTEGER): POINTER is
 		-- gtk_list_store_new (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_new"
		}"
		end

	gtk_list_store_newv (a_n_columns: INTEGER; a_types: POINTER): POINTER is
 		-- gtk_list_store_newv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_newv"
		}"
		end

	gtk_list_store_prepend (a_list_store: POINTER; an_iter: POINTER) is
 		-- gtk_list_store_prepend
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_prepend"
		}"
		end

	gtk_list_store_remove (a_list_store: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_list_store_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_remove"
		}"
		end

	gtk_list_store_reorder (a_store: POINTER; a_new_order: POINTER) is
 		-- gtk_list_store_reorder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_reorder"
		}"
		end

	gtk_list_store_set (a_list_store: POINTER; an_iter: POINTER) is
 		-- gtk_list_store_set (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set"
		}"
		end

	gtk_list_store_set_column_types (a_list_store: POINTER; a_n_columns: INTEGER; a_types: POINTER) is
 		-- gtk_list_store_set_column_types
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_column_types"
		}"
		end

	gtk_list_store_set_valist (a_list_store: POINTER; an_iter: POINTER; a_var_args: POINTER) is
 		-- gtk_list_store_set_valist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_valist"
		}"
		end

	gtk_list_store_set_value (a_list_store: POINTER; an_iter: POINTER; a_column: INTEGER; a_value: POINTER) is
 		-- gtk_list_store_set_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_value"
		}"
		end

	gtk_list_store_set_valuesv (a_list_store: POINTER; an_iter: POINTER; a_columns: POINTER; a_values: POINTER; a_n_values: INTEGER) is
 		-- gtk_list_store_set_valuesv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_set_valuesv"
		}"
		end

	gtk_list_store_swap (a_store: POINTER; an_a: POINTER; a_b: POINTER) is
 		-- gtk_list_store_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_store_swap"
		}"
		end


end -- class GTKLISTSTORE_EXTERNALS
