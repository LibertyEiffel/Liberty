-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEVIEWCOLUMN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_view_column_cell_get_size (a_tree_column: POINTER; a_cell_area: POINTER; a_x_offset: POINTER; a_y_offset: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_tree_view_column_cell_get_size (node at line 250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_get_size"
		}"
		end

	gtk_tree_view_column_cell_is_visible (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_cell_is_visible (node at line 1448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_is_visible"
		}"
		end

	gtk_tree_view_column_set_sort_indicator (a_tree_column: POINTER; a_setting: INTEGER_32) is
 		-- gtk_tree_view_column_set_sort_indicator (node at line 2441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sort_indicator"
		}"
		end

	gtk_tree_view_column_get_sort_order (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_sort_order (node at line 3433)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sort_order"
		}"
		end

	gtk_tree_view_column_clear_attributes (a_tree_column: POINTER; a_cell_renderer: POINTER) is
 		-- gtk_tree_view_column_clear_attributes (node at line 7620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_clear_attributes"
		}"
		end

	gtk_tree_view_column_get_title (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_title (node at line 8949)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_title"
		}"
		end

	gtk_tree_view_column_set_sort_order (a_tree_column: POINTER; an_order: INTEGER) is
 		-- gtk_tree_view_column_set_sort_order (node at line 9100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sort_order"
		}"
		end

	gtk_tree_view_column_set_expand (a_tree_column: POINTER; an_expand: INTEGER_32) is
 		-- gtk_tree_view_column_set_expand (node at line 11920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_expand"
		}"
		end

	gtk_tree_view_column_pack_end (a_tree_column: POINTER; a_cell: POINTER; an_expand: INTEGER_32) is
 		-- gtk_tree_view_column_pack_end (node at line 12244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_pack_end"
		}"
		end

	gtk_tree_view_column_cell_set_cell_data (a_tree_column: POINTER; a_tree_model: POINTER; an_iter: POINTER; an_is_expander: INTEGER_32; an_is_expanded: INTEGER_32) is
 		-- gtk_tree_view_column_cell_set_cell_data (node at line 12472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_set_cell_data"
		}"
		end

	gtk_tree_view_column_set_widget (a_tree_column: POINTER; a_widget: POINTER) is
 		-- gtk_tree_view_column_set_widget (node at line 13500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_widget"
		}"
		end

	gtk_tree_view_column_set_sizing (a_tree_column: POINTER; a_type: INTEGER) is
 		-- gtk_tree_view_column_set_sizing (node at line 13986)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sizing"
		}"
		end

	gtk_tree_view_column_cell_get_position (a_tree_column: POINTER; a_cell_renderer: POINTER; a_start_pos: POINTER; a_width: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_cell_get_position (node at line 14344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_cell_get_position"
		}"
		end

	gtk_tree_view_column_clear (a_tree_column: POINTER) is
 		-- gtk_tree_view_column_clear (node at line 15096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_clear"
		}"
		end

	gtk_tree_view_column_set_cell_data_func (a_tree_column: POINTER; a_cell_renderer: POINTER; a_func: POINTER; a_func_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_column_set_cell_data_func (node at line 17760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_cell_data_func"
		}"
		end

	gtk_tree_view_column_set_title (a_tree_column: POINTER; a_title: POINTER) is
 		-- gtk_tree_view_column_set_title (node at line 18107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_title"
		}"
		end

	gtk_tree_view_column_set_reorderable (a_tree_column: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_tree_view_column_set_reorderable (node at line 18452)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_reorderable"
		}"
		end

	gtk_tree_view_column_get_sort_column_id (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_sort_column_id (node at line 18910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sort_column_id"
		}"
		end

	gtk_tree_view_column_add_attribute (a_tree_column: POINTER; a_cell_renderer: POINTER; an_attribute_external: POINTER; a_column: INTEGER_32) is
 		-- gtk_tree_view_column_add_attribute (node at line 20235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_add_attribute"
		}"
		end

	gtk_tree_view_column_set_attributes (a_tree_column: POINTER; a_cell_renderer: POINTER) is
 		-- gtk_tree_view_column_set_attributes (variadic call)  (node at line 21036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_attributes"
		}"
		end

	gtk_tree_view_column_set_fixed_width (a_tree_column: POINTER; a_fixed_width: INTEGER_32) is
 		-- gtk_tree_view_column_set_fixed_width (node at line 21785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_fixed_width"
		}"
		end

	gtk_tree_view_column_get_reorderable (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_reorderable (node at line 21991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_reorderable"
		}"
		end

	gtk_tree_view_column_get_width (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_width (node at line 22556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_width"
		}"
		end

	gtk_tree_view_column_get_cell_renderers (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_cell_renderers (node at line 23469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_cell_renderers"
		}"
		end

	gtk_tree_view_column_get_tree_view (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_tree_view (node at line 24684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_tree_view"
		}"
		end

	gtk_tree_view_column_set_clickable (a_tree_column: POINTER; a_clickable: INTEGER_32) is
 		-- gtk_tree_view_column_set_clickable (node at line 25480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_clickable"
		}"
		end

	gtk_tree_view_column_set_sort_column_id (a_tree_column: POINTER; a_sort_column_id: INTEGER_32) is
 		-- gtk_tree_view_column_set_sort_column_id (node at line 26902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_sort_column_id"
		}"
		end

	gtk_tree_view_column_get_expand (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_expand (node at line 27274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_expand"
		}"
		end

	gtk_tree_view_column_clicked (a_tree_column: POINTER) is
 		-- gtk_tree_view_column_clicked (node at line 27642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_clicked"
		}"
		end

	gtk_tree_view_column_get_visible (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_visible (node at line 27832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_visible"
		}"
		end

	gtk_tree_view_column_new: POINTER is
 		-- gtk_tree_view_column_new (node at line 28110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_new()"
		}"
		end

	gtk_tree_view_column_focus_cell (a_tree_column: POINTER; a_cell: POINTER) is
 		-- gtk_tree_view_column_focus_cell (node at line 28118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_focus_cell"
		}"
		end

	gtk_tree_view_column_get_widget (a_tree_column: POINTER): POINTER is
 		-- gtk_tree_view_column_get_widget (node at line 28847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_widget"
		}"
		end

	gtk_tree_view_column_get_sizing (a_tree_column: POINTER): INTEGER is
 		-- gtk_tree_view_column_get_sizing (node at line 29345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sizing"
		}"
		end

	gtk_tree_view_column_get_min_width (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_min_width (node at line 30051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_min_width"
		}"
		end

	gtk_tree_view_column_get_spacing (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_spacing (node at line 30680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_spacing"
		}"
		end

	gtk_tree_view_column_get_alignment (a_tree_column: POINTER): REAL_32 is
 		-- gtk_tree_view_column_get_alignment (node at line 31650)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_alignment"
		}"
		end

	gtk_tree_view_column_get_type: NATURAL_32 is
 		-- gtk_tree_view_column_get_type (node at line 31755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_type()"
		}"
		end

	gtk_tree_view_column_get_resizable (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_resizable (node at line 31897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_resizable"
		}"
		end

	gtk_tree_view_column_get_sort_indicator (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_sort_indicator (node at line 32039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_sort_indicator"
		}"
		end

	gtk_tree_view_column_get_clickable (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_clickable (node at line 33388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_clickable"
		}"
		end

	gtk_tree_view_column_set_visible (a_tree_column: POINTER; a_visible: INTEGER_32) is
 		-- gtk_tree_view_column_set_visible (node at line 33661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_visible"
		}"
		end

	gtk_tree_view_column_set_min_width (a_tree_column: POINTER; a_min_width: INTEGER_32) is
 		-- gtk_tree_view_column_set_min_width (node at line 33705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_min_width"
		}"
		end

	gtk_tree_view_column_new_with_attributes (a_title: POINTER; a_cell: POINTER): POINTER is
 		-- gtk_tree_view_column_new_with_attributes (variadic call)  (node at line 33855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_new_with_attributes"
		}"
		end

	gtk_tree_view_column_get_max_width (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_max_width (node at line 34111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_max_width"
		}"
		end

	gtk_tree_view_column_get_fixed_width (a_tree_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_column_get_fixed_width (node at line 34177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_get_fixed_width"
		}"
		end

	gtk_tree_view_column_queue_resize (a_tree_column: POINTER) is
 		-- gtk_tree_view_column_queue_resize (node at line 35223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_queue_resize"
		}"
		end

	gtk_tree_view_column_set_alignment (a_tree_column: POINTER; a_xalign: REAL_32) is
 		-- gtk_tree_view_column_set_alignment (node at line 35227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_alignment"
		}"
		end

	gtk_tree_view_column_set_resizable (a_tree_column: POINTER; a_resizable: INTEGER_32) is
 		-- gtk_tree_view_column_set_resizable (node at line 35510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_resizable"
		}"
		end

	gtk_tree_view_column_pack_start (a_tree_column: POINTER; a_cell: POINTER; an_expand: INTEGER_32) is
 		-- gtk_tree_view_column_pack_start (node at line 36057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_pack_start"
		}"
		end

	gtk_tree_view_column_set_spacing (a_tree_column: POINTER; a_spacing: INTEGER_32) is
 		-- gtk_tree_view_column_set_spacing (node at line 36293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_spacing"
		}"
		end

	gtk_tree_view_column_set_max_width (a_tree_column: POINTER; a_max_width: INTEGER_32) is
 		-- gtk_tree_view_column_set_max_width (node at line 36767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_column_set_max_width"
		}"
		end


end -- class GTKTREEVIEWCOLUMN_EXTERNALS
