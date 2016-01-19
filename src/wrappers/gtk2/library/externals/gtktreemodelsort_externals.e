-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODELSORT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_model_sort_clear_cache (a_tree_model_sort: POINTER) is
 		-- gtk_tree_model_sort_clear_cache
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_clear_cache"
		}"
		end

	gtk_tree_model_sort_convert_child_iter_to_iter (a_tree_model_sort: POINTER; a_sort_iter: POINTER; a_child_iter: POINTER): INTEGER is
 		-- gtk_tree_model_sort_convert_child_iter_to_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_child_iter_to_iter"
		}"
		end

	gtk_tree_model_sort_convert_child_path_to_path (a_tree_model_sort: POINTER; a_child_path: POINTER): POINTER is
 		-- gtk_tree_model_sort_convert_child_path_to_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_child_path_to_path"
		}"
		end

	gtk_tree_model_sort_convert_iter_to_child_iter (a_tree_model_sort: POINTER; a_child_iter: POINTER; a_sorted_iter: POINTER) is
 		-- gtk_tree_model_sort_convert_iter_to_child_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_iter_to_child_iter"
		}"
		end

	gtk_tree_model_sort_convert_path_to_child_path (a_tree_model_sort: POINTER; a_sorted_path: POINTER): POINTER is
 		-- gtk_tree_model_sort_convert_path_to_child_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_convert_path_to_child_path"
		}"
		end

	gtk_tree_model_sort_get_model (a_tree_model: POINTER): POINTER is
 		-- gtk_tree_model_sort_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_get_model"
		}"
		end

	gtk_tree_model_sort_get_type: like long_unsigned is
 		-- gtk_tree_model_sort_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_get_type()"
		}"
		end

	gtk_tree_model_sort_iter_is_valid (a_tree_model_sort: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_model_sort_iter_is_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_iter_is_valid"
		}"
		end

	gtk_tree_model_sort_new_with_model (a_child_model: POINTER): POINTER is
 		-- gtk_tree_model_sort_new_with_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_new_with_model"
		}"
		end

	gtk_tree_model_sort_reset_default_sort_func (a_tree_model_sort: POINTER) is
 		-- gtk_tree_model_sort_reset_default_sort_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_model_sort_reset_default_sort_func"
		}"
		end


end -- class GTKTREEMODELSORT_EXTERNALS
