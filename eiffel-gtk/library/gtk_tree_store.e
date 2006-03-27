-- -- Prev 	Up 	Home 	GTK+ Reference Manual 	Next
-- -- Top  |  Description  |  Object Hierarchy
-- -- GtkTreeStore

-- -- GtkTreeStore %GÅ‚Äî%@ A tree-like data structure that can be used with the GtkTreeView
	
-- -- Synopsis

-- -- #include <gtk/gtk.h>


-- --             GtkTreeStore;
-- -- GtkTreeStore* gtk_tree_store_new            (gint n_columns,
-- --                                              ...);
-- -- GtkTreeStore* gtk_tree_store_newv           (gint n_columns,
-- --                                              GType *types);
-- -- void        gtk_tree_store_set_column_types (GtkTreeStore *tree_store,
-- --                                              gint n_columns,
-- --                                              GType *types);
-- -- void        gtk_tree_store_set_value        (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              gint column,
-- --                                              GValue *value);
-- -- void        gtk_tree_store_set              (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              ...);
-- -- void        gtk_tree_store_set_valist       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              va_list var_args);
-- -- gboolean    gtk_tree_store_remove           (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter);
-- -- void        gtk_tree_store_insert           (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent,
-- --                                              gint position);
-- -- void        gtk_tree_store_insert_before    (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent,
-- --                                              GtkTreeIter *sibling);
-- -- void        gtk_tree_store_insert_after     (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent,
-- --                                              GtkTreeIter *sibling);
-- -- void        gtk_tree_store_prepend          (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent);
-- -- void        gtk_tree_store_append           (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent);
-- -- gboolean    gtk_tree_store_is_ancestor      (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *descendant);
-- -- gint        gtk_tree_store_iter_depth       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter);
-- -- void        gtk_tree_store_clear            (GtkTreeStore *tree_store);
-- -- gboolean    gtk_tree_store_iter_is_valid    (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter);
-- -- void        gtk_tree_store_reorder          (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *parent,
-- --                                              gint *new_order);
-- -- void        gtk_tree_store_swap             (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *a,
-- --                                              GtkTreeIter *b);
-- -- void        gtk_tree_store_move_before      (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *position);
-- -- void        gtk_tree_store_move_after       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *position);



-- -- Object Hierarchy

-- --   GObject
-- --    +----GtkTreeStore

-- -- Implemented Interfaces

-- -- GtkTreeStore implements GtkTreeModel, GtkTreeDragSource, GtkTreeDragDest and GtkTreeSortable.
-- -- Description

-- -- The GtkTreeStore object is a list model for use with a GtkTreeView widget. It implements the GtkTreeModel interface, and consequentialy, can use all of the methods available there. It also implements the GtkTreeSortable interface so it can be sorted by the view. Finally, it also implements the tree drag and drop interfaces.
-- -- Details
-- -- GtkTreeStore

-- -- typedef struct _GtkTreeStore GtkTreeStore;

-- -- gtk_tree_store_new ()

-- -- GtkTreeStore* gtk_tree_store_new            (gint n_columns,
-- --                                              ...);

-- -- Creates a new tree store as with n_columns columns each of the types passed in. Note that only types derived from standard GObject fundamental types are supported.

-- -- As an example, gtk_tree_store_new (3, G_TYPE_INT, G_TYPE_STRING, GDK_TYPE_PIXBUF); will create a new GtkTreeStore with three columns, of type int, string and GdkPixbuf respectively.

-- -- n_columns : 	number of columns in the tree store
-- -- ... : 	all GType types for the columns, from first to last
-- -- Returns : 	a new GtkTreeStore
-- -- gtk_tree_store_newv ()

-- -- GtkTreeStore* gtk_tree_store_newv           (gint n_columns,
-- --                                              GType *types);

-- -- Non vararg creation function. Used primarily by language bindings.

-- -- n_columns : 	number of columns in the tree store
-- -- types : 	an array of GType types for the columns, from first to last
-- -- Returns : 	a new GtkTreeStore
-- -- gtk_tree_store_set_column_types ()

-- -- void        gtk_tree_store_set_column_types (GtkTreeStore *tree_store,
-- --                                              gint n_columns,
-- --                                              GType *types);

-- -- This function is meant primarily for GObjects that inherit from GtkTreeStore, and should only be used when constructing a new GtkTreeStore. It will not function after a row has been added, or a method on the GtkTreeModel interface is called.

