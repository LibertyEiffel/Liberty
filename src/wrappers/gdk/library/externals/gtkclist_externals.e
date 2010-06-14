-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCLIST_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_clist_set_row_style (a_clist: POINTER; a_row: INTEGER_32; a_style: POINTER) is
 		-- gtk_clist_set_row_style (node at line 660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_row_style"
		}"
		end

	gtk_clist_get_type: NATURAL_32 is
 		-- gtk_clist_get_type (node at line 683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_type()"
		}"
		end

	gtk_clist_get_pixtext (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_text: POINTER; a_spacing: POINTER; a_pixmap: POINTER; a_mask: POINTER): INTEGER_32 is
 		-- gtk_clist_get_pixtext (node at line 1283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_pixtext"
		}"
		end

	-- `hidden' function _gtk_clist_create_cell_layout skipped.
	gtk_clist_column_titles_hide (a_clist: POINTER) is
 		-- gtk_clist_column_titles_hide (node at line 3082)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_column_titles_hide"
		}"
		end

	gtk_clist_find_row_from_data (a_clist: POINTER; a_data: POINTER): INTEGER_32 is
 		-- gtk_clist_find_row_from_data (node at line 3864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_find_row_from_data"
		}"
		end

	gtk_clist_set_row_height (a_clist: POINTER; a_height: NATURAL_32) is
 		-- gtk_clist_set_row_height (node at line 4107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_row_height"
		}"
		end

	gtk_clist_set_column_min_width (a_clist: POINTER; a_column: INTEGER_32; a_min_width: INTEGER_32) is
 		-- gtk_clist_set_column_min_width (node at line 4478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_min_width"
		}"
		end

	gtk_clist_set_text (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_text: POINTER) is
 		-- gtk_clist_set_text (node at line 4581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_text"
		}"
		end

	gtk_clist_row_is_visible (a_clist: POINTER; a_row: INTEGER_32): INTEGER is
 		-- gtk_clist_row_is_visible (node at line 5438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_row_is_visible"
		}"
		end

	gtk_clist_moveto (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_clist_moveto (node at line 6172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_moveto"
		}"
		end

	gtk_clist_get_cell_type (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32): INTEGER is
 		-- gtk_clist_get_cell_type (node at line 6873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_cell_type"
		}"
		end

	gtk_clist_columns_autosize (a_clist: POINTER): INTEGER_32 is
 		-- gtk_clist_columns_autosize (node at line 7025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_columns_autosize"
		}"
		end

	gtk_clist_set_column_widget (a_clist: POINTER; a_column: INTEGER_32; a_widget: POINTER) is
 		-- gtk_clist_set_column_widget (node at line 7889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_widget"
		}"
		end

	gtk_clist_set_pixtext (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_text: POINTER; a_spacing: CHARACTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_clist_set_pixtext (node at line 7972)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_pixtext"
		}"
		end

	gtk_clist_set_column_max_width (a_clist: POINTER; a_column: INTEGER_32; a_max_width: INTEGER_32) is
 		-- gtk_clist_set_column_max_width (node at line 8020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_max_width"
		}"
		end

	gtk_clist_set_auto_sort (a_clist: POINTER; an_auto_sort: INTEGER_32) is
 		-- gtk_clist_set_auto_sort (node at line 8132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_auto_sort"
		}"
		end

	gtk_clist_get_cell_style (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32): POINTER is
 		-- gtk_clist_get_cell_style (node at line 8166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_cell_style"
		}"
		end

	gtk_clist_clear (a_clist: POINTER) is
 		-- gtk_clist_clear (node at line 8297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_clear"
		}"
		end

	gtk_clist_column_title_active (a_clist: POINTER; a_column: INTEGER_32) is
 		-- gtk_clist_column_title_active (node at line 9551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_column_title_active"
		}"
		end

	gtk_clist_set_pixmap (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_clist_set_pixmap (node at line 9872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_pixmap"
		}"
		end

	gtk_clist_row_move (a_clist: POINTER; a_source_row: INTEGER_32; a_dest_row: INTEGER_32) is
 		-- gtk_clist_row_move (node at line 10674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_row_move"
		}"
		end

	gtk_clist_get_hadjustment (a_clist: POINTER): POINTER is
 		-- gtk_clist_get_hadjustment (node at line 12182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_hadjustment"
		}"
		end

	gtk_clist_get_vadjustment (a_clist: POINTER): POINTER is
 		-- gtk_clist_get_vadjustment (node at line 13089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_vadjustment"
		}"
		end

	gtk_clist_new_with_titles (a_columns: INTEGER_32; a_titles: POINTER): POINTER is
 		-- gtk_clist_new_with_titles (node at line 13383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_new_with_titles"
		}"
		end

	gtk_clist_set_cell_style (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_style: POINTER) is
 		-- gtk_clist_set_cell_style (node at line 13955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_cell_style"
		}"
		end

	gtk_clist_set_sort_column (a_clist: POINTER; a_column: INTEGER_32) is
 		-- gtk_clist_set_sort_column (node at line 14732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_sort_column"
		}"
		end

	gtk_clist_set_shift (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_vertical: INTEGER_32; a_horizontal: INTEGER_32) is
 		-- gtk_clist_set_shift (node at line 15264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_shift"
		}"
		end

	gtk_clist_set_column_auto_resize (a_clist: POINTER; a_column: INTEGER_32; an_auto_resize: INTEGER_32) is
 		-- gtk_clist_set_column_auto_resize (node at line 16301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_auto_resize"
		}"
		end

	gtk_clist_set_background (a_clist: POINTER; a_row: INTEGER_32; a_color: POINTER) is
 		-- gtk_clist_set_background (node at line 16723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_background"
		}"
		end

	gtk_clist_set_column_title (a_clist: POINTER; a_column: INTEGER_32; a_title: POINTER) is
 		-- gtk_clist_set_column_title (node at line 17350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_title"
		}"
		end

	gtk_clist_column_titles_active (a_clist: POINTER) is
 		-- gtk_clist_column_titles_active (node at line 17415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_column_titles_active"
		}"
		end

	gtk_clist_undo_selection (a_clist: POINTER) is
 		-- gtk_clist_undo_selection (node at line 17757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_undo_selection"
		}"
		end

	gtk_clist_set_column_resizeable (a_clist: POINTER; a_column: INTEGER_32; a_resizeable: INTEGER_32) is
 		-- gtk_clist_set_column_resizeable (node at line 18293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_resizeable"
		}"
		end

	gtk_clist_set_foreground (a_clist: POINTER; a_row: INTEGER_32; a_color: POINTER) is
 		-- gtk_clist_set_foreground (node at line 18376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_foreground"
		}"
		end

	gtk_clist_freeze (a_clist: POINTER) is
 		-- gtk_clist_freeze (node at line 18597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_freeze"
		}"
		end

	gtk_clist_column_titles_show (a_clist: POINTER) is
 		-- gtk_clist_column_titles_show (node at line 19657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_column_titles_show"
		}"
		end

	gtk_clist_select_all (a_clist: POINTER) is
 		-- gtk_clist_select_all (node at line 19766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_select_all"
		}"
		end

	gtk_clist_set_selection_mode (a_clist: POINTER; a_mode: INTEGER) is
 		-- gtk_clist_set_selection_mode (node at line 20522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_selection_mode"
		}"
		end

	gtk_clist_set_row_data (a_clist: POINTER; a_row: INTEGER_32; a_data: POINTER) is
 		-- gtk_clist_set_row_data (node at line 20774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_row_data"
		}"
		end

	gtk_clist_get_column_title (a_clist: POINTER; a_column: INTEGER_32): POINTER is
 		-- gtk_clist_get_column_title (node at line 21301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_column_title"
		}"
		end

	gtk_clist_set_vadjustment (a_clist: POINTER; an_adjustment: POINTER) is
 		-- gtk_clist_set_vadjustment (node at line 21465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_vadjustment"
		}"
		end

	gtk_clist_get_row_data (a_clist: POINTER; a_row: INTEGER_32): POINTER is
 		-- gtk_clist_get_row_data (node at line 21837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_row_data"
		}"
		end

	gtk_clist_optimal_column_width (a_clist: POINTER; a_column: INTEGER_32): INTEGER_32 is
 		-- gtk_clist_optimal_column_width (node at line 21952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_optimal_column_width"
		}"
		end

	gtk_clist_set_column_justification (a_clist: POINTER; a_column: INTEGER_32; a_justification: INTEGER) is
 		-- gtk_clist_set_column_justification (node at line 22400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_justification"
		}"
		end

	gtk_clist_append (a_clist: POINTER; a_text: POINTER): INTEGER_32 is
 		-- gtk_clist_append (node at line 23367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_append"
		}"
		end

	gtk_clist_insert (a_clist: POINTER; a_row: INTEGER_32; a_text: POINTER): INTEGER_32 is
 		-- gtk_clist_insert (node at line 23453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_insert"
		}"
		end

	gtk_clist_set_reorderable (a_clist: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_clist_set_reorderable (node at line 24482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_reorderable"
		}"
		end

	gtk_clist_get_pixmap (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_pixmap: POINTER; a_mask: POINTER): INTEGER_32 is
 		-- gtk_clist_get_pixmap (node at line 25081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_pixmap"
		}"
		end

	gtk_clist_set_use_drag_icons (a_clist: POINTER; an_use_icons: INTEGER_32) is
 		-- gtk_clist_set_use_drag_icons (node at line 25191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_use_drag_icons"
		}"
		end

	gtk_clist_get_text (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32; a_text: POINTER): INTEGER_32 is
 		-- gtk_clist_get_text (node at line 25234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_text"
		}"
		end

	gtk_clist_new (a_columns: INTEGER_32): POINTER is
 		-- gtk_clist_new (node at line 25306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_new"
		}"
		end

	gtk_clist_get_selection_info (a_clist: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_row: POINTER; a_column: POINTER): INTEGER_32 is
 		-- gtk_clist_get_selection_info (node at line 26524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_selection_info"
		}"
		end

	gtk_clist_column_titles_passive (a_clist: POINTER) is
 		-- gtk_clist_column_titles_passive (node at line 26623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_column_titles_passive"
		}"
		end

	gtk_clist_unselect_all (a_clist: POINTER) is
 		-- gtk_clist_unselect_all (node at line 26626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_unselect_all"
		}"
		end

	gtk_clist_get_column_widget (a_clist: POINTER; a_column: INTEGER_32): POINTER is
 		-- gtk_clist_get_column_widget (node at line 26878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_column_widget"
		}"
		end

	gtk_clist_sort (a_clist: POINTER) is
 		-- gtk_clist_sort (node at line 30291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_sort"
		}"
		end

	gtk_clist_set_row_data_full (a_clist: POINTER; a_row: INTEGER_32; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_clist_set_row_data_full (node at line 30801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_row_data_full"
		}"
		end

	gtk_clist_set_compare_func (a_clist: POINTER; a_cmp_func: POINTER) is
 		-- gtk_clist_set_compare_func (node at line 31511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_compare_func"
		}"
		end

	gtk_clist_swap_rows (a_clist: POINTER; a_row1: INTEGER_32; a_row2: INTEGER_32) is
 		-- gtk_clist_swap_rows (node at line 31749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_swap_rows"
		}"
		end

	gtk_clist_select_row (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32) is
 		-- gtk_clist_select_row (node at line 32132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_select_row"
		}"
		end

	gtk_clist_get_selectable (a_clist: POINTER; a_row: INTEGER_32): INTEGER_32 is
 		-- gtk_clist_get_selectable (node at line 32381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_selectable"
		}"
		end

	gtk_clist_unselect_row (a_clist: POINTER; a_row: INTEGER_32; a_column: INTEGER_32) is
 		-- gtk_clist_unselect_row (node at line 32811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_unselect_row"
		}"
		end

	gtk_clist_set_column_width (a_clist: POINTER; a_column: INTEGER_32; a_width: INTEGER_32) is
 		-- gtk_clist_set_column_width (node at line 33093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_width"
		}"
		end

	gtk_clist_thaw (a_clist: POINTER) is
 		-- gtk_clist_thaw (node at line 33491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_thaw"
		}"
		end

	gtk_clist_remove (a_clist: POINTER; a_row: INTEGER_32) is
 		-- gtk_clist_remove (node at line 33889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_remove"
		}"
		end

	gtk_clist_set_shadow_type (a_clist: POINTER; a_type: INTEGER) is
 		-- gtk_clist_set_shadow_type (node at line 34257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_shadow_type"
		}"
		end

	gtk_clist_get_row_style (a_clist: POINTER; a_row: INTEGER_32): POINTER is
 		-- gtk_clist_get_row_style (node at line 34541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_get_row_style"
		}"
		end

	gtk_clist_set_button_actions (a_clist: POINTER; a_button: NATURAL_32; a_button_actions: CHARACTER) is
 		-- gtk_clist_set_button_actions (node at line 35632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_button_actions"
		}"
		end

	gtk_clist_set_sort_type (a_clist: POINTER; a_sort_type: INTEGER) is
 		-- gtk_clist_set_sort_type (node at line 35737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_sort_type"
		}"
		end

	gtk_clist_set_hadjustment (a_clist: POINTER; an_adjustment: POINTER) is
 		-- gtk_clist_set_hadjustment (node at line 35976)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_hadjustment"
		}"
		end

	gtk_clist_prepend (a_clist: POINTER; a_text: POINTER): INTEGER_32 is
 		-- gtk_clist_prepend (node at line 36387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_prepend"
		}"
		end

	gtk_clist_set_column_visibility (a_clist: POINTER; a_column: INTEGER_32; a_visible: INTEGER_32) is
 		-- gtk_clist_set_column_visibility (node at line 36732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_column_visibility"
		}"
		end

	gtk_clist_column_title_passive (a_clist: POINTER; a_column: INTEGER_32) is
 		-- gtk_clist_column_title_passive (node at line 36737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_column_title_passive"
		}"
		end

	gtk_clist_set_selectable (a_clist: POINTER; a_row: INTEGER_32; a_selectable: INTEGER_32) is
 		-- gtk_clist_set_selectable (node at line 37270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_set_selectable"
		}"
		end


end -- class GTKCLIST_EXTERNALS
