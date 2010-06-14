-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEVIEW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_view_get_column (a_tree_view: POINTER; a_n: INTEGER_32): POINTER is
 		-- gtk_tree_view_get_column (node at line 935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_column"
		}"
		end

	gtk_tree_view_get_model (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_model (node at line 1672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_model"
		}"
		end

	gtk_tree_view_get_rubber_banding (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_rubber_banding (node at line 2058)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_rubber_banding"
		}"
		end

	gtk_tree_view_set_reorderable (a_tree_view: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_tree_view_set_reorderable (node at line 2380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_reorderable"
		}"
		end

	gtk_tree_view_set_tooltip_row (a_tree_view: POINTER; a_tooltip: POINTER; a_path: POINTER) is
 		-- gtk_tree_view_set_tooltip_row (node at line 3626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_row"
		}"
		end

	gtk_tree_view_get_search_equal_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_equal_func (node at line 3696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_equal_func"
		}"
		end

	gtk_tree_view_remove_column (a_tree_view: POINTER; a_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_remove_column (node at line 4050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_remove_column"
		}"
		end

	gtk_tree_view_columns_autosize (a_tree_view: POINTER) is
 		-- gtk_tree_view_columns_autosize (node at line 4271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_columns_autosize"
		}"
		end

	gtk_tree_view_set_hadjustment (a_tree_view: POINTER; an_adjustment: POINTER) is
 		-- gtk_tree_view_set_hadjustment (node at line 4295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hadjustment"
		}"
		end

	gtk_tree_view_get_tooltip_column (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_tooltip_column (node at line 4312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_tooltip_column"
		}"
		end

	gtk_tree_view_move_column_after (a_tree_view: POINTER; a_column: POINTER; a_base_column: POINTER) is
 		-- gtk_tree_view_move_column_after (node at line 4611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_move_column_after"
		}"
		end

	gtk_tree_view_set_search_entry (a_tree_view: POINTER; an_entry: POINTER) is
 		-- gtk_tree_view_set_search_entry (node at line 4630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_entry"
		}"
		end

	gtk_tree_view_get_visible_range (a_tree_view: POINTER; a_start_path: POINTER; an_end_path: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_visible_range (node at line 5164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_visible_range"
		}"
		end

	gtk_tree_view_set_vadjustment (a_tree_view: POINTER; an_adjustment: POINTER) is
 		-- gtk_tree_view_set_vadjustment (node at line 5222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_vadjustment"
		}"
		end

	gtk_tree_view_get_reorderable (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_reorderable (node at line 5342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_reorderable"
		}"
		end

	gtk_tree_view_set_headers_visible (a_tree_view: POINTER; a_headers_visible: INTEGER_32) is
 		-- gtk_tree_view_set_headers_visible (node at line 7423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_headers_visible"
		}"
		end

	gtk_tree_view_get_grid_lines (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_grid_lines (node at line 7507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_grid_lines"
		}"
		end

	gtk_tree_view_insert_column_with_attributes (a_tree_view: POINTER; a_position: INTEGER_32; a_title: POINTER; a_cell: POINTER): INTEGER_32 is
 		-- gtk_tree_view_insert_column_with_attributes (variadic call)  (node at line 8146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column_with_attributes"
		}"
		end

	gtk_tree_view_set_enable_tree_lines (a_tree_view: POINTER; an_enabled: INTEGER_32) is
 		-- gtk_tree_view_set_enable_tree_lines (node at line 8221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_enable_tree_lines"
		}"
		end

	gtk_tree_view_get_fixed_height_mode (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_fixed_height_mode (node at line 8377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_fixed_height_mode"
		}"
		end

	gtk_tree_view_set_search_equal_func (a_tree_view: POINTER; a_search_equal_func: POINTER; a_search_user_data: POINTER; a_search_destroy: POINTER) is
 		-- gtk_tree_view_set_search_equal_func (node at line 8400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_equal_func"
		}"
		end

	gtk_tree_view_get_search_entry (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_entry (node at line 9398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_entry"
		}"
		end

	gtk_tree_view_get_level_indentation (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_level_indentation (node at line 10603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_level_indentation"
		}"
		end

	gtk_tree_view_insert_column_with_data_func (a_tree_view: POINTER; a_position: INTEGER_32; a_title: POINTER; a_cell: POINTER; a_func: POINTER; a_data: POINTER; a_dnotify: POINTER): INTEGER_32 is
 		-- gtk_tree_view_insert_column_with_data_func (node at line 11123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column_with_data_func"
		}"
		end

	gtk_tree_view_set_model (a_tree_view: POINTER; a_model: POINTER) is
 		-- gtk_tree_view_set_model (node at line 11156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_model"
		}"
		end

	gtk_tree_view_get_columns (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_columns (node at line 11357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_columns"
		}"
		end

	gtk_tree_view_get_background_area (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; a_rect: POINTER) is
 		-- gtk_tree_view_get_background_area (node at line 11442)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_background_area"
		}"
		end

	gtk_tree_view_set_search_position_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_search_position_func (node at line 11757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_position_func"
		}"
		end

	gtk_tree_view_map_expanded_rows (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_tree_view_map_expanded_rows (node at line 11881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_map_expanded_rows"
		}"
		end

	gtk_tree_view_set_tooltip_column (a_tree_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_tree_view_set_tooltip_column (node at line 13021)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_column"
		}"
		end

	gtk_tree_view_set_grid_lines (a_tree_view: POINTER; a_grid_lines: INTEGER) is
 		-- gtk_tree_view_set_grid_lines (node at line 13166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_grid_lines"
		}"
		end

	gtk_tree_view_set_enable_search (a_tree_view: POINTER; an_enable_search: INTEGER_32) is
 		-- gtk_tree_view_set_enable_search (node at line 13462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_enable_search"
		}"
		end

	gtk_tree_view_get_path_at_pos (a_tree_view: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_path: POINTER; a_column: POINTER; a_cell_x: POINTER; a_cell_y: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_path_at_pos (node at line 13478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_path_at_pos"
		}"
		end

	gtk_tree_view_get_cell_area (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; a_rect: POINTER) is
 		-- gtk_tree_view_get_cell_area (node at line 14213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_cell_area"
		}"
		end

	gtk_tree_view_unset_rows_drag_source (a_tree_view: POINTER) is
 		-- gtk_tree_view_unset_rows_drag_source (node at line 14548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_unset_rows_drag_source"
		}"
		end

	gtk_tree_view_set_fixed_height_mode (a_tree_view: POINTER; an_enable: INTEGER_32) is
 		-- gtk_tree_view_set_fixed_height_mode (node at line 15012)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_fixed_height_mode"
		}"
		end

	gtk_tree_view_get_hover_expand (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_hover_expand (node at line 15158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hover_expand"
		}"
		end

	gtk_tree_view_get_row_separator_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_row_separator_func (node at line 15514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_row_separator_func"
		}"
		end

	gtk_tree_view_get_rules_hint (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_rules_hint (node at line 15755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_rules_hint"
		}"
		end

	gtk_tree_view_get_search_position_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_position_func (node at line 16447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_position_func"
		}"
		end

	gtk_tree_view_collapse_all (a_tree_view: POINTER) is
 		-- gtk_tree_view_collapse_all (node at line 16689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_collapse_all"
		}"
		end

	gtk_tree_view_is_rubber_banding_active (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_is_rubber_banding_active (node at line 17145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_is_rubber_banding_active"
		}"
		end

	gtk_tree_view_set_cursor (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER; a_start_editing: INTEGER_32) is
 		-- gtk_tree_view_set_cursor (node at line 17330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_cursor"
		}"
		end

	gtk_tree_view_get_tooltip_context (a_tree_view: POINTER; a_x: POINTER; a_y: POINTER; a_keyboard_tip: INTEGER_32; a_model: POINTER; a_path: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_tooltip_context (node at line 17384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_tooltip_context"
		}"
		end

	gtk_tree_view_set_expander_column (a_tree_view: POINTER; a_column: POINTER) is
 		-- gtk_tree_view_set_expander_column (node at line 17967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_expander_column"
		}"
		end

	gtk_tree_view_set_drag_dest_row (a_tree_view: POINTER; a_path: POINTER; a_pos: INTEGER) is
 		-- gtk_tree_view_set_drag_dest_row (node at line 18600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_drag_dest_row"
		}"
		end

	gtk_tree_view_get_search_column (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_search_column (node at line 18634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_column"
		}"
		end

	gtk_tree_view_get_vadjustment (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_vadjustment (node at line 18648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_vadjustment"
		}"
		end

	gtk_tree_view_convert_tree_to_widget_coords (a_tree_view: POINTER; a_tx: INTEGER_32; a_ty: INTEGER_32; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_convert_tree_to_widget_coords (node at line 18651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_tree_to_widget_coords"
		}"
		end

	gtk_tree_view_set_cursor_on_cell (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER; a_focus_cell: POINTER; a_start_editing: INTEGER_32) is
 		-- gtk_tree_view_set_cursor_on_cell (node at line 18958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_cursor_on_cell"
		}"
		end

	gtk_tree_view_get_headers_visible (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_headers_visible (node at line 19255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_headers_visible"
		}"
		end

	gtk_tree_view_set_row_separator_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_row_separator_func (node at line 19307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_row_separator_func"
		}"
		end

	gtk_tree_view_insert_column (a_tree_view: POINTER; a_column: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_tree_view_insert_column (node at line 19402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column"
		}"
		end

	gtk_tree_view_get_bin_window (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_bin_window (node at line 19550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_bin_window"
		}"
		end

	gtk_tree_view_expand_all (a_tree_view: POINTER) is
 		-- gtk_tree_view_expand_all (node at line 20720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_all"
		}"
		end

	gtk_tree_view_set_rules_hint (a_tree_view: POINTER; a_setting: INTEGER_32) is
 		-- gtk_tree_view_set_rules_hint (node at line 21013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_rules_hint"
		}"
		end

	gtk_tree_view_scroll_to_cell (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; an_use_align: INTEGER_32; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_tree_view_scroll_to_cell (node at line 21647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_scroll_to_cell"
		}"
		end

	gtk_tree_view_enable_model_drag_source (a_tree_view: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_tree_view_enable_model_drag_source (node at line 21732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_enable_model_drag_source"
		}"
		end

	gtk_tree_view_convert_widget_to_bin_window_coords (a_tree_view: POINTER; a_wx: INTEGER_32; a_wy: INTEGER_32; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_tree_view_convert_widget_to_bin_window_coords (node at line 22347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_widget_to_bin_window_coords"
		}"
		end

	gtk_tree_view_set_tooltip_cell (a_tree_view: POINTER; a_tooltip: POINTER; a_path: POINTER; a_column: POINTER; a_cell: POINTER) is
 		-- gtk_tree_view_set_tooltip_cell (node at line 22357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_cell"
		}"
		end

	gtk_tree_view_collapse_row (a_tree_view: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_view_collapse_row (node at line 22694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_collapse_row"
		}"
		end

	gtk_tree_view_get_type: NATURAL_32 is
 		-- gtk_tree_view_get_type (node at line 22806)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_type()"
		}"
		end

	gtk_tree_view_set_column_drag_function (a_tree_view: POINTER; a_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_column_drag_function (node at line 23171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_column_drag_function"
		}"
		end

	gtk_tree_view_get_headers_clickable (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_headers_clickable (node at line 23337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_headers_clickable"
		}"
		end

	gtk_tree_view_get_dest_row_at_pos (a_tree_view: POINTER; a_drag_x: INTEGER_32; a_drag_y: INTEGER_32; a_path: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_dest_row_at_pos (node at line 23835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_dest_row_at_pos"
		}"
		end

	gtk_tree_view_set_search_column (a_tree_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_tree_view_set_search_column (node at line 24007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_column"
		}"
		end

	gtk_tree_view_new: POINTER is
 		-- gtk_tree_view_new (node at line 24286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_new()"
		}"
		end

	gtk_tree_view_convert_tree_to_bin_window_coords (a_tree_view: POINTER; a_tx: INTEGER_32; a_ty: INTEGER_32; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_tree_view_convert_tree_to_bin_window_coords (node at line 24366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_tree_to_bin_window_coords"
		}"
		end

	gtk_tree_view_expand_to_path (a_tree_view: POINTER; a_path: POINTER) is
 		-- gtk_tree_view_expand_to_path (node at line 26231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_to_path"
		}"
		end

	gtk_tree_view_set_level_indentation (a_tree_view: POINTER; an_indentation: INTEGER_32) is
 		-- gtk_tree_view_set_level_indentation (node at line 26683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_level_indentation"
		}"
		end

	gtk_tree_view_expand_row (a_tree_view: POINTER; a_path: POINTER; an_open_all: INTEGER_32): INTEGER_32 is
 		-- gtk_tree_view_expand_row (node at line 26792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_row"
		}"
		end

	gtk_tree_view_get_show_expanders (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_show_expanders (node at line 27312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_show_expanders"
		}"
		end

	gtk_tree_view_get_drag_dest_row (a_tree_view: POINTER; a_path: POINTER; a_pos: POINTER) is
 		-- gtk_tree_view_get_drag_dest_row (node at line 27884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_drag_dest_row"
		}"
		end

	gtk_tree_view_set_headers_clickable (a_tree_view: POINTER; a_setting: INTEGER_32) is
 		-- gtk_tree_view_set_headers_clickable (node at line 27889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_headers_clickable"
		}"
		end

	gtk_tree_view_enable_model_drag_dest (a_tree_view: POINTER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_tree_view_enable_model_drag_dest (node at line 28067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_enable_model_drag_dest"
		}"
		end

	gtk_tree_view_widget_to_tree_coords (a_tree_view: POINTER; a_wx: INTEGER_32; a_wy: INTEGER_32; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_widget_to_tree_coords (node at line 28980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_widget_to_tree_coords"
		}"
		end

	gtk_tree_view_get_expander_column (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_expander_column (node at line 29239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_expander_column"
		}"
		end

	gtk_tree_view_create_row_drag_icon (a_tree_view: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_view_create_row_drag_icon (node at line 29247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_create_row_drag_icon"
		}"
		end

	gtk_tree_view_get_enable_tree_lines (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_enable_tree_lines (node at line 29457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_enable_tree_lines"
		}"
		end

	gtk_tree_view_set_rubber_banding (a_tree_view: POINTER; an_enable: INTEGER_32) is
 		-- gtk_tree_view_set_rubber_banding (node at line 29698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_rubber_banding"
		}"
		end

	gtk_tree_view_scroll_to_point (a_tree_view: POINTER; a_tree_x: INTEGER_32; a_tree_y: INTEGER_32) is
 		-- gtk_tree_view_scroll_to_point (node at line 30078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_scroll_to_point"
		}"
		end

	gtk_tree_view_set_hover_selection (a_tree_view: POINTER; a_hover: INTEGER_32) is
 		-- gtk_tree_view_set_hover_selection (node at line 30094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hover_selection"
		}"
		end

	gtk_tree_view_set_destroy_count_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_destroy_count_func (node at line 30271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_destroy_count_func"
		}"
		end

	gtk_tree_view_get_hover_selection (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_hover_selection (node at line 30332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hover_selection"
		}"
		end

	gtk_tree_view_convert_bin_window_to_tree_coords (a_tree_view: POINTER; a_bx: INTEGER_32; a_by: INTEGER_32; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_convert_bin_window_to_tree_coords (node at line 32254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_bin_window_to_tree_coords"
		}"
		end

	gtk_tree_view_convert_bin_window_to_widget_coords (a_tree_view: POINTER; a_bx: INTEGER_32; a_by: INTEGER_32; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_convert_bin_window_to_widget_coords (node at line 32369)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_bin_window_to_widget_coords"
		}"
		end

	gtk_tree_view_new_with_model (a_model: POINTER): POINTER is
 		-- gtk_tree_view_new_with_model (node at line 32398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_new_with_model"
		}"
		end

	gtk_tree_view_get_cursor (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER) is
 		-- gtk_tree_view_get_cursor (node at line 32510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_cursor"
		}"
		end

	gtk_tree_view_unset_rows_drag_dest (a_tree_view: POINTER) is
 		-- gtk_tree_view_unset_rows_drag_dest (node at line 34093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_unset_rows_drag_dest"
		}"
		end

	gtk_tree_view_tree_to_widget_coords (a_tree_view: POINTER; a_tx: INTEGER_32; a_ty: INTEGER_32; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_tree_to_widget_coords (node at line 34951)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_tree_to_widget_coords"
		}"
		end

	gtk_tree_view_get_selection (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_selection (node at line 34998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_selection"
		}"
		end

	gtk_tree_view_set_show_expanders (a_tree_view: POINTER; an_enabled: INTEGER_32) is
 		-- gtk_tree_view_set_show_expanders (node at line 35037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_show_expanders"
		}"
		end

	gtk_tree_view_append_column (a_tree_view: POINTER; a_column: POINTER): INTEGER_32 is
 		-- gtk_tree_view_append_column (node at line 35701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_append_column"
		}"
		end

	gtk_tree_view_row_expanded (a_tree_view: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_tree_view_row_expanded (node at line 36024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_row_expanded"
		}"
		end

	gtk_tree_view_row_activated (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER) is
 		-- gtk_tree_view_row_activated (node at line 36727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_row_activated"
		}"
		end

	gtk_tree_view_get_enable_search (a_tree_view: POINTER): INTEGER_32 is
 		-- gtk_tree_view_get_enable_search (node at line 36856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_enable_search"
		}"
		end

	gtk_tree_view_get_hadjustment (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_hadjustment (node at line 37205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hadjustment"
		}"
		end

	gtk_tree_view_get_visible_rect (a_tree_view: POINTER; a_visible_rect: POINTER) is
 		-- gtk_tree_view_get_visible_rect (node at line 37583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_visible_rect"
		}"
		end

	gtk_tree_view_set_hover_expand (a_tree_view: POINTER; an_expand: INTEGER_32) is
 		-- gtk_tree_view_set_hover_expand (node at line 37594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hover_expand"
		}"
		end

	gtk_tree_view_convert_widget_to_tree_coords (a_tree_view: POINTER; a_wx: INTEGER_32; a_wy: INTEGER_32; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_convert_widget_to_tree_coords (node at line 37641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_widget_to_tree_coords"
		}"
		end


end -- class GTKTREEVIEW_EXTERNALS
