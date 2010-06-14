-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREESELECTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_selection_get_user_data (a_selection: POINTER): POINTER is
 		-- gtk_tree_selection_get_user_data (node at line 3184)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_user_data"
		}"
		end

	gtk_tree_selection_set_select_function (a_selection: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_selection_set_select_function (node at line 4545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_set_select_function"
		}"
		end

	gtk_tree_selection_select_path (a_selection: POINTER; a_path: POINTER) is
 		-- gtk_tree_selection_select_path (node at line 5191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_path"
		}"
		end

	gtk_tree_selection_unselect_iter (a_selection: POINTER; an_iter: POINTER) is
 		-- gtk_tree_selection_unselect_iter (node at line 5227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_iter"
		}"
		end

	gtk_tree_selection_get_selected (a_selection: POINTER; a_model: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_selection_get_selected (node at line 5402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_selected"
		}"
		end

	gtk_tree_selection_set_mode (a_selection: POINTER; a_type: INTEGER) is
 		-- gtk_tree_selection_set_mode (node at line 6621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_set_mode"
		}"
		end

	gtk_tree_selection_select_iter (a_selection: POINTER; an_iter: POINTER) is
 		-- gtk_tree_selection_select_iter (node at line 11500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_iter"
		}"
		end

	gtk_tree_selection_select_all (a_selection: POINTER) is
 		-- gtk_tree_selection_select_all (node at line 11719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_all"
		}"
		end

	gtk_tree_selection_selected_foreach (a_selection: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_tree_selection_selected_foreach (node at line 13914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_selected_foreach"
		}"
		end

	gtk_tree_selection_get_selected_rows (a_selection: POINTER; a_model: POINTER): POINTER is
 		-- gtk_tree_selection_get_selected_rows (node at line 15134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_selected_rows"
		}"
		end

	gtk_tree_selection_select_range (a_selection: POINTER; a_start_path: POINTER; an_end_path: POINTER) is
 		-- gtk_tree_selection_select_range (node at line 16922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_select_range"
		}"
		end

	gtk_tree_selection_get_select_function (a_selection: POINTER): POINTER is
 		-- gtk_tree_selection_get_select_function (node at line 17161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_select_function"
		}"
		end

	gtk_tree_selection_unselect_all (a_selection: POINTER) is
 		-- gtk_tree_selection_unselect_all (node at line 18389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_all"
		}"
		end

	gtk_tree_selection_iter_is_selected (a_selection: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_selection_iter_is_selected (node at line 20694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_iter_is_selected"
		}"
		end

	gtk_tree_selection_get_type: NATURAL_32 is
 		-- gtk_tree_selection_get_type (node at line 20943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_type()"
		}"
		end

	gtk_tree_selection_count_selected_rows (a_selection: POINTER): INTEGER_32 is
 		-- gtk_tree_selection_count_selected_rows (node at line 24520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_count_selected_rows"
		}"
		end

	gtk_tree_selection_get_mode (a_selection: POINTER): INTEGER is
 		-- gtk_tree_selection_get_mode (node at line 27469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_mode"
		}"
		end

	gtk_tree_selection_get_tree_view (a_selection: POINTER): POINTER is
 		-- gtk_tree_selection_get_tree_view (node at line 29283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_get_tree_view"
		}"
		end

	gtk_tree_selection_path_is_selected (a_selection: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_selection_path_is_selected (node at line 29380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_path_is_selected"
		}"
		end

	gtk_tree_selection_unselect_range (a_selection: POINTER; a_start_path: POINTER; an_end_path: POINTER) is
 		-- gtk_tree_selection_unselect_range (node at line 36133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_range"
		}"
		end

	gtk_tree_selection_unselect_path (a_selection: POINTER; a_path: POINTER) is
 		-- gtk_tree_selection_unselect_path (node at line 36330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_selection_unselect_path"
		}"
		end


end -- class GTKTREESELECTION_EXTERNALS
