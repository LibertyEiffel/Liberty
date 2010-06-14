-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_path_compare (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- gtk_tree_path_compare (node at line 1067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_compare"
		}"
		end

	gtk_tree_path_get_indices (a_path: POINTER): POINTER is
 		-- gtk_tree_path_get_indices (node at line 1560)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_indices"
		}"
		end

	gtk_tree_model_rows_reordered (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_model_rows_reordered (node at line 2048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_rows_reordered"
		}"
		end

	gtk_tree_model_get_column_type (a_tree_model: POINTER; an_index: INTEGER_32): NATURAL_32 is
 		-- gtk_tree_model_get_column_type (node at line 2163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_column_type"
		}"
		end

	gtk_tree_path_down (a_path: POINTER) is
 		-- gtk_tree_path_down (node at line 3016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_down"
		}"
		end

	gtk_tree_path_get_type: NATURAL_32 is
 		-- gtk_tree_path_get_type (node at line 4604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_type()"
		}"
		end

	gtk_tree_iter_copy (an_iter: POINTER): POINTER is
 		-- gtk_tree_iter_copy (node at line 7062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_copy"
		}"
		end

	gtk_tree_model_get_string_from_iter (a_tree_model: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_tree_model_get_string_from_iter (node at line 7298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_string_from_iter"
		}"
		end

	gtk_tree_model_row_changed (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_changed (node at line 8652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_changed"
		}"
		end

	gtk_tree_path_next (a_path: POINTER) is
 		-- gtk_tree_path_next (node at line 10018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_next"
		}"
		end

	gtk_tree_model_ref_node (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_ref_node (node at line 10431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_ref_node"
		}"
		end

	gtk_tree_row_reference_reordered (a_proxy: POINTER; a_path: POINTER; an_iter: POINTER; a_new_order: POINTER) is
 		-- gtk_tree_row_reference_reordered (node at line 11182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_reordered"
		}"
		end

	gtk_tree_row_reference_deleted (a_proxy: POINTER; a_path: POINTER) is
 		-- gtk_tree_row_reference_deleted (node at line 11763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_deleted"
		}"
		end

	gtk_tree_path_prev (a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_path_prev (node at line 11932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_prev"
		}"
		end

	gtk_tree_path_new: POINTER is
 		-- gtk_tree_path_new (node at line 13980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new()"
		}"
		end

	gtk_tree_iter_free (an_iter: POINTER) is
 		-- gtk_tree_iter_free (node at line 14012)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_free"
		}"
		end

	gtk_tree_model_iter_next (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_next (node at line 14419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_next"
		}"
		end

	gtk_tree_row_reference_valid (a_reference: POINTER): INTEGER_32 is
 		-- gtk_tree_row_reference_valid (node at line 14640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_valid"
		}"
		end

	gtk_tree_iter_get_type: NATURAL_32 is
 		-- gtk_tree_iter_get_type (node at line 14849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_get_type()"
		}"
		end

	gtk_tree_model_foreach (a_model: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_tree_model_foreach (node at line 15183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_foreach"
		}"
		end

	gtk_tree_path_free (a_path: POINTER) is
 		-- gtk_tree_path_free (node at line 16009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_free"
		}"
		end

	gtk_tree_path_copy (a_path: POINTER): POINTER is
 		-- gtk_tree_path_copy (node at line 17396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_copy"
		}"
		end

	gtk_tree_model_get_flags (a_tree_model: POINTER): INTEGER is
 		-- gtk_tree_model_get_flags (node at line 17873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_flags"
		}"
		end

	gtk_tree_path_append_index (a_path: POINTER; an_index: INTEGER_32) is
 		-- gtk_tree_path_append_index (node at line 18544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_append_index"
		}"
		end

	gtk_tree_model_get_n_columns (a_tree_model: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_n_columns (node at line 19197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_n_columns"
		}"
		end

	gtk_tree_model_get (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_get (variadic call)  (node at line 21631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get"
		}"
		end

	gtk_tree_row_reference_new_proxy (a_proxy: POINTER; a_model: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_row_reference_new_proxy (node at line 21739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_new_proxy"
		}"
		end

	gtk_tree_path_is_ancestor (a_path: POINTER; a_descendant: POINTER): INTEGER_32 is
 		-- gtk_tree_path_is_ancestor (node at line 21997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_is_ancestor"
		}"
		end

	gtk_tree_model_iter_n_children (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_n_children (node at line 22336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_n_children"
		}"
		end

	gtk_tree_model_get_iter_first (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_iter_first (node at line 22535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter_first"
		}"
		end

	gtk_tree_row_reference_get_model (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_get_model (node at line 22911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_model"
		}"
		end

	gtk_tree_model_get_type: NATURAL_32 is
 		-- gtk_tree_model_get_type (node at line 23305)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_type()"
		}"
		end

	gtk_tree_model_iter_nth_child (a_tree_model: POINTER; an_iter: POINTER; a_parent: POINTER; a_n: INTEGER_32): INTEGER_32 is
 		-- gtk_tree_model_iter_nth_child (node at line 23554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_nth_child"
		}"
		end

	gtk_tree_model_unref_node (a_tree_model: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_unref_node (node at line 23562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_unref_node"
		}"
		end

	gtk_tree_model_get_valist (a_tree_model: POINTER; an_iter: POINTER; a_var_args: POINTER) is
 		-- gtk_tree_model_get_valist (node at line 24019)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_valist"
		}"
		end

	gtk_tree_model_iter_parent (a_tree_model: POINTER; an_iter: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_parent (node at line 24455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_parent"
		}"
		end

	gtk_tree_row_reference_get_type: NATURAL_32 is
 		-- gtk_tree_row_reference_get_type (node at line 24770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_type()"
		}"
		end

	gtk_tree_row_reference_get_path (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_get_path (node at line 24858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_get_path"
		}"
		end

	gtk_tree_model_row_deleted (a_tree_model: POINTER; a_path: POINTER) is
 		-- gtk_tree_model_row_deleted (node at line 24919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_deleted"
		}"
		end

	gtk_tree_path_prepend_index (a_path: POINTER; an_index: INTEGER_32) is
 		-- gtk_tree_path_prepend_index (node at line 27002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_prepend_index"
		}"
		end

	gtk_tree_model_get_path (a_tree_model: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_tree_model_get_path (node at line 27216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_path"
		}"
		end

	gtk_tree_model_row_has_child_toggled (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_has_child_toggled (node at line 28101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_has_child_toggled"
		}"
		end

	gtk_tree_row_reference_free (a_reference: POINTER) is
 		-- gtk_tree_row_reference_free (node at line 28682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_free"
		}"
		end

	gtk_tree_path_new_from_string (a_path: POINTER): POINTER is
 		-- gtk_tree_path_new_from_string (node at line 28686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_from_string"
		}"
		end

	gtk_tree_model_iter_children (a_tree_model: POINTER; an_iter: POINTER; a_parent: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_children (node at line 28840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_children"
		}"
		end

	gtk_tree_row_reference_new (a_model: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_row_reference_new (node at line 30857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_new"
		}"
		end

	gtk_tree_row_reference_copy (a_reference: POINTER): POINTER is
 		-- gtk_tree_row_reference_copy (node at line 30960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_copy"
		}"
		end

	gtk_tree_path_get_depth (a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_path_get_depth (node at line 30969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_get_depth"
		}"
		end

	gtk_tree_path_new_first: POINTER is
 		-- gtk_tree_path_new_first (node at line 31100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_first()"
		}"
		end

	gtk_tree_model_get_iter (a_tree_model: POINTER; an_iter: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_iter (node at line 33060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter"
		}"
		end

	gtk_tree_path_new_from_indices (a_first_index: INTEGER_32): POINTER is
 		-- gtk_tree_path_new_from_indices (variadic call)  (node at line 33374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_new_from_indices"
		}"
		end

	gtk_tree_model_row_inserted (a_tree_model: POINTER; a_path: POINTER; an_iter: POINTER) is
 		-- gtk_tree_model_row_inserted (node at line 34457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_row_inserted"
		}"
		end

	gtk_tree_model_get_value (a_tree_model: POINTER; an_iter: POINTER; a_column: INTEGER_32; a_value: POINTER) is
 		-- gtk_tree_model_get_value (node at line 34612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_value"
		}"
		end

	gtk_tree_path_to_string (a_path: POINTER): POINTER is
 		-- gtk_tree_path_to_string (node at line 35458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_to_string"
		}"
		end

	gtk_tree_path_up (a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_path_up (node at line 35765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_up"
		}"
		end

	gtk_tree_model_iter_has_child (a_tree_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_iter_has_child (node at line 36181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_iter_has_child"
		}"
		end

	gtk_tree_row_reference_inserted (a_proxy: POINTER; a_path: POINTER) is
 		-- gtk_tree_row_reference_inserted (node at line 37224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_row_reference_inserted"
		}"
		end

	gtk_tree_model_get_iter_from_string (a_tree_model: POINTER; an_iter: POINTER; a_path_string: POINTER): INTEGER_32 is
 		-- gtk_tree_model_get_iter_from_string (node at line 37418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_get_iter_from_string"
		}"
		end

	gtk_tree_path_is_descendant (a_path: POINTER; an_ancestor: POINTER): INTEGER_32 is
 		-- gtk_tree_path_is_descendant (node at line 37590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_path_is_descendant"
		}"
		end


end -- class GTKTREEMODEL_EXTERNALS
