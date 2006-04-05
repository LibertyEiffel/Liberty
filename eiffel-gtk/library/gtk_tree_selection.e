indexing
	description: "GtkTreeSelection - The selection object for GtkTreeView."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	
			-- Description
	
			-- The GtkTreeSelection object is a helper object to manage
			-- the selection for a GtkTreeView widget. The
			-- GtkTreeSelection object is automatically created when a
			-- new GtkTreeView widget is created, and cannot exist
			-- independentally of this widget. The primary reason the
			-- GtkTreeSelection objects exists is for cleanliness of code
			-- and API. That is, there is no conceptual reason all these
			-- functions could not be methods on the GtkTreeView widget
			-- instead of a separate function.

			-- The GtkTreeSelection object is gotten from a GtkTreeView
			-- by calling gtk_tree_view_get_selection(). It can be
			-- manipulated to check the selection status of the tree, as
			-- well as select and deselect individual rows. Selection is
			-- done completely view side. As a result, multiple views of
			-- the same model can have completely different
			-- selections. Additionally, you cannot change the selection
			-- of a row on the model that is not currently displayed by
			-- the view without expanding its parents first.

			-- One of the important things to remember when monitoring
			-- the selection of a view is that the "changed" signal is
			-- mostly a hint. That is, it may only emit one signal when a
			-- range of rows is selected. Additionally, it may on
			-- occasion emit a "changed" signal when nothing has happened
			-- (mostly as a result of programmers calling select_row on
			-- an already selected row).

class GTK_TREE_SELECTION
inherit
	G_OBJECT
	GTK_TREE_SELECTION_EXTERNALS

creation from_external_pointer

feature -- selection mode
	set_single_mode is
			-- Set selection mode to single. Zero or one element may be
			-- selected.If the previous type was GTK_SELECTION_MULTIPLE,
			-- then the anchor is kept selected, if it was previously
			-- selected.
		do
			gtk_tree_selection_set_mode (handle, gtk_selection_single)
		end
	
	is_mode_single: BOOLEAN is
			-- Is selection mode single?
		do
			Result := (gtk_tree_selection_get_mode (handle) = gtk_selection_single )
		end

	set_browse_mode is
			-- Set selection mode to browse. Exactly one element is
			-- selected. In some circumstances, such as initially or
			-- during a search operation, it's possible for no element to
			-- be selected with GTK_SELECTION_BROWSE. What is really
			-- enforced is that the user can't deselect a currently
			-- selected element except by selecting another element. If
			-- the previous type was GTK_SELECTION_MULTIPLE, then the
			-- anchor is kept selected, if it was previously selected.
		do
			gtk_tree_selection_set_mode (handle, gtk_selection_browse)
		end
	
	is_mode_browse: BOOLEAN is
			-- Is selection mode browse?
		do
			Result := (gtk_tree_selection_get_mode (handle) = gtk_selection_browse )
		end
	
	set_multiple_mode is
			-- Set selection mode to multiple. Any number of elements may
			-- be selected. Clicks toggle the state of an item. Any
			-- number of elements may be selected. The Ctrl key may be
			-- used to enlarge the selection, and Shift key to select
			-- between the focus and the child pointed to. Some widgets
			-- may also allow Click-drag to select a range of
			-- elements. If the previous type was GTK_SELECTION_MULTIPLE,
			-- then the anchor is kept selected, if it was previously
			-- selected.
		do
			gtk_tree_selection_set_mode (handle, gtk_selection_multiple)
		end
	
	is_mode_multiple: BOOLEAN is
			-- Is selection mode multiple?
		do
			Result := (gtk_tree_selection_get_mode (handle) = gtk_selection_multiple)
		end

	
-- gtk_tree_selection_set_select_function ()

-- void        gtk_tree_selection_set_select_function
--                                             (GtkTreeSelection *selection,
--                                              GtkTreeSelectionFunc func,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy);

-- Sets the selection function. If set, this function is called before any node is selected or unselected, giving some control over which nodes are selected. The select function should return TRUE if the state of the node may be toggled, and FALSE if the state of the node should be left unchanged.

