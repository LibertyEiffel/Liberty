-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODELFILTER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_model_filter_convert_iter_to_child_iter (a_filter: POINTER; a_child_iter: POINTER; a_filter_iter: POINTER) is
 		-- gtk_tree_model_filter_convert_iter_to_child_iter (node at line 1060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_iter_to_child_iter"
		}"
		end

	gtk_tree_model_filter_new (a_child_model: POINTER; a_root: POINTER): POINTER is
 		-- gtk_tree_model_filter_new (node at line 1252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_new"
		}"
		end

	gtk_tree_model_filter_set_visible_column (a_filter: POINTER; a_column: INTEGER_32) is
 		-- gtk_tree_model_filter_set_visible_column (node at line 2011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_set_visible_column"
		}"
		end

	gtk_tree_model_filter_refilter (a_filter: POINTER) is
 		-- gtk_tree_model_filter_refilter (node at line 5831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_refilter"
		}"
		end

	gtk_tree_model_filter_set_visible_func (a_filter: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_model_filter_set_visible_func (node at line 20000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_set_visible_func"
		}"
		end

	gtk_tree_model_filter_get_type: NATURAL_32 is
 		-- gtk_tree_model_filter_get_type (node at line 28200)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_get_type()"
		}"
		end

	gtk_tree_model_filter_convert_child_path_to_path (a_filter: POINTER; a_child_path: POINTER): POINTER is
 		-- gtk_tree_model_filter_convert_child_path_to_path (node at line 31874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_child_path_to_path"
		}"
		end

	gtk_tree_model_filter_clear_cache (a_filter: POINTER) is
 		-- gtk_tree_model_filter_clear_cache (node at line 33534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_clear_cache"
		}"
		end

	gtk_tree_model_filter_convert_path_to_child_path (a_filter: POINTER; a_filter_path: POINTER): POINTER is
 		-- gtk_tree_model_filter_convert_path_to_child_path (node at line 33903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_path_to_child_path"
		}"
		end

	gtk_tree_model_filter_get_model (a_filter: POINTER): POINTER is
 		-- gtk_tree_model_filter_get_model (node at line 33977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_get_model"
		}"
		end

	gtk_tree_model_filter_set_modify_func (a_filter: POINTER; a_n_columns: INTEGER_32; a_types: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_model_filter_set_modify_func (node at line 35126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_set_modify_func"
		}"
		end

	gtk_tree_model_filter_convert_child_iter_to_iter (a_filter: POINTER; a_filter_iter: POINTER; a_child_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_filter_convert_child_iter_to_iter (node at line 37026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_filter_convert_child_iter_to_iter"
		}"
		end


end -- class GTKTREEMODELFILTER_EXTERNALS
