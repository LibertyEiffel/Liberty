-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCTREE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_ctree_new (a_columns: INTEGER_32; a_tree_column: INTEGER_32): POINTER is
 		-- gtk_ctree_new (node at line 538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_new"
		}"
		end

	gtk_ctree_collapse_to_depth (a_ctree: POINTER; a_node: POINTER; a_depth: INTEGER_32) is
 		-- gtk_ctree_collapse_to_depth (node at line 1278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_collapse_to_depth"
		}"
		end

	gtk_ctree_find_node_ptr (a_ctree: POINTER; a_ctree_row: POINTER): POINTER is
 		-- gtk_ctree_find_node_ptr (node at line 1489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_find_node_ptr"
		}"
		end

	gtk_ctree_node_set_shift (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_vertical: INTEGER_32; a_horizontal: INTEGER_32) is
 		-- gtk_ctree_node_set_shift (node at line 1716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_shift"
		}"
		end

	gtk_ctree_insert_gnode (a_ctree: POINTER; a_parent: POINTER; a_sibling: POINTER; a_gnode: POINTER; a_func: POINTER; a_data: POINTER): POINTER is
 		-- gtk_ctree_insert_gnode (node at line 1806)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_insert_gnode"
		}"
		end

	gtk_ctree_is_viewable (a_ctree: POINTER; a_node: POINTER): INTEGER_32 is
 		-- gtk_ctree_is_viewable (node at line 1875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_is_viewable"
		}"
		end

	gtk_ctree_find_by_row_data_custom (a_ctree: POINTER; a_node: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- gtk_ctree_find_by_row_data_custom (node at line 3010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_find_by_row_data_custom"
		}"
		end

	gtk_ctree_real_select_recursive (a_ctree: POINTER; a_node: POINTER; a_state: INTEGER_32) is
 		-- gtk_ctree_real_select_recursive (node at line 3336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_real_select_recursive"
		}"
		end

	gtk_ctree_move (a_ctree: POINTER; a_node: POINTER; a_new_parent: POINTER; a_new_sibling: POINTER) is
 		-- gtk_ctree_move (node at line 3868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_move"
		}"
		end

	gtk_ctree_last (a_ctree: POINTER; a_node: POINTER): POINTER is
 		-- gtk_ctree_last (node at line 5369)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_last"
		}"
		end

	gtk_ctree_expand_recursive (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_expand_recursive (node at line 6989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_expand_recursive"
		}"
		end

	gtk_ctree_node_get_pixtext (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_text: POINTER; a_spacing: POINTER; a_pixmap: POINTER; a_mask: POINTER): INTEGER_32 is
 		-- gtk_ctree_node_get_pixtext (node at line 7121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_pixtext"
		}"
		end

	gtk_ctree_collapse (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_collapse (node at line 7899)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_collapse"
		}"
		end

	gtk_ctree_expand_to_depth (a_ctree: POINTER; a_node: POINTER; a_depth: INTEGER_32) is
 		-- gtk_ctree_expand_to_depth (node at line 8102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_expand_to_depth"
		}"
		end

	gtk_ctree_sort_recursive (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_sort_recursive (node at line 8859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_sort_recursive"
		}"
		end

	gtk_ctree_set_show_stub (a_ctree: POINTER; a_show_stub: INTEGER_32) is
 		-- gtk_ctree_set_show_stub (node at line 9664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_show_stub"
		}"
		end

	gtk_ctree_node_set_row_data (a_ctree: POINTER; a_node: POINTER; a_data: POINTER) is
 		-- gtk_ctree_node_set_row_data (node at line 10725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_row_data"
		}"
		end

	gtk_ctree_post_recursive (a_ctree: POINTER; a_node: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_ctree_post_recursive (node at line 10910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_post_recursive"
		}"
		end

	gtk_ctree_set_indent (a_ctree: POINTER; an_indent: INTEGER_32) is
 		-- gtk_ctree_set_indent (node at line 11407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_indent"
		}"
		end

	gtk_ctree_node_moveto (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_row_align: REAL_32; a_col_align: REAL_32) is
 		-- gtk_ctree_node_moveto (node at line 11569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_moveto"
		}"
		end

	gtk_ctree_select (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_select (node at line 12813)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_select"
		}"
		end

	gtk_ctree_node_is_visible (a_ctree: POINTER; a_node: POINTER): INTEGER is
 		-- gtk_ctree_node_is_visible (node at line 12908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_is_visible"
		}"
		end

	gtk_ctree_node_set_row_data_full (a_ctree: POINTER; a_node: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_ctree_node_set_row_data_full (node at line 13176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_row_data_full"
		}"
		end

	gtk_ctree_sort_node (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_sort_node (node at line 13593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_sort_node"
		}"
		end

	gtk_ctree_collapse_recursive (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_collapse_recursive (node at line 13600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_collapse_recursive"
		}"
		end

	gtk_ctree_node_set_pixtext (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_text: POINTER; a_spacing: CHARACTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_ctree_node_set_pixtext (node at line 13657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_pixtext"
		}"
		end

	gtk_ctree_post_recursive_to_depth (a_ctree: POINTER; a_node: POINTER; a_depth: INTEGER_32; a_func: POINTER; a_data: POINTER) is
 		-- gtk_ctree_post_recursive_to_depth (node at line 13856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_post_recursive_to_depth"
		}"
		end

	gtk_ctree_node_set_selectable (a_ctree: POINTER; a_node: POINTER; a_selectable: INTEGER_32) is
 		-- gtk_ctree_node_set_selectable (node at line 14058)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_selectable"
		}"
		end

	gtk_ctree_toggle_expansion (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_toggle_expansion (node at line 15354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_toggle_expansion"
		}"
		end

	gtk_ctree_node_set_pixmap (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_ctree_node_set_pixmap (node at line 15797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_pixmap"
		}"
		end

	gtk_ctree_node_get_row_style (a_ctree: POINTER; a_node: POINTER): POINTER is
 		-- gtk_ctree_node_get_row_style (node at line 15973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_row_style"
		}"
		end

	gtk_ctree_insert_node (a_ctree: POINTER; a_parent: POINTER; a_sibling: POINTER; a_text: POINTER; a_spacing: CHARACTER; a_pixmap_closed: POINTER; a_mask_closed: POINTER; a_pixmap_opened: POINTER; a_mask_opened: POINTER; an_is_leaf: INTEGER_32; an_expanded_external: INTEGER_32): POINTER is
 		-- gtk_ctree_insert_node (node at line 16535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_insert_node"
		}"
		end

	gtk_ctree_node_get_text (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_text: POINTER): INTEGER_32 is
 		-- gtk_ctree_node_get_text (node at line 16590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_text"
		}"
		end

	gtk_ctree_set_expander_style (a_ctree: POINTER; an_expander_style: INTEGER) is
 		-- gtk_ctree_set_expander_style (node at line 18052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_expander_style"
		}"
		end

	gtk_ctree_find (a_ctree: POINTER; a_node: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_ctree_find (node at line 18282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_find"
		}"
		end

	gtk_ctree_node_set_row_style (a_ctree: POINTER; a_node: POINTER; a_style: POINTER) is
 		-- gtk_ctree_node_set_row_style (node at line 19910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_row_style"
		}"
		end

	gtk_ctree_set_drag_compare_func (a_ctree: POINTER; a_cmp_func: POINTER) is
 		-- gtk_ctree_set_drag_compare_func (node at line 22126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_drag_compare_func"
		}"
		end

	gtk_ctree_set_line_style (a_ctree: POINTER; a_line_style: INTEGER) is
 		-- gtk_ctree_set_line_style (node at line 22668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_line_style"
		}"
		end

	gtk_ctree_pre_recursive (a_ctree: POINTER; a_node: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_ctree_pre_recursive (node at line 24535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_pre_recursive"
		}"
		end

	gtk_ctree_get_type: NATURAL_32 is
 		-- gtk_ctree_get_type (node at line 24861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_get_type()"
		}"
		end

	gtk_ctree_remove_node (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_remove_node (node at line 24943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_remove_node"
		}"
		end

	gtk_ctree_node_get_cell_type (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32): INTEGER is
 		-- gtk_ctree_node_get_cell_type (node at line 25008)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_cell_type"
		}"
		end

	gtk_ctree_node_get_cell_style (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32): POINTER is
 		-- gtk_ctree_node_get_cell_style (node at line 26053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_cell_style"
		}"
		end

	gtk_ctree_find_all_by_row_data (a_ctree: POINTER; a_node: POINTER; a_data: POINTER): POINTER is
 		-- gtk_ctree_find_all_by_row_data (node at line 26376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_find_all_by_row_data"
		}"
		end

	gtk_ctree_new_with_titles (a_columns: INTEGER_32; a_tree_column: INTEGER_32; a_titles: POINTER): POINTER is
 		-- gtk_ctree_new_with_titles (node at line 26670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_new_with_titles"
		}"
		end

	gtk_ctree_node_nth (a_ctree: POINTER; a_row: NATURAL_32): POINTER is
 		-- gtk_ctree_node_nth (node at line 27444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_nth"
		}"
		end

	gtk_ctree_node_set_cell_style (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_style: POINTER) is
 		-- gtk_ctree_node_set_cell_style (node at line 27947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_cell_style"
		}"
		end

	gtk_ctree_expand (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_expand (node at line 28575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_expand"
		}"
		end

	gtk_ctree_node_get_selectable (a_ctree: POINTER; a_node: POINTER): INTEGER_32 is
 		-- gtk_ctree_node_get_selectable (node at line 29113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_selectable"
		}"
		end

	gtk_ctree_unselect (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_unselect (node at line 29608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_unselect"
		}"
		end

	gtk_ctree_get_node_info (a_ctree: POINTER; a_node: POINTER; a_text: POINTER; a_spacing: POINTER; a_pixmap_closed: POINTER; a_mask_closed: POINTER; a_pixmap_opened: POINTER; a_mask_opened: POINTER; an_is_leaf: POINTER; an_expanded_external: POINTER): INTEGER_32 is
 		-- gtk_ctree_get_node_info (node at line 29813)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_get_node_info"
		}"
		end

	gtk_ctree_node_get_type: NATURAL_32 is
 		-- gtk_ctree_node_get_type (node at line 29888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_type()"
		}"
		end

	gtk_ctree_set_spacing (a_ctree: POINTER; a_spacing: INTEGER_32) is
 		-- gtk_ctree_set_spacing (node at line 30197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_spacing"
		}"
		end

	gtk_ctree_is_ancestor (a_ctree: POINTER; a_node: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_ctree_is_ancestor (node at line 30532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_is_ancestor"
		}"
		end

	gtk_ctree_node_get_pixmap (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_pixmap: POINTER; a_mask: POINTER): INTEGER_32 is
 		-- gtk_ctree_node_get_pixmap (node at line 30811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_pixmap"
		}"
		end

	gtk_ctree_find_by_row_data (a_ctree: POINTER; a_node: POINTER; a_data: POINTER): POINTER is
 		-- gtk_ctree_find_by_row_data (node at line 31568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_find_by_row_data"
		}"
		end

	gtk_ctree_find_all_by_row_data_custom (a_ctree: POINTER; a_node: POINTER; a_data: POINTER; a_func: POINTER): POINTER is
 		-- gtk_ctree_find_all_by_row_data_custom (node at line 32031)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_find_all_by_row_data_custom"
		}"
		end

	gtk_ctree_select_recursive (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_select_recursive (node at line 33285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_select_recursive"
		}"
		end

	gtk_ctree_node_set_text (a_ctree: POINTER; a_node: POINTER; a_column: INTEGER_32; a_text: POINTER) is
 		-- gtk_ctree_node_set_text (node at line 33356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_text"
		}"
		end

	gtk_ctree_set_node_info (a_ctree: POINTER; a_node: POINTER; a_text: POINTER; a_spacing: CHARACTER; a_pixmap_closed: POINTER; a_mask_closed: POINTER; a_pixmap_opened: POINTER; a_mask_opened: POINTER; an_is_leaf: INTEGER_32; an_expanded_external: INTEGER_32) is
 		-- gtk_ctree_set_node_info (node at line 33494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_set_node_info"
		}"
		end

	gtk_ctree_pre_recursive_to_depth (a_ctree: POINTER; a_node: POINTER; a_depth: INTEGER_32; a_func: POINTER; a_data: POINTER) is
 		-- gtk_ctree_pre_recursive_to_depth (node at line 33616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_pre_recursive_to_depth"
		}"
		end

	gtk_ctree_node_set_background (a_ctree: POINTER; a_node: POINTER; a_color: POINTER) is
 		-- gtk_ctree_node_set_background (node at line 33936)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_background"
		}"
		end

	gtk_ctree_export_to_gnode (a_ctree: POINTER; a_parent: POINTER; a_sibling: POINTER; a_node: POINTER; a_func: POINTER; a_data: POINTER): POINTER is
 		-- gtk_ctree_export_to_gnode (node at line 34308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_export_to_gnode"
		}"
		end

	gtk_ctree_toggle_expansion_recursive (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_toggle_expansion_recursive (node at line 35030)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_toggle_expansion_recursive"
		}"
		end

	gtk_ctree_node_set_foreground (a_ctree: POINTER; a_node: POINTER; a_color: POINTER) is
 		-- gtk_ctree_node_set_foreground (node at line 35461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_set_foreground"
		}"
		end

	gtk_ctree_node_get_row_data (a_ctree: POINTER; a_node: POINTER): POINTER is
 		-- gtk_ctree_node_get_row_data (node at line 35955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_node_get_row_data"
		}"
		end

	gtk_ctree_unselect_recursive (a_ctree: POINTER; a_node: POINTER) is
 		-- gtk_ctree_unselect_recursive (node at line 36755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_unselect_recursive"
		}"
		end

	gtk_ctree_is_hot_spot (a_ctree: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gtk_ctree_is_hot_spot (node at line 37427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ctree_is_hot_spot"
		}"
		end


end -- class GTKCTREE_EXTERNALS
