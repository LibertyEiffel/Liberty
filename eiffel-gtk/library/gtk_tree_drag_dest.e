indexing
	description: "Destionation of a drag'n'drop: GtkTreeView drag-and-drop Interface for drag-and-drop support in GtkTreeView"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Description
	
			-- GTK+ supports Drag-and-Drop in tree views with a
			-- high-level and a low-level API.
	
			-- The low-level API consists of the GTK+ DND API, augmented
			-- by some treeview utility functions:
			-- gtk_tree_view_set_drag_dest_row(),
			-- gtk_tree_view_get_drag_dest_row(),
			-- gtk_tree_view_get_dest_row_at_pos(),
			-- gtk_tree_view_create_row_drag_icon(),
			-- gtk_tree_set_row_drag_data() and
			-- gtk_tree_get_row_drag_data(). This API leaves a lot of
			-- flexibility, but nothing is done automatically, and
			-- implementing advanced features like hover-to-open-rows or
			-- autoscrolling on top of this API is a lot of work.
	
			-- On the other hand, if you write to the high-level API,
			-- then all the bookkeeping of rows is done for you, as well
			-- as things like hover-to-open and auto-scroll, but your
			-- models have to implement the GtkTreeDragSource and
			-- GtkTreeDragDest interfaces.

deferred class GTK_TREE_DRAG_DEST
	-- inherit C_STRUCT
	
	-- Object Hierarchy: inherits from GInterface

	-- Known Implementations: GtkTreeDragSource is implemented by
	-- GtkTreeModelSort, GtkTreeStore, GtkListStore and
	-- GtkTreeModelFilter.

	-- GtkTreeDragDest is implemented by GtkTreeStore and GtkListStore.
feature -- 
	is_last_action_successful: BOOLEAN
		
	receive_data (a_path: GTK_TREE_PATH; a_selection_data: GTK_SELECTION_DATA) is
			-- Try to insert a row before `a_path', deriving the contents
			-- of the row from
			-- `a_selection_data'. `is_last_action_successful' will be
			-- False if `a_path' is outside the tree so that inserting
			-- before it is impossible; it will also be False if the new
			-- row is not created for some model-specific reason. Should
			-- robustly handle a dest no longer found in the model!
		require 
			valid_path: a_path /= Void
			valid_data: a_selection_data /= Void
		do
			is_last_action_successful :=
				(gtk_tree_drag_dest_drag_data_received
				 (handle, a_path.handle, a_selection_data.handle)).to_external
		end
	
	is_row_drop_possible (a_path: GTK_TREE_PATH; a_selection_data: GTK_SELECTION_DATA): BOOLEAN is
			-- Determines whether a drop is possible before the given
			-- dest_path, at the same depth as dest_path. i.e., can we
			-- drop the data in selection_data at that
			-- location. dest_path does not have to exist; the return
			-- value will almost certainly be FALSE if the parent of
			-- dest_path doesn't exist, though.
		
			-- drag_dest : 	a GtkTreeDragDest
			-- dest_path : 	destination row
			-- selection_data : 	the data being dragged
			-- Returns : 	TRUE if a drop is possible before dest_path
		require 
			valid_path: a_path /= Void
			valid_data: a_selection_data /= Void
		do
			Result := (gtk_tree_drag_dest_row_drop_possible
						  (handle, a_path.handle, a_selection_data.handle)).to_boolean
		end

	delete_data (a_path: GTK_TREE_PATH) is
			-- Try to delete the row at `a_path', because it was moved
			-- somewhere else via drag-and-drop.
			-- `is_last_action_successful' will be False if the deletion
			-- fails because path no longer exists, or for some
			-- model-specific reason. Should robustly handle a path no
			-- longer found in the model!
		require valid_path: a_path /= Void
		do
			is_last_action_successful := 
				(gtk_tree_drag_source_drag_data_delete 
				 (handle, a_path.handle)).to_boolean
		end

	get_data (a_path: GTK_TREE_PATH; a_selection_data: GTK_SELECTION_DATA) is
			-- Try to fill in `a_selection_data' with a representation of
			-- the row at path. `is_last_action_successful' will be True
			-- if data of the required type was provided.
			-- a_selection_data.target (Note: currently unimplemented;
			-- Paolo 2006-05-05) gives the required type of the
			-- data. Should robustly handle a path no longer found in the
			-- model!

			-- `a_path' : 	row that was dragged

			-- `a_selection_data' : 	a GtkSelectionData to fill with data from the dragged row
		do
			is_last_action_successful :=
				(gtk_tree_drag_source_drag_data_get
				 (handle, a_path.handle, a_selection_data.handle)).to_boolean
		end

 
	-- Note: QUESTO VA NELLA SORGENTE!
	is_row_draggable (a_path: GTK_TREE_PATH): BOOLEAN is
			-- Can `a_path' (i.e.: a particular row) be used as the
			-- source of a DND operation? If the source doesn't implement
			-- this interface, the row is assumed draggable. Note: This
			-- is a feature of GtkTreeDragSource
		do
			Result := (gtk_tree_drag_source_row_draggable 
						  (handle, a_path.handle)).to_boolean
		end

