note
	description: "External calls for GTK_TREE_VIEW_COLUMN"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_VIEW_COLUMN_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	-- void (*GtkTreeCellDataFunc) (GtkTreeViewColumn *tree_column,
	--                                    GtkCellRenderer *cell,
	--                                    GtkTreeModel *tree_model,
	--                                    GtkTreeIter *iter, gpointer
	--                                    data);

	gtk_tree_view_column_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	-- Unwrappable since variadic GtkTreeViewColumn*
	-- gtk_tree_view_column_new_with_attributes (const gchar *title,
	-- GtkCellRenderer *cell, ...)

	gtk_tree_view_column_pack_start (a_tree_column,a_cell: POINTER; expand_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_pack_end (a_tree_column,a_cell: POINTER; expand_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_clear (a_tree_column: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_cell_renderers (a_tree_column: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_add_attribute (a_tree_column, a_cell_renderer, an_attribute: POINTER; a_column:INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	-- variadic: unwrapped void gtk_tree_view_column_set_attributes (a_tree_column: POINTER, GtkCellRenderer *cell_renderer, ...) is

	gtk_tree_view_column_set_cell_data_func (a_tree_column, a_cell_renderer, a_gtktreecelldatafunc, func_data, a_gtkdestroynotify: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_clear_attributes (a_tree_column, a_cell_renderer: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_spacing (a_tree_column: POINTER; a_spacing: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_spacing (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_visible (a_tree_column: POINTER; visible_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_visible (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_resizable (a_tree_column: POINTER; resizable_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_resizable (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_sizing (a_tree_column: POINTER; a_gtktreeviewcolumnsizing: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_sizing (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_width (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_fixed_width (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_fixed_width (a_tree_column: POINTER; a_fixed_width: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_min_width (a_tree_column: POINTER; a_min_width: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_min_width (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_max_width (a_tree_column: POINTER; a_max_width: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_max_width (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_clicked (a_tree_column: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_title (a_tree_column, a_title: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_title (a_tree_column: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_expand (a_tree_column: POINTER; a_expand: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_expand (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_clickable (a_tree_column: POINTER; a_clickable: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_clickable (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_widget (a_tree_column, a_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_widget (a_tree_column: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_alignment (a_tree_column: POINTER; xalign: REAL_32)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_view_column_get_alignment (a_tree_column: POINTER): REAL_32
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_reorderable (a_tree_column: POINTER; a_reorderable: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_reorderable (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_sort_column_id (a_tree_column: POINTER; a_sort_column_id: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_sort_column_id (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_sort_indicator (a_tree_column: POINTER; a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_sort_indicator (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_set_sort_order (a_tree_column: POINTER; a_gtksorttype: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_get_sort_order (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_cell_set_cell_data (a_tree_column, a_gtktreemodel, a_gtktreeiter: POINTER; expander_bool, expanded_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_cell_get_size (a_tree_column, a_gdkrectangle, an_x_offset, an_y_offset, a_width, an_height: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_cell_get_position (a_tree_column, a_gtkcellrenderer, a_start_pos, a_width: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_cell_is_visible (a_tree_column: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_focus_cell (a_tree_column, a_gtkcellrenderer: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_view_column_queue_resize (a_tree_column: POINTER)
		external "C use <gtk/gtk.h>"
		end
end



