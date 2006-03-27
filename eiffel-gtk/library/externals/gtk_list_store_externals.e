indexing
	description: "External calls for GTK_LIST_STORE."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_LIST_STORE_EXTERNALS

feature {NONE} 
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkListStore)"
		end

	-- unwrappable since variadic GtkListStore* gtk_list_store_new (gint n_columns, ...);
	
	gtk_list_store_newv (n_columns: INTEGER, GType *types): POINTER is -- GtkListStore*
		external "C use <gtk/gtk.h>"
		end
	gtk_list_store_set_column_types (a_gtk_list_store: POINTER, n_columns: INTEGER; some_gtypes: NATIVE_ARRAY[INTEGER]) is
		external "C use <gtk/gtk.h>"
		end

	-- unwrappable since variadic gtk_list_store_set (a_gtk_list_store: POINTER, GtkTreeIter *iter, ...) is
		
	-- unwrappable since variadic gtk_list_store_set_valist (a_gtk_list_store, a_gtktreeiter: POINTER; a_va_list: POINTER) is
		
	gtk_list_store_set_value (a_gtk_list_store, a_gtktreeiter: POINTER; a_column: INTEGER; a_gvalue: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_remove (a_gtk_list_store, a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_insert (a_gtk_list_store, a_gtktreeiter: POINTER; a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_insert_before (a_gtk_list_store, a_gtktreeiter, a_sibling_iter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_insert_after (a_gtk_list_store, a_gtktreeiter, a_sibling_iter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	-- unwrappable since variadic gtk_list_store_insert_with_values (a_gtk_list_store, a_gtktreeiter: POINTER, a_position: INTEGER, ...) is

	gtk_list_store_insert_with_valuesv (a_gtk_list_store, a_gtktreeiter: POINTER; a_position: INTEGER; some_columns: NATIVE_ARRAY[INTEGER]; some_gvalues: NATIVE_ARRAY[POINTER];  n_values: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_prepend (a_gtk_list_store, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_append (a_gtk_list_store, a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_clear (a_gtk_list_store: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_iter_is_valid (a_gtk_list_store, a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_reorder (a_gtk_list_store: POINTER; a_new_order: NATIVE_ARRAY[INTEGER]) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_swap (a_gtk_list_store, an_gtktreeiter, another_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_move_before (a_gtk_list_store, an_gtktreeiter, a_position: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_list_store_move_after (a_gtk_list_store, an_gtktreeiter, a_position: POINTER) is
		external "C use <gtk/gtk.h>"
		end
end
