note
	description: "External calls for GTK_LIST_STORE."
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

deferred class GTK_LIST_STORE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {}
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkListStore)"
		end

	-- unwrappable since variadic GtkListStore* gtk_list_store_new (gint n_columns, ...);
	
	gtk_list_store_newv (n_columns: INTEGER; types: POINTER): POINTER is -- GtkListStore*
		external "C use <gtk/gtk.h>"
		end
	gtk_list_store_set_column_types (a_gtk_list_store: POINTER; n_columns: INTEGER; some_gtypes: NATIVE_ARRAY[INTEGER])
		external "C use <gtk/gtk.h>"
		end

	-- unwrappable since variadic gtk_list_store_set (a_gtk_list_store: POINTER, GtkTreeIter *iter, ...) is
		
	-- unwrappable since variadic gtk_list_store_set_valist (a_gtk_list_store, a_gtktreeiter: POINTER; a_va_list: POINTER) is
		
	gtk_list_store_set_value (a_gtk_list_store, a_gtktreeiter: POINTER; a_column: INTEGER; a_gvalue: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_remove (a_gtk_list_store, a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_insert (a_gtk_list_store, a_gtktreeiter: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_insert_before (a_gtk_list_store, a_gtktreeiter, a_sibling_iter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_insert_after (a_gtk_list_store, a_gtktreeiter, a_sibling_iter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	-- unwrappable since variadic gtk_list_store_insert_with_values (a_gtk_list_store, a_gtktreeiter: POINTER, a_position: INTEGER, ...) is

	gtk_list_store_insert_with_valuesv (a_gtk_list_store, a_gtktreeiter: POINTER; a_position: INTEGER; some_columns, some_gvalues: POINTER;  n_values: INTEGER)
		-- Note some_columns was a NATIVE_ARRAY[INTEGER] and some_gvalues a NATIVE_ARRAY[POINTER];
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_prepend (a_gtk_list_store, a_gtktreeiter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_append (a_gtk_list_store, a_gtktreeiter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_clear (a_gtk_list_store: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_iter_is_valid (a_gtk_list_store, a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_reorder (a_gtk_list_store: POINTER; a_new_order: POINTER)
			-- Note: a_new_order was NATIVE_ARRAY[INTEGER]
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_swap (a_gtk_list_store, an_gtktreeiter, another_gtktreeiter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_move_before (a_gtk_list_store, an_gtktreeiter, a_position: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_move_after (a_gtk_list_store, an_gtktreeiter, a_position: POINTER)
		external "C use <gtk/gtk.h>"
		end
end
