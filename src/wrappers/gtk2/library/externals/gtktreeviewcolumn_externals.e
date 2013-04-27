-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEVIEWCOLUMN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_view_column_add_attribute (a_tree_column: POINTER; a_cell_renderer: POINTER; an_attribute_external: POINTER; a_column: INTEGER) is
 		-- gtk_tree_view_column_add_attribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_add_attribute"
		}"
		end

	gtk_tree_view_column_cell_get_position (a_tree_column: POINTER; a_cell_renderer: POINTER; a_start_pos: POINTER; a_width: POINTER): INTEGER is
 		-- gtk_tree_view_column_cell_get_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_get_position"
		}"
		end

	gtk_tree_view_column_cell_get_size (a_tree_column: POINTER; a_cell_area: POINTER; a_x_offset: POINTER; a_y_offset: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_tree_view_column_cell_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_get_size"
		}"
		end

	gtk_tree_view_column_cell_is_visible (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_cell_is_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_is_visible"
		}"
		end

	gtk_tree_view_column_cell_set_cell_data (a_tree_column: POINTER; a_tree_model: POINTER; an_iter: POINTER; an_is_expander: INTEGER; an_is_expanded: INTEGER) is
 		-- gtk_tree_view_column_cell_set_cell_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_set_cell_data"
		}"
		end

	gtk_tree_view_column_clear (a_tree_column: POINTER) is
 		-- gtk_tree_view_column_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_clear"
		}"
		end

	gtk_tree_view_column_clear_attributes (a_tree_column: POINTER; a_cell_renderer: POINTER) is
 		-- gtk_tree_view_column_clear_attributes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_clear_attributes"
		}"
		end

	gtk_tree_view_column_clicked (a_tree_column: POINTER) is
 		-- gtk_tree_view_column_clicked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_clicked"
		}"
		end

	gtk_tree_view_column_focus_cell (a_tree_column: POINTER; a_cell: POINTER) is
 		-- gtk_tree_view_column_focus_cell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_focus_cell"
		}"
		end

	gtk_tree_view_column_get_alignment (a_tree_column: POINTER): REAL_32 is
 		-- gtk_tree_view_column_get_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_alignment"
		}"
		end

	gtk_tree_view_column_get_clickable (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_clickable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_clickable"
		}"
		end

	gtk_tree_view_column_get_expand (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_expand"
		}"
		end

	gtk_tree_view_column_get_fixed_width (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_fixed_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_fixed_width"
		}"
		end

	gtk_tree_view_column_get_max_width (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_max_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_max_width"
		}"
		end

	gtk_tree_view_column_get_min_width (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_min_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_min_width"
		}"
		end

	gtk_tree_view_column_get_reorderable (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_reorderable"
		}"
		end

	gtk_tree_view_column_get_resizable (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_resizable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_resizable"
		}"
		end

	gtk_tree_view_column_get_sizing (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_sizing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sizing"
		}"
		end

	gtk_tree_view_column_get_sort_column_id (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_sort_column_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sort_column_id"
		}"
		end

	gtk_tree_view_column_get_sort_indicator (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_sort_indicator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sort_indicator"
		}"
		end

	gtk_tree_view_column_get_sort_order (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_sort_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sort_order"
		}"
		end

	gtk_tree_view_column_get_spacing (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_spacing"
		}"
		end

	gtk_tree_view_column_get_title (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_title"
		}"
		end

	gtk_tree_view_column_get_tree_view (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_tree_view
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_tree_view"
		}"
		end

	gtk_tree_view_column_get_type: like long_unsigned is
 		-- gtk_tree_view_column_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_type()"
		}"
		end

	gtk_tree_view_column_get_visible (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_visible"
		}"
		end

	gtk_tree_view_column_get_widget (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_widget"
		}"
		end

	gtk_tree_view_column_get_width (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_width"
		}"
		end

	gtk_tree_view_column_new: POINTER is
 		-- gtk_tree_view_column_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_new()"
		}"
		end

	gtk_tree_view_column_new_with_attributes (a_title: POINTER; a_cell: POINTER): POINTER is
 		-- gtk_tree_view_column_new_with_attributes (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_new_with_attributes"
		}"
		end

	gtk_tree_view_column_pack_end (a_tree_column: POINTER; a_cell: POINTER; an_expand: INTEGER) is
 		-- gtk_tree_view_column_pack_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_pack_end"
		}"
		end

	gtk_tree_view_column_pack_start (a_tree_column: POINTER; a_cell: POINTER; an_expand: INTEGER) is
 		-- gtk_tree_view_column_pack_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_pack_start"
		}"
		end

	gtk_tree_view_column_queue_resize (a_tree_column: POINTER) is
 		-- gtk_tree_view_column_queue_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_queue_resize"
		}"
		end

	gtk_tree_view_column_set_alignment (a_tree_column: POINTER; a_xalign: REAL_32) is
 		-- gtk_tree_view_column_set_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_alignment"
		}"
		end

	gtk_tree_view_column_set_attributes (a_tree_column: POINTER; a_cell_renderer: POINTER) is
 		-- gtk_tree_view_column_set_attributes (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_attributes"
		}"
		end

	gtk_tree_view_column_set_cell_data_func (a_tree_column: POINTER; a_cell_renderer: POINTER; a_func: POINTER; a_func_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_column_set_cell_data_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_cell_data_func"
		}"
		end

	gtk_tree_view_column_set_clickable (a_tree_column: POINTER; a_clickable: INTEGER) is
 		-- gtk_tree_view_column_set_clickable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_clickable"
		}"
		end

	gtk_tree_view_column_set_expand (a_tree_column: POINTER; an_expand: INTEGER) is
 		-- gtk_tree_view_column_set_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_expand"
		}"
		end

	gtk_tree_view_column_set_fixed_width (a_tree_column: POINTER; a_fixed_width: INTEGER) is
 		-- gtk_tree_view_column_set_fixed_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_fixed_width"
		}"
		end

	gtk_tree_view_column_set_max_width (a_tree_column: POINTER; a_max_width: INTEGER) is
 		-- gtk_tree_view_column_set_max_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_max_width"
		}"
		end

	gtk_tree_view_column_set_min_width (a_tree_column: POINTER; a_min_width: INTEGER) is
 		-- gtk_tree_view_column_set_min_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_min_width"
		}"
		end

	gtk_tree_view_column_set_reorderable (a_tree_column: POINTER; a_reorderable: INTEGER) is
 		-- gtk_tree_view_column_set_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_reorderable"
		}"
		end

	gtk_tree_view_column_set_resizable (a_tree_column: POINTER; a_resizable: INTEGER) is
 		-- gtk_tree_view_column_set_resizable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_resizable"
		}"
		end

	gtk_tree_view_column_set_sizing (a_tree_column: POINTER; a_type: INTEGER) is
 		-- gtk_tree_view_column_set_sizing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sizing"
		}"
		end

	gtk_tree_view_column_set_sort_column_id (a_tree_column: POINTER; a_sort_column_id: INTEGER) is
 		-- gtk_tree_view_column_set_sort_column_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sort_column_id"
		}"
		end

	gtk_tree_view_column_set_sort_indicator (a_tree_column: POINTER; a_setting: INTEGER) is
 		-- gtk_tree_view_column_set_sort_indicator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sort_indicator"
		}"
		end

	gtk_tree_view_column_set_sort_order (a_tree_column: POINTER; an_order: INTEGER) is
 		-- gtk_tree_view_column_set_sort_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sort_order"
		}"
		end

	gtk_tree_view_column_set_spacing (a_tree_column: POINTER; a_spacing: INTEGER) is
 		-- gtk_tree_view_column_set_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_spacing"
		}"
		end

	gtk_tree_view_column_set_title (a_tree_column: POINTER; a_title: POINTER) is
 		-- gtk_tree_view_column_set_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_title"
		}"
		end

	gtk_tree_view_column_set_visible (a_tree_column: POINTER; a_visible: INTEGER) is
 		-- gtk_tree_view_column_set_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_visible"
		}"
		end

	gtk_tree_view_column_set_widget (a_tree_column: POINTER; a_widget: POINTER) is
 		-- gtk_tree_view_column_set_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_widget"
		}"
		end


end -- class GTKTREEVIEWCOLUMN_EXTERNALS
