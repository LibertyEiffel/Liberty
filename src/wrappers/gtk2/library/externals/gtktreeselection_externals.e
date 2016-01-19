-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREESELECTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_selection_count_selected_rows (a_selection: POINTER): INTEGER is
 		-- gtk_tree_selection_count_selected_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_count_selected_rows"
		}"
		end

	gtk_tree_selection_get_mode (a_selection: POINTER): INTEGER is
 		-- gtk_tree_selection_get_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_mode"
		}"
		end

	gtk_tree_selection_get_select_function (a_selection: POINTER): POINTER is
 		-- gtk_tree_selection_get_select_function
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_select_function"
		}"
		end

	gtk_tree_selection_get_selected (a_selection: POINTER; a_model: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_selection_get_selected
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_selected"
		}"
		end

	gtk_tree_selection_get_selected_rows (a_selection: POINTER; a_model: POINTER): POINTER is
 		-- gtk_tree_selection_get_selected_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_selected_rows"
		}"
		end

	gtk_tree_selection_get_tree_view (a_selection: POINTER): POINTER is
 		-- gtk_tree_selection_get_tree_view
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_tree_view"
		}"
		end

	gtk_tree_selection_get_type: like long_unsigned is
 		-- gtk_tree_selection_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_type()"
		}"
		end

	gtk_tree_selection_get_user_data (a_selection: POINTER): POINTER is
 		-- gtk_tree_selection_get_user_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_user_data"
		}"
		end

	gtk_tree_selection_iter_is_selected (a_selection: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_selection_iter_is_selected
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_iter_is_selected"
		}"
		end

	gtk_tree_selection_path_is_selected (a_selection: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_tree_selection_path_is_selected
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_path_is_selected"
		}"
		end

	gtk_tree_selection_select_all (a_selection: POINTER) is
 		-- gtk_tree_selection_select_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_all"
		}"
		end

	gtk_tree_selection_select_iter (a_selection: POINTER; an_iter: POINTER) is
 		-- gtk_tree_selection_select_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_iter"
		}"
		end

	gtk_tree_selection_select_path (a_selection: POINTER; a_path: POINTER) is
 		-- gtk_tree_selection_select_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_path"
		}"
		end

	gtk_tree_selection_select_range (a_selection: POINTER; a_start_path: POINTER; an_end_path: POINTER) is
 		-- gtk_tree_selection_select_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_range"
		}"
		end

	gtk_tree_selection_selected_foreach (a_selection: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_tree_selection_selected_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_selected_foreach"
		}"
		end

	gtk_tree_selection_set_mode (a_selection: POINTER; a_type: INTEGER) is
 		-- gtk_tree_selection_set_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_set_mode"
		}"
		end

	gtk_tree_selection_set_select_function (a_selection: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_selection_set_select_function
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_set_select_function"
		}"
		end

	gtk_tree_selection_unselect_all (a_selection: POINTER) is
 		-- gtk_tree_selection_unselect_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_all"
		}"
		end

	gtk_tree_selection_unselect_iter (a_selection: POINTER; an_iter: POINTER) is
 		-- gtk_tree_selection_unselect_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_iter"
		}"
		end

	gtk_tree_selection_unselect_path (a_selection: POINTER; a_path: POINTER) is
 		-- gtk_tree_selection_unselect_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_path"
		}"
		end

	gtk_tree_selection_unselect_range (a_selection: POINTER; a_start_path: POINTER; an_end_path: POINTER) is
 		-- gtk_tree_selection_unselect_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_range"
		}"
		end


end -- class GTKTREESELECTION_EXTERNALS