-- -- tree_store : 	A GtkTreeStore
-- -- n_columns : 	Number of columns for the tree store
-- -- types : 	An array of GType types, one for each column
-- -- gtk_tree_store_set_value ()

-- -- void        gtk_tree_store_set_value        (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              gint column,
-- --                                              GValue *value);

-- -- Sets the data in the cell specified by iter and column. The type of value must be convertible to the type of the column.

-- -- tree_store : 	a GtkTreeStore
-- -- iter : 	A valid GtkTreeIter for the row being modified
-- -- column : 	column number to modify
-- -- value : 	new value for the cell
-- -- gtk_tree_store_set ()

-- -- void        gtk_tree_store_set              (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              ...);

-- -- Sets the value of one or more cells in the row referenced by iter. The variable argument list should contain integer column numbers, each column number followed by the value to be set. The list is terminated by a -1. For example, to set column 0 with type G_TYPE_STRING to "Foo", you would write gtk_tree_store_set (store, iter, 0, "Foo", -1).

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	A valid GtkTreeIter for the row being modified
-- -- ... : 	pairs of column number and value, terminated with -1
-- -- gtk_tree_store_set_valist ()

-- -- void        gtk_tree_store_set_valist       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              va_list var_args);

-- -- See gtk_tree_store_set(); this version takes a va_list for use by language bindings.

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	A valid GtkTreeIter for the row being modified
-- -- var_args : 	va_list of column/value pairs
-- -- gtk_tree_store_remove ()

-- -- gboolean    gtk_tree_store_remove           (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter);

-- -- Removes iter from tree_store. After being removed, iter is set to the next valid row at that level, or invalidated if it previously pointed to the last one.

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	A valid GtkTreeIter
-- -- Returns : 	TRUE if iter is still valid, FALSE if not.
-- -- gtk_tree_store_insert ()

-- -- void        gtk_tree_store_insert           (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent,
-- --                                              gint position);

-- -- Creates a new row at position. If parent is non-NULL, then the row will be made a child of parent. Otherwise, the row will be created at the toplevel. If position is larger than the number of rows at that level, then the new row will be inserted to the end of the list. iter will be changed to point to this new row. The row will be empty after this function is called. To fill in values, you need to call gtk_tree_store_set() or gtk_tree_store_set_value().

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	An unset GtkTreeIter to set to the new row
-- -- parent : 	A valid GtkTreeIter, or NULL
-- -- position : 	position to insert the new row
-- -- gtk_tree_store_insert_before ()

-- -- void        gtk_tree_store_insert_before    (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent,
-- --                                              GtkTreeIter *sibling);

-- -- Inserts a new row before sibling. If sibling is NULL, then the row will be appended to parent 's children. If parent and sibling are NULL, then the row will be appended to the toplevel. If both sibling and parent are set, then parent must be the parent of sibling. When sibling is set, parent is optional.

-- -- iter will be changed to point to this new row. The row will be empty after this function is called. To fill in values, you need to call gtk_tree_store_set() or gtk_tree_store_set_value().

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	An unset GtkTreeIter to set to the new row
-- -- parent : 	A valid GtkTreeIter, or NULL
-- -- sibling : 	A valid GtkTreeIter, or NULL
-- -- gtk_tree_store_insert_after ()

-- -- void        gtk_tree_store_insert_after     (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent,
-- --                                              GtkTreeIter *sibling);

-- -- Inserts a new row after sibling. If sibling is NULL, then the row will be prepended to parent 's children. If parent and sibling are NULL, then the row will be prepended to the toplevel. If both sibling and parent are set, then parent must be the parent of sibling. When sibling is set, parent is optional.

-- -- iter will be changed to point to this new row. The row will be empty after this function is called. To fill in values, you need to call gtk_tree_store_set() or gtk_tree_store_set_value().

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	An unset GtkTreeIter to set to the new row
-- -- parent : 	A valid GtkTreeIter, or NULL
-- -- sibling : 	A valid GtkTreeIter, or NULL
-- -- gtk_tree_store_prepend ()

-- -- void        gtk_tree_store_prepend          (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent);