-- selection : 	A GtkTreeSelection.
-- func : 	The selection function.
-- data : 	The selection function's data.
-- destroy : 	The destroy function for user data. May be NULL.
-- gtk_tree_selection_get_user_data ()

-- gpointer    gtk_tree_selection_get_user_data
--                                             (GtkTreeSelection *selection);

-- Returns the user data for the selection function.

-- selection : 	A GtkTreeSelection.
	-- Returns : 	The user data.

feature -- View	
	tree_view: GTK_TREE_VIEW is
			-- the tree view associated with selection.
		do
			create Result.from_external_pointer (gtk_tree_selection_get_tree_view (handle))
		ensure result_not_void: Result/=Void
		end


	is_node_selected: BOOLEAN is
			-- Is there a selected node?
		require not_multiple: not is_mode_multiple
		do
			Result:=(gtk_tree_selection_get_selected (handle, Null, Null)).to_boolean
		end
	
feature -- selections
	selected: GTK_TREE_ITER is
			--  the currently selected node if selection is set to
			--  GTK_SELECTION_SINGLE or GTK_SELECTION_BROWSE. This
			--  feature will not work if you use selection is
			--  GTK_SELECTION_MULTIPLE.
		require not_multiple: not is_mode_multiple
		local discarded_result: INTEGER
		do
			create Result.make
			discarded_result := gtk_tree_selection_get_selected (handle, Null, Result.handle)
		end
	
-- TODO: gtk_tree_selection_selected_foreach ()

-- void        gtk_tree_selection_selected_foreach
--                                             (GtkTreeSelection *selection,
--                                              GtkTreeSelectionForeachFunc func,
--                                              gpointer data);

-- Calls a function for each selected node. Note that you cannot modify the tree or selection from within this function. As a result, gtk_tree_selection_get_selected_rows() might be more useful.

