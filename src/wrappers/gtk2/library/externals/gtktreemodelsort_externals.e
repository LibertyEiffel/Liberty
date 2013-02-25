-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODELSORT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_model_sort_convert_child_iter_to_iter (a_tree_model_sort: POINTER; a_sort_iter: POINTER; a_child_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_sort_convert_child_iter_to_iter (node at line 3069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_child_iter_to_iter"
		}"
		end

	gtk_tree_model_sort_convert_iter_to_child_iter (a_tree_model_sort: POINTER; a_child_iter: POINTER; a_sorted_iter: POINTER) is
 		-- gtk_tree_model_sort_convert_iter_to_child_iter (node at line 4997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_iter_to_child_iter"
		}"
		end

	gtk_tree_model_sort_new_with_model (a_child_model: POINTER): POINTER is
 		-- gtk_tree_model_sort_new_with_model (node at line 5538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_new_with_model"
		}"
		end

	gtk_tree_model_sort_clear_cache (a_tree_model_sort: POINTER) is
 		-- gtk_tree_model_sort_clear_cache (node at line 14923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_clear_cache"
		}"
		end

	gtk_tree_model_sort_get_type: NATURAL_64 is
 		-- gtk_tree_model_sort_get_type (node at line 31752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_get_type()"
		}"
		end

	gtk_tree_model_sort_get_model (a_tree_model: POINTER): POINTER is
 		-- gtk_tree_model_sort_get_model (node at line 32855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_get_model"
		}"
		end

	gtk_tree_model_sort_iter_is_valid (a_tree_model_sort: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_model_sort_iter_is_valid (node at line 33281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_iter_is_valid"
		}"
		end

	gtk_tree_model_sort_reset_default_sort_func (a_tree_model_sort: POINTER) is
 		-- gtk_tree_model_sort_reset_default_sort_func (node at line 33417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_reset_default_sort_func"
		}"
		end

	gtk_tree_model_sort_convert_child_path_to_path (a_tree_model_sort: POINTER; a_child_path: POINTER): POINTER is
 		-- gtk_tree_model_sort_convert_child_path_to_path (node at line 38393)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_child_path_to_path"
		}"
		end

	gtk_tree_model_sort_convert_path_to_child_path (a_tree_model_sort: POINTER; a_sorted_path: POINTER): POINTER is
 		-- gtk_tree_model_sort_convert_path_to_child_path (node at line 40642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_path_to_child_path"
		}"
		end


end -- class GTKTREEMODELSORT_EXTERNALS
