-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREESORTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_sortable_get_sort_column_id (a_sortable: POINTER; a_sort_column_id: POINTER; an_order: POINTER): INTEGER is
 		-- gtk_tree_sortable_get_sort_column_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_get_sort_column_id"
		}"
		end

	gtk_tree_sortable_get_type: like long_unsigned is
 		-- gtk_tree_sortable_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_get_type()"
		}"
		end

	gtk_tree_sortable_has_default_sort_func (a_sortable: POINTER): INTEGER is
 		-- gtk_tree_sortable_has_default_sort_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_has_default_sort_func"
		}"
		end

	gtk_tree_sortable_set_default_sort_func (a_sortable: POINTER; a_sort_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_sortable_set_default_sort_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_set_default_sort_func"
		}"
		end

	gtk_tree_sortable_set_sort_column_id (a_sortable: POINTER; a_sort_column_id: INTEGER; an_order: INTEGER) is
 		-- gtk_tree_sortable_set_sort_column_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_set_sort_column_id"
		}"
		end

	gtk_tree_sortable_set_sort_func (a_sortable: POINTER; a_sort_column_id: INTEGER; a_sort_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_sortable_set_sort_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_set_sort_func"
		}"
		end

	gtk_tree_sortable_sort_column_changed (a_sortable: POINTER) is
 		-- gtk_tree_sortable_sort_column_changed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_sortable_sort_column_changed"
		}"
		end


end -- class GTKTREESORTABLE_EXTERNALS
