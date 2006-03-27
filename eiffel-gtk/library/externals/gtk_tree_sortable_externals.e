indexing
	description: "External calls for GTK_TREE_SORTABLE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_SORTABLE_EXTERNALS
feature {NONE} -- External calls

	--             GtkTreeSortable;
	--             GtkTreeSortableIface;
	-- gint        (*GtkTreeIterCompareFunc)       (GtkTreeModel *model,
	--                                              GtkTreeIter *a,
	--                                              GtkTreeIter *b,
	--                                              gpointer user_data);
	
	gtk_tree_sortable_sort_column_changed (a_gtktreesortable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_sortable_get_sort_column_id (a_gtktreesortable, gint_sort_column_id, a_gtksorttype_order: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_set_sort_column_id (a_gtktreesortable: POINTER; a_sort_column_id: INTEGER;
													  an_order: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_set_sort_func (a_gtktreesortable: POINTER;
												a_sort_column_id: INTEGER;
												a_gtktreeitercomparefunc, user_data a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_set_default_sort_func (a_gtktreesortable, a_gtktreeitercomparefunc, user_data, a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_sortable_has_default_sort_func (a_gtktreesortable: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end



end