-- selection : 	A GtkTreeSelection.
-- func : 	The function to call for each selected node.
-- data : 	user data to pass to the function.

	selected_rows: G_LIST [GTK_TREE_PATH] is
		do
			create Result.from_external_pointer (gtk_tree_selection_get_selected_rows(handle,Null))
			-- gtk_tree_selection_get_selected_rows Creates a list of
			-- path of all selected rows. Additionally, if you are
			-- planning on modifying the model after calling this
			-- function, you may want to convert the returned list into a
			-- list of GtkTreeRowReferences. To do this, you can use
			-- gtk_tree_row_reference_new().

			-- To free the return value, use:
			
			-- g_list_foreach (list, gtk_tree_path_free, NULL);
			-- g_list_free (list);

			-- selection : 	A GtkTreeSelection.
			-- model : 	A pointer to set to the GtkTreeModel, or NULL.
			-- Returns : 	A GList containing a GtkTreePath for each selected row.
		end

	selected_rows_count: INTEGER is
			-- the number of rows that have been selected in tree.
		do
			Result := gtk_tree_selection_count_selected_rows (handle)
		end

	select_path (a_path: GTK_TREE_PATH) is
			-- Select the row at `a_path'.
		require path_not_void: a_path/=Void
		do
			gtk_tree_selection_select_path  (handle, a_path.handle)
		ensure selected: is_path_selected (a_path)
		end

	unselect_path (a_path: GTK_TREE_PATH) is
			-- Unselect the row at `a_path'.
		require path_not_void: a_path/=Void
		do
			gtk_tree_selection_unselect_path  (handle, a_path.handle)
		ensure unselected: not is_path_selected (a_path)
		end

	is_path_selected (a_path: GTK_TREE_PATH): BOOLEAN is
			-- Is the row pointed to by `a_path' currently selected?
			-- False if `a_path' does not point to a valid location.
		do
			Result:=(gtk_tree_selection_path_is_selected(handle,a_path.handle)).to_boolean
		end

	select_iter (an_iter: GTK_TREE_ITER) is
			-- Selects the specified iterator (`an_iter').
		require iterator_not_void: an_iter/=Void
		do
			gtk_tree_selection_select_iter  (handle, an_iter.handle)
		ensure selected: is_iter_selected(an_iter)
		end
	
	unselect_iter (an_iter: GTK_TREE_ITER) is
			-- Unselects the specified iterator (`an_iter').
		require iterator_not_void: an_iter/=Void
		do
			gtk_tree_selection_unselect_iter  (handle, an_iter.handle)		
		ensure unselected: not is_iter_selected(an_iter)
		end

	is_iter_selected (an_iter: GTK_TREE_ITER): BOOLEAN is
			-- Is the row at `an_iter' currently selected?
		require iterator_not_void: an_iter/=Void
		do
			Result:=(gtk_tree_selection_iter_is_selected(handle,an_iter.handle)).to_boolean
		end

	select_all is
			-- Selects all the nodes. selection must be set to GTK_SELECTION_MULTIPLE mode.
		require multiple_mode: is_mode_multiple
		do
			gtk_tree_selection_select_all (handle)
		end

	unselect_all is
			-- Unselects all the nodes.
		do
			gtk_tree_selection_unselect_all (handle)
		end 

	select_range (a_start,an_end: GTK_TREE_PATH) is
			-- Selects a range of nodes, determined by `a_start' and
			-- `an_end' paths inclusive. Selection must be set to
			-- GTK_SELECTION_MULTIPLE mode.

			-- `a_start' : 	The initial node of the range.
			-- `an_end' : 	The final node of the range.
		require
			multiple_mode: is_mode_multiple
			valid_start: a_start /= Void
			valid_end: an_end /= Void
		do
			gtk_tree_selection_select_range (handle, a_start.handle, an_end.handle)
		end

	unselect_range (a_start,an_end: GTK_TREE_PATH) is
			-- Unselects a range of nodes, determined by `a_start' and
			-- `an_end' paths inclusive. Selection must be set to
			-- GTK_SELECTION_MULTIPLE mode.

			-- `a_start' : 	The initial node of the range.
			-- `an_end' : 	The final node of the range.
		require
			multiple_mode: is_mode_multiple
			valid_start: a_start /= Void
			valid_end: an_end /= Void
		do
			gtk_tree_selection_unselect_range (handle, a_start.handle, an_end.handle)
		end
	

-- Since 2.2
-- Signal Details
-- The "changed" signal

-- void        user_function                  (GtkTreeSelection *treeselection,
--                                             gpointer user_data);

-- Emitted whenever the selection has (possibly) changed. Please note that this signal is mostly a hint. It may only be emitted once when a range of rows are selected, and it may occasionally be emitted when nothing has happened.
-- treeselection : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- See Also

-- GtkTreeView, GtkTreeViewColumn, GtkTreeDnd, GtkTreeMode, GtkTreeSortable,
-- GtkTreeModelSort, GtkListStore, GtkTreeStore, GtkCellRenderer, GtkCellEditable,
	-- GtkCellRendererPixbuf, GtkCellRendererText, GtkCellRendererToggle
	
	-- TODO: Unwrapped
	
-- GtkTreeSelectionFunc ()

-- gboolean    (*GtkTreeSelectionFunc)         (GtkTreeSelection *selection,
--                                              GtkTreeModel *model,
--                                              GtkTreePath *path,
--                                              gboolean path_currently_selected,
--                                              gpointer data);

-- A function used by gtk_tree_selection_set_select_function() to filter whether or not a row may be selected. It is called whenever a row's state might change. A return value of TRUE indicates to selection that it is okay to change the selection.
-- selection : 	A GtkTreeSelection
-- model : 	A GtkTreeModel being viewed
-- path : 	The GtkTreePath of the row in question
-- path_currently_selected : 	TRUE, if the path is currently selected
-- data : 	user data
-- Returns : 	TRUE, if the selection state of the row can be toggled
-- GtkTreeSelectionForeachFunc ()

-- void        (*GtkTreeSelectionForeachFunc)  (GtkTreeModel *model,
--                                              GtkTreePath *path,
--                                              GtkTreeIter *iter,
--                                              gpointer data);

-- A function used by gtk_tree_selection_selected_foreach() to map all selected rows. It will be called on every selected row in the view.
-- model : 	The GtkTreeModel being viewed
-- path : 	The GtkTreePath of a selected row
-- iter : 	A GtkTreeIter pointing to a selected row
-- data : 	user data

end
