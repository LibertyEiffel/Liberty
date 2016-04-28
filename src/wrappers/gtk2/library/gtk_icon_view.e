note
	description: "GtkIconView -- A widget which displays a list of icons in a grid"
	copyright: "[
					Copyright (C) 2006 Nicolas Fafchamps <nicolas.fafchamps@gmail.com> and others
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
	date: "$Date:$"
	revision "$Revision:$"

class GTK_ICON_VIEW
		-- GtkIconView provides an alternative view on a list model.
		-- It displays the model as a grid of icons with labels.
		-- Like GtkTreeView, it allows to select one or multiple items (depending
		-- on the selection mode, see gtk_icon_view_set_selection_mode()). In
		-- addition to selection with the arrow keys, GtkIconView supports
		-- rubberband selection, which is controlled by dragging the pointer.

inherit
	GTK_CONTAINER

insert
	GTK_ICON_VIEW_EXTERNALS
	G_OBJECT_FACTORY [GTK_TREE_MODEL]
	GTK_ICON_VIEW_DROP_POSITION
	G_OBJECT_EXTERNALS

create {ANY}
	make, with_model, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new GtkIconView widget
		do
			from_external_pointer (gtk_icon_view_new)
		end

	with_model (a_model: GTK_TREE_MODEL) is
			-- Creates a new GtkIconView widget with `a_model'.
		require
			a_model /= Void
		do
			from_external_pointer (gtk_icon_view_new_with_model (a_model.handle))
		end

--             GtkIconView;
-- void        (*GtkIconViewForeachFunc)       (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              gpointer data);

feature {ANY} -- Access

	model: GTK_TREE_MODEL is
			-- the model the GtkIconView is based on. Void if the model is
			-- unset.
		do
			Result := wrapper_or_void (gtk_icon_view_get_model (handle))
		end

	text_column: INTEGER is
		do
			Result := gtk_icon_view_get_text_column (handle)
		end

	markup_column: INTEGER is
		do
			Result := gtk_icon_view_get_markup_column (handle)
		end

	pixbuf_column: INTEGER is
		do
			Result := gtk_icon_view_get_pixbuf_column (handle)
		end

feature {ANY} -- Operations

	set_model (a_model: GTK_TREE_MODEL) is
			-- Sets the model for a GtkIconView. If the Current icon view
			-- already has a model set, it will remove it before setting
			-- the new model. 
		require
			a_model /= Void
		do
			gtk_icon_view_set_model (handle, a_model.handle)
		ensure set: model = a_model
		end

	unset_model is
			-- Unset the old model.
		do
			gtk_icon_view_set_model (handle, default_pointer)
			ensure unset: model = Void
		end

	set_text_column (a_column: INTEGER) is
			-- Sets the column with text for icon_view to be `a_column'.
		require
			-- TODO: The text column must be of type G_TYPE_STRING.
		do
			gtk_icon_view_set_text_column (handle, a_column)
		end

	set_markup_column (a_column: INTEGER) is
		do
			gtk_icon_view_set_markup_column (handle, a_column)
		end

	set_pixbuf_column (a_column: INTEGER) is
		do
			gtk_icon_view_set_pixbuf_column (handle, a_column)
		end

-- GtkTreePath* gtk_icon_view_get_path_at_pos  (GtkIconView *icon_view,
--                                              gint x,
--                                              gint y);
-- gboolean    gtk_icon_view_get_item_at_pos   (GtkIconView *icon_view,
--                                              gint x,
--                                              gint y,
--                                              GtkTreePath **path,
--                                              GtkCellRenderer **cell);
-- void        gtk_icon_view_set_cursor        (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              GtkCellRenderer *cell,
--                                              gboolean start_editing);
-- gboolean    gtk_icon_view_get_cursor        (GtkIconView *icon_view,
--                                              GtkTreePath **path,
--                                              GtkCellRenderer **cell);
-- void        gtk_icon_view_selected_foreach  (GtkIconView *icon_view,
--                                              GtkIconViewForeachFunc func,
--                                              gpointer data);
-- void        gtk_icon_view_set_selection_mode
--                                             (GtkIconView *icon_view,
--                                              GtkSelectionMode mode);
-- GtkSelectionMode gtk_icon_view_get_selection_mode
--                                             (GtkIconView *icon_view);
-- void        gtk_icon_view_set_orientation   (GtkIconView *icon_view,
--                                              GtkOrientation orientation);
-- GtkOrientation gtk_icon_view_get_orientation
--                                             (GtkIconView *icon_view);
-- void        gtk_icon_view_set_columns       (GtkIconView *icon_view,
--                                              gint columns);
-- gint        gtk_icon_view_get_columns       (GtkIconView *icon_view);

