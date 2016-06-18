note
	description: "GtkListStore -- A list-like data structure that can be used with the GtkTreeView."
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

class GTK_LIST_STORE
	-- The GtkListStore object is a list model for use with a
	-- GtkTreeView widget. It implements the GtkTreeModel interface,
	-- and consequentialy, can use all of the methods available
	-- there. It also implements the GtkTreeSortable interface so it
	-- can be sorted by the view. Finally, it also implements the tree
	-- drag and drop interfaces.

	-- The GtkListStore can accept most GObject types as a column type,
	-- though it can't accept all custom types. Internally, it will
	-- keep a copy of data passed in (such as a string or a boxed
	-- pointer). Columns that accept GObjects are handled a little
	-- differently. The GtkListStore will keep a reference to the
	-- object instead of copying the value. As a result, if the object
	-- is modified, it is up to the application writer to call
	-- gtk_tree_model_row_changed to emit the "row_changed"
	-- signal. This most commonly affects lists with GdkPixbufs stored.

	-- Example 5. Creating a simple list store. TODO: Eiffelize this example

	-- enum { COLUMN_STRING, COLUMN_INT, COLUMN_BOOLEAN, N_COLUMNS };

	-- {
	--   GtkListStore *list_store;
	--   GtkTreePath *path;
	--   GtkTreeIter iter;
	--   gint i;
			
	-- list_store = gtk_list_store_new (N_COLUMNS, G_TYPE_STRING,
	--                                    G_TYPE_INT, G_TYPE_BOOLEAN);
			
	--   for (i = 0; i < 10; i++) {
	--       gchar *some_data;
			
	--       some_data = get_some_data (i);
			
	--       /* Add a new row to the model */
	--       gtk_list_store_append (list_store, &iter);
	--       gtk_list_store_set (list_store, &iter,
	--                           COLUMN_STRING, some_data,
	--                           COLUMN_INT, i,
	--                           COLUMN_BOOLEAN,  FALSE,
	--                           -1);
			
	--       /* As the store will keep a copy of the string internally, we
	--        * free some_data.
	--        */
	--       g_free (some_data);
	--     }
			
	--   /* Modify a particular row */
	--   path = gtk_tree_path_new_from_string ("4");
	--   gtk_tree_model_get_iter (GTK_TREE_MODEL (list_store),
	--                            &iter,
	--                            path);
	--   gtk_tree_path_free (path);
	--   gtk_list_store_set (list_store, &iter,
	--                       COLUMN_BOOLEAN, TRUE,
	--                       -1);
	-- }
	
	-- Performance Considerations: Internally, the GtkListStore was
	-- implemented with a linked list with a tail pointer prior to GTK+
	-- 2.6. As a result, it was fast at data insertion and deletion,
	-- and not fast at random data access. The GtkListStore sets the
	-- GTK_TREE_MODEL_ITERS_PERSIST flag, which means that GtkTreeIters
	-- can be cached while the row exists. Thus, if access to a
	-- particular row is needed often and your code is expected to run
	-- on older versions of GTK+, it is worth keeping the iter around.

	--	Note: GTK_LIST_STORE has some features that are deliberately similar to COLLECTION's

inherit
	GTK_TREE_MODEL
	GTK_TREE_SORTABLE
	GTK_TREE_DRAG_SOURCE
	GTK_TREE_DRAG_DEST

