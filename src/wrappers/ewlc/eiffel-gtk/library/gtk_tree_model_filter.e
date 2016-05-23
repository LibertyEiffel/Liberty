note
	description: "GtkTreeModelFilter - a GtkTreeModel which hides parts of an underlying tree model."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTK_TREE_MODEL_FILTER
	-- Description: a GtkTreeModelFilter is a tree model which wraps
	-- another tree model, and can do the following things:

	-- * Filter specific rows, based on data from a "visible column", a
	-- column storing booleans indicating whether the row should be
	-- filtered or not, or based on the return value of a "visible
	-- function", which gets a model, iter and user_data and returns a
	-- boolean indicating whether the row should be filtered or not.

	-- * Modify the "appearance" of the model, using a modify
	-- function. This is extremely powerful and allows for just
	-- changing some values and also for creating a completely
	-- different model based on the given child model.

	-- * Set a different root node, also known as a "virtual root". You
	-- can pass in a GtkTreePath indicating the root node for the
	-- filter at construction time.

inherit
	GTK_TREE_MODEL 
	GTK_TREE_DRAG_SOURCE

insert
	G_TYPES

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_child_model: GTK_TREE_MODEL; a_root: GTK_TREE_PATH) is
			-- Creates a new GtkTreeModel with `a_child_model' and - if
			-- it is not Void - `a_root' as the virtual root.
		do
			from_external_pointer(gtk_tree_model_filter_new(handle,null_or(a_root)))
		end

