-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEVIEW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_view_get_model (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_model (node at line 1594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_model"
		}"
		end

	gtk_tree_view_set_reorderable (a_tree_view: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_tree_view_set_reorderable (node at line 2291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_reorderable"
		}"
		end

	gtk_tree_view_get_hadjustment (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_hadjustment (node at line 3076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hadjustment"
		}"
		end

	gtk_tree_view_set_tooltip_row (a_tree_view: POINTER; a_tooltip: POINTER; a_path: POINTER) is
 		-- gtk_tree_view_set_tooltip_row (node at line 3724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_row"
		}"
		end

	gtk_tree_view_remove_column (a_tree_view: POINTER; a_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_remove_column (node at line 4252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_remove_column"
		}"
		end

	gtk_tree_view_set_hadjustment (a_tree_view: POINTER; an_adjustment: POINTER) is
 		-- gtk_tree_view_set_hadjustment (node at line 4477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hadjustment"
		}"
		end

	gtk_tree_view_get_tooltip_column (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_tooltip_column (node at line 4491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_tooltip_column"
		}"
		end

	gtk_tree_view_move_column_after (a_tree_view: POINTER; a_column: POINTER; a_base_column: POINTER) is
 		-- gtk_tree_view_move_column_after (node at line 4796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_move_column_after"
		}"
		end

	gtk_tree_view_set_search_entry (a_tree_view: POINTER; an_entry: POINTER) is
 		-- gtk_tree_view_set_search_entry (node at line 4825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_entry"
		}"
		end

	gtk_tree_view_unset_rows_drag_dest (a_tree_view: POINTER) is
 		-- gtk_tree_view_unset_rows_drag_dest (node at line 5302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_unset_rows_drag_dest"
		}"
		end

	gtk_tree_view_convert_bin_window_to_tree_coords (a_tree_view: POINTER; a_bx: INTEGER_32; a_by: INTEGER_32; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_convert_bin_window_to_tree_coords (node at line 5322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_bin_window_to_tree_coords"
		}"
		end

	gtk_tree_view_get_visible_range (a_tree_view: POINTER; a_start_path: POINTER; an_end_path: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_visible_range (node at line 5429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_visible_range"
		}"
		end

	gtk_tree_view_set_vadjustment (a_tree_view: POINTER; an_adjustment: POINTER) is
 		-- gtk_tree_view_set_vadjustment (node at line 5481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_vadjustment"
		}"
		end

	gtk_tree_view_get_cell_area (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; a_rect: POINTER) is
 		-- gtk_tree_view_get_cell_area (node at line 7337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_cell_area"
		}"
		end

	gtk_tree_view_get_grid_lines (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_grid_lines (node at line 8214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_grid_lines"
		}"
		end

	gtk_tree_view_insert_column_with_attributes (a_tree_view: POINTER; a_position: INTEGER_32; a_title: POINTER; a_cell: POINTER): INTEGER_32 is
 		-- gtk_tree_view_insert_column_with_attributes (variadic call)  (node at line 8823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column_with_attributes"
		}"
		end

	gtk_tree_view_new_with_model (a_model: POINTER): POINTER is
 		-- gtk_tree_view_new_with_model (node at line 8884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_new_with_model"
		}"
		end

	gtk_tree_view_set_headers_visible (a_tree_view: POINTER; a_headers_visible: INTEGER_32) is
 		-- gtk_tree_view_set_headers_visible (node at line 9125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_headers_visible"
		}"
		end

	gtk_tree_view_get_headers_visible (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_headers_visible (node at line 10079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_headers_visible"
		}"
		end

	gtk_tree_view_get_dest_row_at_pos (a_tree_view: POINTER; a_drag_x: INTEGER_32; a_drag_y: INTEGER_32; a_path: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_dest_row_at_pos (node at line 11083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_dest_row_at_pos"
		}"
		end

	gtk_tree_view_scroll_to_cell (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; an_use_align: INTEGER_32; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_tree_view_scroll_to_cell (node at line 11410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_scroll_to_cell"
		}"
		end

	gtk_tree_view_get_cursor (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER) is
 		-- gtk_tree_view_get_cursor (node at line 11674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_cursor"
		}"
		end

	gtk_tree_view_get_reorderable (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_reorderable (node at line 11851)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_reorderable"
		}"
		end

	gtk_tree_view_insert_column_with_data_func (a_tree_view: POINTER; a_position: INTEGER_32; a_title: POINTER; a_cell: POINTER; a_func: POINTER; a_data: POINTER; a_dnotify: POINTER): INTEGER_32 is
 		-- gtk_tree_view_insert_column_with_data_func (node at line 12084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column_with_data_func"
		}"
		end

	gtk_tree_view_get_columns (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_columns (node at line 12366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_columns"
		}"
		end

	gtk_tree_view_get_background_area (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; a_rect: POINTER) is
 		-- gtk_tree_view_get_background_area (node at line 12453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_background_area"
		}"
		end

	gtk_tree_view_set_search_position_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_search_position_func (node at line 12795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_position_func"
		}"
		end

	gtk_tree_view_get_fixed_height_mode (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_fixed_height_mode (node at line 12862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_fixed_height_mode"
		}"
		end

	gtk_tree_view_map_expanded_rows (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_tree_view_map_expanded_rows (node at line 12932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_map_expanded_rows"
		}"
		end

	gtk_tree_view_new: POINTER is
 		-- gtk_tree_view_new (node at line 13139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_new()"
		}"
		end

	gtk_tree_view_get_level_indentation (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_level_indentation (node at line 14004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_level_indentation"
		}"
		end

	gtk_tree_view_set_tooltip_column (a_tree_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_tree_view_set_tooltip_column (node at line 14149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_column"
		}"
		end

	gtk_tree_view_set_grid_lines (a_tree_view: POINTER; a_grid_lines: INTEGER) is
 		-- gtk_tree_view_set_grid_lines (node at line 14285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_grid_lines"
		}"
		end

	gtk_tree_view_set_enable_search (a_tree_view: POINTER; an_enable_search: INTEGER_32) is
 		-- gtk_tree_view_set_enable_search (node at line 14569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_enable_search"
		}"
		end

	gtk_tree_view_convert_tree_to_widget_coords (a_tree_view: POINTER; a_tx: INTEGER_32; a_ty: INTEGER_32; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_convert_tree_to_widget_coords (node at line 16891)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_tree_to_widget_coords"
		}"
		end

	gtk_tree_view_get_search_position_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_position_func (node at line 17895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_position_func"
		}"
		end

	gtk_tree_view_collapse_all (a_tree_view: POINTER) is
 		-- gtk_tree_view_collapse_all (node at line 18155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_collapse_all"
		}"
		end

	gtk_tree_view_set_cursor_on_cell (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER; a_focus_cell: POINTER; a_start_editing: INTEGER_32) is
 		-- gtk_tree_view_set_cursor_on_cell (node at line 18204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_cursor_on_cell"
		}"
		end

	gtk_tree_view_set_level_indentation (a_tree_view: POINTER; an_indentation: INTEGER_32) is
 		-- gtk_tree_view_set_level_indentation (node at line 18501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_level_indentation"
		}"
		end

	gtk_tree_view_columns_autosize (a_tree_view: POINTER) is
 		-- gtk_tree_view_columns_autosize (node at line 18740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_columns_autosize"
		}"
		end

	gtk_tree_view_get_tooltip_context (a_tree_view: POINTER; a_x: POINTER; a_y: POINTER; a_keyboard_tip: INTEGER_32; a_model: POINTER; a_path: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_tooltip_context (node at line 19039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_tooltip_context"
		}"
		end

	gtk_tree_view_set_expander_column (a_tree_view: POINTER; a_column: POINTER) is
 		-- gtk_tree_view_set_expander_column (node at line 19653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_expander_column"
		}"
		end

	gtk_tree_view_get_search_column (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_search_column (node at line 20342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_column"
		}"
		end

	gtk_tree_view_get_vadjustment (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_vadjustment (node at line 20352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_vadjustment"
		}"
		end

	gtk_tree_view_insert_column (a_tree_view: POINTER; a_column: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_tree_view_insert_column (node at line 21292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column"
		}"
		end

	gtk_tree_view_get_bin_window (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_bin_window (node at line 21443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_bin_window"
		}"
		end

	gtk_tree_view_set_fixed_height_mode (a_tree_view: POINTER; an_enable: INTEGER_32) is
 		-- gtk_tree_view_set_fixed_height_mode (node at line 21674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_fixed_height_mode"
		}"
		end

	gtk_tree_view_get_row_separator_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_row_separator_func (node at line 22209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_row_separator_func"
		}"
		end

	gtk_tree_view_get_type: NATURAL_64 is
 		-- gtk_tree_view_get_type (node at line 22470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_type()"
		}"
		end

	gtk_tree_view_convert_bin_window_to_widget_coords (a_tree_view: POINTER; a_bx: INTEGER_32; a_by: INTEGER_32; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_convert_bin_window_to_widget_coords (node at line 22796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_bin_window_to_widget_coords"
		}"
		end

	gtk_tree_view_expand_all (a_tree_view: POINTER) is
 		-- gtk_tree_view_expand_all (node at line 22821)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_all"
		}"
		end

	gtk_tree_view_get_search_equal_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_equal_func (node at line 22890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_equal_func"
		}"
		end

	gtk_tree_view_set_rules_hint (a_tree_view: POINTER; a_setting: INTEGER_32) is
 		-- gtk_tree_view_set_rules_hint (node at line 23149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_rules_hint"
		}"
		end

	gtk_tree_view_enable_model_drag_source (a_tree_view: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_tree_view_enable_model_drag_source (node at line 23965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_enable_model_drag_source"
		}"
		end

	gtk_tree_view_collapse_row (a_tree_view: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_view_collapse_row (node at line 24992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_collapse_row"
		}"
		end

	gtk_tree_view_set_enable_tree_lines (a_tree_view: POINTER; an_enabled: INTEGER_32) is
 		-- gtk_tree_view_set_enable_tree_lines (node at line 25122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_enable_tree_lines"
		}"
		end

	gtk_tree_view_set_column_drag_function (a_tree_view: POINTER; a_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_column_drag_function (node at line 25505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_column_drag_function"
		}"
		end

	gtk_tree_view_get_headers_clickable (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_headers_clickable (node at line 25698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_headers_clickable"
		}"
		end

	gtk_tree_view_set_search_column (a_tree_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_tree_view_set_search_column (node at line 26503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_column"
		}"
		end

	gtk_tree_view_convert_tree_to_bin_window_coords (a_tree_view: POINTER; a_tx: INTEGER_32; a_ty: INTEGER_32; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_tree_view_convert_tree_to_bin_window_coords (node at line 26901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_tree_to_bin_window_coords"
		}"
		end

	gtk_tree_view_set_model (a_tree_view: POINTER; a_model: POINTER) is
 		-- gtk_tree_view_set_model (node at line 27120)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_model"
		}"
		end

	gtk_tree_view_set_search_equal_func (a_tree_view: POINTER; a_search_equal_func: POINTER; a_search_user_data: POINTER; a_search_destroy: POINTER) is
 		-- gtk_tree_view_set_search_equal_func (node at line 28303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_equal_func"
		}"
		end

	gtk_tree_view_expand_to_path (a_tree_view: POINTER; a_path: POINTER) is
 		-- gtk_tree_view_expand_to_path (node at line 28978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_to_path"
		}"
		end

	gtk_tree_view_get_show_expanders (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_show_expanders (node at line 29064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_show_expanders"
		}"
		end

	gtk_tree_view_expand_row (a_tree_view: POINTER; a_path: POINTER; an_open_all: INTEGER_32): INTEGER_32 is
 		-- gtk_tree_view_expand_row (node at line 29572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_row"
		}"
		end

	gtk_tree_view_set_row_separator_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_row_separator_func (node at line 29880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_row_separator_func"
		}"
		end

	gtk_tree_view_unset_rows_drag_source (a_tree_view: POINTER) is
 		-- gtk_tree_view_unset_rows_drag_source (node at line 30315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_unset_rows_drag_source"
		}"
		end

	gtk_tree_view_is_rubber_banding_active (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_is_rubber_banding_active (node at line 30746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_is_rubber_banding_active"
		}"
		end

	gtk_tree_view_get_drag_dest_row (a_tree_view: POINTER; a_path: POINTER; a_pos: POINTER) is
 		-- gtk_tree_view_get_drag_dest_row (node at line 30801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_drag_dest_row"
		}"
		end

	gtk_tree_view_set_headers_clickable (a_tree_view: POINTER; a_setting: INTEGER_32) is
 		-- gtk_tree_view_set_headers_clickable (node at line 30806)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_headers_clickable"
		}"
		end

	gtk_tree_view_enable_model_drag_dest (a_tree_view: POINTER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_tree_view_enable_model_drag_dest (node at line 31055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_enable_model_drag_dest"
		}"
		end

	gtk_tree_view_get_hover_expand (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_hover_expand (node at line 31384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hover_expand"
		}"
		end

	gtk_tree_view_row_expanded (a_tree_view: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_view_row_expanded (node at line 31518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_row_expanded"
		}"
		end

	gtk_tree_view_get_expander_column (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_expander_column (node at line 32270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_expander_column"
		}"
		end

	gtk_tree_view_create_row_drag_icon (a_tree_view: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_view_create_row_drag_icon (node at line 32278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_create_row_drag_icon"
		}"
		end

	gtk_tree_view_get_enable_tree_lines (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_enable_tree_lines (node at line 32485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_enable_tree_lines"
		}"
		end

	gtk_tree_view_set_rubber_banding (a_tree_view: POINTER; an_enable: INTEGER_32) is
 		-- gtk_tree_view_set_rubber_banding (node at line 32728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_rubber_banding"
		}"
		end

	gtk_tree_view_scroll_to_point (a_tree_view: POINTER; a_tree_x: INTEGER_32; a_tree_y: INTEGER_32) is
 		-- gtk_tree_view_scroll_to_point (node at line 33165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_scroll_to_point"
		}"
		end

	gtk_tree_view_set_hover_selection (a_tree_view: POINTER; a_hover: INTEGER_32) is
 		-- gtk_tree_view_set_hover_selection (node at line 33185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hover_selection"
		}"
		end

	gtk_tree_view_set_cursor (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER; a_start_editing: INTEGER_32) is
 		-- gtk_tree_view_set_cursor (node at line 33275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_cursor"
		}"
		end

	gtk_tree_view_set_destroy_count_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_destroy_count_func (node at line 33420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_destroy_count_func"
		}"
		end

	gtk_tree_view_get_hover_selection (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_hover_selection (node at line 33480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hover_selection"
		}"
		end

	gtk_tree_view_get_rubber_banding (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_rubber_banding (node at line 34877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_rubber_banding"
		}"
		end

	gtk_tree_view_get_search_entry (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_entry (node at line 37047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_entry"
		}"
		end

	gtk_tree_view_convert_widget_to_tree_coords (a_tree_view: POINTER; a_wx: INTEGER_32; a_wy: INTEGER_32; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_convert_widget_to_tree_coords (node at line 37518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_widget_to_tree_coords"
		}"
		end

	gtk_tree_view_set_drag_dest_row (a_tree_view: POINTER; a_path: POINTER; a_pos: INTEGER) is
 		-- gtk_tree_view_set_drag_dest_row (node at line 38000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_drag_dest_row"
		}"
		end

	gtk_tree_view_get_selection (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_selection (node at line 38593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_selection"
		}"
		end

	gtk_tree_view_set_show_expanders (a_tree_view: POINTER; an_enabled: INTEGER_32) is
 		-- gtk_tree_view_set_show_expanders (node at line 38627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_show_expanders"
		}"
		end

	gtk_tree_view_get_path_at_pos (a_tree_view: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_path: POINTER; a_column: POINTER; a_cell_x: POINTER; a_cell_y: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_path_at_pos (node at line 38650)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_path_at_pos"
		}"
		end

	gtk_tree_view_get_column (a_tree_view: POINTER; a_n: INTEGER_32): POINTER is
 		-- gtk_tree_view_get_column (node at line 39529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_column"
		}"
		end

	gtk_tree_view_convert_widget_to_bin_window_coords (a_tree_view: POINTER; a_wx: INTEGER_32; a_wy: INTEGER_32; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_tree_view_convert_widget_to_bin_window_coords (node at line 39982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_widget_to_bin_window_coords"
		}"
		end

	gtk_tree_view_row_activated (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER) is
 		-- gtk_tree_view_row_activated (node at line 40408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_row_activated"
		}"
		end

	gtk_tree_view_get_enable_search (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_enable_search (node at line 40546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_enable_search"
		}"
		end

	gtk_tree_view_append_column (a_tree_view: POINTER; a_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_append_column (node at line 40737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_append_column"
		}"
		end

	gtk_tree_view_set_tooltip_cell (a_tree_view: POINTER; a_tooltip: POINTER; a_path: POINTER; a_column: POINTER; a_cell: POINTER) is
 		-- gtk_tree_view_set_tooltip_cell (node at line 41106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_cell"
		}"
		end

	gtk_tree_view_get_visible_rect (a_tree_view: POINTER; a_visible_rect: POINTER) is
 		-- gtk_tree_view_get_visible_rect (node at line 41277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_visible_rect"
		}"
		end

	gtk_tree_view_set_hover_expand (a_tree_view: POINTER; an_expand: INTEGER_32) is
 		-- gtk_tree_view_set_hover_expand (node at line 41288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hover_expand"
		}"
		end

	gtk_tree_view_get_rules_hint (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_rules_hint (node at line 41394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_rules_hint"
		}"
		end


end -- class GTKTREEVIEW_EXTERNALS
