note
	description: "GtkTreeStore -- A tree-like data structure that can be used with the GtkTreeView."
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

class GTK_TREE_STORE
	-- The GtkTreeStore object is a list model for use with a
	-- GtkTreeView widget. It implements the GtkTreeModel interface,
	-- and consequentialy, can use all of the methods available
	-- there. It also implements the GtkTreeSortable interface so it
	-- can be sorted by the view. Finally, it also implements the tree
	-- drag and drop interfaces.
	
inherit
	GTK_TREE_MODEL 
	GTK_TREE_SORTABLE 
	GTK_TREE_DRAG_SOURCE
	GTK_TREE_DRAG_DEST

insert
	GTK_STORE_SETTERS
	GTK_TREE_STORE_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	make (some_columns: ARRAY[INTEGER])
			-- Creates a new tree store. `some_columns' is an array of integers; each
			-- integer is the G_TYPE of an actual column. Note that only types
			-- derived from standard GObject fundamental types are supported.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_tree_store_newv (some_columns.count, some_columns.to_external))
		end
	
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
			gtk_tree_store_set_value (handle, an_iterator.handle, a_column, a_value.handle)
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
			is_last_iterator_valid := gtk_tree_store_remove (handle,an_iterator.handle).to_boolean
		end

	put (an_iterator, a_parent: GTK_TREE_ITER; a_position: INTEGER)
			-- Creates a new row at position. If `a_parent' is non-NULL, 
			-- then the row will be made a child of parent. Otherwise,
			-- the row will be created at the toplevel. If `a_position' is
			-- larger than the number of rows at that level, then the
			-- new row will be inserted to the end of the list. `iter' will
			-- be changed to point to this new row. The row will be empty
			-- after this function is called. To fill in values, you need
			-- to call some of the set_* methods.
		require
			valid_iterator: an_iterator/=Void
		local
			parent_pointer: POINTER
		do
			if a_parent /= Void then parent_pointer := a_parent.handle end
			gtk_tree_store_insert (handle, an_iterator.handle, a_parent.handle, a_position)
		end

	put_before, insert_before  (an_iterator, a_parent, a_sibling: GTK_TREE_ITER)
			-- Inserts a new row before `a_sibling'. If `a_sibling' is Void,
			-- then the row will be appended to `a_parent''s children. If
			-- `a_parent' and `a_sibling' are Void, then the row will be
			-- appended to the toplevel. If both `a_sibling' and `a_parent'
			-- are set, then `a_parent' must be the parent of `a_sibling'.
			-- When `a_sibling' is set, `a_parent' is optional.
			--
			-- `an_iterator' will be changed to point to this new row.
			-- The row will be empty after this function is called.
			-- To fill in values, you need to call some of the set_* methods.
		require
			valid_iterator: an_iterator /= Void
		local
			parent_pointer, sibling_pointer: POINTER
		do
			if a_parent /= Void then parent_pointer := a_parent.handle end
			if a_sibling /= Void then sibling_pointer := a_sibling.handle end
			gtk_tree_store_insert_before (handle, an_iterator.handle,
										 parent_pointer, sibling_pointer)
		end

	put_after, insert_after (an_iterator, a_parent, a_sibling: GTK_TREE_ITER)
			-- Inserts a new row after `a_sibling'. If `a_sibling' is Void,
			-- then the row will be prepended to `a_parent''s children.
			-- If `a_parent' and `a_sibling' are Void, then the row will
			-- be prepended to the toplevel. If both `a_sibling' and
			-- `a_parent' are set, then `a_parent' must be the parent of
			-- `a_sibling'. When `a_sibling' is set, `a_parent' is optional.
			--
			-- `an_iterator' will be changed to point to this new row.
			-- The row will be empty after this function is called.
			-- To fill in values, you need to call some of the set_* methods.
		require
			valid_iterator: an_iterator /= Void
		local
			parent_pointer, sibling_pointer: POINTER
		do
			if a_parent /= Void then parent_pointer := a_parent.handle end
			if a_sibling /= Void then sibling_pointer := a_sibling.handle end
			gtk_tree_store_insert_after (handle, an_iterator.handle,
										 parent_pointer, sibling_pointer)
		end

	insert_with_values (an_iterator, a_parent: GTK_TREE_ITER;
							  a_position: INTEGER;
							  some_columns: ARRAY[INTEGER];
							  some_values: ARRAY[G_VALUE])
			-- Creates a new row at `a_position'. `an_iterator' will be
			-- changed to point to this new row. If `a_position' is larger
			-- than the number of rows on the list, then the new row will
			-- be appended to the list. The row will be filled with the
			-- values given to this function.

			-- Calling store.insert_with_values (iter, parent, position,
			-- cols, vals) has the same effect as calling

			-- store.put (iter, parent, position)
			-- store.set (iter, cols, vals);

			-- with the difference that the former will only emit a
			-- row_inserted signal, while the latter will emit
			-- row_inserted, row_changed and if the tree store is sorted,
			-- rows_reordered.  Since emitting the rows_reordered signal
			-- repeatedly can affect the performance of the program,
			-- insert_with_values should generally be preferred when
			-- inserting rows in a sorted tree store.

			-- `some_columns' contains the column numbers; each column
			-- will be set with the corresponding value in `some_values'.
		require columns_n_equals_values_n: some_columns.count = some_values.count
		do
			not_yet_implemented
			-- TODO: some_values.to_external is an array of pointers to the Eiffel wrappers!!!
			gtk_tree_store_insert_with_valuesv (handle, an_iterator.handle,
															a_parent.handle,
															a_position,
															-- gint *columns an array of column numbers
															some_columns.to_external,
															-- GValue *values an array of GValues
															some_values.to_external,
															-- gint n_values the length of the
															-- columns and values arrays
															some_values.count
														  )
		end

	add_first, prepend (an_iterator, a_parent: GTK_TREE_ITER)
			-- Prepends a new row to tree store. If `a_parent' is non-Void,
			-- then it will prepend the new row before the first child of
			-- `a_parent', otherwise it will prepend a row to the top
			-- level. `an_iterator' will be changed to point to this new
			-- row. The row will be empty after this function is called.
			-- To fill in values, you need to call some set_* method.
		require valid_iterator: an_iterator /= Void
		local
			parent_pointer: POINTER
		do
			if a_parent /= Void then parent_pointer := a_parent.handle end
			gtk_tree_store_prepend (handle, an_iterator.handle, parent_pointer)
		end

	add_last, append (an_iterator, a_parent: GTK_TREE_ITER)
			-- Appends a new row to tree store. If `a_parent' is non-Void,
			-- then it will append the new row after the last child of
			-- `a_parent', otherwise it will append a row to the top level.
			-- `an_iterator' will be changed to point to this new row. The row will
			-- be empty after this function is called. To fill in values,
			-- you need to call some `set_*' feature
		require iterator_not_void: an_iterator /= Void
		local
			parent_pointer: POINTER
		do
			if a_parent /= Void then parent_pointer := a_parent.handle end
			gtk_tree_store_append  (handle, an_iterator.handle, parent_pointer)
		end

	is_ancestor(an_iterator, a_descendant: GTK_TREE_ITER): BOOLEAN
			-- Returns True if `an_iterator' is an ancestor of `a_descendant'.
			-- That is, `an_iterator' is the parent (or grandparent or
			-- great-grandparent or ...) of `a_descendant).
		require
			valid_iterators: an_iterator /= Void and a_descendant /= Void
		do
			Result := gtk_tree_store_is_ancestor(handle, an_iterator.handle,
								 a_descendant.handle).to_boolean
		end

	iter_depth(an_iterator: GTK_TREE_ITER): INTEGER
			-- Returns the depth of `an_iterator'. This will be 0 for
			-- anything on the root level, 1 for anything down a level, etc.
		require
			valid_iterators: an_iterator /= Void
		do
			Result := gtk_tree_store_iter_depth(handle, an_iterator.handle)
		end

	clear
			-- Removes all rows from the tree store.
		do
			gtk_tree_store_clear (handle)
		end

	is_iterator_valid (an_iterator: GTK_TREE_ITER): BOOLEAN
			-- Is `an_iterator' valid for Current GtkTreeStore?
			--
			-- Warning: this query is slow. Only use it for debugging
			-- and/or testing purposes.
		require
			valid_iterator: an_iterator/=Void
		do
			Result:=(gtk_tree_store_iter_is_valid(handle,an_iterator.handle)).to_boolean
		end

	reorder (a_parent: GTK_TREE_ITER; a_new_order: ARRAY[INTEGER])
			-- Reorders the children of `a_parent' to follow the order
			-- indicated by `a_new_order'. Note that this function only
			-- works with unsorted stores.
			-- `a_new_order' is the array of integers
			-- mapping the new position of each child to its old position
			-- before the re-ordering, i.e. a_new_order.item(newpos) =
			-- oldpos.
		require
			unsorted_store: not is_sorted
			valid_order: a_new_order /= Void
		do
			gtk_tree_store_reorder (handle, a_parent.handle, a_new_order.to_external)
		end

	swap (a, b: GTK_TREE_ITER)
			-- Swaps `a' and `b' in the same level of tree store.
			-- Note that this function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterators: a /= Void and b /= Void
		do
			gtk_tree_store_swap (handle, a.handle, b.handle)
		end

	move_before (an_iterator, a_position: GTK_TREE_ITER)
			-- Moves `an_iterator' in tree store to the position before
			-- `a_position'. `an_iterator' and `a_position' should be in
			-- the same level. Note that this function only works with
			-- unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
			valid_position: a_position/=Void
		do
			gtk_tree_store_move_before (handle,an_iterator.handle, a_position.handle)
		end

	move_last  (an_iterator: GTK_TREE_ITER)
			-- Moves `an_iterator' in store to the end of the level. Note that this
			-- function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator /= Void
		do
			gtk_tree_store_move_before (handle, an_iterator.handle, default_pointer)
		end

	move_after  (an_iterator, a_position: GTK_TREE_ITER)
			-- Moves `an_iterator' in store to the position after
			-- `a_position'. Note that this function only works with unsorted stores. 
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
			valid_position: a_position/=Void
		do
			gtk_tree_store_move_after (handle, an_iterator.handle, a_position.handle)
		end

	move_first  (an_iterator: GTK_TREE_ITER)
			-- Moves item pointed to by `an_iterator' to the start of the
			-- level. Note that this function only works with unsorted stores.
		require
			unsorted_store: not is_sorted
			valid_iterator: an_iterator/=Void
		do
			gtk_tree_store_move_after (handle, an_iterator.handle, default_pointer)
		end
feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeStore)"
		end

-- TODO:
-- --             GtkTreeStore;
-- -- GtkTreeStore* gtk_tree_store_newv           (gint n_columns,

-- -- void        gtk_tree_store_set              (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              ...);
-- -- void        gtk_tree_store_set_valist       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              va_list var_args);
end
