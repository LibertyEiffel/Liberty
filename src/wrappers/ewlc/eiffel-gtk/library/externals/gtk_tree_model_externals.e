note
	description: "External calls for GTK_TREE_MODEL, the tree interface used by GtkTreeView"
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

deferred class GTK_TREE_MODEL_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	-- gboolean (*GtkTreeModelForeachFunc) (GtkTreeModel *model,
	--                                              GtkTreePath *path,
	--                                              GtkTreeIter *iter,
	--                                              gpointer data) is
	--                                              -- external "C use
	--                                              <gtk/gtk.h>" -- end
	
	-- enum        GtkTreeModelFlags;

	gtk_tree_path_new: POINTER  is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_new_from_string (a_path: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	-- GtkTreePath* gtk_tree_path_new_from_indices (gint first_index,
	--                                              ...) is
	-- variadic, hence unwrappable
	-- external "C use <gtk/gtk.h>"
	-- end

	gtk_tree_path_to_string (a_path: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_new_first: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_append_index (a_path: POINTER; an_index: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_prepend_index (a_gtk_tree_path: POINTER; an_index: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_get_depth (a_gtk_tree_path: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_get_indices (a_gtk_tree_path: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_free (a_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_copy (a_gtk_tree_path: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_compare (a_gtktreepath, another_gtktreepath: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_next (a_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_prev (a_gtk_tree_path: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_up (a_gtk_tree_path: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_down (a_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_is_ancestor (a_gtk_tree_path, another_gtktreepath: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_path_is_descendant (a_gtk_tree_path, another_gtktreepath: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_new (a_gtktreemodel, a_gtk_tree_path: POINTER): POINTER is -- GtkTreeRowReference*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_new_proxy (a_gobject, a_gtktreemodel, a_gtk_tree_path: POINTER): POINTER is -- GtkTreeRowReference*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_get_model (a_gtktreerowreference: POINTER): POINTER is -- GtkTreeModel*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_get_path (a_gtktreerowreference: POINTER): POINTER is -- GtkTreePath*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_valid (a_gtktreerowreference: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_free (a_gtktreerowreference: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_copy (a_gtktreerowreference: POINTER): POINTER is -- GtkTreeRowReference*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_inserted (a_gobject, a_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_deleted (a_gobject, a_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_row_reference_reordered (a_gobject, a_gtk_tree_path, a_gtktreeiter, a_gint_ptr: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_flags (a_gtktreemodel: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
			-- ensure is_gtk_tree_model_flags (result)
		end

	gtk_tree_model_get_n_columns (a_gtktreemodel: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_column_type (a_gtktreemodel: POINTER;an_index: INTEGER): INTEGER is -- GType
		external "C use <gtk/gtk.h>"
	end

	gtk_tree_model_get_iter (a_gtktreemodel, a_gtktreeiter, a_gtk_tree_path: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_iter_from_string (a_gtktreemodel, a_gtktreeiter, a_gchar: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_iter_first (a_gtktreemodel, a_gtktreeiter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_path (a_gtktreemodel, a_gtktreeiter: POINTER): POINTER is -- GtkTreePath*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_value (a_gtktreemodel, a_gtktreeiter: POINTER; a_column: INTEGER; a_gvalue: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_iter_next (a_gtktreemodel, a_gtktreeiter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_iter_children (a_gtktreemodel, a_gtk_tree_iter, a_parent_gtk_tree_iter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
	end

	gtk_tree_model_iter_has_child (a_gtktreemodel, a_gtktreeiter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_iter_n_children (a_gtktreemodel, a_gtktreeiter: POINTER): INTEGER is
	external "C use <gtk/gtk.h>"
	end

	gtk_tree_model_iter_nth_child (a_gtktreemodel, a_gtktreeiter, a_parent_gtktreeiter: POINTER; an_index: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_iter_parent (a_gtktreemodel, a_gtktreeiter, a_child_gtktreeiter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_get_string_from_iter (a_gtktreemodel, a_gtktreeiter: POINTER): POINTER is -- gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_ref_node (a_gtktreemodel, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_unref_node (a_gtktreemodel, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	-- gtk_tree_model_get (a_GtkTreeModel: POINTER, a_gtktreeiter: POINTER, ...) is
	-- unwrappable since variadic
	-- external "C use <gtk/gtk.h>"
	-- end

	-- gtk_tree_model_get_valist (a_GtkTreeModel: POINTER, a_gtktreeiter: POINTER, va_list var_args) is
	-- unwrappable since it is not possible to build a va_list in a portable (at C level) way
	-- external "C use <gtk/gtk.h>"
	-- end

	gtk_tree_model_foreach (a_gtktreemodel, a_gtktreemodelforeachfunc, a_gpointer_user_data: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_row_changed (a_gtktreemodel, a_gtk_tree_path, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_row_inserted (a_gtktreemodel, a_gtk_tree_path, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_row_has_child_toggled (a_gtktreemodel, a_gtk_tree_path, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_row_deleted (a_gtktreemodel, a_gtk_tree_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_rows_reordered (a_gtktreemodel, a_gtk_tree_path, a_gtktreeiter: POINTER; a_gint_new_order: POINTER) is
		external "C use <gtk/gtk.h>"
	end


	-- Signals

	-- "row-changed"
	-- void        user_function      (GtkTreeModel *treemodel,
	--                                             GtkTreePath  *arg1,
	--                                             GtkTreeIter  *arg2,
	--                                             gpointer      user_data)      : Run last
	-- "row-deleted"
	--             void        user_function      (GtkTreeModel *treemodel,
	--                                             GtkTreePath  *arg1,
	--                                             gpointer      user_data)      : Run first
	-- "row-has-child-toggled"
	--             void        user_function      (GtkTreeModel *treemodel,
	--                                             GtkTreePath  *arg1,
	--                                             GtkTreeIter  *arg2,
	--                                             gpointer      user_data)      : Run last
	-- "row-inserted"
	--             void        user_function      (GtkTreeModel *treemodel,
	--                                             GtkTreePath  *arg1,
	--                                             GtkTreeIter  *arg2,
	--                                             gpointer      user_data)      : Run first
	-- "rows-reordered"
	--             void        user_function      (GtkTreeModel *treemodel,
	--                                             GtkTreePath  *arg1,
	--                                             GtkTreeIter  *arg2,
	--                                             gpointer      arg3,
	--                                             gpointer      user_data)      : Run first
end
