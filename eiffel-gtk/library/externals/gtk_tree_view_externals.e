indexing
	description: "External calls for GTK_TREE_VIEW"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_VIEW_EXTERNALS
feature {NONE} -- External calls
--             GtkTreeView;

-- gboolean    (*GtkTreeViewColumnDropFunc)    (GtkTreeView *tree_view, GtkTreeViewColumn *column, GtkTreeViewColumn *prev_column, GtkTreeViewColumn *next_column, gpointer data);
-- void        (*GtkTreeViewMappingFunc)       (GtkTreeView *tree_view, GtkTreePath *path, gpointer user_data);
-- gboolean    (*GtkTreeViewSearchEqualFunc)   (GtkTreeModel *model, gint column, const gchar *key, GtkTreeIter *iter, gpointer search_data);


	gtk_tree_view_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_new_with_model (a_gtktreemodel: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_model (a_gtktreeview: POINTER): POINTER is -- GtkTreeModel*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_set_model (a_gtktreeview, a_gtktreemodel: POINTER) is 
		external "c use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_selection (a_gtktreeview: POINTER): POINTER is -- GtkTreeSelection
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_hadjustment (a_gtktreeview: POINTER): POINTER is -- GtkAdjustment
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_set_hadjustment (a_gtktreeview, a_gtkadjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_vadjustment (a_gtktreeview: POINTER): POINTER is -- GtkAdjustment
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_vadjustment (a_gtktreeview, a_gtkadjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_headers_visible (a_gtktreeview: POINTER): POINTER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_set_headers_visible (a_gtktreeview: POINTER; headers_visible: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_columns_autosize (a_gtktreeview: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_headers_clickable (a_gtktreeview: POINTER;a_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_set_rules_hint (a_gtktreeview: POINTER; a_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_rules_hint (a_GtkTreeView: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_append_column (a_gtktreeview, a_gtktreeviewcolumn: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_remove_column (a_gtktreeview, a_gtktreeviewcolumn: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_insert_column (a_gtktreeview, a_gtktreeviewcolumn: POINTER; a_position: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	-- gtk_tree_view_insert_column_with_attributes (a_GtkTreeView: POINTER, a_position: INTEGER, const a_gchar: POINTER, GtkCellRendrer: POINTER, ...): INTEGER is
	--external "C use <gtk/gtk.h>"
	--		end
	
	-- gtk_tree_view_insert_column_with_data_func (a_GtkTreeView:
	-- POINTER, a_position: INTEGER, const a_gchar: POINTER,
	-- GtkCellRenderer: POINTER, GtkTreeCellDataFunc func, gpointer
	-- data, GDestroyNotify dnotify): INTEGER is
	--external "C use <gtk/gtk.h>"
	--end

	gtk_tree_view_get_column (a_GtkTreeView: POINTER, a_n: INTEGER): POINTER is -- GtkTreeViewColumn
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_columns (a_GtkTreeView: POINTER): POINTER is -- GList*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_move_column_after (a_gtktreeview, a_columnb, a_base_column: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_set_expander_column (a_gtktreeview, a_gtktreeviewcolumn: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_get_expander_column (a_GtkTreeView: POINTER): POINTER is -- GtkTreeViewColumn
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_set_column_drag_function (a_gtktreeview, a_gtktreeviewcolumndropfunc, user_data, a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_scroll_to_point (a_GtkTreeView: POINTER; a_tree_x, a_tree_y: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_scroll_to_cell (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn: POINTER; use_align: INTEGER; a_row_align, a_col_align: REAL_32) is
		external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_cursor (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, a_GtkTreeViewColumn: POINTER, gboolean start_editing) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_cursor_on_cell (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, a_GtkTreeViewColumn: POINTER, GtkCellRend
a_erer: POINTER, gboolean start_editing) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_cursor (a_GtkTreeView: POINTER, GtkTreePath **path, GtkTreeViewColumn **focus_column) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_row_activated (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, a_GtkTreeViewColumn: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_expand_all (a_GtkTreeView: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_collapse_all (a_GtkTreeView: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_expand_to_path (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_expand_row (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, gboolean open_all): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_collapse_row (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_map_expanded_rows (a_GtkTreeView: POINTER, GtkTreeViewMappingFunc func, gpointer data) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_row_expanded (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_reorderable (a_GtkTreeView: POINTER, gboolean reorderable) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_reorderable (a_GtkTreeView: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_path_at_pos (a_GtkTreeView: POINTER, a_x: INTEGER, a_y: INTEGER, GtkTreePath **path, GtkTreeViewColumn **column, a_gint: POINTER, a_gint: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_cell_area (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, a_GtkTreeViewColumn: POINTER, a_GdkRectangle: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_background_area (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, a_GtkTreeViewColumn: POINTER, a_GdkRectangle: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_visible_rect (a_GtkTreeView: POINTER, a_GdkRectangle: POINTER) is
external "C use <gtk/gtk.h>"
end

-- gboolean gtk_tree_view_get_visible_range (a_GtkTreeView: POINTER, GtkTreePath **start_path, GtkTreePath **end
_path) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_bin_window (a_GtkTreeView: POINTER): POINTER is -- gtk_tree_view_get_bin_window (a_GtkTreeView: POINTER)
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_widget_to_tree_coords (a_GtkTreeView: POINTER, a_wx: INTEGER, a_wy: INTEGER, a_gint: POINTER, a_gint: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_tree_to_widget_coords (a_GtkTreeView: POINTER, a_tx: INTEGER, a_ty: INTEGER, a_gint: POINTER, a_gint: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_enable_model_drag_dest (a_GtkTreeView: POINTER, const a_GtkTargetEntry: POINTER, a_n_targets: INTEGER, GdkDragAction actions) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_enable_model_drag_source (a_GtkTreeView: POINTER, GdkModifierType start_button_mask, const a_GtkTargetEntry: POINTER, a_n_targets: INTEGER, GdkDragAction actions) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_unset_rows_drag_source (a_GtkTreeView: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_unset_rows_drag_dest (a_GtkTreeView: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_drag_dest_row (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, GtkTreeViewDropPosition pos) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_drag_dest_row (a_GtkTreeView: POINTER, GtkTreePath **path, a_GtkTreeViewDropPosition: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_dest_row_at_pos (a_GtkTreeView: POINTER, a_drag_x: INTEGER, a_drag_y: INTEGER, GtkTreePath **path, a_GtkTreeViewDropPosition: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

-- GdkPixmap* gtk_tree_view_create_row_drag_icon (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_enable_search (a_GtkTreeView: POINTER, gboolean enable_search) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_enable_search (a_GtkTreeView: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

gtk_tree_view_get_search_column (a_GtkTreeView: POINTER): INTEGER is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_search_column (a_GtkTreeView: POINTER, a_column: INTEGER) is
external "C use <gtk/gtk.h>"
end

-- GtkTreeViewSearchEqualFunc gtk_tree_view_get_search_equal_func (a_GtkTreeView: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_search_equal_func (a_GtkTreeView: POINTER, GtkTreeViewSearchEqualFunc search_equal_func, gpointer search_user_data, GtkDestroyNotify search_destroy) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_fixed_height_mode (a_GtkTreeView: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_fixed_height_mode (a_GtkTreeView: POINTER, gboolean enable) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_hover_selection (a_GtkTreeView: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_hover_selection (a_GtkTreeView: POINTER, gboolean hover) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_get_hover_expand (a_GtkTreeView: POINTER): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_hover_expand (a_GtkTreeView: POINTER, gboolean expand) is
external "C use <gtk/gtk.h>"
end

 (*GtkTreeDestroyCountFunc) (a_GtkTreeView: POINTER, a_GtkTreePath: POINTER, a_children: INTEGER, gpointer user_data) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_destroy_count_func (a_GtkTreeView: POINTER, GtkTreeDestroyCountFunc func, gpointer data, GtkDestroyNotify destroy) is
external "C use <gtk/gtk.h>"
end

 (*GtkTreeViewRowSeparatorFunc) (a_GtkTreeModel: POINTER, a_GtkTreeIter: POINTER, gpointer data): INTEGER is -- gboolean
external "C use <gtk/gtk.h>"
end

-- GtkTreeViewRowSeparatorFunc gtk_tree_view_get_row_separator_func (a_GtkTreeView: POINTER) is
external "C use <gtk/gtk.h>"
end

 gtk_tree_view_set_row_separator_func (a_GtkTreeView: POINTER, GtkTreeViewRowSeparatorFunc func, gpointer data, GtkDestroyNotify destroy) is
external "C use <gtk/gtk.h>"
		end

end