-- Since 2.6
-- gtk_icon_view_set_item_width ()

-- void        gtk_icon_view_set_item_width    (GtkIconView *icon_view,
--                                              gint item_width);

	item_width: INTEGER is
			-- Returns the value of the ::item-width property.
		do
			Result := gtk_icon_view_get_item_width (handle)
		end

	set_item_width (a_width: INTEGER) is
			-- Sets the ::item-width property which specifies the width
			-- to use for each item. If it is set to -1, the icon view will
			-- automatically determine a suitable item size.
		do
			gtk_icon_view_set_item_width (handle, a_width)
		end

-- void        gtk_icon_view_set_spacing       (GtkIconView *icon_view,
--                                              gint spacing);
-- gint        gtk_icon_view_get_spacing       (GtkIconView *icon_view);
-- void        gtk_icon_view_set_row_spacing   (GtkIconView *icon_view,
--                                              gint row_spacing);
-- gint        gtk_icon_view_get_row_spacing   (GtkIconView *icon_view);
-- void        gtk_icon_view_set_column_spacing
--                                             (GtkIconView *icon_view,
--                                              gint column_spacing);
-- gint        gtk_icon_view_get_column_spacing
--                                             (GtkIconView *icon_view);
-- void        gtk_icon_view_set_margin        (GtkIconView *icon_view,
--                                              gint margin);
-- gint        gtk_icon_view_get_margin        (GtkIconView *icon_view);
-- void        gtk_icon_view_select_path       (GtkIconView *icon_view,
--                                              GtkTreePath *path);
-- void        gtk_icon_view_unselect_path     (GtkIconView *icon_view,
--                                              GtkTreePath *path);
-- gboolean    gtk_icon_view_path_is_selected  (GtkIconView *icon_view,
--                                              GtkTreePath *path);
-- GList*      gtk_icon_view_get_selected_items
--                                             (GtkIconView *icon_view);
-- void        gtk_icon_view_select_all        (GtkIconView *icon_view);
-- void        gtk_icon_view_unselect_all      (GtkIconView *icon_view);
-- void        gtk_icon_view_item_activated    (GtkIconView *icon_view,
--                                              GtkTreePath *path);
-- void        gtk_icon_view_scroll_to_path    (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              gboolean use_align,
--                                              gfloat row_align,
--                                              gfloat col_align);
-- gboolean    gtk_icon_view_get_visible_range (GtkIconView *icon_view,
--                                              GtkTreePath **start_path,
--                                              GtkTreePath **end_path);

-- enum        GtkIconViewDropPosition;
-- void        gtk_icon_view_enable_model_drag_source
--                                             (GtkIconView *icon_view,
--                                              GdkModifierType start_button_mask,
--                                              const GtkTargetEntry *targets,
--                                              gint n_targets,
--                                              GdkDragAction actions);
-- void        gtk_icon_view_enable_model_drag_dest
--                                             (GtkIconView *icon_view,
--                                              const GtkTargetEntry *targets,
--                                              gint n_targets,
--                                              GdkDragAction actions);
-- void        gtk_icon_view_unset_model_drag_source
--                                             (GtkIconView *icon_view);
-- void        gtk_icon_view_unset_model_drag_dest
--                                             (GtkIconView *icon_view);
-- void        gtk_icon_view_set_reorderable   (GtkIconView *icon_view,
--                                              gboolean reorderable);
-- gboolean    gtk_icon_view_get_reorderable   (GtkIconView *icon_view);
-- void        gtk_icon_view_set_drag_dest_item
--                                             (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              GtkIconViewDropPosition pos);
-- void        gtk_icon_view_get_drag_dest_item
--                                             (GtkIconView *icon_view,
--                                              GtkTreePath **path,
--                                              GtkIconViewDropPosition *pos);
-- gboolean    gtk_icon_view_get_dest_item_at_pos
--                                             (GtkIconView *icon_view,
--                                              gint drag_x,
--                                              gint drag_y,
--                                              GtkTreePath **path,
--                                              GtkIconViewDropPosition *pos);
-- GdkPixmap*  gtk_icon_view_create_drag_icon  (GtkIconView *icon_view,
--                                              GtkTreePath *path);

-- Description

-- GtkIconViewForeachFunc ()

-- void        (*GtkIconViewForeachFunc)       (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              gpointer data);