feature -- TODO: GtkTreeDragDestIface

	-- typedef struct {
	--   GTypeInterface g_iface;
	
	--   /* VTable - not signals */
	
	--   gboolean     (* drag_data_received) (GtkTreeDragDest   *drag_dest,
	-- 													GtkTreePath       *dest,
	-- 													GtkSelectionData  *selection_data);
	
	--   gboolean     (* row_drop_possible)  (GtkTreeDragDest   *drag_dest,
	-- 													GtkTreePath       *dest_path,
	-- 						                     GtkSelectionData  *selection_data);
	-- } GtkTreeDragDestIface;


	-- gtk_tree_set_row_drag_data ()
	
	-- gboolean    gtk_tree_set_row_drag_data      (GtkSelectionData *selection_data,
	-- 															GtkTreeModel *tree_model,
	-- 															GtkTreePath *path);

	-- Sets selection data of target type GTK_TREE_MODEL_ROW. Normally used in a drag_data_get handler.

	-- selection_data : 	some GtkSelectionData
	-- tree_model : 	a GtkTreeModel
	-- path : 	a row in tree_model
	-- Returns : 	TRUE if the GtkSelectionData had the proper target type to allow us to set a tree row
	-- gtk_tree_get_row_drag_data ()

	-- gboolean    gtk_tree_get_row_drag_data      (GtkSelectionData *selection_data,
	-- 															GtkTreeModel **tree_model,
	-- 															GtkTreePath **path);

	-- Obtains a tree_model and path from selection data of target type GTK_TREE_MODEL_ROW. Normally called from a drag_data_received handler. This function can only be used if selection_data originates from the same process that's calling this function, because a pointer to the tree model is being passed around. If you aren't in the same process, then you'll get memory corruption. In the GtkTreeDragDest drag_data_received handler, you can assume that selection data of type GTK_TREE_MODEL_ROW is in from the current process. The returned path must be freed with gtk_tree_path_free().

	-- selection_data : 	a GtkSelectionData
	-- tree_model : 	a GtkTreeModel
	-- path : 	row in tree_model
	-- Returns : 	TRUE if selection_data had target type GTK_TREE_MODEL_ROW and is otherwise valid
feature {NONE} -- External calls
	
	gtk_tree_drag_source_drag_data_delete (a_drag_source: POINTER; -- GtkTreeDragSource*
														a_path: POINTER -- GtkTreePath*
														): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_drag_source_drag_data_get (a_drag_source: POINTER -- GtkTreeDragSource*
													a_path: POINTER; -- GtkTreePath*
													a_selection_data: POINTER -- GtkSelectionData*
													): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_drag_source_row_draggable (a_drag_source: POINTER; -- GtkTreeDragSource*
													a_path: POINTER -- GtkTreePath*
													): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_drag_dest_drag_data_received (a_drag_dest: POINTER; -- GtkTreeDragDest*
														a_dest: POINTER; -- GtkTreePath*
														a_selection_data: POINTER -- GtkSelectionData*
														): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_drag_dest_row_drop_possible (a_drag_dest: POINTER; -- GtkTreeDragDest*
													  a_dest_path: POINTER; -- GtkTreePath *
													  a_selection_data: POINTER; -- GtkSelectionData
													  ): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_set_row_drag_data (a_selection_data: POINTER; -- GtkSelectionData*
										 a_tree_model: POINTER; -- GtkTreeModel*
										 a_path: POINTER; -- GtkTreePath*
										 ): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tree_get_row_drag_data (a_selection_data: POINTER; -- GtkSelectionData
										 a_tree_model_handle: POINTER -- GtkTreeModel **
										 a_path_handle: POINTER -- GtkTreePath **path
										 ): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	-- GtkTreeDragSource
	
	-- typedef struct _GtkTreeDragSource GtkTreeDragSource;

	-- GtkTreeDragSourceIface

	-- typedef struct {
	--   GTypeInterface g_iface;

	--   /* VTable - not signals */

	--   gboolean     (* row_draggable)        (GtkTreeDragSource   *drag_source,
	-- 													  GtkTreePath         *path);

	--   gboolean     (* drag_data_get)        (GtkTreeDragSource   *drag_source,
	-- 													  GtkTreePath         *path,
	-- 													  GtkSelectionData    *selection_data);

	--   gboolean     (* drag_data_delete)     (GtkTreeDragSource *drag_source,
	-- 													  GtkTreePath       *path);
	-- } GtkTreeDragSourceIface;

end
