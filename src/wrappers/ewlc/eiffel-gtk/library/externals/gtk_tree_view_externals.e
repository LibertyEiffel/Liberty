note
	description: "External calls for GTK_TREE_VIEW"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
				
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
				
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_VIEW_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	-- gboolean (*GtkTreeViewColumnDropFunc) (GtkTreeView *tree_view,
	-- GtkTreeViewColumn *column, GtkTreeViewColumn *prev_column,
	-- GtkTreeViewColumn *next_column, gpointer data);

	-- void (*GtkTreeViewMappingFunc) (GtkTreeView *tree_view,
	-- GtkTreePath *path, gpointer user_data);

	-- gboolean (*GtkTreeViewSearchEqualFunc) (GtkTreeModel *model,
	-- gint column, const gchar *key, GtkTreeIter *iter, gpointer
	-- search_data);

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
		external "C use <gtk/gtk.h>"
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

	gtk_tree_view_get_headers_visible (a_gtktreeview: POINTER): INTEGER is -- gboolean
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

	gtk_tree_view_get_rules_hint (a_gtktreeview: POINTER): INTEGER is -- gboolean
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

	gtk_tree_view_get_column (a_gtktreeview: POINTER; a_n: INTEGER): POINTER is -- GtkTreeViewColumn
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_columns (a_gtktreeview: POINTER): POINTER is -- GList*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_move_column_after (a_gtktreeview, a_columnb, a_base_column: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_expander_column (a_gtktreeview, a_gtktreeviewcolumn: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_expander_column (a_gtktreeview: POINTER): POINTER is -- GtkTreeViewColumn
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_column_drag_function (a_gtktreeview, a_gtktreeviewcolumndropfunc, user_data, a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_scroll_to_point (a_gtktreeview: POINTER; a_tree_x, a_tree_y: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_scroll_to_cell (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn: POINTER; use_align: INTEGER; a_row_align, a_col_align: REAL_32) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_cursor (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn: POINTER; start_editing_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_cursor_on_cell (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn, a_gtkcellrenderer: POINTER; start_editing_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_cursor (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn_focus: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_row_activated (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_expand_all (a_gtktreeview: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_collapse_all (a_gtktreeview: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_expand_to_path (a_gtktreeview, a_gtktreepath: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_expand_row (a_gtktreeview, a_gtktreepath: POINTER; open_all_bool: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_collapse_row (a_gtktreeview, a_gtktreepath: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_map_expanded_rows (a_gtktreeview, a_gtktreeviewmappingfunc, some_data: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_row_expanded (a_gtktreeview, a_gtktreepath: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_reorderable (a_gtktreeview: POINTER; reorderable_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_reorderable (a_gtktreeview: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_path_at_pos (a_gtktreeview: POINTER; an_x, an_y: INTEGER; a_gtktreepath , a_gtktreeviewcolumn, a_gint_cell_x, a_gint_cell_y: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_cell_area (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn, a_gdkrectangle: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_background_area (a_gtktreeview, a_gtktreepath, a_gtktreeviewcolumn, a_gdkrectangle: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_visible_rect (a_gtktreeview, a_gdkrectangle: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_visible_range (a_gtktreeview, a_start_path, an_end_path: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_bin_window (a_gtktreeview: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_widget_to_tree_coords (a_gtktreeview: POINTER; a_wx, a_wy: INTEGER; a_tx, a_ty: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_tree_to_widget_coords (a_gtktreeview: POINTER; a_tx, a_ty: INTEGER; a_wx,a_wy: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_enable_model_drag_dest (a_gtktreeview, a_gtktargetentry: POINTER; a_n_targets: INTEGER; some_gdkdragaction: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_enable_model_drag_source (a_gtktreeview: POINTER; a_start_button_mask: INTEGER; a_gtktargetentry: POINTER; a_n_targets: INTEGER; some_gdkdragaction: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_unset_rows_drag_source (a_gtktreeview: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_unset_rows_drag_dest (a_gtktreeview: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_drag_dest_row (a_gtktreeview, a_gtktreepath: POINTER; a_gtktreeviewdropposition: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_drag_dest_row (a_gtktreeview, a_gtktreepath: POINTER; a_gtktreeviewdropposition: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_dest_row_at_pos (a_gtktreeview: POINTER; a_drag_x, a_drag_y: INTEGER; a_gtktreepath, a_gtktreeviewdropposition: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_create_row_drag_icon (a_gtktreeview, a_gtktreepath: POINTER): POINTER is -- GdkPixmap*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_enable_search (a_gtktreeview: POINTER; enable_search_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_enable_search (a_gtktreeview: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_search_column (a_gtktreeview: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_search_column (a_gtktreeview: POINTER; a_column: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_search_equal_func (a_gtktreeview: POINTER): POINTER is -- GtkTreeViewSearchEqualFunc
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_search_equal_func (a_gtktreeview, a_gtktreeviewsearchequalfunc, search_user_data, a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_fixed_height_mode (a_gtktreeview: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_fixed_height_mode (a_gtktreeview: POINTER; enable_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_hover_selection (a_gtktreeview: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_hover_selection (a_gtktreeview: POINTER; hover_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_hover_expand (a_gtktreeview: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_hover_expand (a_gtktreeview: POINTER; expand_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_destroy_count_func (a_gtktreeview, a_gtktreedestroycountfunc, some_data, a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_get_row_separator_func (a_gtktreeview: POINTER): POINTER is -- GtkTreeViewRowSeparatorFunc
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_set_row_separator_func (a_gtktreeview, a_gtktreeviewrowseparatorfunc, some_data, a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

end