-- A function used by gtk_icon_view_selected_foreach() to map all selected rows. It will be called on every selected row in the view.
-- icon_view : 	
-- path : 	The GtkTreePath of a selected row
-- data : 	user data
	
-- Since 2.6
-- gtk_icon_view_get_text_column ()

-- gint        gtk_icon_view_get_text_column   (GtkIconView *icon_view);

-- Returns the column with text for icon_view.

-- icon_view : 	A GtkIconView.
-- Returns : 	the text column, or -1 if it's unset.

-- Since 2.6
-- gtk_icon_view_set_markup_column ()

-- void        gtk_icon_view_set_markup_column (GtkIconView *icon_view,
--                                              gint column);

-- Sets the column with markup information for icon_view to be column. The markup column must be of type G_TYPE_STRING. If the markup column is set to something, it overrides the text column set by gtk_icon_view_set_text_column().

-- icon_view : 	A GtkIconView.
-- column : 	A column in the currently used model.

-- Since 2.6
-- gtk_icon_view_get_markup_column ()

-- gint        gtk_icon_view_get_markup_column (GtkIconView *icon_view);

-- Returns the column with markup text for icon_view.

-- icon_view : 	A GtkIconView.
-- Returns : 	the markup column, or -1 if it's unset.

-- Since 2.6
-- gtk_icon_view_set_pixbuf_column ()

-- void        gtk_icon_view_set_pixbuf_column (GtkIconView *icon_view,
--                                              gint column);

-- Sets the column with pixbufs for icon_view to be column. The pixbuf column must be of type GDK_TYPE_PIXBUF

-- icon_view : 	A GtkIconView.
-- column : 	A column in the currently used model.

-- Since 2.6
-- gtk_icon_view_get_pixbuf_column ()

-- gint        gtk_icon_view_get_pixbuf_column (GtkIconView *icon_view);

-- Returns the column with pixbufs for icon_view.

-- icon_view : 	A GtkIconView.
-- Returns : 	the pixbuf column, or -1 if it's unset.

-- Since 2.6
-- gtk_icon_view_get_path_at_pos ()

-- GtkTreePath* gtk_icon_view_get_path_at_pos  (GtkIconView *icon_view,
--                                              gint x,
--                                              gint y);

-- Finds the path at the point (x, y), relative to widget coordinates. See gtk_icon_view_get_item_at_pos(), if you are also interested in the cell at the specified position.

-- icon_view : 	A GtkIconView.
-- x : 	The x position to be identified
-- y : 	The y position to be identified
-- Returns : 	The GtkTreePath corresponding to the icon or NULL if no icon exists at that position.

-- Since 2.6

-- gtk_icon_view_get_item_at_pos ()

-- gboolean    gtk_icon_view_get_item_at_pos   (GtkIconView *icon_view,
--                                              gint x,
--                                              gint y,
--                                              GtkTreePath **path,
--                                              GtkCellRenderer **cell);

-- Finds the path at the point (x, y), relative to widget coordinates. In contrast to gtk_icon_view_get_path_at_pos(), this function also obtains the cell at the specified position. The returned path should be freed with gtk_tree_path_free().

-- icon_view : 	A GtkIconView.
-- x : 	The x position to be identified
-- y : 	The y position to be identified
-- path : 	Return location for the path, or NULL
-- cell : 	Return location for the renderer responsible for the cell at (x, y), or NULL
-- Returns : 	TRUE if an item exists at the specified position

-- Since 2.8
-- gtk_icon_view_set_cursor ()

-- void        gtk_icon_view_set_cursor        (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              GtkCellRenderer *cell,
--                                              gboolean start_editing);

-- Sets the current keyboard focus to be at path, and selects it. This is useful when you want to focus the user's attention on a particular item. If cell is not NULL, then focus is given to the cell specified by it. Additionally, if start_editing is TRUE, then editing should be started in the specified cell.

-- This function is often followed by gtk_widget_grab_focus (icon_view) in order to give keyboard focus to the widget. Please note that editing can only happen when the widget is realized.

-- icon_view : 	A GtkIconView
-- path : 	A GtkTreePath
-- cell : 	A GtkCellRenderer or NULL
-- start_editing : 	TRUE if the specified cell should start being edited.

