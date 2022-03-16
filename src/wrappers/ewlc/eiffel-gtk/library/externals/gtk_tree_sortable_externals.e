note
	description: "External calls for GTK_TREE_SORTABLE"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_TREE_SORTABLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	--             GtkTreeSortable;
	--             GtkTreeSortableIface;
	-- gint        (*GtkTreeIterCompareFunc)       (GtkTreeModel *model,
	--                                              GtkTreeIter *a,
	--                                              GtkTreeIter *b,
	--                                              gpointer user_data);
	
	gtk_tree_sortable_sort_column_changed (a_gtktreesortable: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_sortable_get_sort_column_id (a_gtktreesortable, gint_sort_column_id, a_gtksorttype_order: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_set_sort_column_id (a_gtktreesortable: POINTER; a_sort_column_id: INTEGER;
													  an_order: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_set_sort_func (a_gtktreesortable: POINTER;
												a_sort_column_id: INTEGER;
												a_gtktreeitercomparefunc, user_data a_gtkdestroynotify: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_set_default_sort_func (a_gtktreesortable, a_gtktreeitercomparefunc, user_data, a_gtkdestroynotify: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_has_default_sort_func (a_gtktreesortable: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end



end
