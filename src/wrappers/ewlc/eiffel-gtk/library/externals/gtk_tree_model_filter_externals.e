note
	description: "External calls for GtkTreeModelFilter: A GtkTreeModel which hides parts of an underlying tree model"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_TREE_MODEL_FILTER_EXTERNALS

inherit ANY undefine is_equal, copy end

-- Synopsis

-- #include <gtk/gtk.h>


--             GtkTreeModelFilter;
-- gboolean    (*GtkTreeModelFilterVisibleFunc)
--                                             (GtkTreeModel *model,
--                                              GtkTreeIter *iter,
--                                              gpointer data);
-- void        (*GtkTreeModelFilterModifyFunc) (GtkTreeModel *model,
--                                              GtkTreeIter *iter,
--                                              GValue *value,
--                                              gint column,
--                                              gpointer data);
-- GtkTreeModel* gtk_tree_model_filter_new     (GtkTreeModel *child_model,
--                                              GtkTreePath *root);
-- void        gtk_tree_model_filter_set_visible_func
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreeModelFilterVisibleFunc func,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy);
-- void        gtk_tree_model_filter_set_modify_func
--                                             (GtkTreeModelFilter *filter,
--                                              gint n_columns,
--                                              GType *types,
--                                              GtkTreeModelFilterModifyFunc func,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy);
-- void        gtk_tree_model_filter_set_visible_column
--                                             (GtkTreeModelFilter *filter,
--                                              gint column);
-- GtkTreeModel* gtk_tree_model_filter_get_model
--                                             (GtkTreeModelFilter *filter);
-- void        gtk_tree_model_filter_convert_child_iter_to_iter
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreeIter *filter_iter,
--                                              GtkTreeIter *child_iter);
-- void        gtk_tree_model_filter_convert_iter_to_child_iter
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreeIter *child_iter,
--                                              GtkTreeIter *filter_iter);
-- GtkTreePath* gtk_tree_model_filter_convert_child_path_to_path
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreePath *child_path);
-- GtkTreePath* gtk_tree_model_filter_convert_path_to_child_path
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreePath *filter_path);
-- void        gtk_tree_model_filter_refilter  (GtkTreeModelFilter *filter);
-- void        gtk_tree_model_filter_clear_cache
--                                             (GtkTreeModelFilter *filter);



-- Object Hierarchy

--   GObject
--    +----GtkTreeModelFilter

-- Implemented Interfaces

-- GtkTreeModelFilter implements GtkTreeModel and GtkTreeDragSource.
-- Properties

--   "child-model"          GtkTreeModel          : Read / Write / Construct Only
--   "virtual-root"         GtkTreePath           : Read / Write / Construct Only

-- Description

-- A GtkTreeModelFilter is a tree model which wraps another tree model, and can do the following things:

--     *

--       Filter specific rows, based on data from a "visible column", a column storing booleans indicating whether the row should be filtered or not, or based on the return value of a "visible function", which gets a model, iter and user_data and returns a boolean indicating whether the row should be filtered or not.
--     *

--       Modify the "appearance" of the model, using a modify function. This is extremely powerful and allows for just changing some values and also for creating a completely different model based on the given child model.
--     *

--       Set a different root node, also known as a "virtual root". You can pass in a GtkTreePath indicating the root node for the filter at construction time.

-- Details
-- GtkTreeModelFilter

-- typedef struct _GtkTreeModelFilter GtkTreeModelFilter;

-- The GtkTreeModelFilter struct contains only private fields.
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
-- gtk_tree_model_filter_new ()

-- GtkTreeModel* gtk_tree_model_filter_new     (GtkTreeModel *child_model,
--                                              GtkTreePath *root);

-- Creates a new GtkTreeModel, with child_model as the child_model and root as the virtual root.

-- child_model : 	A GtkTreeModel.
-- root : 	A GtkTreePath or NULL.
-- Returns : 	A new GtkTreeModel.

-- Since 2.4
-- gtk_tree_model_filter_set_visible_func ()

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
-- gtk_tree_model_filter_set_modify_func ()

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
-- gtk_tree_model_filter_set_visible_column ()

-- void        gtk_tree_model_filter_set_visible_column
--                                             (GtkTreeModelFilter *filter,
--                                              gint column);