-- Since 2.8

	cursor: TUPLE [GTK_TREE_PATH, GTK_CELL_RENDERER] is
			-- Fills in path and cell with the current cursor path and cell.
			-- If the cursor isn't currently set, then *path will be NULL.
			-- If no cell currently has focus, then *cell will be NULL.
			-- The returned GtkTreePath must be freed with gtk_successtree_path_free().
		local
			path_ptr, cell_ptr: POINTER
			res: BOOLEAN
			path: GTK_TREE_PATH
			cell: GTK_CELL_RENDERER
			cell_name: STRING
			retriever: G_OBJECT_EXPANDED_FACTORY [GTK_CELL_RENDERER]
		do
			res := gtk_icon_view_get_cursor (handle, $path_ptr, $cell_ptr).to_boolean
			
			if path_ptr.is_not_null then create path.from_external_pointer (path_ptr)
			else path := Void
			end

			cell := retriever.wrapper_or_void(cell_ptr)
			Result := [path, cell]
		end

	-- TODO:gtk_icon_view_selected_foreach ()

-- void        gtk_icon_view_selected_foreach  (GtkIconView *icon_view,
--                                              GtkIconViewForeachFunc func,
--                                              gpointer data);

-- Calls a function for each selected icon. Note that the model or selection cannot be modified from within this function.

-- icon_view : 	A GtkIconView.
-- func : 	The funcion to call for each selected icon.
-- data : 	User data to pass to the function.

-- Since 2.6
-- gtk_icon_view_set_selection_mode ()

-- void        gtk_icon_view_set_selection_mode
--                                             (GtkIconView *icon_view,
--                                              GtkSelectionMode mode);

-- Sets the selection mode of the icon_view.

-- icon_view : 	A GtkIconView.
-- mode : 	The selection mode

-- Since 2.6
-- gtk_icon_view_get_selection_mode ()

-- GtkSelectionMode gtk_icon_view_get_selection_mode
--                                             (GtkIconView *icon_view);

-- Gets the selection mode of the icon_view.

-- icon_view : 	A GtkIconView.
-- Returns : 	the current selection mode

-- Since 2.6
-- gtk_icon_view_set_orientation ()

-- void        gtk_icon_view_set_orientation   (GtkIconView *icon_view,
--                                              GtkOrientation orientation);

-- Sets the ::orientation property which determines whether the labels are drawn beside the icons instead of below.

-- icon_view : 	a GtkIconView
-- orientation : 	the relative position of texts and icons

-- Since 2.6
-- gtk_icon_view_get_orientation ()

-- GtkOrientation gtk_icon_view_get_orientation
--                                             (GtkIconView *icon_view);

-- Returns the value of the ::orientation property which determines whether the labels are drawn beside the icons instead of below.

-- icon_view : 	a GtkIconView
-- Returns : 	the relative position of texts and icons

-- Since 2.6
-- gtk_icon_view_set_columns ()

-- void        gtk_icon_view_set_columns       (GtkIconView *icon_view,
--                                              gint columns);

-- Sets the ::columns property which determines in how many columns the icons are arranged. If columns is -1, the number of columns will be chosen automatically to fill the available area.

-- icon_view : 	a GtkIconView
-- columns : 	the number of columns

-- Since 2.6
-- gtk_icon_view_get_columns ()

-- gint        gtk_icon_view_get_columns       (GtkIconView *icon_view);

-- Returns the value of the ::columns property.

-- icon_view : 	a GtkIconView
-- Returns : 	the number of columns, or -1

-- Since 2.6
-- gtk_icon_view_set_spacing ()

-- void        gtk_icon_view_set_spacing       (GtkIconView *icon_view,
--                                              gint spacing);

-- Sets the ::spacing property which specifies the space which is inserted between the cells (i.e. the icon and the text) of an item.

-- icon_view : 	a GtkIconView
-- spacing : 	the spacing

-- Since 2.6
-- gtk_icon_view_get_spacing ()

-- gint        gtk_icon_view_get_spacing       (GtkIconView *icon_view);

-- Returns the value of the ::spacing property.

-- icon_view : 	a GtkIconView
-- Returns : 	the space between cells

-- Since 2.6
-- gtk_icon_view_set_row_spacing ()

-- void        gtk_icon_view_set_row_spacing   (GtkIconView *icon_view,
--                                              gint row_spacing);

-- Sets the ::row-spacing property which specifies the space which is inserted between the rows of the icon view.

-- icon_view : 	a GtkIconView
-- row_spacing : 	the row spacing

-- Since 2.6
-- gtk_icon_view_get_row_spacing ()

-- gint        gtk_icon_view_get_row_spacing   (GtkIconView *icon_view);

-- Returns the value of the ::row-spacing property.

