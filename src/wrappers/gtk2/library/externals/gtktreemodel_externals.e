-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_path_compare (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gtk_tree_path_compare (node at line 1027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_compare"
		}"
		end

	gtk_tree_path_get_indices (a_path: POINTER): POINTER is
 		-- gtk_tree_path_get_indices (node at line 1507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_indices"
		}"
		end

	gtk_tree_model_rows_reordered (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_model_rows_reordered (node at line 1935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_rows_reordered"
		}"
		end

	gtk_tree_model_get_column_type (a_tree_model: POINTER; an_index: INTEGER_32): NATURAL_64 is
 		-- gtk_tree_model_get_column_type (node at line 2057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_column_type"
		}"
		end

	gtk_tree_path_get_indices_with_depth (a_path: POINTER; a_depth: POINTER): POINTER is
 		-- gtk_tree_path_get_indices_with_depth (node at line 3079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_indices_with_depth"
		}"
		end

	gtk_tree_iter_copy (an_iter: POINTER): POINTER is
 		-- gtk_tree_iter_copy (node at line 7718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_copy"
		}"
		end

	gtk_tree_model_get_string_from_iter (a_tree_model: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_tree_model_get_string_from_iter (node at line 7991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_string_from_iter"
		}"
		end

	gtk_tree_model_row_changed (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_changed (node at line 9365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_changed"
		}"
		end

	gtk_tree_path_next (a_path: POINTER) is
 		-- gtk_tree_path_next (node at line 10784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_next"
		}"
		end

	gtk_tree_model_ref_node (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_ref_node (node at line 11318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_ref_node"
		}"
		end

	gtk_tree_row_reference_reordered (a_proxy: POINTER; a_path: POINTER; an_iter: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_row_reference_reordered (node at line 12159)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_reordered"
		}"
		end

	gtk_tree_row_reference_deleted (a_proxy: POINTER; a_path: POINTER) is
 		-- gtk_tree_row_reference_deleted (node at line 12801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_deleted"
		}"
		end

	gtk_tree_path_prev (a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_path_prev (node at line 12985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_prev"
		}"
		end

	gtk_tree_model_iter_next (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_next (node at line 15577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_next"
		}"
		end

	gtk_tree_row_reference_valid (a_reference: POINTER): INTEGER_32 is
 		-- gtk_tree_row_reference_valid (node at line 15828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_valid"
		}"
		end

	gtk_tree_iter_get_type: NATURAL_64 is
 		-- gtk_tree_iter_get_type (node at line 16108)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_get_type()"
		}"
		end

	gtk_tree_path_free (a_path: POINTER) is
 		-- gtk_tree_path_free (node at line 17374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_free"
		}"
		end

	gtk_tree_path_copy (a_path: POINTER): POINTER is
 		-- gtk_tree_path_copy (node at line 19052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_copy"
		}"
		end

	gtk_tree_model_get_value (a_tree_model: POINTER; an_iter: POINTER; a_column: INTEGER_32; a_value: POINTER) is
 		-- gtk_tree_model_get_value (node at line 19254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_value"
		}"
		end

	gtk_tree_model_get_flags (a_tree_model: POINTER): INTEGER is
 		-- gtk_tree_model_get_flags (node at line 19564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_flags"
		}"
		end

	gtk_tree_row_reference_copy (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_copy (node at line 19586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_copy"
		}"
		end

	gtk_tree_model_iter_has_child (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_has_child (node at line 20148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_has_child"
		}"
		end

	gtk_tree_path_append_index (a_path: POINTER; an_index: INTEGER_32) is
 		-- gtk_tree_path_append_index (node at line 20227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_append_index"
		}"
		end

	gtk_tree_model_get_n_columns (a_tree_model: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_n_columns (node at line 21027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_n_columns"
		}"
		end

	gtk_tree_model_get (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_get (variadic call)  (node at line 23861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get"
		}"
		end

	gtk_tree_path_is_ancestor (a_path: POINTER; a_descendant: POINTER): INTEGER_32 is
 		-- gtk_tree_path_is_ancestor (node at line 24235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_is_ancestor"
		}"
		end

	gtk_tree_model_iter_n_children (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_n_children (node at line 24612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_n_children"
		}"
		end

	gtk_tree_model_get_iter_first (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_iter_first (node at line 24802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter_first"
		}"
		end

	gtk_tree_path_down (a_path: POINTER) is
 		-- gtk_tree_path_down (node at line 25223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_down"
		}"
		end

	gtk_tree_model_get_type: NATURAL_64 is
 		-- gtk_tree_model_get_type (node at line 25658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_type()"
		}"
		end

	gtk_tree_model_iter_nth_child (a_tree_model: POINTER; an_iter: POINTER; a_parent: POINTER; a_n: INTEGER_32): INTEGER_32 is
 		-- gtk_tree_model_iter_nth_child (node at line 25916)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_nth_child"
		}"
		end

	gtk_tree_model_unref_node (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_unref_node (node at line 25922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_unref_node"
		}"
		end

	gtk_tree_model_get_valist (a_tree_model: POINTER; an_iter: POINTER; a_var_args: POINTER) is
 		-- gtk_tree_model_get_valist (node at line 26523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_valist"
		}"
		end

	gtk_tree_model_iter_parent (a_tree_model: POINTER; an_iter: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_parent (node at line 26997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_parent"
		}"
		end

	gtk_tree_row_reference_get_type: NATURAL_64 is
 		-- gtk_tree_row_reference_get_type (node at line 27348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_type()"
		}"
		end

	gtk_tree_row_reference_get_path (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_get_path (node at line 27564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_path"
		}"
		end

	gtk_tree_model_row_deleted (a_tree_model: POINTER; a_path: POINTER) is
 		-- gtk_tree_model_row_deleted (node at line 27639)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_deleted"
		}"
		end

	gtk_tree_path_get_depth (a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_path_get_depth (node at line 29128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_depth"
		}"
		end

	gtk_tree_path_prepend_index (a_path: POINTER; an_index: INTEGER_32) is
 		-- gtk_tree_path_prepend_index (node at line 29810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_prepend_index"
		}"
		end

	gtk_tree_model_get_path (a_tree_model: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_tree_model_get_path (node at line 30035)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_path"
		}"
		end

	gtk_tree_model_row_has_child_toggled (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_has_child_toggled (node at line 31089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_has_child_toggled"
		}"
		end

	gtk_tree_path_new_from_string (a_path: POINTER): POINTER is
 		-- gtk_tree_path_new_from_string (node at line 31720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_from_string"
		}"
		end

	gtk_tree_model_iter_children (a_tree_model: POINTER; an_iter: POINTER; a_parent: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_children (node at line 31822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_children"
		}"
		end

	gtk_tree_model_foreach (a_model: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_tree_model_foreach (node at line 32015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_foreach"
		}"
		end

	gtk_tree_row_reference_free (a_reference: POINTER) is
 		-- gtk_tree_row_reference_free (node at line 32629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_free"
		}"
		end

	gtk_tree_iter_free (an_iter: POINTER) is
 		-- gtk_tree_iter_free (node at line 32871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_free"
		}"
		end

	gtk_tree_row_reference_new (a_model: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_row_reference_new (node at line 34064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_new"
		}"
		end

	gtk_tree_path_new_first: POINTER is
 		-- gtk_tree_path_new_first (node at line 34347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_first()"
		}"
		end

	gtk_tree_path_new: POINTER is
 		-- gtk_tree_path_new (node at line 34523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new()"
		}"
		end

	gtk_tree_model_get_iter (a_tree_model: POINTER; an_iter: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_iter (node at line 36448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter"
		}"
		end

	gtk_tree_path_new_from_indices (a_first_index: INTEGER_32): POINTER is
 		-- gtk_tree_path_new_from_indices (variadic call)  (node at line 36850)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_from_indices"
		}"
		end

	gtk_tree_row_reference_get_model (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_get_model (node at line 37646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_model"
		}"
		end

	gtk_tree_model_row_inserted (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_inserted (node at line 37954)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_inserted"
		}"
		end

	gtk_tree_path_get_type: NATURAL_64 is
 		-- gtk_tree_path_get_type (node at line 38790)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_type()"
		}"
		end

	gtk_tree_row_reference_new_proxy (a_proxy: POINTER; a_model: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_row_reference_new_proxy (node at line 38835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_new_proxy"
		}"
		end

	gtk_tree_path_to_string (a_path: POINTER): POINTER is
 		-- gtk_tree_path_to_string (node at line 39036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_to_string"
		}"
		end

	gtk_tree_path_up (a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_path_up (node at line 39356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_up"
		}"
		end

	gtk_tree_row_reference_inserted (a_proxy: POINTER; a_path: POINTER) is
 		-- gtk_tree_row_reference_inserted (node at line 40910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_inserted"
		}"
		end

	gtk_tree_model_get_iter_from_string (a_tree_model: POINTER; an_iter: POINTER; a_path_string: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_iter_from_string (node at line 41097)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter_from_string"
		}"
		end

	gtk_tree_path_is_descendant (a_path: POINTER; an_ancestor: POINTER): INTEGER_32 is
 		-- gtk_tree_path_is_descendant (node at line 41284)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_is_descendant"
		}"
		end


end -- class GTKTREEMODEL_EXTERNALS
