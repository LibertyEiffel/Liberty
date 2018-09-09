note
	description: "External calls for GTK_TREE_STORE."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_TREE_STORE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {}
	gtk_tree_store_newv (n_columns: INTEGER; types: POINTER): POINTER is -- GtkListStore*
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_set_column_types (store: POINTER; n_columns: INTEGER; some_gtypes: NATIVE_ARRAY[INTEGER])
		external "C use <gtk/gtk.h>"
		end

	-- unwrappable since variadic gtk_tree_store_set (a_gtk_list_store: POINTER, GtkTreeIter *iter, ...) is
		
	-- unwrappable since variadic gtk_tree_store_set_valist (a_gtk_list_store, a_gtktreeiter: POINTER; a_va_list: POINTER) is

	gtk_tree_store_set_value (store, a_iter: POINTER; a_column: INTEGER; a_gvalue: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_remove (store, a_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_insert (store, a_iter, a_parent: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_insert_before (store, a_iter, a_parent, a_sibling: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_insert_after (store, a_iter, a_parent, a_sibling: POINTER)
		external "C use <gtk/gtk.h>"
		end

-- unwrappable since variadic gtk_tree_store_insert_with_values is

	gtk_tree_store_insert_with_valuesv (store, a_iter, a_parent: POINTER; a_position: INTEGER; cols, gvalues: POINTER;  n_values: INTEGER)
		-- This isn't working yet.  some_gvalues receives an array of pointers to wrappers :-/
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_prepend (store, a_iter, a_parent: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_append (store, a_iter, a_parent: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_is_ancestor (store, a_iter, a_descendant: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_iter_depth (store, a_iter: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_clear (store: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_iter_is_valid (store, a_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_reorder (store, a_parent: POINTER; a_new_order: POINTER)
			-- Note: a_new_order was NATIVE_ARRAY[INTEGER]
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_swap (store, a_iter, b_iter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_move_before (store, a_iter, a_position: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_store_move_after (store, a_iter, a_position: POINTER)
		external "C use <gtk/gtk.h>"
		end
end
