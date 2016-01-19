-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEVIEW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tree_view_append_column (a_tree_view: POINTER; a_column: POINTER): INTEGER is
 		-- gtk_tree_view_append_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_append_column"
		}"
		end

	gtk_tree_view_collapse_all (a_tree_view: POINTER) is
 		-- gtk_tree_view_collapse_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_collapse_all"
		}"
		end

	gtk_tree_view_collapse_row (a_tree_view: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_tree_view_collapse_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_collapse_row"
		}"
		end

	gtk_tree_view_columns_autosize (a_tree_view: POINTER) is
 		-- gtk_tree_view_columns_autosize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_columns_autosize"
		}"
		end

	gtk_tree_view_convert_bin_window_to_tree_coords (a_tree_view: POINTER; a_bx: INTEGER; a_by: INTEGER; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_convert_bin_window_to_tree_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_bin_window_to_tree_coords"
		}"
		end

	gtk_tree_view_convert_bin_window_to_widget_coords (a_tree_view: POINTER; a_bx: INTEGER; a_by: INTEGER; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_convert_bin_window_to_widget_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_bin_window_to_widget_coords"
		}"
		end

	gtk_tree_view_convert_tree_to_bin_window_coords (a_tree_view: POINTER; a_tx: INTEGER; a_ty: INTEGER; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_tree_view_convert_tree_to_bin_window_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_tree_to_bin_window_coords"
		}"
		end

	gtk_tree_view_convert_tree_to_widget_coords (a_tree_view: POINTER; a_tx: INTEGER; a_ty: INTEGER; a_wx: POINTER; a_wy: POINTER) is
 		-- gtk_tree_view_convert_tree_to_widget_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_tree_to_widget_coords"
		}"
		end

	gtk_tree_view_convert_widget_to_bin_window_coords (a_tree_view: POINTER; a_wx: INTEGER; a_wy: INTEGER; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_tree_view_convert_widget_to_bin_window_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_widget_to_bin_window_coords"
		}"
		end

	gtk_tree_view_convert_widget_to_tree_coords (a_tree_view: POINTER; a_wx: INTEGER; a_wy: INTEGER; a_tx: POINTER; a_ty: POINTER) is
 		-- gtk_tree_view_convert_widget_to_tree_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_convert_widget_to_tree_coords"
		}"
		end

	gtk_tree_view_create_row_drag_icon (a_tree_view: POINTER; a_path: POINTER): POINTER is
 		-- gtk_tree_view_create_row_drag_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_create_row_drag_icon"
		}"
		end

	gtk_tree_view_enable_model_drag_dest (a_tree_view: POINTER; a_targets: POINTER; a_n_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_tree_view_enable_model_drag_dest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_enable_model_drag_dest"
		}"
		end

	gtk_tree_view_enable_model_drag_source (a_tree_view: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_tree_view_enable_model_drag_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_enable_model_drag_source"
		}"
		end

	gtk_tree_view_expand_all (a_tree_view: POINTER) is
 		-- gtk_tree_view_expand_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_all"
		}"
		end

	gtk_tree_view_expand_row (a_tree_view: POINTER; a_path: POINTER; an_open_all: INTEGER): INTEGER is
 		-- gtk_tree_view_expand_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_row"
		}"
		end

	gtk_tree_view_expand_to_path (a_tree_view: POINTER; a_path: POINTER) is
 		-- gtk_tree_view_expand_to_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_expand_to_path"
		}"
		end

	gtk_tree_view_get_background_area (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; a_rect: POINTER) is
 		-- gtk_tree_view_get_background_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_background_area"
		}"
		end

	gtk_tree_view_get_bin_window (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_bin_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_bin_window"
		}"
		end

	gtk_tree_view_get_cell_area (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; a_rect: POINTER) is
 		-- gtk_tree_view_get_cell_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_cell_area"
		}"
		end

	gtk_tree_view_get_column (a_tree_view: POINTER; a_n: INTEGER): POINTER is
 		-- gtk_tree_view_get_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_column"
		}"
		end

	gtk_tree_view_get_columns (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_columns"
		}"
		end

	gtk_tree_view_get_cursor (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER) is
 		-- gtk_tree_view_get_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_cursor"
		}"
		end

	gtk_tree_view_get_dest_row_at_pos (a_tree_view: POINTER; a_drag_x: INTEGER; a_drag_y: INTEGER; a_path: POINTER; a_pos: POINTER): INTEGER is
 		-- gtk_tree_view_get_dest_row_at_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_dest_row_at_pos"
		}"
		end

	gtk_tree_view_get_drag_dest_row (a_tree_view: POINTER; a_path: POINTER; a_pos: POINTER) is
 		-- gtk_tree_view_get_drag_dest_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_drag_dest_row"
		}"
		end

	gtk_tree_view_get_enable_search (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_enable_search
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_enable_search"
		}"
		end

	gtk_tree_view_get_enable_tree_lines (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_enable_tree_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_enable_tree_lines"
		}"
		end

	gtk_tree_view_get_expander_column (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_expander_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_expander_column"
		}"
		end

	gtk_tree_view_get_fixed_height_mode (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_fixed_height_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_fixed_height_mode"
		}"
		end

	gtk_tree_view_get_grid_lines (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_grid_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_grid_lines"
		}"
		end

	gtk_tree_view_get_hadjustment (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hadjustment"
		}"
		end

	gtk_tree_view_get_headers_clickable (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_headers_clickable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_headers_clickable"
		}"
		end

	gtk_tree_view_get_headers_visible (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_headers_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_headers_visible"
		}"
		end

	gtk_tree_view_get_hover_expand (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_hover_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hover_expand"
		}"
		end

	gtk_tree_view_get_hover_selection (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_hover_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_hover_selection"
		}"
		end

	gtk_tree_view_get_level_indentation (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_level_indentation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_level_indentation"
		}"
		end

	gtk_tree_view_get_model (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_model"
		}"
		end

	gtk_tree_view_get_path_at_pos (a_tree_view: POINTER; a_x: INTEGER; a_y: INTEGER; a_path: POINTER; a_column: POINTER; a_cell_x: POINTER; a_cell_y: POINTER): INTEGER is
 		-- gtk_tree_view_get_path_at_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_path_at_pos"
		}"
		end

	gtk_tree_view_get_reorderable (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_reorderable"
		}"
		end

	gtk_tree_view_get_row_separator_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_row_separator_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_row_separator_func"
		}"
		end

	gtk_tree_view_get_rubber_banding (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_rubber_banding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_rubber_banding"
		}"
		end

	gtk_tree_view_get_rules_hint (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_rules_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_rules_hint"
		}"
		end

	gtk_tree_view_get_search_column (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_search_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_column"
		}"
		end

	gtk_tree_view_get_search_entry (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_entry"
		}"
		end

	gtk_tree_view_get_search_equal_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_equal_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_equal_func"
		}"
		end

	gtk_tree_view_get_search_position_func (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_search_position_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_search_position_func"
		}"
		end

	gtk_tree_view_get_selection (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_selection"
		}"
		end

	gtk_tree_view_get_show_expanders (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_show_expanders
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_show_expanders"
		}"
		end

	gtk_tree_view_get_tooltip_column (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_get_tooltip_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_tooltip_column"
		}"
		end

	gtk_tree_view_get_tooltip_context (a_tree_view: POINTER; a_x: POINTER; a_y: POINTER; a_keyboard_tip: INTEGER; a_model: POINTER; a_path: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_tree_view_get_tooltip_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_tooltip_context"
		}"
		end

	gtk_tree_view_get_type: like long_unsigned is
 		-- gtk_tree_view_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_type()"
		}"
		end

	gtk_tree_view_get_vadjustment (a_tree_view: POINTER): POINTER is
 		-- gtk_tree_view_get_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_vadjustment"
		}"
		end

	gtk_tree_view_get_visible_range (a_tree_view: POINTER; a_start_path: POINTER; an_end_path: POINTER): INTEGER is
 		-- gtk_tree_view_get_visible_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_visible_range"
		}"
		end

	gtk_tree_view_get_visible_rect (a_tree_view: POINTER; a_visible_rect: POINTER) is
 		-- gtk_tree_view_get_visible_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_get_visible_rect"
		}"
		end

	gtk_tree_view_insert_column (a_tree_view: POINTER; a_column: POINTER; a_position: INTEGER): INTEGER is
 		-- gtk_tree_view_insert_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column"
		}"
		end

	gtk_tree_view_insert_column_with_attributes (a_tree_view: POINTER; a_position: INTEGER; a_title: POINTER; a_cell: POINTER): INTEGER is
 		-- gtk_tree_view_insert_column_with_attributes (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column_with_attributes"
		}"
		end

	gtk_tree_view_insert_column_with_data_func (a_tree_view: POINTER; a_position: INTEGER; a_title: POINTER; a_cell: POINTER; a_func: POINTER; a_data: POINTER; a_dnotify: POINTER): INTEGER is
 		-- gtk_tree_view_insert_column_with_data_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_insert_column_with_data_func"
		}"
		end

	gtk_tree_view_is_rubber_banding_active (a_tree_view: POINTER): INTEGER is
 		-- gtk_tree_view_is_rubber_banding_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_is_rubber_banding_active"
		}"
		end

	gtk_tree_view_map_expanded_rows (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_tree_view_map_expanded_rows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_map_expanded_rows"
		}"
		end

	gtk_tree_view_move_column_after (a_tree_view: POINTER; a_column: POINTER; a_base_column: POINTER) is
 		-- gtk_tree_view_move_column_after
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_move_column_after"
		}"
		end

	gtk_tree_view_new: POINTER is
 		-- gtk_tree_view_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_new()"
		}"
		end

	gtk_tree_view_new_with_model (a_model: POINTER): POINTER is
 		-- gtk_tree_view_new_with_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_new_with_model"
		}"
		end

	gtk_tree_view_remove_column (a_tree_view: POINTER; a_column: POINTER): INTEGER is
 		-- gtk_tree_view_remove_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_remove_column"
		}"
		end

	gtk_tree_view_row_activated (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER) is
 		-- gtk_tree_view_row_activated
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_row_activated"
		}"
		end

	gtk_tree_view_row_expanded (a_tree_view: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_tree_view_row_expanded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_row_expanded"
		}"
		end

	gtk_tree_view_scroll_to_cell (a_tree_view: POINTER; a_path: POINTER; a_column: POINTER; an_use_align: INTEGER; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_tree_view_scroll_to_cell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_scroll_to_cell"
		}"
		end

	gtk_tree_view_scroll_to_point (a_tree_view: POINTER; a_tree_x: INTEGER; a_tree_y: INTEGER) is
 		-- gtk_tree_view_scroll_to_point
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_scroll_to_point"
		}"
		end

	gtk_tree_view_set_column_drag_function (a_tree_view: POINTER; a_func: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_column_drag_function
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_column_drag_function"
		}"
		end

	gtk_tree_view_set_cursor (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER; a_start_editing: INTEGER) is
 		-- gtk_tree_view_set_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_cursor"
		}"
		end

	gtk_tree_view_set_cursor_on_cell (a_tree_view: POINTER; a_path: POINTER; a_focus_column: POINTER; a_focus_cell: POINTER; a_start_editing: INTEGER) is
 		-- gtk_tree_view_set_cursor_on_cell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_cursor_on_cell"
		}"
		end

	gtk_tree_view_set_destroy_count_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_destroy_count_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_destroy_count_func"
		}"
		end

	gtk_tree_view_set_drag_dest_row (a_tree_view: POINTER; a_path: POINTER; a_pos: INTEGER) is
 		-- gtk_tree_view_set_drag_dest_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_drag_dest_row"
		}"
		end

	gtk_tree_view_set_enable_search (a_tree_view: POINTER; an_enable_search: INTEGER) is
 		-- gtk_tree_view_set_enable_search
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_enable_search"
		}"
		end

	gtk_tree_view_set_enable_tree_lines (a_tree_view: POINTER; an_enabled: INTEGER) is
 		-- gtk_tree_view_set_enable_tree_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_enable_tree_lines"
		}"
		end

	gtk_tree_view_set_expander_column (a_tree_view: POINTER; a_column: POINTER) is
 		-- gtk_tree_view_set_expander_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_expander_column"
		}"
		end

	gtk_tree_view_set_fixed_height_mode (a_tree_view: POINTER; an_enable: INTEGER) is
 		-- gtk_tree_view_set_fixed_height_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_fixed_height_mode"
		}"
		end

	gtk_tree_view_set_grid_lines (a_tree_view: POINTER; a_grid_lines: INTEGER) is
 		-- gtk_tree_view_set_grid_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_grid_lines"
		}"
		end

	gtk_tree_view_set_hadjustment (a_tree_view: POINTER; an_adjustment: POINTER) is
 		-- gtk_tree_view_set_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hadjustment"
		}"
		end

	gtk_tree_view_set_headers_clickable (a_tree_view: POINTER; a_setting: INTEGER) is
 		-- gtk_tree_view_set_headers_clickable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_headers_clickable"
		}"
		end

	gtk_tree_view_set_headers_visible (a_tree_view: POINTER; a_headers_visible: INTEGER) is
 		-- gtk_tree_view_set_headers_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_headers_visible"
		}"
		end

	gtk_tree_view_set_hover_expand (a_tree_view: POINTER; an_expand: INTEGER) is
 		-- gtk_tree_view_set_hover_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hover_expand"
		}"
		end

	gtk_tree_view_set_hover_selection (a_tree_view: POINTER; a_hover: INTEGER) is
 		-- gtk_tree_view_set_hover_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_hover_selection"
		}"
		end

	gtk_tree_view_set_level_indentation (a_tree_view: POINTER; an_indentation: INTEGER) is
 		-- gtk_tree_view_set_level_indentation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_level_indentation"
		}"
		end

	gtk_tree_view_set_model (a_tree_view: POINTER; a_model: POINTER) is
 		-- gtk_tree_view_set_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_model"
		}"
		end

	gtk_tree_view_set_reorderable (a_tree_view: POINTER; a_reorderable: INTEGER) is
 		-- gtk_tree_view_set_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_reorderable"
		}"
		end

	gtk_tree_view_set_row_separator_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_row_separator_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_row_separator_func"
		}"
		end

	gtk_tree_view_set_rubber_banding (a_tree_view: POINTER; an_enable: INTEGER) is
 		-- gtk_tree_view_set_rubber_banding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_rubber_banding"
		}"
		end

	gtk_tree_view_set_rules_hint (a_tree_view: POINTER; a_setting: INTEGER) is
 		-- gtk_tree_view_set_rules_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_rules_hint"
		}"
		end

	gtk_tree_view_set_search_column (a_tree_view: POINTER; a_column: INTEGER) is
 		-- gtk_tree_view_set_search_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_column"
		}"
		end

	gtk_tree_view_set_search_entry (a_tree_view: POINTER; an_entry: POINTER) is
 		-- gtk_tree_view_set_search_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_entry"
		}"
		end

	gtk_tree_view_set_search_equal_func (a_tree_view: POINTER; a_search_equal_func: POINTER; a_search_user_data: POINTER; a_search_destroy: POINTER) is
 		-- gtk_tree_view_set_search_equal_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_equal_func"
		}"
		end

	gtk_tree_view_set_search_position_func (a_tree_view: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_tree_view_set_search_position_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_search_position_func"
		}"
		end

	gtk_tree_view_set_show_expanders (a_tree_view: POINTER; an_enabled: INTEGER) is
 		-- gtk_tree_view_set_show_expanders
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_show_expanders"
		}"
		end

	gtk_tree_view_set_tooltip_cell (a_tree_view: POINTER; a_tooltip: POINTER; a_path: POINTER; a_column: POINTER; a_cell: POINTER) is
 		-- gtk_tree_view_set_tooltip_cell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_cell"
		}"
		end

	gtk_tree_view_set_tooltip_column (a_tree_view: POINTER; a_column: INTEGER) is
 		-- gtk_tree_view_set_tooltip_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_column"
		}"
		end

	gtk_tree_view_set_tooltip_row (a_tree_view: POINTER; a_tooltip: POINTER; a_path: POINTER) is
 		-- gtk_tree_view_set_tooltip_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_tooltip_row"
		}"
		end

	gtk_tree_view_set_vadjustment (a_tree_view: POINTER; an_adjustment: POINTER) is
 		-- gtk_tree_view_set_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_set_vadjustment"
		}"
		end

	gtk_tree_view_unset_rows_drag_dest (a_tree_view: POINTER) is
 		-- gtk_tree_view_unset_rows_drag_dest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_unset_rows_drag_dest"
		}"
		end

	gtk_tree_view_unset_rows_drag_source (a_tree_view: POINTER) is
 		-- gtk_tree_view_unset_rows_drag_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_view_unset_rows_drag_source"
		}"
		end


end -- class GTKTREEVIEW_EXTERNALS
