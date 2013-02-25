-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREESORTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_sortable_set_sort_column_id (a_sortable: POINTER; a_sort_column_id: INTEGER_32; an_order: INTEGER) is
 		-- gtk_tree_sortable_set_sort_column_id (node at line 8769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_set_sort_column_id"
		}"
		end

	gtk_tree_sortable_set_default_sort_func (a_sortable: POINTER; a_sort_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_sortable_set_default_sort_func (node at line 11635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_set_default_sort_func"
		}"
		end

	gtk_tree_sortable_sort_column_changed (a_sortable: POINTER) is
 		-- gtk_tree_sortable_sort_column_changed (node at line 27235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_sort_column_changed"
		}"
		end

	gtk_tree_sortable_get_type: NATURAL_64 is
 		-- gtk_tree_sortable_get_type (node at line 35199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_get_type()"
		}"
		end

	gtk_tree_sortable_has_default_sort_func (a_sortable: POINTER): INTEGER_32 is
 		-- gtk_tree_sortable_has_default_sort_func (node at line 36388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_has_default_sort_func"
		}"
		end

	gtk_tree_sortable_set_sort_func (a_sortable: POINTER; a_sort_column_id: INTEGER_32; a_sort_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_sortable_set_sort_func (node at line 37546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_set_sort_func"
		}"
		end

	gtk_tree_sortable_get_sort_column_id (a_sortable: POINTER; a_sort_column_id: POINTER; an_order: POINTER): INTEGER_32 is
 		-- gtk_tree_sortable_get_sort_column_id (node at line 40567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_get_sort_column_id"
		}"
		end


end -- class GTKTREESORTABLE_EXTERNALS
