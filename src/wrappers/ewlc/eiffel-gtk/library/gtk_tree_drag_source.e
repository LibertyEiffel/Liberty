note
	description: "GtkTreeView drag-and-drop Interface for drag-and-drop support in GtkTreeView."
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

deferred class GTK_TREE_DRAG_SOURCE
	-- GTK+ supports Drag-and-Drop in tree views with a high-level and
	-- a low-level API.
	
	-- The low-level API consists of the GTK+ DND API, augmented by
	-- some treeview utility functions, wrapped into GTK_TREE_VIEW:
	-- set_drag_dest_row, get_drag_dest_row, get_dest_row_at_pos,
	-- create_row_drag_icon, _set_row_drag_data() and
	-- gtk_tree_get_row_drag_data(). This API leaves a lot of
	-- flexibility, but nothing is done automatically, and implementing
	-- advanced features like hover-to-open-rows or autoscrolling on
	-- top of this API is a lot of work.
	
	-- On the other hand, if you write to the high-level API, then all
	-- the bookkeeping of rows is done for you, as well as things like
	-- hover-to-open and auto-scroll, but your models have to implement
	-- the GtkTreeDragSource and GtkTreeDragDest interfaces.
	
inherit
	G_OBJECT
	
		-- Note: GtkTreeDragSource inherits from GInterface, but GInterface
		-- doesn't have an Eiffel wrapper now, at I suspect that the
	-- generic GInterface wouldn't even need one. Paolo 2006-05-06

	-- GtkTreeDragSource is implemented by GtkTreeModelSort,
	-- GtkTreeStore, GtkListStore and GtkTreeModelFilter.

feature {ANY}

	is_action_successful: BOOLEAN

	delete_data (a_path: GTK_TREE_PATH)
			-- Try to delete the row at `a_path', because it was moved
			-- somewhere else via drag-and-drop.
			-- `is_action_successful' will be False if the deletion
			-- fails because path no longer exists, or for some
			-- model-specific reason. Should robustly handle a path no
			-- longer found in the model!
		require valid_path: a_path /= Void
		do
			is_action_successful := (gtk_tree_drag_source_drag_data_delete (handle, a_path.handle)).to_boolean
		end

	data (a_path: GTK_TREE_PATH): GTK_SELECTION_DATA
			-- Try to fill in `a_selection_data' with a representation of
			-- the row at path. `is_action_successful' will be True
			-- if data of the required type was provided.
			-- a_selection_data.target (Note: currently unimplemented;
			-- Paolo 2006-05-05) gives the required type of the
			-- data. Should robustly handle a path no longer found in the
			-- model!

			-- `a_path' : 	row that was dragged

			-- `a_selection_data' : 	a GtkSelectionData to fill with data from the dragged row
		do
			create Result.make
			is_action_successful := (gtk_tree_drag_source_drag_data_get (handle, a_path.handle, Result.handle)).to_boolean
		end

	is_row_draggable (a_path: GTK_TREE_PATH): BOOLEAN
			-- Can `a_path' (i.e.: a particular row) be used as the
			-- source of a DND operation? If the source doesn't implement
			-- this interface, the row is assumed draggable. Note: This
			-- is a feature of GtkTreeDragSource
		do
			Result := (gtk_tree_drag_source_row_draggable (handle, a_path.handle)).to_boolean
		end

	-- TODO: understand usage and then wrap gtk_tree_set_row_drag_data ()

	-- gboolean gtk_tree_set_row_drag_data (GtkSelectionData
	-- *selection_data, GtkTreeModel *tree_model, GtkTreePath *path);
	
	-- Sets selection data of target type GTK_TREE_MODEL_ROW. Normally
	-- used in a drag_data_get handler.
	
	-- selection_data : 	some GtkSelectionData
	-- tree_model : 	a GtkTreeModel
	-- path : 	a row in tree_model
	-- Returns : 	TRUE if the GtkSelectionData had the proper target
	-- type to allow us to set a tree row

	-- TODO: understand usage and wrap gtk_tree_get_row_drag_data ()
	
	-- gboolean gtk_tree_get_row_drag_data (GtkSelectionData
	-- *selection_data, GtkTreeModel **tree_model, GtkTreePath **path);

	-- Obtains a tree_model and path from selection data of target type
	-- GTK_TREE_MODEL_ROW. Normally called from a drag_data_received
	-- handler. This function can only be used if selection_data
	-- originates from the same process that's calling this function,
	-- because a pointer to the tree model is being passed around. If
	-- you aren't in the same process, then you'll get memory
	-- corruption. In the GtkTreeDragDest drag_data_received handler,
	-- you can assume that selection data of type GTK_TREE_MODEL_ROW is
	-- in from the current process. The returned path must be freed
	-- with gtk_tree_path_free().

	-- selection_data : 	a GtkSelectionData
	-- tree_model : 	a GtkTreeModel
	-- path : 	row in tree_model
	-- Returns : 	TRUE if selection_data had target type GTK_TREE_MODEL_ROW and is
	-- 		otherwise valid

feature {} -- External calls
	
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

-- 	gtk_tree_set_row_drag_data (a_selection_data: POINTER; -- GtkSelectionData*
-- 										 a_tree_model: POINTER; -- GtkTreeModel*
-- 										 a_path: POINTER; -- GtkTreePath*
-- 										 ): INTEGER is -- gboolean
-- 		external "C use <gtk/gtk.h>"
-- 		end
	
-- 	gtk_tree_get_row_drag_data (a_selection_data: POINTER; -- GtkSelectionData
-- 										 a_tree_model_handle: POINTER -- GtkTreeModel **
-- 										 a_path_handle: POINTER -- GtkTreePath **path
-- 										 ): INTEGER is -- gboolean
-- 		external "C use <gtk/gtk.h>"
-- 		end

feature {}	-- TODO: wrap - if necessary - GtkTreeDragSourceIface
	
	-- typedef struct _GtkTreeDragSource GtkTreeDragSource;



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
