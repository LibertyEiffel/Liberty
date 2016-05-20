note
	description: "GtkTreeSortable -- The interface for sortable models used by GtkTreeView."
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
					

deferred class GTK_TREE_SORTABLE
	-- GtkTreeSortable is an interface to be implemented by tree models
	-- which support sorting. The GtkTreeView uses the methods provided
	-- by this interface to sort the model.
inherit
	-- TODO: G_INTERFACE 
	-- Prerequisites: GtkTreeSortable requires GtkTreeModel and GObject.
	GTK_TREE_MODEL

		-- Note: GTK_TREE_MODEL already requires G_OBJECT
	
		-- Known Implementations: GtkTreeSortable is implemented by
		-- GtkTreeModelSort, GtkTreeStore and GtkListStore.

insert
	GTK_SORT_TYPE
	GTK_TREE_SORTABLE_EXTERNALS
		
feature {ANY} 

-- GtkTreeIterCompareFunc ()

-- gint        (*GtkTreeIterCompareFunc)       (GtkTreeModel *model,
--                                              GtkTreeIter *a,
--                                              GtkTreeIter *b,
--                                              gpointer user_data);

-- A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive integer if a sorts before b, a sorts with b, or a sorts after b respectively. If two iters compare as equal, their order in the sorted model is undefined. In order to ensure that the GtkTreeSortable behaves as expected, the GtkTreeIterCompareFunc must define a partial order on the model, i.e. it must be reflexive, antisymmetric and transitive.

-- For example, if model is a product catalogue, then a compare function for the "price" column could be one which returns price_of(a) - price_of(b).
-- model : 	The GtkTreeModel the comparison is within
-- a : 	A GtkTreeIter in model
-- b : 	Another GtkTreeIter in model
-- user_data : 	Data passed when the compare func is assigned e.g. by gtk_tree_sortable_set_sort_func()
-- Returns : 	

	sort_column_changed is
			-- -- Emits a GtkTreeSortable::sort_column_changed signal on Current
		do
			gtk_tree_sortable_sort_column_changed (handle)
		end

	is_sort_column_id_not_special: BOOLEAN
			-- Is the sort column not one of the special sort column ids
			-- (i.e.: gtk_tree_sortable_default_sort_column_id or
			-- gtk_tree_sortable_unsorted_sort_column_id)?
	
	sort_column_id: INTEGER is
			-- The current sort column and the order. It returns TRUE
			-- unless the sort_column_id is
			-- GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID or
			-- GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID.
		
			-- sortable : 	A GtkTreeSortable
			-- sort_column_id : 	The sort column id to be filled in
			-- order : 	The GtkSortType to be filled in
			-- Returns : 	TRUE if the sort column is not one of the special sort column ids.
		local an_order: INTEGER
		do
			is_sort_column_id_not_special := (gtk_tree_sortable_get_sort_column_id (handle,
																											$Result,
																											$an_order
																											)).to_boolean
		end

	order: INTEGER is
			-- Fills in sort_column_id and order with the current sort column and the order. It returns TRUE unless the sort_column_id is GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID or GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID.
		
			-- sortable : 	A GtkTreeSortable
			-- sort_column_id : 	The sort column id to be filled in
			-- order : 	The GtkSortType to be filled in
			-- Returns : 	TRUE if the sort column is not one of the special sort column ids.
		local a_column: INTEGER
		do
			is_sort_column_id_not_special := (gtk_tree_sortable_get_sort_column_id (handle, $a_column,
																											$Result)).to_boolean
		ensure is_valid_gtk_sort_type (Result)
		end
	
	set_sort_column_id (a_column_id, an_order: INTEGER) is
			-- Sets the current sort column to be `a_column_id'. The
			-- sortable will resort itself to reflect this change, after
			-- emitting a GtkTreeSortable::sort_column_changed signal. If
			-- sort_column_id is
			-- GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID, then the default
			-- sort function will be used, if it is set.
		
			-- `an_order' is the sort order of the column
		require valid_order: is_valid_gtk_sort_type (an_order)
		do
			gtk_tree_sortable_set_sort_column_id (handle, a_column_id, an_order)
		end
	
	is_sorted: BOOLEAN is
			-- Is Current GTK_TREE_SORTABLE sorted?
		local
			col, sorted: INTEGER
		do
			Result := gtk_tree_sortable_get_sort_column_id (handle,
				$col,
				$sorted
				).to_boolean
		end

	-- TODO: gtk_tree_sortable_set_sort_func ()
	
	-- void        gtk_tree_sortable_set_sort_func (GtkTreeSortable *sortable,
	--                                              gint sort_column_id,
	--                                              GtkTreeIterCompareFunc sort_func,
	--                                              gpointer user_data,
	--                                              GtkDestroyNotify destroy);
	
	-- Sets the comparison function used when sorting to be sort_func. If the current sort column id of sortable is the same as sort_column_id, then the model will sort using this function.

	-- sortable : 	A GtkTreeSortable
	-- sort_column_id : 	the sort column id to set the function for
	-- sort_func : 	The comparison function
	-- user_data : 	User data to pass to sort_func, or NULL
	-- destroy : 	Destroy notifier of user_data, or NULL

	-- TODO: set_default_sort_func is

	-- void        gtk_tree_sortable_set_default_sort_func
	--                                             (GtkTreeSortable *sortable,
	--                                              GtkTreeIterCompareFunc sort_func,
--                                              gpointer user_data,
	--                                              GtkDestroyNotify destroy);

	-- Sets the default comparison function used when sorting to be sort_func. If the current sort column id of sortable is GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID, then the model will sort using this function.
	
-- If sort_func is NULL, then there will be no default comparison function. This means that once the model has been sorted, it can't go back to the default state. In this case, when the current sort column id of sortable is GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID, the model will be unsorted.
	
-- sortable : 	A GtkTreeSortable
-- sort_func : 	The comparison function
-- user_data : 	User data to pass to sort_func, or NULL
-- destroy : 	Destroy notifier of user_data, or NULL
-- gtk_tree_sortable_has_default_sort_func ()

-- gboolean    gtk_tree_sortable_has_default_sort_func
--                                             (GtkTreeSortable *sortable);

-- Returns TRUE if the model has a default sort function. This is used primarily by GtkTreeViewColumns in order to determine if a model can go back to the default state, or not.

-- sortable : 	A GtkTreeSortable
-- Returns : 	TRUE, if the model has a default sort function
-- Signal Details
-- The "sort-column-changed" signal

-- void        user_function                  (GtkTreeSortable *treesortable,
--                                             gpointer user_data);

-- treesortable : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- See Also

-- GtkTreeModel, GtkTreeView
end