-- icon_view : 	a GtkIconView
-- Returns : 	the space between rows

-- Since 2.6
-- gtk_icon_view_set_column_spacing ()

-- void        gtk_icon_view_set_column_spacing
--                                             (GtkIconView *icon_view,
--                                              gint column_spacing);

-- Sets the ::column-spacing property which specifies the space which is inserted between the columns of the icon view.

-- icon_view : 	a GtkIconView
-- column_spacing : 	the column spacing

-- Since 2.6
-- gtk_icon_view_get_column_spacing ()

-- gint        gtk_icon_view_get_column_spacing
--                                             (GtkIconView *icon_view);

-- Returns the value of the ::column-spacing property.

-- icon_view : 	a GtkIconView
-- Returns : 	the space between columns

-- Since 2.6
-- gtk_icon_view_set_margin ()

-- void        gtk_icon_view_set_margin        (GtkIconView *icon_view,
--                                              gint margin);

-- Sets the ::margin property which specifies the space which is inserted at the top, bottom, left and right of the icon view.

-- icon_view : 	a GtkIconView
-- margin : 	the margin

-- Since 2.6
-- gtk_icon_view_get_margin ()

-- gint        gtk_icon_view_get_margin        (GtkIconView *icon_view);

-- Returns the value of the ::margin property.

-- icon_view : 	a GtkIconView
-- Returns : 	the space at the borders

-- Since 2.6
-- gtk_icon_view_select_path ()

-- void        gtk_icon_view_select_path       (GtkIconView *icon_view,
--                                              GtkTreePath *path);

-- Selects the row at path.

-- icon_view : 	A GtkIconView.
-- path : 	The GtkTreePath to be selected.

-- Since 2.6
-- gtk_icon_view_unselect_path ()

-- void        gtk_icon_view_unselect_path     (GtkIconView *icon_view,
--                                              GtkTreePath *path);

-- Unselects the row at path.

-- icon_view : 	A GtkIconView.
-- path : 	The GtkTreePath to be unselected.

-- Since 2.6
-- gtk_icon_view_path_is_selected ()

-- gboolean    gtk_icon_view_path_is_selected  (GtkIconView *icon_view,
--                                              GtkTreePath *path);

-- Returns TRUE if the icon pointed to by path is currently selected. If icon does not point to a valid location, FALSE is returned.

-- icon_view : 	A GtkIconView.
-- path : 	A GtkTreePath to check selection on.
-- Returns : 	TRUE if path is selected.

-- Since 2.6
-- gtk_icon_view_get_selected_items ()

-- GList*      gtk_icon_view_get_selected_items
--                                             (GtkIconView *icon_view);

-- Creates a list of paths of all selected items. Additionally, if you are planning on modifying the model after calling this function, you may want to convert the returned list into a list of GtkTreeRowReferences. To do this, you can use gtk_tree_row_reference_new().

-- To free the return value, use:

-- g_list_foreach (list, gtk_tree_path_free, NULL);
-- g_list_free (list);

-- icon_view : 	A GtkIconView.
-- Returns : 	A GList containing a GtkTreePath for each selected row.

-- Since 2.6
-- gtk_icon_view_select_all ()

-- void        gtk_icon_view_select_all        (GtkIconView *icon_view);

-- Selects all the icons. icon_view must has its selection mode set to GTK_SELECTION_MULTIPLE.

-- icon_view : 	A GtkIconView.

-- Since 2.6
-- gtk_icon_view_unselect_all ()

-- void        gtk_icon_view_unselect_all      (GtkIconView *icon_view);

-- Unselects all the icons.

-- icon_view : 	A GtkIconView.

-- Since 2.6
-- gtk_icon_view_item_activated ()

-- void        gtk_icon_view_item_activated    (GtkIconView *icon_view,
--                                              GtkTreePath *path);

-- Activates the item determined by path.

-- icon_view : 	A GtkIconView
-- path : 	The GtkTreePath to be activated

-- Since 2.6
-- gtk_icon_view_scroll_to_path ()

-- void        gtk_icon_view_scroll_to_path    (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              gboolean use_align,
--                                              gfloat row_align,
--                                              gfloat col_align);

-- Moves the alignments of icon_view to the position specified by path. row_align determines where the row is placed, and col_align determines where column is placed. Both are expected to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means center.

-- If use_align is FALSE, then the alignment arguments are ignored, and the tree does the minimum amount of work to scroll the item onto the screen. This means that the item will be scrolled to the edge closest to its current position. If the item is currently visible on the screen, nothing is done.