-- Sets column of the child_model to be the column where filter should look for visibility information. columns should be a column of type G_TYPE_BOOLEAN, where TRUE means that a row is visible, and FALSE if not.

-- filter : 	A GtkTreeModelFilter.
-- column : 	A gint which is the column containing the visible information.

-- Since 2.4
-- gtk_tree_model_filter_get_model ()

-- GtkTreeModel* gtk_tree_model_filter_get_model
--                                             (GtkTreeModelFilter *filter);

-- Returns a pointer to the child model of filter.

-- filter : 	A GtkTreeModelFilter.
-- Returns : 	A pointer to a GtkTreeModel.

-- Since 2.4
-- gtk_tree_model_filter_convert_child_iter_to_iter ()

-- void        gtk_tree_model_filter_convert_child_iter_to_iter
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreeIter *filter_iter,
--                                              GtkTreeIter *child_iter);

-- Sets filter_iter to point to the row in filter that corresponds to the row pointed at by child_iter.

-- filter : 	A GtkTreeModelFilter.
-- filter_iter : 	An uninitialized GtkTreeIter.
-- child_iter : 	A valid GtkTreeIter pointing to a row on the child model.

-- Since 2.4
-- gtk_tree_model_filter_convert_iter_to_child_iter ()

-- void        gtk_tree_model_filter_convert_iter_to_child_iter
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreeIter *child_iter,
--                                              GtkTreeIter *filter_iter);

-- Sets child_iter to point to the row pointed to by filter_iter.

-- filter : 	A GtkTreeModelFilter.
-- child_iter : 	An uninitialized GtkTreeIter.
-- filter_iter : 	A valid GtkTreeIter pointing to a row on filter.

-- Since 2.4
-- gtk_tree_model_filter_convert_child_path_to_path ()

-- GtkTreePath* gtk_tree_model_filter_convert_child_path_to_path
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreePath *child_path);

-- Converts child_path to a path relative to filter. That is, child_path points to a path in the child model. The rerturned path will point to the same row in the filtered model. If child_path isn't a valid path on the child model, then NULL is returned.

-- filter : 	A GtkTreeModelFilter.
-- child_path : 	A GtkTreePath to convert.
-- Returns : 	A newly allocated GtkTreePath, or NULL.

-- Since 2.4
-- gtk_tree_model_filter_convert_path_to_child_path ()

-- GtkTreePath* gtk_tree_model_filter_convert_path_to_child_path
--                                             (GtkTreeModelFilter *filter,
--                                              GtkTreePath *filter_path);

-- Converts filter_path to a path on the child model of filter. That is, filter_path points to a location in filter. The returned path will point to the same location in the model not being filtered. If filter_path does not point to a location in the child model, NULL is returned.

-- filter : 	A GtkTreeModelFilter.
-- filter_path : 	A GtkTreePath to convert.
-- Returns : 	A newly allocated GtkTreePath, or NULL.

-- Since 2.4
-- gtk_tree_model_filter_refilter ()

-- void        gtk_tree_model_filter_refilter  (GtkTreeModelFilter *filter);

-- Emits ::row_changed for each row in the child model, which causes the filter to re-evaluate whether a row is visible or not.

-- filter : 	A GtkTreeModelFilter.

-- Since 2.4
-- gtk_tree_model_filter_clear_cache ()

-- void        gtk_tree_model_filter_clear_cache
--                                             (GtkTreeModelFilter *filter);

-- This function should almost never be called. It clears the filter of any cached iterators that haven't been reffed with gtk_tree_model_ref_node(). This might be useful if the child model being filtered is static (and doesn't change often) and there has been a lot of unreffed access to nodes. As a side effect of this function, all unreffed itters will be invalid.

-- filter : 	A GtkTreeModelFilter.

-- Since 2.4
-- Property Details
-- The "child-model" property

--   "child-model"          GtkTreeModel          : Read / Write / Construct Only

-- The model for the filtermodel to filter.
-- The "virtual-root" property

--   "virtual-root"         GtkTreePath           : Read / Write / Construct Only

-- The virtual root (relative to the child model) for this filtermodel.
-- See Also

-- GtkTreeModelSort

end -- class GTK_TREE_MODEL_FILTER_EXTERNALS