insert
	GTK_STORE_SETTERS
	GTK_LIST_STORE_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	make (some_columns: ARRAY[INTEGER])
			-- Creates a new list store. `some_columns' is a list of integers; each
			-- integer is the G_TYPE of an actual column. Note that only types
			-- derived from standard GObject fundamental types are supported.
			
			-- As an example, make (<<g_type_int, g_type_string, gdk_type_pixbuf>>)
			-- will create a new GtkListStore with three columns, of type int,
			-- string and GdkPixbuf respectively.
			
			-- TODO: make this more eiffelish
			
			-- Note: ARRAY seems to be the more general class that fits the
			-- task. Feel free to change it. Paolo 2006-02-22
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_list_store_newv (some_columns.count, some_columns.to_external))
		end

feature {} -- Unwrapped code
	
	-- gtk_list_store_set_column_types ()
	
	-- void gtk_list_store_set_column_types (GtkListStore *list_store, gint
	-- n_columns, GType *types);
	
	-- This function is meant primarily for GObjects that inherit from
	-- GtkListStore, and should only be used when constructing a new
	-- GtkListStore. It will not function after a row has been added, or a method
	-- on the GtkTreeModel interface is called.

	-- list_store : 	A GtkListStore
	-- n_columns : 	Number of columns for the list store
	-- types : 	An array length n of GTypes
	
	-- gtk_list_store_set ()

	-- void gtk_list_store_set (GtkListStore *list_store, GtkTreeIter *iter,
	-- ...);

	-- Sets the value of one or more cells in the row referenced by iter. The
	-- variable argument list should contain integer column numbers, each column
	-- number followed by the value to be set. The list is terminated by a
	-- -1. For example, to set column 0 with type G_TYPE_STRING to "Foo", you
	-- would write gtk_list_store_set (store, iter, 0, "Foo", -1).

	-- list_store : 	a GtkListStore
	-- iter : 	row iterator
	-- ... : 	pairs of column number and value, terminated with -1
	
	-- gtk_list_store_set_valist ()
	
	-- void gtk_list_store_set_valist (GtkListStore *list_store, GtkTreeIter
	-- *iter, va_list var_args);

	-- See gtk_list_store_set(); this version takes a va_list for use by language
	-- bindings.

	-- list_store : 	A GtkListStore
	-- iter : 	A valid GtkTreeIter for the row being modified
	-- var_args : 	va_list of column/value pairs

feature {ANY} -- Generic setter

	set_value (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_value: G_VALUE)
			-- Sets the data in the cell specified by `an_iterator' and
			-- `a_column'. The type of `a_value' must be convertible to the type of
			-- the column.
		
			-- `an_iterator': A valid GtkTreeIter for the row being modified
			-- `a_column' : column number to modify
			-- `a_value' : new value for the cell
		require
			valid_iterator: an_iterator/=Void
			valid_value: a_value /= Void -- and then Eiffelize "The type of
			-- `a_value' must be convertible to the type of the column."
		do
			gtk_list_store_set_value (handle, an_iterator.handle, a_column, a_value.handle)
		end

	is_last_iterator_valid: BOOLEAN
			-- Is the last iterator passed as an argument still valid?

	remove (an_iterator: GTK_TREE_ITER)
			-- Removes the given row from the list store. After being removed,
			-- `an_iterator' is set to be the next valid row, or invalidated if it
			-- pointed to the last row in the list store; in this case
			-- `is_last_iterator_valid' will be False
		require
			valid_iterator: an_iterator/=Void
		do
			is_last_iterator_valid := gtk_list_store_remove (handle,an_iterator.handle).to_boolean
		end

	put (an_iterator: GTK_TREE_ITER; a_position: INTEGER)
			-- Creates a new row at position. iter will be changed to
			-- point to this new row. If position is larger than the
			-- number of rows on the list, then the new row will be
			-- appended to the list. The row will be empty after this
			-- function is called. To fill in values, you need to call
			-- `set' or `set_value'.
		require
			valid_iterator: an_iterator/=Void
		do
			gtk_list_store_insert (handle, an_iterator.handle, a_position)
		end

	put_before, insert_before  (an_iterator, a_sibling: GTK_TREE_ITER)
			-- Inserts a new row before `a_sibling'. `an_iterator' iter will
			-- be changed to point to this new row. The row will be empty
			-- after this function is called. To fill in values, you need
			-- to call gtk_list_store_set() or
			-- gtk_list_store_set_value().
		require
			valid_iterator: an_iterator/=Void
			valid_sibling: a_sibling/=Void
		do
			gtk_list_store_insert_before (handle, an_iterator.handle, a_sibling.handle)
		end

	add_last (an_iterator: GTK_TREE_ITER)
			-- Append the row referred by `an_iterator' to the end of the
			-- list. `an_iterator' will be changed to point to this new
			-- row. The row will be empty after this function is
			-- called. To fill in values, you need to call `set' or
			-- `set_value'.
		require
			valid_iterator: an_iterator/=Void
		do
			gtk_list_store_insert_before (handle, an_iterator.handle, default_pointer)
		end

	put_after, insert_after (an_iterator, a_sibling: GTK_TREE_ITER)
			-- Inserts a new row after `a_sibling'. `an_iterator' iter
			-- will be changed to point to this new row. The row will be
			-- empty after this function is called. To fill in values,
			-- you need to call `set' or `set_value'.
		require
			valid_iterator: an_iterator/=Void
			valid_sibling: a_sibling/=Void
		do
			gtk_list_store_insert_after (handle, an_iterator.handle, a_sibling.handle)
		end

	add_first (an_iterator: GTK_TREE_ITER)
			-- Prepend the row to the beginning of the list. `an_iterator' iter will
			-- be changed to point to this new row. The row will be empty
			-- after this function is called. To fill in values, you need
			-- to call `set' or `set_value'.
		require
			valid_iterator: an_iterator/=Void
		do
			gtk_list_store_insert_after (handle, an_iterator.handle, default_pointer)
		end

	-- Unwrappable: variadic gtk_list_store_insert_with_values ()

	-- void        gtk_list_store_insert_with_values
	--                                             (GtkListStore *list_store,
	--                                              GtkTreeIter *iter,
	--                                              gint position,
	--                                              ...);

	-- Creates a new row at position. iter will be changed to point to
	-- this new row. If position is larger than the number of rows on
	-- the list, then the new row will be appended to the list. The row
	-- will be filled with the values given to this function.

	-- Calling gtk_list_store_insert_with_values(list_store, iter,
	-- position...) has the same effect as calling
	
	-- gtk_list_store_insert (list_store, iter, position);
	-- gtk_list_store_set (list_store_iter, ...);

	-- with the difference that the former will only emit a
	-- row_inserted signal, while the latter will emit row_inserted,
	-- row_changed and, if the list store is sorted,
	-- rows_reordered. Since emitting the rows_reordered signal
	-- repeatedly can affect the performance of the program,
	-- gtk_list_store_insert_with_values() should generally be
	-- preferred when inserting rows in a sorted list store.

	-- list_store : 	A GtkListStore
	-- iter : 	An unset GtkTreeIter to set to the new row
	-- position : 	position to insert the new row
	-- ... : 	pairs of column number and value, terminated with -1

	insert_with_values (an_iterator: GTK_TREE_ITER;
							  a_position: INTEGER;
							  some_columns: ARRAY[INTEGER];
							  some_values: ARRAY[G_VALUE])
			-- Creates a new row at `a_position'. `an_iterator' will be changed to
			-- point to this new row. If position is larger than the number of rows
			-- on the list, then the new row will be appended to the list. The row
			-- will be filled with the values given to this function.
		
			-- `insert_with_values' has the same effect as calling `put' (known as
			-- insert in C) and `set_values' with the difference that the former
			-- will only emit a row_inserted signal, while the latter will emit
			-- row_inserted, row_changed and, if the list store is sorted,
			-- rows_reordered. Since emitting the rows_reordered signal repeatedly
			-- can affect the performance of the program, insert_with_values should
			-- generally be preferred when inserting rows in a sorted list store.

			-- `some_columns' contains the column numbers; each column
			-- will be set with the corresponding value in `some_values'
		require columns_n_equals_values_n: some_columns.count = some_values.count
		do
			-- Uses a variant of gtk_list_store_insert_with_values() which takes
			-- the columns and values as two arrays, instead of varargs. This
			-- function is mainly intended for language-bindings. (PS Paolo: No, I
			-- couldn't believe it!)
			
			-- list_store : 	A GtkListStore
			-- iter : 	An unset GtkTreeIter to set to the new row
			-- position : 	position to insert the new row
			not_yet_implemented
			-- TODO: some_values.to_external is an array of pointers to the Eiffel wrappers!!!
			gtk_list_store_insert_with_valuesv (handle, an_iterator.handle,
												a_position,
												-- gint *columns an array of column numbers
												some_columns.to_external,
												-- GValue *values an array of
												-- GValues
												some_values.to_external,
												-- gint n_values the length of the
												-- columns and values arrays
												some_values.count
												)
		end

	prepend (an_iterator: GTK_TREE_ITER)
			-- Prepends a new row. `an_iterator' will be changed to
			-- point to this new row. The row will be empty after this
			-- function is called. To fill in values, you need to call
			-- `set_values'
		
			-- TODO: C documentation says that `an_iterator` shall be unset. Is it true?
		require valid_iterator: an_iterator/=Void
		do
			gtk_list_store_prepend (handle, an_iterator.handle)
		end

	append  (an_iterator: GTK_TREE_ITER)
			-- Append a new row. `an_iterator' will be changed to point to this new
			-- row. The row will be empty after this function is called. To fill in
			-- values, you need to call `set_values'
		
			-- TODO: C documentation says that `an_iterator` shall be unset. Is it
			-- true?
		require valid_iterator: an_iterator/=Void
		do
			gtk_list_store_append  (handle, an_iterator.handle)
		end

	clear
			-- Removes all rows from the list store.
		do
			gtk_list_store_clear (handle)
		end

	is_iterator_valid (an_iterator: GTK_TREE_ITER): BOOLEAN
			-- Is `an_iterator' valid for Current GtkListStore?
			
			-- Warning: this query is slow. Only use it for debugging
			-- and/or testing purposes.
		require valid_iterator: an_iterator/=Void
		do
			Result:=(gtk_list_store_iter_is_valid(handle,an_iterator.handle)).to_boolean
		end

	reorder (a_new_order: ARRAY[INTEGER])
			-- Reorders store to follow the order indicated by
			-- `a_new_order'. Note that this function only works with
			-- unsorted stores. `a_new_order' is the array of integers
			-- mapping the new position of each child to its old position
			-- before the re-ordering, i.e. a_new_order.item(newpos) =
			-- oldpos.
		require
			unsorted_store: not is_sorted
			valid_order: a_new_order /= Void
		do
			gtk_list_store_reorder (handle, a_new_order.to_external)
		end

	swap (an_iterator, another: GTK_TREE_ITER)
			-- Swaps `an_iterator' and `another' in store. Note that this
			-- function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
			valid_another: another/=Void
		do
			gtk_list_store_swap (handle, an_iterator.handle, another.handle)
		end

	move_before (an_iterator, a_position: GTK_TREE_ITER)
			-- Moves iter in store to the position before position. Note
			-- that this function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
			valid_position: a_position/=Void
		do
			gtk_list_store_move_before (handle,an_iterator.handle, a_position.handle)
		end

	move_last  (an_iterator: GTK_TREE_ITER)
			-- Moves iter in store to the end of the list. Note that this
			-- function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
		do
			gtk_list_store_move_before (handle,an_iterator.handle, default_pointer)
		end

	move_after  (an_iterator, a_position: GTK_TREE_ITER)
			-- Moves iter in store to the position after position. Note
			-- that this function only works with unsorted stores. 
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
			valid_position: a_position/=Void
		do
			gtk_list_store_move_after  (handle,an_iterator.handle, a_position.handle)
		end

	move_first  (an_iterator: GTK_TREE_ITER)
			-- Moves item pointed to by `an_iterator' to the start of the list.
			-- Note that this function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
		do
			gtk_list_store_move_after (handle, an_iterator.handle, default_pointer)
		end

end
