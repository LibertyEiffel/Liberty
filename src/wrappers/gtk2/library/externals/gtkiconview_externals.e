-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONVIEW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_icon_view_convert_widget_to_bin_window_coords (an_icon_view: POINTER; a_wx: INTEGER; a_wy: INTEGER; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_icon_view_convert_widget_to_bin_window_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_convert_widget_to_bin_window_coords"
		}"
		end

	gtk_icon_view_create_drag_icon (an_icon_view: POINTER; a_path: POINTER): POINTER is
 		-- gtk_icon_view_create_drag_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_create_drag_icon"
		}"
		end

	gtk_icon_view_enable_model_drag_dest (an_icon_view: POINTER; a_targets: POINTER; a_n_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_icon_view_enable_model_drag_dest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_enable_model_drag_dest"
		}"
		end

	gtk_icon_view_enable_model_drag_source (an_icon_view: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_icon_view_enable_model_drag_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_enable_model_drag_source"
		}"
		end

	gtk_icon_view_get_column_spacing (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_column_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_column_spacing"
		}"
		end

	gtk_icon_view_get_columns (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_columns"
		}"
		end

	gtk_icon_view_get_cursor (an_icon_view: POINTER; a_path: POINTER; a_cell: POINTER): INTEGER is
 		-- gtk_icon_view_get_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_cursor"
		}"
		end

	gtk_icon_view_get_dest_item_at_pos (an_icon_view: POINTER; a_drag_x: INTEGER; a_drag_y: INTEGER; a_path: POINTER; a_pos: POINTER): INTEGER is
 		-- gtk_icon_view_get_dest_item_at_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_dest_item_at_pos"
		}"
		end

	gtk_icon_view_get_drag_dest_item (an_icon_view: POINTER; a_path: POINTER; a_pos: POINTER) is
 		-- gtk_icon_view_get_drag_dest_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_drag_dest_item"
		}"
		end

	gtk_icon_view_get_item_at_pos (an_icon_view: POINTER; a_x: INTEGER; a_y: INTEGER; a_path: POINTER; a_cell: POINTER): INTEGER is
 		-- gtk_icon_view_get_item_at_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_at_pos"
		}"
		end

	gtk_icon_view_get_item_column (an_icon_view: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_icon_view_get_item_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_column"
		}"
		end

	gtk_icon_view_get_item_orientation (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_item_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_orientation"
		}"
		end

	gtk_icon_view_get_item_padding (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_item_padding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_padding"
		}"
		end

	gtk_icon_view_get_item_row (an_icon_view: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_icon_view_get_item_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_row"
		}"
		end

	gtk_icon_view_get_item_width (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_item_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_width"
		}"
		end

	gtk_icon_view_get_margin (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_margin"
		}"
		end

	gtk_icon_view_get_markup_column (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_markup_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_markup_column"
		}"
		end

	gtk_icon_view_get_model (an_icon_view: POINTER): POINTER is
 		-- gtk_icon_view_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_model"
		}"
		end

	gtk_icon_view_get_orientation (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_orientation"
		}"
		end

	gtk_icon_view_get_path_at_pos (an_icon_view: POINTER; a_x: INTEGER; a_y: INTEGER): POINTER is
 		-- gtk_icon_view_get_path_at_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_path_at_pos"
		}"
		end

	gtk_icon_view_get_pixbuf_column (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_pixbuf_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_pixbuf_column"
		}"
		end

	gtk_icon_view_get_reorderable (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_reorderable"
		}"
		end

	gtk_icon_view_get_row_spacing (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_row_spacing"
		}"
		end

	gtk_icon_view_get_selected_items (an_icon_view: POINTER): POINTER is
 		-- gtk_icon_view_get_selected_items
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_selected_items"
		}"
		end

	gtk_icon_view_get_selection_mode (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_selection_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_selection_mode"
		}"
		end

	gtk_icon_view_get_spacing (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_spacing"
		}"
		end

	gtk_icon_view_get_text_column (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_text_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_text_column"
		}"
		end

	gtk_icon_view_get_tooltip_column (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_tooltip_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_tooltip_column"
		}"
		end

	gtk_icon_view_get_tooltip_context (an_icon_view: POINTER; a_x: POINTER; a_y: POINTER; a_keyboard_tip: INTEGER; a_model: POINTER; a_path: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_icon_view_get_tooltip_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_tooltip_context"
		}"
		end

	gtk_icon_view_get_type: like long_unsigned is
 		-- gtk_icon_view_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_type()"
		}"
		end

	gtk_icon_view_get_visible_range (an_icon_view: POINTER; a_start_path: POINTER; an_end_path: POINTER): INTEGER is
 		-- gtk_icon_view_get_visible_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_visible_range"
		}"
		end

	gtk_icon_view_item_activated (an_icon_view: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_item_activated
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_item_activated"
		}"
		end

	gtk_icon_view_new: POINTER is
 		-- gtk_icon_view_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_new()"
		}"
		end

	gtk_icon_view_new_with_model (a_model: POINTER): POINTER is
 		-- gtk_icon_view_new_with_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_new_with_model"
		}"
		end

	gtk_icon_view_path_is_selected (an_icon_view: POINTER; a_path: POINTER): INTEGER is
 		-- gtk_icon_view_path_is_selected
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_path_is_selected"
		}"
		end

	gtk_icon_view_scroll_to_path (an_icon_view: POINTER; a_path: POINTER; an_use_align: INTEGER; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_icon_view_scroll_to_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_scroll_to_path"
		}"
		end

	gtk_icon_view_select_all (an_icon_view: POINTER) is
 		-- gtk_icon_view_select_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_select_all"
		}"
		end

	gtk_icon_view_select_path (an_icon_view: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_select_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_select_path"
		}"
		end

	gtk_icon_view_selected_foreach (an_icon_view: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_icon_view_selected_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_selected_foreach"
		}"
		end

	gtk_icon_view_set_column_spacing (an_icon_view: POINTER; a_column_spacing: INTEGER) is
 		-- gtk_icon_view_set_column_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_column_spacing"
		}"
		end

	gtk_icon_view_set_columns (an_icon_view: POINTER; a_columns: INTEGER) is
 		-- gtk_icon_view_set_columns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_columns"
		}"
		end

	gtk_icon_view_set_cursor (an_icon_view: POINTER; a_path: POINTER; a_cell: POINTER; a_start_editing: INTEGER) is
 		-- gtk_icon_view_set_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_cursor"
		}"
		end

	gtk_icon_view_set_drag_dest_item (an_icon_view: POINTER; a_path: POINTER; a_pos: INTEGER) is
 		-- gtk_icon_view_set_drag_dest_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_drag_dest_item"
		}"
		end

	gtk_icon_view_set_item_orientation (an_icon_view: POINTER; an_orientation: INTEGER) is
 		-- gtk_icon_view_set_item_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_item_orientation"
		}"
		end

	gtk_icon_view_set_item_padding (an_icon_view: POINTER; an_item_padding: INTEGER) is
 		-- gtk_icon_view_set_item_padding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_item_padding"
		}"
		end

	gtk_icon_view_set_item_width (an_icon_view: POINTER; an_item_width: INTEGER) is
 		-- gtk_icon_view_set_item_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_item_width"
		}"
		end

	gtk_icon_view_set_margin (an_icon_view: POINTER; a_margin: INTEGER) is
 		-- gtk_icon_view_set_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_margin"
		}"
		end

	gtk_icon_view_set_markup_column (an_icon_view: POINTER; a_column: INTEGER) is
 		-- gtk_icon_view_set_markup_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_markup_column"
		}"
		end

	gtk_icon_view_set_model (an_icon_view: POINTER; a_model: POINTER) is
 		-- gtk_icon_view_set_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_model"
		}"
		end

	gtk_icon_view_set_orientation (an_icon_view: POINTER; an_orientation: INTEGER) is
 		-- gtk_icon_view_set_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_orientation"
		}"
		end

	gtk_icon_view_set_pixbuf_column (an_icon_view: POINTER; a_column: INTEGER) is
 		-- gtk_icon_view_set_pixbuf_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_pixbuf_column"
		}"
		end

	gtk_icon_view_set_reorderable (an_icon_view: POINTER; a_reorderable: INTEGER) is
 		-- gtk_icon_view_set_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_reorderable"
		}"
		end

	gtk_icon_view_set_row_spacing (an_icon_view: POINTER; a_row_spacing: INTEGER) is
 		-- gtk_icon_view_set_row_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_row_spacing"
		}"
		end

	gtk_icon_view_set_selection_mode (an_icon_view: POINTER; a_mode: INTEGER) is
 		-- gtk_icon_view_set_selection_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_selection_mode"
		}"
		end

	gtk_icon_view_set_spacing (an_icon_view: POINTER; a_spacing: INTEGER) is
 		-- gtk_icon_view_set_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_spacing"
		}"
		end

	gtk_icon_view_set_text_column (an_icon_view: POINTER; a_column: INTEGER) is
 		-- gtk_icon_view_set_text_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_text_column"
		}"
		end

	gtk_icon_view_set_tooltip_cell (an_icon_view: POINTER; a_tooltip: POINTER; a_path: POINTER; a_cell: POINTER) is
 		-- gtk_icon_view_set_tooltip_cell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_tooltip_cell"
		}"
		end

	gtk_icon_view_set_tooltip_column (an_icon_view: POINTER; a_column: INTEGER) is
 		-- gtk_icon_view_set_tooltip_column
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_tooltip_column"
		}"
		end

	gtk_icon_view_set_tooltip_item (an_icon_view: POINTER; a_tooltip: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_set_tooltip_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_tooltip_item"
		}"
		end

	gtk_icon_view_unselect_all (an_icon_view: POINTER) is
 		-- gtk_icon_view_unselect_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unselect_all"
		}"
		end

	gtk_icon_view_unselect_path (an_icon_view: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_unselect_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unselect_path"
		}"
		end

	gtk_icon_view_unset_model_drag_dest (an_icon_view: POINTER) is
 		-- gtk_icon_view_unset_model_drag_dest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unset_model_drag_dest"
		}"
		end

	gtk_icon_view_unset_model_drag_source (an_icon_view: POINTER) is
 		-- gtk_icon_view_unset_model_drag_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unset_model_drag_source"
		}"
		end


end -- class GTKICONVIEW_EXTERNALS
