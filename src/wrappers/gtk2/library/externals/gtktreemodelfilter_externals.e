-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODELFILTER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_model_filter_clear_cache (a_filter: POINTER) is
 		-- gtk_tree_model_filter_clear_cache
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_clear_cache"
		}"
		end

	gtk_tree_model_filter_convert_child_iter_to_iter (a_filter: POINTER; a_filter_iter: POINTER; a_child_iter: POINTER): INTEGER is
 		-- gtk_tree_model_filter_convert_child_iter_to_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_child_iter_to_iter"
		}"
		end

	gtk_tree_model_filter_convert_child_path_to_path (a_filter: POINTER; a_child_path: POINTER): POINTER is
 		-- gtk_tree_model_filter_convert_child_path_to_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_child_path_to_path"
		}"
		end

	gtk_tree_model_filter_convert_iter_to_child_iter (a_filter: POINTER; a_child_iter: POINTER; a_filter_iter: POINTER) is
 		-- gtk_tree_model_filter_convert_iter_to_child_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_iter_to_child_iter"
		}"
		end

	gtk_tree_model_filter_convert_path_to_child_path (a_filter: POINTER; a_filter_path: POINTER): POINTER is
 		-- gtk_tree_model_filter_convert_path_to_child_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_path_to_child_path"
		}"
		end

	gtk_tree_model_filter_get_model (a_filter: POINTER): POINTER is
 		-- gtk_tree_model_filter_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_get_model"
		}"
		end

	gtk_tree_model_filter_get_type: like long_unsigned is
 		-- gtk_tree_model_filter_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_get_type()"
		}"
		end

	gtk_tree_model_filter_new (a_child_model: POINTER; a_root: POINTER): POINTER is
 		-- gtk_tree_model_filter_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_new"
		}"
		end

	gtk_tree_model_filter_refilter (a_filter: POINTER) is
 		-- gtk_tree_model_filter_refilter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_refilter"
		}"
		end

	gtk_tree_model_filter_set_modify_func (a_filter: POINTER; a_n_columns: INTEGER; a_types: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_model_filter_set_modify_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_set_modify_func"
		}"
		end

	gtk_tree_model_filter_set_visible_column (a_filter: POINTER; a_column: INTEGER) is
 		-- gtk_tree_model_filter_set_visible_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_set_visible_column"
		}"
		end

	gtk_tree_model_filter_set_visible_func (a_filter: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_model_filter_set_visible_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_set_visible_func"
		}"
		end


end -- class GTKTREEMODELFILTER_EXTERNALS