feature {ANY} 
	-- TODO: gtk_tree_model_filter_set_visible_func ()

	-- void        gtk_tree_model_filter_set_visible_func
	--                                             (GtkTreeModelFilter *filter,
	--                                              GtkTreeModelFilterVisibleFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- Sets the visible function used when filtering the filter to be func. The function should return TRUE if the given row should be visible and FALSE otherwise.

	-- If the condition calculated by the function changes over time (e.g. because it depends on some global parameters), you must call gtk_tree_model_filter_refilter() to keep the visibility information of the model uptodate.

	-- filter : 	A GtkTreeModelFilter.
	-- func : 	A GtkTreeModelFilterVisibleFunc, the visible function.
	-- data : 	User data to pass to the visible function, or NULL.
	-- destroy : 	Destroy notifier of data, or NULL.

	-- Since 2.4

	-- TODO: gtk_tree_model_filter_set_modify_func ()

	-- void        gtk_tree_model_filter_set_modify_func
	--                                             (GtkTreeModelFilter *filter,
	--                                              gint n_columns,
	--                                              GType *types,
	--                                              GtkTreeModelFilterModifyFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- With the n_columns and types parameters, you give an array of column types for this model (which will be exposed to the parent model/view). The func, data and destroy parameters are for specifying the modify function. The modify function will get called for each data access, the goal of the modify function is to return the data which should be displayed at the location specified using the parameters of the modify function.

	-- filter : 	A GtkTreeModelFilter.
	-- n_columns : 	The number of columns in the filter model.
	-- types : 	The GTypes of the columns.
	-- func : 	A GtkTreeModelFilterModifyFunc
	-- data : 	User data to pass to the modify function, or NULL.
	-- destroy : 	Destroy notifier of data, or NULL.

	-- Since 2.4

	set_visible_column (a_column: INTEGER) is
			-- Sets `a_column' of the child_model to be the column where
			-- filter should look for visibility information. A True
			-- column value means that a row is visible, and False is
			-- not.
		require 
			boolean_column: model.column_type(a_column) = g_type_boolean
		do
			gtk_tree_model_filter_set_visible_column(handle,a_column)
		end

	model: GTK_TREE_MODEL is
			-- the child model of filter.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_TREE_MODEL]
		do
			Result := factory.wrapper(gtk_tree_model_filter_get_model(handle))
		end
	
	iter_from_child_iter (a_child_iter: GTK_TREE_ITER): GTK_TREE_ITER is
			-- An_iterator pointing to the row in filter that corresponds
			-- to the row pointed at by `a_child_iter'.
		require iter_not_void: a_child_iter /= Void
		do
			create Result.make
			gtk_tree_model_filter_convert_child_iter_to_iter (handle, Result.handle, a_child_iter.handle)
		end

	to_child_iter (a_filter_iter: GTK_TEXT_ITER): GTK_TREE_ITER is
			-- An iterator pointing to the row pointed to by
			-- `a_filter_iter', a valid GtkTreeIter pointing to a row on
			-- filter.
		require 
			iter_not_void: a_filter_iter /= Void
			-- TODO: a_filter_iter.model = Current 
		do
			create Result.make
			gtk_tree_model_filter_convert_iter_to_child_iter (handle, Result.handle, a_filter_iter.handle)
		end

	child_path_to_path (a_child_path: GTK_TREE_PATH): GTK_TREE_PATH is
			-- cnverts `a_child_path' to a path relative to filter. That
			-- is, `a_child_path' points to a path in the child
			-- model. The Result path will point to the same row in the
			-- filtered model. If `a_child_path' isn't a valid path on
			-- the child model, then Void is returned.
		require path_not_void: a_child_path /= Void
		local path_ptr: POINTER
		do
			path_ptr:=gtk_tree_model_filter_convert_child_path_to_path(handle, a_child_path.handle)
			if path_ptr.is_not_null then create Result.from_external_pointer(path_ptr) end
		end

	path_to_child_path (a_filter_path: GTK_TREE_PATH): GTK_TREE_PATH is	
			-- Converts `a_filter_path' to a path on the child model of
			-- filter. That is, `a_filter_path' points to a location in
			-- filter. The Result path will point to the same location in
			-- the model not being filtered. If `a_filter_path' does not
			-- point to a location in the child model, Void is returned.
		require path_not_void: a_filter_path /= Void
		local path_ptr: POINTER
		do
			path_ptr:=gtk_tree_model_filter_convert_path_to_child_path(handle, a_filter_path.handle)
			if path_ptr.is_not_null then create Result.from_external_pointer(path_ptr) end
		end

	refilter is
			-- Emits ::row_changed for each row in the child model, which
			-- causes the filter to re-evaluate whether a row is visible
			-- or not.
		do
			gtk_tree_model_filter_refilter  (handle)
		end

	clear_cache is
			-- This function should almost never be called. It clears the
			-- filter of any cached iterators that haven't been reffed
			-- with `ref_node'. This might be useful if the child model
			-- being filtered is static (and doesn't change often) and
			-- there has been a lot of unreffed access to nodes. As a
			-- side effect of this function, all unreffed itters will be
			-- invalid.
		do
			gtk_tree_model_filter_clear_cache(handle)
		end

feature {ANY} -- TODO: Properties
	-- The "child-model" property

	--   "child-model"          GtkTreeModel          : Read / Write / Construct Only

	-- The model for the filtermodel to filter.

	-- TODO: how can a property be writable and at the same time
	-- writable at construct time only? This question is valid for both
	-- these properties. Paolo 2007-01-09
	

	-- The "virtual-root" property

	--   "virtual-root"         GtkTreePath           : Read / Write / Construct Only

	-- The virtual root (relative to the child model) for this filtermodel.

feature {} -- Unwrapped features 
-- GtkTreeModelFilterVisibleFunc ()

	-- gboolean    (*GtkTreeModelFilterVisibleFunc)
	--                                             (GtkTreeModel *model,
	--                                              GtkTreeIter *iter,
	--                                              gpointer data);

	-- A function which decides whether the row indicated by iter is visible.
	-- model : 	the child model of the GtkTreeModelFilter
	-- iter : 	a GtkTreeIter pointing to the row in model whose visibility is determined
	-- data : 	user data given to gtk_tree_model_filter_set_visible_func()
	-- Returns : 	Whether the row indicated by iter is visible.
	-- GtkTreeModelFilterModifyFunc ()

	-- void        (*GtkTreeModelFilterModifyFunc) (GtkTreeModel *model,
	--                                              GtkTreeIter *iter,
	--                                              GValue *value,
	--                                              gint column,
	--                                              gpointer data);
	
	-- A function which calculates display values from raw values in the model. It must fill value with the display value for the column column in the row indicated by iter.
	
	-- Since this function is called for each data access, it's not a particularly efficient operation.
	-- model : 	the GtkTreeModelFilter
	-- iter : 	a GtkTreeIter pointing to the row whose display values are determined
	-- value : 	A GValue which is already initialized for with the correct type for the column column.
	-- column : 	the column whose display value is determined
	-- data : 	user data given to gtk_tree_model_filter_set_modify_func()
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeModelFilter)"
		end

feature {} -- External calls
	-- TODO: wrap function pointer gboolean (*GtkTreeModelFilterVisibleFunc)
	-- (GtkTreeModel *model, GtkTreeIter *iter, gpointer data);

	-- TODO: wrap funtion pointer void (*GtkTreeModelFilterModifyFunc)
	-- (GtkTreeModel *model, GtkTreeIter *iter, GValue *value, gint
	-- column, gpointer data);

	gtk_tree_model_filter_new (a_child_model, a_root: POINTER): POINTER is
			-- GtkTreeModel* gtk_tree_model_filter_new (GtkTreeModel
			-- *child_model, GtkTreePath *root);
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_filter_set_visible_func (a_filter, a_gtktreemodelfiltervisiblefunc, some_data, a_gtkdestroynotify: POINTER) is
			-- void gtk_tree_model_filter_set_visible_func
			-- (GtkTreeModelFilter *filter, GtkTreeModelFilterVisibleFunc
			-- func, gpointer data, GtkDestroyNotify destroy);
	external "C use <gtk/gtk.h>"
	end

	gtk_tree_model_filter_set_modify_func (a_filter: POINTER; an_n_columns: INTEGER; some_gtypes, a_gtktreemodelfiltermodifyfunc, some_data, a_gtkdestroynotify: POINTER) is
			-- void gtk_tree_model_filter_set_modify_func
			-- (GtkTreeModelFilter *filter, gint n_columns, GType *types,
			-- GtkTreeModelFilterModifyFunc func, gpointer data,
			-- GtkDestroyNotify destroy);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_model_filter_set_visible_column (a_filter: POINTER; a_column: INTEGER) is
			-- void gtk_tree_model_filter_set_visible_column
			-- (GtkTreeModelFilter *filter, gint column);
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_filter_get_model (a_filter: POINTER): POINTER is
			-- GtkTreeModel* gtk_tree_model_filter_get_model (GtkTreeModelFilter *filter);
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_filter_convert_child_iter_to_iter (a_filter, a_filter_iter, a_child_iter: POINTER) is
			-- void gtk_tree_model_filter_convert_child_iter_to_iter
			-- (GtkTreeModelFilter *filter, GtkTreeIter *filter_iter,
			-- GtkTreeIter *child_iter);
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_filter_convert_iter_to_child_iter (a_filter, a_child_iter, a_filter_iter: POINTER) is
			-- void gtk_tree_model_filter_convert_iter_to_child_iter
			-- (GtkTreeModelFilter *filter, GtkTreeIter *child_iter,
			-- GtkTreeIter *filter_iter);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_model_filter_convert_child_path_to_path (a_filter, a_child_path: POINTER): POINTER is
			-- GtkTreePath*
			-- gtk_tree_model_filter_convert_child_path_to_path
			-- (GtkTreeModelFilter *filter, GtkTreePath *child_path);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_model_filter_convert_path_to_child_path (a_filter, a_filter_path: POINTER): POINTER is
			-- GtkTreePath*
			-- gtk_tree_model_filter_convert_path_to_child_path
			-- (GtkTreeModelFilter *filter, GtkTreePath *filter_path);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_model_filter_refilter (a_filter: POINTER) is
			-- void gtk_tree_model_filter_refilter (GtkTreeModelFilter *filter);
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_model_filter_clear_cache (a_filter: POINTER) is
			-- void gtk_tree_model_filter_clear_cache (GtkTreeModelFilter *filter);
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_TREE_MODEL_FILTER
