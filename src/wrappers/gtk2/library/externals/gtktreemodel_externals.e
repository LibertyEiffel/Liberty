-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_iter_copy (an_iter: POINTER): POINTER is
 		-- gtk_tree_iter_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_copy"
		}"
		end

	gtk_tree_iter_free (an_iter: POINTER) is
 		-- gtk_tree_iter_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_free"
		}"
		end

	gtk_tree_iter_get_type: like long_unsigned is
 		-- gtk_tree_iter_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_get_type()"
		}"
		end

	gtk_tree_model_foreach (a_model: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_tree_model_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_foreach"
		}"
		end

	gtk_tree_model_get (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_get (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get"
		}"
		end

	gtk_tree_model_get_column_type (a_tree_model: POINTER; an_index: INTEGER): like long_unsigned is
 		-- gtk_tree_model_get_column_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_column_type"
		}"
		end

	gtk_tree_model_get_flags (a_tree_model: POINTER): INTEGER is
 		-- gtk_tree_model_get_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_flags"
		}"
		end

	gtk_tree_model_get_iter (a_tree_model: POINTER; an_iter: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_tree_model_get_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter"
		}"
		end

	gtk_tree_model_get_iter_first (a_tree_model: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_model_get_iter_first
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter_first"
		}"
		end

	gtk_tree_model_get_iter_from_string (a_tree_model: POINTER; an_iter: POINTER; a_path_string: POINTER): INTEGER is
 		-- gtk_tree_model_get_iter_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter_from_string"
		}"
		end

	gtk_tree_model_get_n_columns (a_tree_model: POINTER): INTEGER is
 		-- gtk_tree_model_get_n_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_n_columns"
		}"
		end

	gtk_tree_model_get_path (a_tree_model: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_tree_model_get_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_path"
		}"
		end

	gtk_tree_model_get_string_from_iter (a_tree_model: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_tree_model_get_string_from_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_string_from_iter"
		}"
		end

	gtk_tree_model_get_type: like long_unsigned is
 		-- gtk_tree_model_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_type()"
		}"
		end

	gtk_tree_model_get_valist (a_tree_model: POINTER; an_iter: POINTER; a_var_args: POINTER) is
 		-- gtk_tree_model_get_valist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_valist"
		}"
		end

	gtk_tree_model_get_value (a_tree_model: POINTER; an_iter: POINTER; a_column: INTEGER; a_value: POINTER) is
 		-- gtk_tree_model_get_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_value"
		}"
		end

	gtk_tree_model_iter_children (a_tree_model: POINTER; an_iter: POINTER; a_parent: POINTER): INTEGER is
 		-- gtk_tree_model_iter_children
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_children"
		}"
		end

	gtk_tree_model_iter_has_child (a_tree_model: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_model_iter_has_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_has_child"
		}"
		end

	gtk_tree_model_iter_n_children (a_tree_model: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_model_iter_n_children
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_n_children"
		}"
		end

	gtk_tree_model_iter_next (a_tree_model: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_model_iter_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_next"
		}"
		end

	gtk_tree_model_iter_nth_child (a_tree_model: POINTER; an_iter: POINTER; a_parent: POINTER; a_n: INTEGER): INTEGER is
 		-- gtk_tree_model_iter_nth_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_nth_child"
		}"
		end

	gtk_tree_model_iter_parent (a_tree_model: POINTER; an_iter: POINTER; a_child: POINTER): INTEGER is
 		-- gtk_tree_model_iter_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_parent"
		}"
		end

	gtk_tree_model_ref_node (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_ref_node
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_ref_node"
		}"
		end

	gtk_tree_model_row_changed (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_changed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_changed"
		}"
		end

	gtk_tree_model_row_deleted (a_tree_model: POINTER; a_path: POINTER) is
 		-- gtk_tree_model_row_deleted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_deleted"
		}"
		end

	gtk_tree_model_row_has_child_toggled (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_has_child_toggled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_has_child_toggled"
		}"
		end

	gtk_tree_model_row_inserted (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_inserted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_inserted"
		}"
		end

	gtk_tree_model_rows_reordered (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_model_rows_reordered
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_rows_reordered"
		}"
		end

	gtk_tree_model_unref_node (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_unref_node
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_unref_node"
		}"
		end

	gtk_tree_path_append_index (a_path: POINTER; an_index: INTEGER) is
 		-- gtk_tree_path_append_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_append_index"
		}"
		end

	gtk_tree_path_compare (an_a: POINTER; a_b: POINTER): INTEGER is
 		-- gtk_tree_path_compare
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_compare"
		}"
		end

	gtk_tree_path_copy (a_path: POINTER): POINTER is
 		-- gtk_tree_path_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_copy"
		}"
		end

	gtk_tree_path_down (a_path: POINTER) is
 		-- gtk_tree_path_down
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_down"
		}"
		end

	gtk_tree_path_free (a_path: POINTER) is
 		-- gtk_tree_path_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_free"
		}"
		end

	gtk_tree_path_get_depth (a_path: POINTER): INTEGER is
 		-- gtk_tree_path_get_depth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_depth"
		}"
		end

	gtk_tree_path_get_indices (a_path: POINTER): POINTER is
 		-- gtk_tree_path_get_indices
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_indices"
		}"
		end

	gtk_tree_path_get_indices_with_depth (a_path: POINTER; a_depth: POINTER): POINTER is
 		-- gtk_tree_path_get_indices_with_depth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_indices_with_depth"
		}"
		end

	gtk_tree_path_get_type: like long_unsigned is
 		-- gtk_tree_path_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_type()"
		}"
		end

	gtk_tree_path_is_ancestor (a_path: POINTER; a_descendant: POINTER): INTEGER is
 		-- gtk_tree_path_is_ancestor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_is_ancestor"
		}"
		end

	gtk_tree_path_is_descendant (a_path: POINTER; an_ancestor: POINTER): INTEGER is
 		-- gtk_tree_path_is_descendant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_is_descendant"
		}"
		end

	gtk_tree_path_new: POINTER is
 		-- gtk_tree_path_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new()"
		}"
		end

	gtk_tree_path_new_first: POINTER is
 		-- gtk_tree_path_new_first
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_first()"
		}"
		end

	gtk_tree_path_new_from_indices (a_first_index: INTEGER): POINTER is
 		-- gtk_tree_path_new_from_indices (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_from_indices"
		}"
		end

	gtk_tree_path_new_from_string (a_path: POINTER): POINTER is
 		-- gtk_tree_path_new_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_from_string"
		}"
		end

	gtk_tree_path_next (a_path: POINTER) is
 		-- gtk_tree_path_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_next"
		}"
		end

	gtk_tree_path_prepend_index (a_path: POINTER; an_index: INTEGER) is
 		-- gtk_tree_path_prepend_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_prepend_index"
		}"
		end

	gtk_tree_path_prev (a_path: POINTER): INTEGER is
 		-- gtk_tree_path_prev
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_prev"
		}"
		end

	gtk_tree_path_to_string (a_path: POINTER): POINTER is
 		-- gtk_tree_path_to_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_to_string"
		}"
		end

	gtk_tree_path_up (a_path: POINTER): INTEGER is
 		-- gtk_tree_path_up
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_up"
		}"
		end

	gtk_tree_row_reference_copy (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_copy"
		}"
		end

	gtk_tree_row_reference_deleted (a_proxy: POINTER; a_path: POINTER) is
 		-- gtk_tree_row_reference_deleted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_deleted"
		}"
		end

	gtk_tree_row_reference_free (a_reference: POINTER) is
 		-- gtk_tree_row_reference_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_free"
		}"
		end

	gtk_tree_row_reference_get_model (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_model"
		}"
		end

	gtk_tree_row_reference_get_path (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_get_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_path"
		}"
		end

	gtk_tree_row_reference_get_type: like long_unsigned is
 		-- gtk_tree_row_reference_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_type()"
		}"
		end

	gtk_tree_row_reference_inserted (a_proxy: POINTER; a_path: POINTER) is
 		-- gtk_tree_row_reference_inserted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_inserted"
		}"
		end

	gtk_tree_row_reference_new (a_model: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_row_reference_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_new"
		}"
		end

	gtk_tree_row_reference_new_proxy (a_proxy: POINTER; a_model: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_row_reference_new_proxy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_new_proxy"
		}"
		end

	gtk_tree_row_reference_reordered (a_proxy: POINTER; a_path: POINTER; an_iter: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_row_reference_reordered
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_reordered"
		}"
		end

	gtk_tree_row_reference_valid (a_reference: POINTER): INTEGER is
 		-- gtk_tree_row_reference_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_valid"
		}"
		end


end -- class GTKTREEMODEL_EXTERNALS