-- This function only works if the model is set, and path is a valid row on the model. If the model changes before the icon_view is realized, the centered path will be modified to reflect this change.

-- icon_view : 	A GtkIconView.
-- path : 	The path of the item to move to.
-- use_align : 	whether to use alignment arguments, or FALSE.
-- row_align : 	The vertical alignment of the item specified by path.
-- col_align : 	The horizontal alignment of the item specified by path.

-- Since 2.8
-- gtk_icon_view_get_visible_range ()

-- gboolean    gtk_icon_view_get_visible_range (GtkIconView *icon_view,
--                                              GtkTreePath **start_path,
--                                              GtkTreePath **end_path);

-- Sets start_path and end_path to be the first and last visible path. Note that there may be invisible paths in between.

-- Both paths should be freed with gtk_tree_path_free() after use.

-- icon_view : 	A GtkIconView
-- start_path : 	Return location for start of region, or NULL
-- end_path : 	Return location for end of region, or NULL
-- Returns : 	TRUE, if valid paths were placed in start_path and end_path

-- Since 2.8
-- enum GtkIconViewDropPosition

-- typedef enum
-- {
--   GTK_ICON_VIEW_NO_DROP,
--   GTK_ICON_VIEW_DROP_INTO,
--   GTK_ICON_VIEW_DROP_LEFT,
--   GTK_ICON_VIEW_DROP_RIGHT,
--   GTK_ICON_VIEW_DROP_ABOVE,
--   GTK_ICON_VIEW_DROP_BELOW
-- } GtkIconViewDropPosition;

	enable_model_drag_source (a_start_button_mask: INTEGER;
									  a_target: GTK_TARGET_ENTRY;
									  some_actions: INTEGER) is
			-- Turns icon_view into a drag source for automatic DND.
			-- start_button_mask : 	Mask of allowed buttons to start drag
			-- some_targets : 	the table of targets that the drag will support
			-- n_targets : 	the number of items in targets
			-- some_actions : 	the bitmask of possible actions for a drag from this widget
		require
			is_valid_gdk_modifier_type (a_start_button_mask)
			a_target /= Void
			is_valid_gdk_drag_action (some_actions)
		do
			-- XXX: WATCH OUT! this implemetation allows the setting of only ONE target.
			-- In order to allow a list of them, we'd need to develop some C code so we can transform
			-- a NATIVE_ARRAY [POINTER] with the handle's of the different GTK_TARGET_ENTRY
			-- into a GtkTargetEntry *.
			-- nessa, 2006-10-30
			gtk_icon_view_enable_model_drag_source (handle, a_start_button_mask,
																 a_target.handle, 1, some_actions)
		end

	enable_model_drag_dest (a_target: GTK_TARGET_ENTRY; some_actions: INTEGER) is
			-- Turns icon_view into a drop destination for automatic DND.
			-- some_targets : 	the table of targets that the drag will support
			-- n_targets : 	the number of items in targets
			-- some_actions : 	the bitmask of possible actions for a drag from this widget
		require
			a_target /= Void
			is_valid_gdk_drag_action (some_actions)
		do
			-- XXX: WATCH OUT! thsi implemetation allows the setting of only ONE target.
			-- In order to allow a list of them, we'd need to develop some C code so we can transform
			-- a NATIVE_ARRAY [POINTER] with the handle's of the different GTK_TARGET_ENTRY
			-- into a GtkTargetEntry *.
			-- nessa, 2006-10-30
			gtk_icon_view_enable_model_drag_dest (handle, a_target.handle, 1, some_actions)
		end

	unset_model_drag_source is
			-- Undoes the effect of `enable_model_drag_source'
		do
			gtk_icon_view_unset_model_drag_source (handle)
		end

	unset_model_drag_dest is
			-- Undoes the effect of `enable_model_drag_dest'
		do
			gtk_icon_view_unset_model_drag_dest (handle)
		end

	set_reorderable (a_boolean: BOOLEAN) is
			-- This function is a convenience function to allow you to
			-- reorder models that support the GtkTreeDragSourceIface
			-- and the GtkTreeDragDestIface. Both GtkTreeStore
			-- and GtkListStore support these. If reorderable is TRUE,
			-- then the user can reorder the model by dragging and dropping rows.
			-- The developer can listen to these changes by connecting to the
			-- model's row_inserted and row_deleted signals
			-- This function does not give you any degree of control over the order
			-- (any reordering is allowed). If more control is needed, you should
			-- probably handle drag and drop manually.
		do
			gtk_icon_view_set_reorderable (handle, a_boolean.to_integer)
		end

	reorderable: BOOLEAN is
			-- Retrieves whether the user can reorder the list via drag-and-drop.
			-- See `set_reorderable'.
		do
			Result := gtk_icon_view_get_reorderable (handle).to_boolean
		end
		
-- gtk_icon_view_set_drag_dest_item ()

-- void        gtk_icon_view_set_drag_dest_item
--                                             (GtkIconView *icon_view,
--                                              GtkTreePath *path,
--                                              GtkIconViewDropPosition pos);

-- Sets the item that is highlighted for feedback.

-- icon_view : 	a GtkIconView
-- path : 	The path of the item to highlight, or NULL.
-- pos : 	Specifies where to drop, relative to the item

-- Since 2.8
-- gtk_icon_view_get_drag_dest_item ()

-- void        gtk_icon_view_get_drag_dest_item
--                                             (GtkIconView *icon_view,
--                                              GtkTreePath **path,
--                                              GtkIconViewDropPosition *pos);

-- Gets information about the item that is highlighted for feedback.

-- icon_view : 	a GtkIconView
-- path : 	Return location for the path of the highlighted item, or NULL.
-- pos : 	Return location for the drop position, or NULL

-- Since 2.8

	dest_item_at_pos (drag_x, drag_y: INTEGER): TUPLE [GTK_TREE_PATH, INTEGER] is
			-- Determines the destination item for a given position.
			-- drag_x : 	the position to determine the destination item for
			-- drag_y : 	the position to determine the destination item for
			-- a_path : 	Return location for the path of the item, or NULL.
			-- a_position : 	Return location for the drop position, or NULL
			-- Returns : 	whether there is an item at the given position.
		local
			item_exists: BOOLEAN
			a_path: GTK_TREE_PATH
			a_path_ptr: POINTER
			a_position: INTEGER
		do
			item_exists := gtk_icon_view_get_dest_item_at_pos (handle, drag_x, drag_y, $a_path_ptr, $a_position).to_boolean
			if item_exists then
				create a_path.from_external_pointer (a_path_ptr)
			end
			Result := [a_path, a_position]
		ensure
			Result /= Void
			Result.first /= Void implies is_valid_gtk_icon_view_drop_position (Result.second)
		end

-- gtk_icon_view_create_drag_icon ()

-- GdkPixmap*  gtk_icon_view_create_drag_icon  (GtkIconView *icon_view,
--                                              GtkTreePath *path);

-- Creates a GdkPixmap representation of the item at path. This image is used for a drag icon.

-- icon_view : 	a GtkIconView
-- path : 	a GtkTreePath in icon_view
-- Returns : 	a newly-allocated pixmap of the drag icon.

	-- Since 2.8
	-- Implemented Interfaces

-- GtkIconView implements AtkImplementorIface and GtkCellLayout.
-- Properties

--   "column-spacing"       gint                  : Read / Write
--   "columns"              gint                  : Read / Write
--   "item-width"           gint                  : Read / Write
--   "margin"               gint                  : Read / Write
--   "markup-column"        gint                  : Read / Write
--   "model"                GtkTreeModel          : Read / Write
--   "orientation"          GtkOrientation        : Read / Write
--   "pixbuf-column"        gint                  : Read / Write
--   "reorderable"          gboolean              : Read / Write
--   "row-spacing"          gint                  : Read / Write
--   "selection-mode"       GtkSelectionMode      : Read / Write
--   "spacing"              gint                  : Read / Write
--   "text-column"          gint                  : Read / Write


-- Property Details
-- The "column-spacing" property

--   "column-spacing"       gint                  : Read / Write

-- Space which is inserted between grid column.

-- Allowed values: >= 0

-- Default value: 6
-- The "columns" property

--   "columns"              gint                  : Read / Write

-- The columns property contains the number of the columns in which the items should be displayed. If it is -1, the number of columns will be chosen automatically to fill the available area.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
-- The "item-width" property

--   "item-width"           gint                  : Read / Write

-- The width used for each item.

-- Allowed values: >= -1

-- Default value: -1
-- The "margin" property

--   "margin"               gint                  : Read / Write

-- Space which is inserted at the edges of the icon view.

-- Allowed values: >= 0

-- Default value: 6
-- The "markup-column" property

--   "markup-column"        gint                  : Read / Write

-- The ::markup-column property contains the number of the model column containing markup information to be displayed. The markup column must be of type G_TYPE_STRING. If this property and the :text-column property are both set to column numbers, it overrides the text column. If both are set to -1, no texts are displayed.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
-- The "model" property

--   "model"                GtkTreeModel          : Read / Write

-- The model for the icon view.
-- The "orientation" property

--   "orientation"          GtkOrientation        : Read / Write

-- How the text and icon of each item are positioned relative to each other.

-- Default value: GTK_ORIENTATION_VERTICAL
-- The "pixbuf-column" property

--   "pixbuf-column"        gint                  : Read / Write

-- The ::pixbuf-column property contains the number of the model column containing the pixbufs which are displayed. The pixbuf column must be of type GDK_TYPE_PIXBUF. Setting this property to -1 turns off the display of pixbufs.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
-- The "reorderable" property

--   "reorderable"          gboolean              : Read / Write

-- The reorderable property specifies if the items can be reordered by drag-and-drop.

-- Default value: FALSE

-- Since 2.8
-- The "row-spacing" property

--   "row-spacing"          gint                  : Read / Write

-- Space which is inserted between grid rows.

-- Allowed values: >= 0

-- Default value: 6
-- The "selection-mode" property

--   "selection-mode"       GtkSelectionMode      : Read / Write

-- The ::selection-mode property specifies the selection mode of icon view. If the mode is GTK_SELECTION_MULTIPLE, rubberband selection is enabled, for the other modes, only keyboard selection is possible.

-- Default value: GTK_SELECTION_SINGLE

-- Since 2.6
-- The "spacing" property

--   "spacing"              gint                  : Read / Write

-- Space which is inserted between cells of an item.

-- Allowed values: >= 0

-- Default value: 0
-- The "text-column" property

--   "text-column"          gint                  : Read / Write

-- The ::text-column property contains the number of the model column containing the texts which are displayed. The text column must be of type G_TYPE_STRING. If this property and the :markup-column property are both set to -1, no texts are displayed.

-- Allowed values: >= -1

-- Default value: -1

	-- Since 2.6
	
feature {ANY} -- TODO: Style Properties

--   "selection-box-alpha"  guchar                : Read
--   "selection-box-color"  GdkColor              : Read

-- Style Property Details
-- The "selection-box-alpha" style property

--   "selection-box-alpha"  guchar                : Read

-- Opacity of the selection box.

-- Default value: 64
-- The "selection-box-color" style property

--   "selection-box-color"  GdkColor              : Read

-- Color of the selection box.

feature {ANY} -- TODO: Signals

-- "activate-cursor-item"
--             gboolean    user_function      (GtkIconView *iconview,
--                                             gpointer user_data);
-- "item-activated"
--             void        user_function      (GtkIconView *iconview,
--                                             GtkTreePath *arg1,
--                                             gpointer user_data);
-- "move-cursor"
--             gboolean    user_function      (GtkIconView *iconview,
--                                             GtkMovementStep arg1,
--                                             gint arg2,
--                                             gpointer user_data);
-- "select-all"
--             void        user_function      (GtkIconView *iconview,
--                                             gpointer user_data);
-- "select-cursor-item"
--             void        user_function      (GtkIconView *iconview,
--                                             gpointer user_data);
-- "selection-changed"
--             void        user_function      (GtkIconView *iconview,
--                                             gpointer user_data);
-- "set-scroll-adjustments"
--             void        user_function      (GtkIconView *iconview,
--                                             GtkAdjustment *arg1,
--                                             GtkAdjustment *arg2,
--                                             gpointer user_data);
-- "toggle-cursor-item"
--             void        user_function      (GtkIconView *iconview,
--                                             gpointer user_data);
-- "unselect-all"
--             void        user_function      (GtkIconView *iconview,
--                                             gpointer user_data);

-- Signal Details
-- The "activate-cursor-item" signal

-- gboolean    user_function                  (GtkIconView *iconview,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "item-activated" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             GtkTreePath *arg1,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "move-cursor" signal

-- gboolean    user_function                  (GtkIconView *iconview,
--                                             GtkMovementStep arg1,
--                                             gint arg2,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "select-all" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "select-cursor-item" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "selection-changed" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "set-scroll-adjustments" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             GtkAdjustment *arg1,
--                                             GtkAdjustment *arg2,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "toggle-cursor-item" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "unselect-all" signal

-- void        user_function                  (GtkIconView *iconview,
--                                             gpointer user_data);

-- iconview : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.

feature {ANY}

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkIconView)"
		end

end -- class GTK_ICON_VIEW