-- -- Prepends a new row to tree_store. If parent is non-NULL, then it will prepend the new row before the first child of parent, otherwise it will prepend a row to the top level. iter will be changed to point to this new row. The row will be empty after this function is called. To fill in values, you need to call gtk_tree_store_set() or gtk_tree_store_set_value().

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	An unset GtkTreeIter to set to the prepended row
-- -- parent : 	A valid GtkTreeIter, or NULL
-- -- gtk_tree_store_append ()

-- -- void        gtk_tree_store_append           (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *parent);

-- -- Appends a new row to tree_store. If parent is non-NULL, then it will append the new row after the last child of parent, otherwise it will append a row to the top level. iter will be changed to point to this new row. The row will be empty after this function is called. To fill in values, you need to call gtk_tree_store_set() or gtk_tree_store_set_value().

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	An unset GtkTreeIter to set to the appended row
-- -- parent : 	A valid GtkTreeIter, or NULL
-- -- gtk_tree_store_is_ancestor ()

-- -- gboolean    gtk_tree_store_is_ancestor      (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *descendant);

-- -- Returns TRUE if iter is an ancestor of descendant. That is, iter is the parent (or grandparent or great-grandparent) of descendant.

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	A valid GtkTreeIter
-- -- descendant : 	A valid GtkTreeIter
-- -- Returns : 	TRUE, if iter is an ancestor of descendant
-- -- gtk_tree_store_iter_depth ()

-- -- gint        gtk_tree_store_iter_depth       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter);

-- -- Returns the depth of iter. This will be 0 for anything on the root level, 1 for anything down a level, etc.

-- -- tree_store : 	A GtkTreeStore
-- -- iter : 	A valid GtkTreeIter
-- -- Returns : 	The depth of iter
-- -- gtk_tree_store_clear ()

-- -- void        gtk_tree_store_clear            (GtkTreeStore *tree_store);

-- -- Removes all rows from tree_store

-- -- tree_store : 	a GtkTreeStore
-- -- gtk_tree_store_iter_is_valid ()

-- -- gboolean    gtk_tree_store_iter_is_valid    (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter);

-- -- WARNING: This function is slow. Only use it for debugging and/or testing purposes.

-- -- Checks if the given iter is a valid iter for this GtkTreeStore.

-- -- tree_store : 	A GtkTreeStore.
-- -- iter : 	A GtkTreeIter.
-- -- Returns : 	TRUE if the iter is valid, FALSE if the iter is invalid.

-- -- Since 2.2
-- -- gtk_tree_store_reorder ()

-- -- void        gtk_tree_store_reorder          (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *parent,
-- --                                              gint *new_order);

-- -- Reorders the children of parent in tree_store to follow the order indicated by new_order. Note that this function only works with unsorted stores.

-- -- tree_store : 	A GtkTreeStore.
-- -- parent : 	A GtkTreeIter.
-- -- new_order : 	an array of integers mapping the new position of each child to its old position before the re-ordering, i.e. new_order[newpos] = oldpos.

-- -- Since 2.2
-- -- gtk_tree_store_swap ()

-- -- void        gtk_tree_store_swap             (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *a,
-- --                                              GtkTreeIter *b);

-- -- Swaps a and b in the same level of tree_store. Note that this function only works with unsorted stores.

-- -- tree_store : 	A GtkTreeStore.
-- -- a : 	A GtkTreeIter.
-- -- b : 	Another GtkTreeIter.

-- -- Since 2.2
-- -- gtk_tree_store_move_before ()

-- -- void        gtk_tree_store_move_before      (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *position);

-- -- Moves iter in tree_store to the position before position. iter and position should be in the same level. Note that this function only works with unsorted stores. If position is NULL, iter will be moved to the end of the level.

-- -- tree_store : 	A GtkTreeStore.
-- -- iter : 	A GtkTreeIter.
-- -- position : 	A GtkTreeIter or NULL.

-- -- Since 2.2
-- -- gtk_tree_store_move_after ()

-- -- void        gtk_tree_store_move_after       (GtkTreeStore *tree_store,
-- --                                              GtkTreeIter *iter,
-- --                                              GtkTreeIter *position);

-- -- Moves iter in tree_store to the position after position. iter and position should be in the same level. Note that this function only works with unsorted stores. If position is NULL, iter will be moved to the start of the level.

-- -- tree_store : 	A GtkTreeStore.
-- -- iter : 	A GtkTreeIter.
-- -- position : 	A GtkTreeIter.

-- -- Since 2.2
-- -- See Also

-- -- GtkTreeModel, GtkTreeStore
