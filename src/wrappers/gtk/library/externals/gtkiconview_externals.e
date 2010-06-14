-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONVIEW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_icon_view_get_item_padding (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_item_padding (node at line 309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_padding"
		}"
		end

	gtk_icon_view_get_model (an_icon_view: POINTER): POINTER is
 		-- gtk_icon_view_get_model (node at line 472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_model"
		}"
		end

	gtk_icon_view_get_type: NATURAL_32 is
 		-- gtk_icon_view_get_type (node at line 699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_type()"
		}"
		end

	gtk_icon_view_get_spacing (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_spacing (node at line 958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_spacing"
		}"
		end

	gtk_icon_view_get_cursor (an_icon_view: POINTER; a_path: POINTER; a_cell: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_cursor (node at line 2125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_cursor"
		}"
		end

	gtk_icon_view_item_activated (an_icon_view: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_item_activated (node at line 2188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_item_activated"
		}"
		end

	gtk_icon_view_set_row_spacing (an_icon_view: POINTER; a_row_spacing: INTEGER_32) is
 		-- gtk_icon_view_set_row_spacing (node at line 2652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_row_spacing"
		}"
		end

	gtk_icon_view_unset_model_drag_dest (an_icon_view: POINTER) is
 		-- gtk_icon_view_unset_model_drag_dest (node at line 3840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unset_model_drag_dest"
		}"
		end

	gtk_icon_view_get_drag_dest_item (an_icon_view: POINTER; a_path: POINTER; a_pos: POINTER) is
 		-- gtk_icon_view_get_drag_dest_item (node at line 6521)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_drag_dest_item"
		}"
		end

	gtk_icon_view_set_orientation (an_icon_view: POINTER; an_orientation: INTEGER) is
 		-- gtk_icon_view_set_orientation (node at line 11874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_orientation"
		}"
		end

	gtk_icon_view_path_is_selected (an_icon_view: POINTER; a_path: POINTER): INTEGER_32 is
 		-- gtk_icon_view_path_is_selected (node at line 12005)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_path_is_selected"
		}"
		end

	gtk_icon_view_create_drag_icon (an_icon_view: POINTER; a_path: POINTER): POINTER is
 		-- gtk_icon_view_create_drag_icon (node at line 12285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_create_drag_icon"
		}"
		end

	gtk_icon_view_select_all (an_icon_view: POINTER) is
 		-- gtk_icon_view_select_all (node at line 12989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_select_all"
		}"
		end

	gtk_icon_view_selected_foreach (an_icon_view: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_icon_view_selected_foreach (node at line 13370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_selected_foreach"
		}"
		end

	gtk_icon_view_select_path (an_icon_view: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_select_path (node at line 14716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_select_path"
		}"
		end

	gtk_icon_view_set_tooltip_cell (an_icon_view: POINTER; a_tooltip: POINTER; a_path: POINTER; a_cell: POINTER) is
 		-- gtk_icon_view_set_tooltip_cell (node at line 15016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_tooltip_cell"
		}"
		end

	gtk_icon_view_set_drag_dest_item (an_icon_view: POINTER; a_path: POINTER; a_pos: INTEGER) is
 		-- gtk_icon_view_set_drag_dest_item (node at line 15217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_drag_dest_item"
		}"
		end

	gtk_icon_view_get_path_at_pos (an_icon_view: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gtk_icon_view_get_path_at_pos (node at line 15598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_path_at_pos"
		}"
		end

	gtk_icon_view_get_orientation (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_orientation (node at line 15902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_orientation"
		}"
		end

	gtk_icon_view_get_row_spacing (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_row_spacing (node at line 16256)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_row_spacing"
		}"
		end

	gtk_icon_view_unselect_path (an_icon_view: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_unselect_path (node at line 17212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unselect_path"
		}"
		end

	gtk_icon_view_get_selected_items (an_icon_view: POINTER): POINTER is
 		-- gtk_icon_view_get_selected_items (node at line 17583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_selected_items"
		}"
		end

	gtk_icon_view_get_item_width (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_item_width (node at line 17794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_width"
		}"
		end

	gtk_icon_view_unset_model_drag_source (an_icon_view: POINTER) is
 		-- gtk_icon_view_unset_model_drag_source (node at line 17894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unset_model_drag_source"
		}"
		end

	gtk_icon_view_set_reorderable (an_icon_view: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_icon_view_set_reorderable (node at line 18805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_reorderable"
		}"
		end

	gtk_icon_view_new: POINTER is
 		-- gtk_icon_view_new (node at line 18821)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_new()"
		}"
		end

	gtk_icon_view_get_visible_range (an_icon_view: POINTER; a_start_path: POINTER; an_end_path: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_visible_range (node at line 18874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_visible_range"
		}"
		end

	gtk_icon_view_set_model (an_icon_view: POINTER; a_model: POINTER) is
 		-- gtk_icon_view_set_model (node at line 19735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_model"
		}"
		end

	gtk_icon_view_get_pixbuf_column (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_pixbuf_column (node at line 20106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_pixbuf_column"
		}"
		end

	gtk_icon_view_set_item_width (an_icon_view: POINTER; an_item_width: INTEGER_32) is
 		-- gtk_icon_view_set_item_width (node at line 22937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_item_width"
		}"
		end

	gtk_icon_view_set_text_column (an_icon_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_icon_view_set_text_column (node at line 23147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_text_column"
		}"
		end

	gtk_icon_view_unselect_all (an_icon_view: POINTER) is
 		-- gtk_icon_view_unselect_all (node at line 23475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_unselect_all"
		}"
		end

	gtk_icon_view_convert_widget_to_bin_window_coords (an_icon_view: POINTER; a_wx: INTEGER_32; a_wy: INTEGER_32; a_bx: POINTER; a_by: POINTER) is
 		-- gtk_icon_view_convert_widget_to_bin_window_coords (node at line 23512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_convert_widget_to_bin_window_coords"
		}"
		end

	gtk_icon_view_get_columns (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_columns (node at line 23776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_columns"
		}"
		end

	gtk_icon_view_get_selection_mode (an_icon_view: POINTER): INTEGER is
 		-- gtk_icon_view_get_selection_mode (node at line 23931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_selection_mode"
		}"
		end

	gtk_icon_view_set_cursor (an_icon_view: POINTER; a_path: POINTER; a_cell: POINTER; a_start_editing: INTEGER_32) is
 		-- gtk_icon_view_set_cursor (node at line 24439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_cursor"
		}"
		end

	gtk_icon_view_new_with_model (a_model: POINTER): POINTER is
 		-- gtk_icon_view_new_with_model (node at line 24872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_new_with_model"
		}"
		end

	gtk_icon_view_set_pixbuf_column (an_icon_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_icon_view_set_pixbuf_column (node at line 25424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_pixbuf_column"
		}"
		end

	gtk_icon_view_enable_model_drag_source (an_icon_view: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_icon_view_enable_model_drag_source (node at line 25552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_enable_model_drag_source"
		}"
		end

	gtk_icon_view_get_dest_item_at_pos (an_icon_view: POINTER; a_drag_x: INTEGER_32; a_drag_y: INTEGER_32; a_path: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_dest_item_at_pos (node at line 27042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_dest_item_at_pos"
		}"
		end

	gtk_icon_view_get_markup_column (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_markup_column (node at line 28290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_markup_column"
		}"
		end

	gtk_icon_view_scroll_to_path (an_icon_view: POINTER; a_path: POINTER; an_use_align: INTEGER_32; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_icon_view_scroll_to_path (node at line 28895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_scroll_to_path"
		}"
		end

	gtk_icon_view_get_tooltip_column (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_tooltip_column (node at line 28994)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_tooltip_column"
		}"
		end

	gtk_icon_view_get_column_spacing (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_column_spacing (node at line 29788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_column_spacing"
		}"
		end

	gtk_icon_view_set_columns (an_icon_view: POINTER; a_columns: INTEGER_32) is
 		-- gtk_icon_view_set_columns (node at line 30061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_columns"
		}"
		end

	gtk_icon_view_get_reorderable (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_reorderable (node at line 31491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_reorderable"
		}"
		end

	gtk_icon_view_set_spacing (an_icon_view: POINTER; a_spacing: INTEGER_32) is
 		-- gtk_icon_view_set_spacing (node at line 31926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_spacing"
		}"
		end

	gtk_icon_view_get_item_at_pos (an_icon_view: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_path: POINTER; a_cell: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_item_at_pos (node at line 31949)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_item_at_pos"
		}"
		end

	gtk_icon_view_set_selection_mode (an_icon_view: POINTER; a_mode: INTEGER) is
 		-- gtk_icon_view_set_selection_mode (node at line 32176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_selection_mode"
		}"
		end

	gtk_icon_view_enable_model_drag_dest (an_icon_view: POINTER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_icon_view_enable_model_drag_dest (node at line 32500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_enable_model_drag_dest"
		}"
		end

	gtk_icon_view_get_margin (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_margin (node at line 33575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_margin"
		}"
		end

	gtk_icon_view_set_markup_column (an_icon_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_icon_view_set_markup_column (node at line 33791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_markup_column"
		}"
		end

	gtk_icon_view_set_item_padding (an_icon_view: POINTER; an_item_padding: INTEGER_32) is
 		-- gtk_icon_view_set_item_padding (node at line 33941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_item_padding"
		}"
		end

	gtk_icon_view_set_margin (an_icon_view: POINTER; a_margin: INTEGER_32) is
 		-- gtk_icon_view_set_margin (node at line 34577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_margin"
		}"
		end

	gtk_icon_view_set_tooltip_item (an_icon_view: POINTER; a_tooltip: POINTER; a_path: POINTER) is
 		-- gtk_icon_view_set_tooltip_item (node at line 35083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_tooltip_item"
		}"
		end

	gtk_icon_view_get_text_column (an_icon_view: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_text_column (node at line 35620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_text_column"
		}"
		end

	gtk_icon_view_set_tooltip_column (an_icon_view: POINTER; a_column: INTEGER_32) is
 		-- gtk_icon_view_set_tooltip_column (node at line 36520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_tooltip_column"
		}"
		end

	gtk_icon_view_get_tooltip_context (an_icon_view: POINTER; a_x: POINTER; a_y: POINTER; a_keyboard_tip: INTEGER_32; a_model: POINTER; a_path: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_icon_view_get_tooltip_context (node at line 36539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_get_tooltip_context"
		}"
		end

	gtk_icon_view_set_column_spacing (an_icon_view: POINTER; a_column_spacing: INTEGER_32) is
 		-- gtk_icon_view_set_column_spacing (node at line 37333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_view_set_column_spacing"
		}"
		end


end -- class GTKICONVIEW_EXTERNALS
