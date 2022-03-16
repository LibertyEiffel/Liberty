note
	description: "GtkTreeView A widget for displaying both trees and lists."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

class GTK_TREE_VIEW
inherit
	GTK_CONTAINER

		-- GtkTreeView implements AtkImplementorIface.
insert
	GTK_TREE_VIEW_EXTERNALS
	GTK_TREE_VIEW_DROP_POSITION

create {ANY} make, with_model, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkTreeView widget.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_tree_view_new)
		end

	with_model (a_model: GTK_TREE_MODEL)
			-- Creates a new GtkTreeView widget with the model initialized to `a_model'.
		require
			gtk_initialized: gtk.is_initialized
			valid_model: a_model /= Void
		do
			from_external_pointer (gtk_tree_view_new_with_model (a_model.handle))
		end

feature {ANY}
	model: GTK_TREE_MODEL
			-- The model the GtkTreeView is based on. Void if the model
			-- is unset.
		local model_factory: G_OBJECT_EXPANDED_FACTORY [GTK_TREE_MODEL]
		do
			Result := model_factory.wrapper_or_void(gtk_tree_view_get_model (handle))
		end

	set_model (a_model: GTK_TREE_MODEL)
			-- Sets the model for a GtkTreeView. If the tree view already
			-- has a model set, it will remove it before setting the new
			-- model. 
		require valid_model: a_model /= Void
		do
			gtk_tree_view_set_model (handle, a_model.handle)
		end

	unset_model
			-- Unset the old model.
		do
			gtk_tree_view_set_model (handle, default_pointer)
		end

feature {ANY}
	selection: GTK_TREE_SELECTION
			-- the GtkTreeSelection associated with tree view.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_TREE_SELECTION]
		do
			Result := factory.wrapper(gtk_tree_view_get_selection (handle))
		end

	hadjustment: GTK_ADJUSTMENT
			-- the GtkAdjustment currently being used for the horizontal
			-- aspect or Void if none is currently being used.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_ADJUSTMENT]
		do
			Result := factory.wrapper(gtk_tree_view_get_hadjustment (handle))
		end

	set_hadjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Sets the GtkAdjustment for the current orizontal aspect.
		require valid_adjustment: an_adjustment/=Void
		do
			gtk_tree_view_set_hadjustment   (handle, an_adjustment.handle)
		end
	
	unset_hadjustment
			-- Unsets the GtkAdjustment for the current orizontal aspect.
		do
			gtk_tree_view_set_hadjustment   (handle, default_pointer)
		end
	

	vadjustment: GTK_ADJUSTMENT
			-- Gets the GtkAdjustment currently being used for the
			-- vertical aspect or Void if none is currently being used.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_ADJUSTMENT]
		do
			Result := factory.wrapper(gtk_tree_view_get_vadjustment (handle))
		end

	set_vadjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Sets the GtkAdjustment for the current vertical aspect.
		require valid_adjustment: an_adjustment/=Void
		do
			gtk_tree_view_set_vadjustment   (handle, an_adjustment.handle)
		end
	
	unset_vadjustment
			-- Unsets the GtkAdjustment for the current vertical aspect.
		do
			gtk_tree_view_set_vadjustment   (handle, default_pointer)
		end
	
	are_headers_visible: BOOLEAN
			-- Are the headers on the tree view visible?
		do
			Result := gtk_tree_view_get_headers_visible(handle).to_boolean
		end

	set_headers_visible
			-- Makes the headers are visible
		do
			gtk_tree_view_set_headers_visible (handle,1)
		ensure are_headers_visible
		end

	set_headers_invisible
			-- Makes the headers are invisible
		do
			gtk_tree_view_set_headers_visible (handle,0)
		ensure not are_headers_visible
		end

	columns_autosize
			-- Resizes all columns to their optimal width. Only works
			-- after the treeview has been realized.
		do
			gtk_tree_view_columns_autosize  (handle)
		end

	set_headers_clickable
			-- Allow the column title buttons to be clicked.
		do
			gtk_tree_view_set_headers_clickable (handle,1)
		end

	set_headers_unclickable
			-- Forbid the column title buttons to be clicked.
		do
			gtk_tree_view_set_headers_clickable (handle,0)
		end

	--TODO: set_rules_hint ()

	-- void        gtk_tree_view_set_rules_hint    (GtkTreeView *tree_view,
	--                                              gboolean setting);
	
	-- This function tells GTK+ that the user interface for your
	-- application requires users to read across tree rows and
	-- associate cells with one another. By default, GTK+ will then
	-- render the tree with alternating row colors. Do not use it just
	-- because you prefer the appearance of the ruled tree; that's a
	-- question for the theme. Some themes will draw tree rows in
	-- alternating colors even when rules are turned off, and users who
	-- prefer that appearance all the time can choose those themes. You
	-- should call this function only as a semantic hint to the theme
	-- engine that your tree makes alternating colors useful from a
	-- functional standpoint (since it has lots of columns, generally).

	-- tree_view : 	a GtkTreeView
	-- setting : 	TRUE if the tree requires reading across rows

	-- TODO: gtk_tree_view_get_rules_hint ()

	-- gboolean    gtk_tree_view_get_rules_hint    (GtkTreeView *tree_view);
	
	-- Gets the setting set by gtk_tree_view_set_rules_hint().
	
	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if rules are useful for the user of this tree

	columns_number: INTEGER
			-- Number of columns of Current GTK_TREE_VIEW
	
	append_column (a_column: GTK_TREE_VIEW_COLUMN)
			-- Appends column to the list of columns. If tree view has
			-- "fixed_height" mode enabled, then column must have its
			-- "sizing" property set to be GTK_TREE_VIEW_COLUMN_FIXED.
		require
			valid_column: a_column/=Void
			-- TODO: fixed_height_requirements: is_height_fixed implies a_column.is_sizing_fixed
		do
			columns_number := gtk_tree_view_append_column (handle, a_column.handle)
		end

	remove_column  (a_column: GTK_TREE_VIEW_COLUMN)
			-- Removes `a_column' from tree view.
		require
			valid_column: a_column/=Void
		do
			columns_number := gtk_tree_view_remove_column (handle, a_column.handle)
		end

	insert_column (a_column: GTK_TREE_VIEW_COLUMN; a_position: INTEGER)
			-- This inserts `a_column' into the tree view at `a_position'. If
			-- position is -1, then the column is inserted at the end. If
			-- tree_view has "fixed_height" mode enabled, then column
			-- must have its "sizing" property set to be
			-- GTK_TREE_VIEW_COLUMN_FIXED.
		require
			valid_column: a_column /= Void
			valid_position: a_position >= -1
		do
			columns_number := gtk_tree_view_insert_column (handle,a_column.handle,a_position)
		end
	
	-- Note: gtk_tree_view_insert_column_with_attributes () unwrappable since variadic.
	
	-- TODO: Provide a feature equivalent to gtk_tree_view_insert_column_with_attributes
	
	-- gint        gtk_tree_view_insert_column_with_attributes
	--                                             (GtkTreeView *tree_view,
	--                                              gint position,
	--                                              const gchar *title,
	--                                              GtkCellRenderer *cell,
	--                                              ...);
	
	-- Creates a new GtkTreeViewColumn and inserts it into the tree_view at position. If position is -1, then the newly created column is inserted at the end. The column is initialized with the attributes given. If tree_view has "fixed_height" mode enabled, then column must have its sizing property set to be GTK_TREE_VIEW_COLUMN_FIXED.
	
	-- tree_view : 	A GtkTreeView
	-- position : 	The position to insert the new column in.
	-- title : 	The title to set the header to.
	-- cell : 	The GtkCellRenderer.
	-- ... : 	A NULL-terminated list of attributes.
	-- Returns : 	The number of columns in tree_view after insertion.

	-- TODO wrap gtk_tree_view_insert_column_with_data_func ()
	
	-- gint gtk_tree_view_insert_column_with_data_func (GtkTreeView
	-- *tree_view, gint position, const gchar *title, GtkCellRenderer
	-- *cell, GtkTreeCellDataFunc func, gpointer data, GDestroyNotify
	-- dnotify);

	-- Convenience function that inserts a new column into the
	-- GtkTreeView with the given cell renderer and a GtkCellDataFunc
	-- to set cell renderer attributes (normally using data from the
	-- model). See also gtk_tree_view_column_set_cell_data_func(),
	-- gtk_tree_view_column_pack_start(). If tree_view has
	-- "fixed_height" mode enabled, then column must have its "sizing"
	-- property set to be GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	a GtkTreeView
	-- position : 	Position to insert, -1 for append
	-- title : 	column title
	-- cell : 	cell renderer for column
	-- func : 	function to set attributes of cell renderer
	-- data : 	data for func
	-- dnotify : 	destroy notifier for data
	-- Returns : 	number of columns in the tree view post-insert
	
	column (a_position: INTEGER): GTK_TREE_VIEW_COLUMN
			-- the GtkTreeViewColumn at the given `a_position' in the tree view.
		require valid_number: a_position.in_range(0,columns.count)
		local ptr: POINTER
		do
			create Result.from_external_pointer (gtk_tree_view_get_column (handle, a_position))
		end

	columns: G_LIST[GTK_TREE_VIEW_COLUMN]
			-- a GList of all the GtkTreeViewColumn s currently in tree view.
		do
			create {G_OBJECT_LIST[GTK_TREE_VIEW_COLUMN]}
			Result.from_external_pointer(gtk_tree_view_get_columns(handle))
			-- Note: The returned list must be freed with g_list_free().
		end

	move_column_after (a_column, a_base: GTK_TREE_VIEW_COLUMN)
			-- Moves `a_column' to be after to `a_base' column. If
			-- `a_base' is Void, then column is placed in the first
			-- position.
		require valid_column: a_column/=Void
		do
			if a_base /= Void then
				gtk_tree_view_move_column_after (handle, a_column.handle, a_base.handle)
			else
				gtk_tree_view_move_column_after (handle, a_column.handle, default_pointer)
			end
		end

	set_expander_column (a_column: GTK_TREE_VIEW_COLUMN)
			-- Sets the column to draw the expander arrow at. It must be
			-- in tree view. If `a_column' is Void, then the expander
			-- arrow is always at the first visible column.

			-- If you do not want expander arrow to appear in your tree,
			-- set the expander column to a hidden column.
		do
			if a_column = Void then
				gtk_tree_view_set_expander_column (handle, default_pointer)
			else
				gtk_tree_view_set_expander_column (handle, a_column.handle)
			end
		end

	expander_column: GTK_TREE_VIEW_COLUMN
			--  the column that is the current expander column. This
			--  column has the expander arrow drawn next to it.
		do
			create Result.from_external_pointer (gtk_tree_view_get_expander_column (handle))
		end
	
	-- TODO: wrap gtk_tree_view_set_column_drag_function ()

	-- void gtk_tree_view_set_column_drag_function (GtkTreeView
	-- *tree_view, GtkTreeViewColumnDropFunc func, gpointer user_data,
	-- GtkDestroyNotify destroy);

	-- Sets a user function for determining where a column may be
	-- dropped when dragged. This function is called on every column
	-- pair in turn at the beginning of a column drag to determine
	-- where a drop can take place. The arguments passed to func are:
	-- the tree_view, the GtkTreeViewColumn being dragged, the two
	-- GtkTreeViewColumn s determining the drop spot, and user_data. If
	-- either of the GtkTreeViewColumn arguments for the drop spot are
	-- NULL, then they indicate an edge. If func is set to be NULL,
	-- then tree_view reverts to the default behavior of allowing all
	-- columns to be dropped everywhere.

	-- tree_view : 	A GtkTreeView.
	-- func : 	A function to determine which columns are reorderable, or NULL.
	-- user_data : 	User data to be passed to func, or NULL
	-- destroy : 	Destroy notifier for user_data, or NULL

	scroll_to_point (an_x, an_y: INTEGER)
			-- Scrolls the tree view such that the top-left corner of the
			-- visible area is `an_x', `an_y', where `an_x' and `an_y'
			-- are specified in tree window coordinates. The tree_view
			-- must be realized before this function is called. If it
			-- isn't, you probably want to be using `scroll_to_cell'.
			
			-- If either `an_x' or `an_y' are -1, then that direction isn't scrolled.
		do
			gtk_tree_view_scroll_to_point   (handle, an_x, an_y)
		end

	scroll_to_cell (a_path: GTK_TREE_PATH; a_column: GTK_TREE_VIEW_COLUMN;
						 use_align: BOOLEAN; row_align, col_align: REAL_32)
			-- Moves the alignments of tree view to the position
			-- specified by `a_column' and `a_path'. If `a_column' is
			-- Void, then no horizontal scrolling occurs. Likewise, if
			-- `a_path' is Void no vertical scrolling occurs. At a
			-- minimum, one of `a_column' or `a_path' need to be
			-- non-Void. `row_align' determines where the row is placed,
			-- and `col_align' determines where `a_column' is
			-- placed. Both are expected to be between 0.0 and 1.0. 0.0
			-- means left/top alignment, 1.0 means right/bottom
			-- alignment, 0.5 means center.
			
			-- If `use_align' is False, then the alignment arguments are
			-- ignored, and the tree does the minimum amount of work to
			-- scroll the cell onto the screen. This means that the cell
			-- will be scrolled to the edge closest to its current
			-- position. If the cell is currently visible on the screen,
			-- nothing is done.
			
			-- This function only works if the model is set, and `a_path'
			-- is a valid row on the model. If the model changes before
			-- the tree_view is realized, the centered `a_path' will be
			-- modified to reflect this change.
			
			-- `a_path' : 	The path of the row to move to, or Void.
			-- `a_column' : 	The GtkTreeViewColumn to move horizontally to, or Void.
			-- `use_align' : 	whether to use alignment arguments, or FALSE.
			-- `row_align' : 	The vertical alignment of the row specified by path.
			-- `col_align' : 	The horizontal alignment of the column specified by column.
		require
			either_column_or_path_not_void: a_column/=Void or a_path/=Void
			valid_row_align: row_align.in_range ({REAL_32 0.0}, {REAL_32 1.0})
			valid_col_align: col_align.in_range ({REAL_32 0.0}, {REAL_32 1.0})
		local
			column_ptr, path_ptr: POINTER
		do
			if a_column /= Void then column_ptr := a_column.handle end
			if a_path /= Void then path_ptr := a_path.handle end
			
			gtk_tree_view_scroll_to_cell (handle, path_ptr, column_ptr,
													use_align.to_integer, row_align, col_align)
		end

	set_cursor (a_path: GTK_TREE_PATH; a_focus_column: GTK_TREE_VIEW_COLUMN; start_editing: BOOLEAN)
			-- Sets the current keyboard focus to be at `a_path', and
			-- selects it. This is useful when you want to focus the
			-- user's attention on a particular row. If `a_focus_column'
			-- is not Void, then focus is given to the column specified
			-- by it. Additionally, if `a_focus_column' is specified, and
			-- `start_editing' is TRUE, then editing should be started in
			-- the specified cell. This function is often followed by
			-- gtk_widget_grab_focus (tree_view) in order to give
			-- keyboard focus to the widget. Please note that editing can
			-- only happen when the widget is realized.
			
			-- `a_path' : 	A GtkTreePath
			-- `a_focus_column' : 	A GtkTreeViewColumn, or Void
			-- `start_editing' : 	TRUE if the specified cell should start being edited.
		require valid_path: a_path /= Void
		do
			if a_focus_column=Void then
				gtk_tree_view_set_cursor (handle, a_path.handle,
												  default_pointer, start_editing.to_integer)
			else
				gtk_tree_view_set_cursor (handle, a_path.handle,
												  a_focus_column.handle, start_editing.to_integer)
			end
		end

	set_cursor_on_cell (a_path: GTK_TREE_PATH; a_focus_column: GTK_TREE_VIEW_COLUMN;
							a_focus_cell: GTK_CELL_RENDERER; start_editing: BOOLEAN)
			-- Sets the current keyboard focus to be at `a_path', and selects
			-- it. This is useful when you want to focus the user's
			-- attention on a particular row. If `a_focus_column' is not
			-- Void, then focus is given to the column specified by
			-- it. If `a_focus_column' and `a_focus_cell' are not Void, and
			-- `a_focus_column' contains 2 or more editable or activatable
			-- cells, then focus is given to the cell specified by
			-- `a_focus_cell'. Additionally, if `a_focus_column' is specified,
			-- and `start_editing' is TRUE, then editing should be started
			-- in the specified cell. This function is often followed by
			-- gtk_widget_grab_focus (tree_view) in order to give
			-- keyboard focus to the widget. Please note that editing can
			-- only happen when the widget is realized.

			-- tree_view : 	A GtkTreeView
			-- `a_path' : 	A GtkTreePath
			-- `a_focus_column' : 	A GtkTreeViewColumn, or Void
			-- `a_focus_cell' : 	A GtkCellRenderer, or Void
			-- `start_editing' : 	TRUE if the specified cell should start being edited.
		require valid_path: a_path /= Void
		local column_ptr,cell_ptr: POINTER
		do
			if a_focus_column/=Void then column_ptr := a_focus_column.handle end
			if a_focus_cell/=Void then cell_ptr := a_focus_cell.handle end
			
			gtk_tree_view_set_cursor_on_cell (handle, a_path.handle, column_ptr, cell_ptr,
														 start_editing.to_integer)
		end

	cursor: TUPLE[GTK_TREE_PATH, GTK_TREE_VIEW_COLUMN]
			-- The path and focus column with the current path and focus column. If the cursor isn't currently set, then path will be Void. If no column currently has focus, then the column will be Void.
		local
			path_ptr, column_ptr: POINTER;
			a_path: GTK_TREE_PATH;
			a_column: GTK_TREE_VIEW_COLUMN
		do
			gtk_tree_view_get_cursor (handle, $path_ptr, $column_ptr)
			if path_ptr.is_not_null then  create a_path.from_external_pointer(path_ptr) end
			if column_ptr.is_not_null then create a_column.secondary_wrapper_from(column_ptr) end
			create Result.make_2 (a_path, a_column)
		ensure
			Result /= Void
			Result.first /= Void implies Result.first.is_not_null
			Result.second /= Void implies Result.second.is_not_null
		end

	row_expanded (a_path: GTK_TREE_PATH): BOOLEAN
			-- Returns True if the node pointed to by `a_path' is expanded in Current.
		require
			a_path /= Void
		do
			Result := gtk_tree_view_row_expanded (handle, a_path.handle).to_boolean
		end

	expand_row (a_path: GTK_TREE_PATH; open_all: BOOLEAN): BOOLEAN
			-- Opens the row so its children are visible.
			-- `open_all' indicates whether to recursively expand, or
			-- just expand immediate children
			-- Returns True if the row existed and had children
		require
			a_path /= Void
		do
			Result := gtk_tree_view_expand_row(handle, a_path.handle, open_all.to_integer) > 0
		end

	collapse_row (a_path: GTK_TREE_PATH): BOOLEAN
			-- Collapses a row (hides its child rows, if they exist).
			-- Returns True if the row was collapsed.
		require
			a_path /= Void
		do
			Result := gtk_tree_view_collapse_row(handle, a_path.handle) > 0
		end

	expand_all
			-- Recursively expands all nodes in the tree view.
		do
			gtk_tree_view_expand_all(handle)
		end

	collapse_all
			-- Recursively collapses all visible, expanded nodes in tree view.
		do
			gtk_tree_view_collapse_all(handle)
		end

	expand_to_path (a_path: GTK_TREE_PATH)
			-- Expands the row at `a_path'. This will also expand all parent rows of path as necessary.
			-- Since 2.2
		require
			a_path /= Void
		do
			gtk_tree_view_expand_to_path (handle, a_path.handle)
		end

	-- gtk_tree_view_map_expanded_rows ()

	-- void        gtk_tree_view_map_expanded_rows (GtkTreeView *tree_view,
	--                                              GtkTreeViewMappingFunc func,
	--                                              gpointer data);

	-- Calls func on all expanded rows.

	-- tree_view : 	A GtkTreeView
	-- func : 	A function to be called
	-- data : 	User data to be passed to the function.

	set_reorderable(a_reorderable: BOOLEAN)
			-- This function is a convenience function to allow you to
			-- reorder models that support the GtkDragSourceIface and the
			-- GtkDragDestIface. Both GtkTreeStore and GtkListStore support
			-- these. If `a_reorderable' is True, then the user can reorder
			-- the model by dragging and dropping rows. The developer can
			-- listen to these changes by connecting to the model's
			-- row_inserted and row_deleted signals.
			--
			-- This function does not give you any degree of control over
			-- the order.  *Any* reordering is allowed. If more control
			-- is needed, you should probably handle drag and drop manually.
		do
			gtk_tree_view_set_reorderable(handle, a_reorderable.to_integer)
		ensure
			is_reorderable = a_reorderable
		end

	is_reorderable: BOOLEAN
			-- Retrieves whether the user can reorder the tree via
			-- drag-and-drop. See set_reorderable().
			-- Returns True if the tree can be reordered.
		do
			Result := gtk_tree_view_get_reorderable(handle) > 0
		end

	row_activated (a_path: GTK_TREE_PATH; a_column: GTK_TREE_VIEW_COLUMN)
			-- Activates the cell determined by `a_path' and `a_column'.
		require
			a_path /= Void
			a_column /= Void
		do
			gtk_tree_view_row_activated (handle, a_path.handle, a_column.handle)
		end

	-- gtk_tree_view_get_path_at_pos ()

	-- gboolean    gtk_tree_view_get_path_at_pos   (GtkTreeView *tree_view,
	--                                              gint x,
	--                                              gint y,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewColumn **column,
	--                                              gint *cell_x,
	--                                              gint *cell_y);

	-- Finds the path at the point (x, y), relative to widget coordinates. That is, x and y are relative to an events coordinates. x and y must come from an event on the tree_view only where event->window == gtk_tree_view_get_bin (). It is primarily for things like popup menus. If path is non-NULL, then it will be filled with the GtkTreePath at that point. This path should be freed with gtk_tree_path_free(). If column is non-NULL, then it will be filled with the column at that point. cell_x and cell_y return the coordinates relative to the cell background (i.e. the background_area passed to gtk_cell_renderer_render()). This function is only meaningful if tree_view is realized.

	-- tree_view : 	A GtkTreeView.
	-- x : 	The x position to be identified.
	-- y : 	The y position to be identified.
	-- path : 	A pointer to a GtkTreePath pointer to be filled in, or NULL
	-- column : 	A pointer to a GtkTreeViewColumn pointer to be filled in, or NULL
	-- cell_x : 	A pointer where the X coordinate relative to the cell can be placed, or NULL
	-- cell_y : 	A pointer where the Y coordinate relative to the cell can be placed, or NULL
	-- Returns : 	TRUE if a row exists at that coordinate.
	-- gtk_tree_view_get_cell_area ()

	-- void        gtk_tree_view_get_cell_area     (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              GdkRectangle *rect);

	-- Fills the bounding rectangle in tree window coordinates for the cell at the row specified by path and the column specified by column. If path is NULL, or points to a path not currently displayed, the y and height fields of the rectangle will be filled with 0. If column is NULL, the x and width fields will be filled with 0. The sum of all cell rects does not cover the entire tree; there are extra pixels in between rows, for example. The returned rectangle is equivalent to the cell_area passed to gtk_cell_renderer_render(). This function is only valid if tree_view is realized.

	-- tree_view : 	a GtkTreeView
	-- path : 	a GtkTreePath for the row, or NULL to get only horizontal coordinates
	-- column : 	a GtkTreeViewColumn for the column, or NULL to get only vertical coordinates
	-- rect : 	rectangle to fill with cell rect
	-- gtk_tree_view_get_background_area ()

	-- void        gtk_tree_view_get_background_area
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              GdkRectangle *rect);

	-- Fills the bounding rectangle in tree window coordinates for the cell at the row specified by path and the column specified by column. If path is NULL, or points to a node not found in the tree, the y and height fields of the rectangle will be filled with 0. If column is NULL, the x and width fields will be filled with 0. The returned rectangle is equivalent to the background_area passed to gtk_cell_renderer_render(). These background areas tile to cover the entire tree window (except for the area used for header buttons). Contrast with the cell_area, returned by gtk_tree_view_get_cell_area(), which returns only the cell itself, excluding surrounding borders and the tree expander area.

	-- tree_view : 	a GtkTreeView
	-- path : 	a GtkTreePath for the row, or NULL to get only horizontal coordinates
	-- column : 	a GtkTreeViewColumn for the column, or NULL to get only vertical coordiantes
	-- rect : 	rectangle to fill with cell background rect
	-- gtk_tree_view_get_visible_rect ()

	-- void        gtk_tree_view_get_visible_rect  (GtkTreeView *tree_view,
	--                                              GdkRectangle *visible_rect);

	-- Fills visible_rect with the currently-visible region of the buffer, in tree coordinates. Convert to widget coordinates with gtk_tree_view_tree_to_widget_coords(). Tree coordinates start at 0,0 for row 0 of the tree, and cover the entire scrollable area of the tree.

	-- tree_view : 	a GtkTreeView
	-- visible_rect : 	rectangle to fill
	-- gtk_tree_view_get_visible_range ()

	-- gboolean    gtk_tree_view_get_visible_range (GtkTreeView *tree_view,
	--                                              GtkTreePath **start_path,
	--                                              GtkTreePath **end_path);

	-- Sets start_path and end_path to be the first and last visible path. Note that there may be invisible paths in between.

	-- The paths should be freed with gtk_tree_path_free() after use.

	-- tree_view : 	A GtkTreeView
	-- start_path : 	Return location for start of region, or NULL.
	-- end_path : 	Return location for end of region, or NULL.
	-- Returns : 	TRUE, if valid paths were placed in start_path and end_path.

	-- Since 2.8
	-- gtk_tree_view_get_bin_window ()

	-- GdkWindow*  gtk_tree_view_get_bin_window    (GtkTreeView *tree_view);

	-- Returns the window that tree_view renders to. This is used primarily to compare to event->window to confirm that the event on tree_view is on the right window.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	A GdkWindow, or NULL when tree_view hasn't been realized yet
	-- gtk_tree_view_widget_to_tree_coords ()

	-- void        gtk_tree_view_widget_to_tree_coords
	--                                             (GtkTreeView *tree_view,
	--                                              gint wx,
	--                                              gint wy,
	--                                              gint *tx,
	--                                              gint *ty);

	-- Converts widget coordinates to coordinates for the tree window (the full scrollable area of the tree).

	-- tree_view : 	a GtkTreeView
	-- wx : 	widget X coordinate
	-- wy : 	widget Y coordinate
	-- tx : 	return location for tree X coordinate
	-- ty : 	return location for tree Y coordinate
	-- gtk_tree_view_tree_to_widget_coords ()

	-- void        gtk_tree_view_tree_to_widget_coords
	--                                             (GtkTreeView *tree_view,
	--                                              gint tx,
	--                                              gint ty,
	--                                              gint *wx,
	--                                              gint *wy);

	-- Converts tree coordinates (coordinates in full scrollable area of the tree) to widget coordinates.

	-- tree_view : 	a GtkTreeView
	-- tx : 	tree X coordinate
	-- ty : 	tree Y coordinate
	-- wx : 	return location for widget X coordinate
	-- wy : 	return location for widget Y coordinate
	-- gtk_tree_view_enable_model_drag_dest ()

feature {ANY} -- Drag n' Drop

	enable_model_drag_dest (a_target: GTK_TARGET_ENTRY; some_actions: INTEGER)
			-- Turns Current into a drop destination for automatic DND.
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
			gtk_tree_view_enable_model_drag_dest (handle, a_target.handle, 1, some_actions)
		end

	enable_model_drag_source (a_start_button_mask: INTEGER;
									  a_target: GTK_TARGET_ENTRY;
									  some_actions: INTEGER)
			-- Turns Current into a drag source for automatic DND.
			-- a_start_button_mask : 	Mask of allowed buttons to start drag
			-- some_targets : 	the table of targets that the drag will support
			-- n_targets : 	the number of items in targets
			-- some_actions : 	the bitmask of possible actions for a drag from this widget
		require
			is_valid_gdk_modifier_type (a_start_button_mask)
			a_target /= Void
			is_valid_gdk_drag_action (some_actions)
		do
			-- XXX: WATCH OUT! thsi implemetation allows the setting of only ONE target.
			-- In order to allow a list of them, we'd need to develop some C code so we can transform
			-- a NATIVE_ARRAY [POINTER] with the handle's of the different GTK_TARGET_ENTRY
			-- into a GtkTargetEntry *.
			-- nessa, 2006-10-30
			gtk_tree_view_enable_model_drag_source (handle, a_start_button_mask,
																 a_target.handle, 1, some_actions)
		end

	unset_rows_drag_source
			-- Undoes the effect of `enable_model_drag_source'.
		do
			gtk_tree_view_unset_rows_drag_source (handle)
		end

	unset_rows_drag_dest
			-- Undoes the effect of `enable_model_drag_dest'.
		do
			gtk_tree_view_unset_rows_drag_dest (handle)
		end

	set_drag_dest_row (a_path: GTK_TREE_PATH; a_position: INTEGER)
			-- Sets the row that is highlighted for feedback.
			-- a_path : The path of the row to highlight, or NULL.
			-- a_position : Specifies whether to drop before, after or into the row
		require
			a_path /= Void
			is_valid_gtk_tree_view_drop_position (a_position)
		do
			gtk_tree_view_set_drag_dest_row (handle, a_path.handle, a_position)
		end

	drag_dest_row: TUPLE [GTK_TREE_PATH, INTEGER]
			-- Gets information about the row that is highlighted for feedback.
			-- Returns a tuple with the location for the path of the highlighted row, or NULL;
			-- and the location for the drop position, or NULL.
		local
			a_path: GTK_TREE_PATH
			a_path_ptr: POINTER
			a_position: INTEGER
		do
			gtk_tree_view_get_drag_dest_row (handle, $a_path_ptr, $a_position);
			if a_path_ptr.is_not_null then create a_path.from_external_pointer (a_path_ptr) end
			Result := [a_path, a_position]
		ensure
			Result /= Void
			Result.first  /= Void implies is_valid_gtk_tree_view_drop_position (Result.second)
		end

	dest_row_at_pos (drag_x, drag_y: INTEGER): TUPLE [GTK_TREE_PATH, INTEGER]
			-- Determines the destination row for a given position.
			-- drag_x : 	the position to determine the destination row for
			-- drag_y : 	the position to determine the destination row for
			-- a_path : 	Return location for the path of the highlighted row, or NULL.
			-- a_position : 	Return location for the drop position, or NULL
			-- Returns : 	whether there is a row at the given position.
		local
			a_path: GTK_TREE_PATH
			a_path_ptr: POINTER
			a_position: INTEGER
			row_exists: BOOLEAN
		do
			row_exists := gtk_tree_view_get_dest_row_at_pos (handle, drag_x, drag_y, $a_path_ptr, $a_position).to_boolean
			if row_exists then create a_path.from_external_pointer (a_path_ptr) end
			Result := [a_path, a_position]
		ensure
			Result /= Void
			Result.first /= Void implies is_valid_gtk_tree_view_drop_position (Result.second)
		end

	row_drag_icon (a_path: GTK_TREE_PATH): GDK_PIXMAP
			-- Creates a GdkPixmap representation of the row at path.
			-- This image is used for a drag icon.
			-- a_path : 	a GtkTreePath in Current
			-- Returns : 	a newly-allocated pixmap of the drag icon.
		require
			a_path /= Void
		local
			c_ptr: POINTER
		do
			c_ptr := gtk_tree_view_create_row_drag_icon (handle, a_path.handle)
			create Result.from_external_pointer (c_ptr)
		end

feature {ANY} -- Search

	-- gtk_tree_view_set_enable_search ()

	-- void        gtk_tree_view_set_enable_search (GtkTreeView *tree_view,
	--                                              gboolean enable_search);

	-- If enable_search is set, then the user can type in text to search through the tree interactively (this is sometimes called "typeahead find").

	-- Note that even if this is FALSE, the user can still initiate a search using the "start-interactive-search" key binding.

	-- tree_view : 	A GtkTreeView
	-- enable_search : 	TRUE, if the user can search interactively
	-- gtk_tree_view_get_enable_search ()

	-- gboolean    gtk_tree_view_get_enable_search (GtkTreeView *tree_view);

	-- Returns whether or not the tree allows to start interactive searching by typing in text.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	whether or not to let the user search interactively
	-- gtk_tree_view_get_search_column ()

	-- gint        gtk_tree_view_get_search_column (GtkTreeView *tree_view);

	-- Gets the column searched on by the interactive search code.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	the column the interactive search code searches in.
	-- gtk_tree_view_set_search_column ()

	-- void        gtk_tree_view_set_search_column (GtkTreeView *tree_view,
	--                                              gint column);

	-- Sets column as the column where the interactive search code should search in.

	-- If the sort column is set, users can use the "start-interactive-search" key binding to bring up search popup. The enable-search property controls whether simply typing text will also start an interactive search.

	-- Note that column refers to a column of the model.

	-- tree_view : 	A GtkTreeView
	-- column : 	the column of the model to search in, or -1 to disable searching
	-- gtk_tree_view_get_search_equal_func ()

	-- GtkTreeViewSearchEqualFunc gtk_tree_view_get_search_equal_func
	--                                             (GtkTreeView *tree_view);

	-- Returns the compare function currently in use.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	the currently used compare function for the search code.
	-- gtk_tree_view_set_search_equal_func ()

	-- void        gtk_tree_view_set_search_equal_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewSearchEqualFunc search_equal_func,
	--                                              gpointer search_user_data,
	--                                              GtkDestroyNotify search_destroy);

	-- Sets the compare function for the interactive search capabilities; note that somewhat like strcmp() returning 0 for equality GtkTreeViewSearchEqualFunc returns FALSE on matches.

	-- tree_view : 	A GtkTreeView
	-- search_equal_func : 	the compare function to use during the search
	-- search_user_data : 	user data to pass to search_equal_func, or NULL
	-- search_destroy : 	Destroy notifier for search_user_data, or NULL
	-- gtk_tree_view_get_fixed_height_mode ()

	-- gboolean    gtk_tree_view_get_fixed_height_mode
	--                                             (GtkTreeView *tree_view);

	-- Returns whether fixed height mode is turned on for tree_view.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if tree_view is in fixed height mode

	-- Since 2.6
	-- gtk_tree_view_set_fixed_height_mode ()

	-- void        gtk_tree_view_set_fixed_height_mode
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean enable);

	-- Enables or disables the fixed height mode of tree_view. Fixed height mode speeds up GtkTreeView by assuming that all rows have the same height. Only enable this option if all rows are the same height and all columns are of type GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	a GtkTreeView
	-- enable : 	TRUE to enable fixed height mode

	-- Since 2.6
	-- gtk_tree_view_get_hover_selection ()

	-- gboolean    gtk_tree_view_get_hover_selection
	--                                             (GtkTreeView *tree_view);

	-- Returns whether hover selection mode is turned on for tree_view.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if tree_view is in hover selection mode

	-- Since 2.6
	-- gtk_tree_view_set_hover_selection ()

	-- void        gtk_tree_view_set_hover_selection
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean hover);

	-- Enables of disables the hover selection mode of tree_view. Hover selection makes the selected row follow the pointer. Currently, this works only for the selection modes GTK_SELECTION_SINGLE and GTK_SELECTION_BROWSE.

	-- tree_view : 	a GtkTreeView
	-- hover : 	TRUE to enable hover selection mode

	-- Since 2.6
	-- gtk_tree_view_get_hover_expand ()

	-- gboolean    gtk_tree_view_get_hover_expand  (GtkTreeView *tree_view);

	-- Returns whether hover expansion mode is turned on for tree_view.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if tree_view is in hover expansion mode

	-- Since 2.6
	-- gtk_tree_view_set_hover_expand ()

	-- void        gtk_tree_view_set_hover_expand  (GtkTreeView *tree_view,
	--                                              gboolean expand);

	-- Enables of disables the hover expansion mode of tree_view. Hover expansion makes rows expand or collaps if the pointer moves over them.

	-- tree_view : 	a GtkTreeView
	-- expand : 	TRUE to enable hover selection mode

	-- Since 2.6
	-- GtkTreeDestroyCountFunc ()

	-- void        (*GtkTreeDestroyCountFunc)      (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              gint children,
	--                                              gpointer user_data);

	-- tree_view : 	
	-- path : 	
	-- children : 	
	-- user_data : 	
	-- gtk_tree_view_set_destroy_count_func ()

	-- void        gtk_tree_view_set_destroy_count_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeDestroyCountFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- This function should almost never be used. It is meant for private use by ATK for determining the number of visible children that are removed when the user collapses a row, or a row is deleted.

	-- tree_view : 	A GtkTreeView
	-- func : 	Function to be called when a view row is destroyed, or NULL
	-- data : 	User data to be passed to func, or NULL
	-- destroy : 	Destroy notifier for data, or NULL
	-- GtkTreeViewRowSeparatorFunc ()

	-- gboolean    (*GtkTreeViewRowSeparatorFunc)  (GtkTreeModel *model,
	--                                              GtkTreeIter *iter,
	--                                              gpointer data);

	-- Function type for determining whether the row pointed to by iter should be rendered as a separator. A common way to implement this is to have a boolean column in the model, whose values the GtkTreeViewRowSeparatorFunc returns.
	-- model : 	the GtkTreeModel
	-- iter : 	a GtkTreeIter pointing at a row in model
	-- data : 	user data
	-- Returns : 	TRUE if the row is a separator
	-- gtk_tree_view_get_row_separator_func ()

	-- GtkTreeViewRowSeparatorFunc gtk_tree_view_get_row_separator_func
	--                                             (GtkTreeView *tree_view);

	-- Returns the current row separator function.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	the current row separator function.

	-- Since 2.6
	-- gtk_tree_view_set_row_separator_func ()

	-- void        gtk_tree_view_set_row_separator_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewRowSeparatorFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- Sets the row separator function, which is used to determine whether a row should be drawn as a separator. If the row separator function is NULL, no separators are drawn. This is the default value.

	-- tree_view : 	a GtkTreeView
	-- func : 	a GtkTreeViewRowSeparatorFunc
	-- data : 	user data to pass to func, or NULL
	-- destroy : 	destroy notifier for data, or NULL

	-- Since 2.6
	-- Property Details
	-- The "enable-search" property

	--   "enable-search"        gboolean              : Read / Write

	-- View allows user to search through columns interactively.

	-- Default value: TRUE
	-- The "expander-column" property

	--   "expander-column"      GtkTreeViewColumn     : Read / Write

	-- Set the column for the expander column.
	-- The "fixed-height-mode" property

	--   "fixed-height-mode"    gboolean              : Read / Write

	-- Setting the ::fixed-height-mode property to TRUE speeds up GtkTreeView by assuming that all rows have the same height. Only enable this option if all rows are the same height. Please see gtk_tree_view_set_fixed_height_mode() for more information on this option.

	-- Default value: FALSE

	-- Since 2.4
	-- The "hadjustment" property

	--   "hadjustment"          GtkAdjustment         : Read / Write

	-- Horizontal Adjustment for the widget.
	-- The "headers-clickable" property

	--   "headers-clickable"    gboolean              : Read / Write

	-- Column headers respond to click events.

	-- Default value: FALSE
	-- The "headers-visible" property

	--   "headers-visible"      gboolean              : Read / Write

	-- Show the column header buttons.

	-- Default value: TRUE
	-- The "hover-expand" property

	--   "hover-expand"         gboolean              : Read / Write

	-- Enables of disables the hover expansion mode of tree_view. Hover expansion makes rows expand or collaps if the pointer moves over them.

	-- This mode is primarily indended for treeviews in popups, e.g. in GtkComboBox or GtkEntryCompletion.

	-- Default value: FALSE

	-- Since 2.6
	-- The "hover-selection" property

	--   "hover-selection"      gboolean              : Read / Write

	-- Enables of disables the hover selection mode of tree_view. Hover selection makes the selected row follow the pointer. Currently, this works only for the selection modes GTK_SELECTION_SINGLE and GTK_SELECTION_BROWSE.

	-- This mode is primarily indended for treeviews in popups, e.g. in GtkComboBox or GtkEntryCompletion.

	-- Default value: FALSE

	-- Since 2.6
	-- The "model" property

	--   "model"                GtkTreeModel          : Read / Write

	-- The model for the tree view.
	-- The "reorderable" property

	--   "reorderable"          gboolean              : Read / Write

	-- View is reorderable.

	-- Default value: FALSE
	-- The "rules-hint" property

	--   "rules-hint"           gboolean              : Read / Write

	-- Set a hint to the theme engine to draw rows in alternating colors.

	-- Default value: FALSE
	-- The "search-column" property

	--   "search-column"        gint                  : Read / Write

	-- Model column to search through when searching through code.

	-- Allowed values: >= -1

	-- Default value: -1
	-- The "vadjustment" property

	--   "vadjustment"          GtkAdjustment         : Read / Write

	-- Vertical Adjustment for the widget.
	-- Style Property Details
	-- The "allow-rules" style property

	--   "allow-rules"          gboolean              : Read

	-- Allow drawing of alternating color rows.

	-- Default value: TRUE
	-- The "even-row-color" style property

	--   "even-row-color"       GdkColor              : Read

	-- Color to use for even rows.
	-- The "expander-size" style property

	--   "expander-size"        gint                  : Read

	-- Size of the expander arrow.

	-- Allowed values: >= 0

	-- Default value: 12
	-- The "horizontal-separator" style property

	--   "horizontal-separator" gint                  : Read

	-- Horizontal space between cells. Must be an even number.

	-- Allowed values: >= 0

	-- Default value: 2
	-- The "indent-expanders" style property

	--   "indent-expanders"     gboolean              : Read

	-- Make the expanders indented.

	-- Default value: TRUE
	-- The "odd-row-color" style property

	--   "odd-row-color"        GdkColor              : Read

	-- Color to use for odd rows.
	-- The "vertical-separator" style property

	--   "vertical-separator"   gint                  : Read

	-- Vertical space between cells. Must be an even number.

	-- Allowed values: >= 0

	-- Default value: 2
	-- Signal Details
	-- The "columns-changed" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "cursor-changed" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.

	-- The "move-cursor" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             GtkMovementStep arg1,
	--                                             gint arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	

	-- The "select-all" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "select-cursor-parent" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "select-cursor-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gboolean arg1,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "set-scroll-adjustments" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             GtkAdjustment *arg1,
	--                                             GtkAdjustment *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "start-interactive-search" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "test-collapse-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             GtkTreeIter *arg1,
	--                                             GtkTreePath *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "test-expand-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             GtkTreeIter *arg1,
	--                                             GtkTreePath *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "toggle-cursor-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	

feature {ANY} -- "unselect-all" signal
	unselect_all_signal_name: STRING is "unselect-all"
		-- "unselect-all"
		--             gboolean    user_function      (GtkTreeView *treeview,
		--                                             gpointer user_data);

	enable_on_unselect_all
			-- Connects "unselect-all" signal to `on_unselect_all' feature.
		do
			connect (Current, unselect_all_signal_name, $on_unselect_all)
		end

	on_unselect_all: INTEGER
			-- Built-in unselect-all signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_unselect_all_signal (a_function: FUNCTION[ANY, TUPLE [GTK_TREE_VIEW], BOOLEAN])
			-- treeview : 	the object which received the signal.
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : ?
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			unselect_all_callback: UNSELECT_ALL_CALLBACK
		do
			create unselect_all_callback.make
			unselect_all_callback.connect (Current, a_function)
		end

	-- GtkWidget*  gtk_tree_view_new               (void);
	-- GtkWidget*  gtk_tree_view_new_with_model    (GtkTreeModel *model);
	-- GtkTreeModel* gtk_tree_view_get_model       (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_model         (GtkTreeView *tree_view,
	--                                              GtkTreeModel *model);
	-- GtkTreeSelection* gtk_tree_view_get_selection
	--                                             (GtkTreeView *tree_view);
	-- GtkAdjustment* gtk_tree_view_get_hadjustment
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_hadjustment   (GtkTreeView *tree_view,
	--                                              GtkAdjustment *adjustment);
	-- GtkAdjustment* gtk_tree_view_get_vadjustment
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_vadjustment   (GtkTreeView *tree_view,
	--                                              GtkAdjustment *adjustment);
	-- gboolean    gtk_tree_view_get_headers_visible
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_headers_visible
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean headers_visible);
	-- void        gtk_tree_view_columns_autosize  (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_headers_clickable
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean setting);
	-- void        gtk_tree_view_set_rules_hint    (GtkTreeView *tree_view,
	--                                              gboolean setting);
	-- gboolean    gtk_tree_view_get_rules_hint    (GtkTreeView *tree_view);
	-- gint        gtk_tree_view_append_column     (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column);
	-- gint        gtk_tree_view_remove_column     (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column);
	-- gint        gtk_tree_view_insert_column     (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column,
	--                                              gint position);
	-- gint        gtk_tree_view_insert_column_with_attributes
	--                                             (GtkTreeView *tree_view,
	--                                              gint position,
	--                                              const gchar *title,
	--                                              GtkCellRenderer *cell,
	--                                              ...);
	-- gint        gtk_tree_view_insert_column_with_data_func
	--                                             (GtkTreeView *tree_view,
	--                                              gint position,
	--                                              const gchar *title,
	--                                              GtkCellRenderer *cell,
	--                                              GtkTreeCellDataFunc func,
	--                                              gpointer data,
	--                                              GDestroyNotify dnotify);
	-- GtkTreeViewColumn* gtk_tree_view_get_column (GtkTreeView *tree_view,
	--                                              gint n);
	-- GList*      gtk_tree_view_get_columns       (GtkTreeView *tree_view);
	-- void        gtk_tree_view_move_column_after (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column,
	--                                              GtkTreeViewColumn *base_column);
	-- void        gtk_tree_view_set_expander_column
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column);
	-- GtkTreeViewColumn* gtk_tree_view_get_expander_column
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_column_drag_function
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumnDropFunc func,
	--                                              gpointer user_data,
	--                                              GtkDestroyNotify destroy);
	-- void        gtk_tree_view_scroll_to_point   (GtkTreeView *tree_view,
	--                                              gint tree_x,
	--                                              gint tree_y);
	-- void        gtk_tree_view_scroll_to_cell    (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              gboolean use_align,
	--                                              gfloat row_align,
	--                                              gfloat col_align);
	-- void        gtk_tree_view_set_cursor        (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *focus_column,
	--                                              gboolean start_editing);
	-- void        gtk_tree_view_set_cursor_on_cell
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *focus_column,
	--                                              GtkCellRenderer *focus_cell,
	--                                              gboolean start_editing);
	-- void        gtk_tree_view_get_cursor        (GtkTreeView *tree_view,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewColumn **focus_column);
	-- void        gtk_tree_view_row_activated     (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column);
	-- void        gtk_tree_view_expand_all        (GtkTreeView *tree_view);
	-- void        gtk_tree_view_collapse_all      (GtkTreeView *tree_view);
	-- void        gtk_tree_view_expand_to_path    (GtkTreeView *tree_view,
	--                                              GtkTreePath *path);
	-- void        gtk_tree_view_map_expanded_rows (GtkTreeView *tree_view,
	--                                              GtkTreeViewMappingFunc func,
	--                                              gpointer data);
	-- gboolean    gtk_tree_view_row_expanded      (GtkTreeView *tree_view,
	--                                              GtkTreePath *path);
	-- void        gtk_tree_view_set_reorderable   (GtkTreeView *tree_view,
	--                                              gboolean reorderable);
	-- gboolean    gtk_tree_view_get_reorderable   (GtkTreeView *tree_view);
	-- gboolean    gtk_tree_view_get_path_at_pos   (GtkTreeView *tree_view,
	--                                              gint x,
	--                                              gint y,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewColumn **column,
	--                                              gint *cell_x,
	--                                              gint *cell_y);
	-- void        gtk_tree_view_get_cell_area     (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              GdkRectangle *rect);
	-- void        gtk_tree_view_get_background_area
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              GdkRectangle *rect);
	-- void        gtk_tree_view_get_visible_rect  (GtkTreeView *tree_view,
	--                                              GdkRectangle *visible_rect);
	-- gboolean    gtk_tree_view_get_visible_range (GtkTreeView *tree_view,
	--                                              GtkTreePath **start_path,
	--                                              GtkTreePath **end_path);
	-- GdkWindow*  gtk_tree_view_get_bin_window    (GtkTreeView *tree_view);
	-- void        gtk_tree_view_widget_to_tree_coords
	--                                             (GtkTreeView *tree_view,
	--                                              gint wx,
	--                                              gint wy,
	--                                              gint *tx,
	--                                              gint *ty);
	-- void        gtk_tree_view_tree_to_widget_coords
	--                                             (GtkTreeView *tree_view,
	--                                              gint tx,
	--                                              gint ty,
	--                                              gint *wx,
	--                                              gint *wy);
	-- void        gtk_tree_view_enable_model_drag_dest
	--                                             (GtkTreeView *tree_view,
	--                                              const GtkTargetEntry *targets,
	--                                              gint n_targets,
	--                                              GdkDragAction actions);
	-- void        gtk_tree_view_enable_model_drag_source
	--                                             (GtkTreeView *tree_view,
	--                                              GdkModifierType start_button_mask,
	--                                              const GtkTargetEntry *targets,
	--                                              gint n_targets,
	--                                              GdkDragAction actions);
	-- void        gtk_tree_view_unset_rows_drag_source
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_unset_rows_drag_dest
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_drag_dest_row (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewDropPosition pos);
	-- void        gtk_tree_view_get_drag_dest_row (GtkTreeView *tree_view,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewDropPosition *pos);
	-- gboolean    gtk_tree_view_get_dest_row_at_pos
	--                                             (GtkTreeView *tree_view,
	--                                              gint drag_x,
	--                                              gint drag_y,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewDropPosition *pos);
	-- GdkPixmap*  gtk_tree_view_create_row_drag_icon
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path);
	-- void        gtk_tree_view_set_enable_search (GtkTreeView *tree_view,
	--                                              gboolean enable_search);
	-- gboolean    gtk_tree_view_get_enable_search (GtkTreeView *tree_view);
	-- gint        gtk_tree_view_get_search_column (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_search_column (GtkTreeView *tree_view,
	--                                              gint column);
	-- GtkTreeViewSearchEqualFunc gtk_tree_view_get_search_equal_func
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_search_equal_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewSearchEqualFunc search_equal_func,
	--                                              gpointer search_user_data,
	--                                              GtkDestroyNotify search_destroy);
	-- gboolean    gtk_tree_view_get_fixed_height_mode
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_fixed_height_mode
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean enable);
	-- gboolean    gtk_tree_view_get_hover_selection
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_hover_selection
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean hover);
	-- gboolean    gtk_tree_view_get_hover_expand  (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_hover_expand  (GtkTreeView *tree_view,
	--                                              gboolean expand);
	-- void        (*GtkTreeDestroyCountFunc)      (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              gint children,
	--                                              gpointer user_data);
	-- void        gtk_tree_view_set_destroy_count_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeDestroyCountFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	-- gboolean    (*GtkTreeViewRowSeparatorFunc)  (GtkTreeModel *model,
	--                                              GtkTreeIter *iter,
	--                                              gpointer data);
	-- GtkTreeViewRowSeparatorFunc gtk_tree_view_get_row_separator_func
	--                                             (GtkTreeView *tree_view);
	-- void        gtk_tree_view_set_row_separator_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewRowSeparatorFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);



	-- Object Hierarchy

	--   GObject
	--    +----GtkObject
	--          +----GtkWidget
	--                +----GtkContainer
	--                      +----GtkTreeView

	-- Implemented Interfaces

	-- GtkTreeView implements AtkImplementorIface.
	-- Properties

	--   "enable-search"        gboolean              : Read / Write
	--   "expander-column"      GtkTreeViewColumn     : Read / Write
	--   "fixed-height-mode"    gboolean              : Read / Write
	--   "hadjustment"          GtkAdjustment         : Read / Write
	--   "headers-clickable"    gboolean              : Read / Write
	--   "headers-visible"      gboolean              : Read / Write
	--   "hover-expand"         gboolean              : Read / Write
	--   "hover-selection"      gboolean              : Read / Write
	--   "model"                GtkTreeModel          : Read / Write
	--   "reorderable"          gboolean              : Read / Write
	--   "rules-hint"           gboolean              : Read / Write
	--   "search-column"        gint                  : Read / Write
	--   "vadjustment"          GtkAdjustment         : Read / Write

	-- Style Properties

	--   "allow-rules"          gboolean              : Read
	--   "even-row-color"       GdkColor              : Read
	--   "expander-size"        gint                  : Read
	--   "horizontal-separator" gint                  : Read
	--   "indent-expanders"     gboolean              : Read
	--   "odd-row-color"        GdkColor              : Read
	--   "vertical-separator"   gint                  : Read

	-- Signals

	-- "columns-changed"
	--             void        user_function      (GtkTreeView *treeview,
	--                                             gpointer user_data);

feature {ANY} -- The "cursor_changed" signal
	-- "cursor-changed"
	--             void        user_function      (GtkTreeView *treeview,
	--                                             gpointer user_data);

	cursor_changed_signal_name: STRING is "cursor-changed"

	on_cursor_changed
			-- Built-in cursor_changed signal handler; empty by design; redefine it.
		do
		end

	enable_on_cursor_changed
			-- Connects "cursor_changed" signal to `on_cursor_changed' feature.
		do
			connect (Current, cursor_changed_signal_name, $on_cursor_changed)
		end

	connect_agent_to_cursor_changed_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_VIEW]])
		require valid_procedure: a_procedure /= Void
		local cursor_changed_callback: CURSOR_CHANGED_CALLBACK
		do
			create cursor_changed_callback.make
			cursor_changed_callback.connect (Current, a_procedure)
		end

feature {ANY} -- "expand-collapse-cursor-row"
	expand_collapse_cursor_row_signal_name: STRING is "expand-collapse-cursor-row"
			--             gboolean    user_function      (GtkTreeView *treeview,
			--                                             gboolean     arg1,
			--                                             gboolean     arg2,
			--                                             gboolean     arg3,
			--                                             gpointer user_data);

	enable_on_expand_collapse_cursor_row
			-- Connects "expand-collapse-cursor-row" signal to `on_expand_collapse_cursor_row' feature.
		do
			connect (Current, expand_collapse_cursor_row_signal_name,
									$on_expand_collapse_cursor_row)
		end

	on_expand_collapse_cursor_row: INTEGER
			-- Built-in expand-collapse-cursor-row signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_expand_collapse_cursor_row_signal (a_function: FUNCTION[ANY, TUPLE [BOOLEAN, BOOLEAN, BOOLEAN,
																												  GTK_TREE_VIEW], BOOLEAN])
			-- treeview : 	the object which received the signal.
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : ?
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			expand_collapse_cursor_row_callback: EXPAND_COLLAPSE_CURSOR_ROW_CALLBACK
		do
			create expand_collapse_cursor_row_callback.make
			expand_collapse_cursor_row_callback.connect (Current, a_function)
		end

	-- "move-cursor"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             GtkMovementStep arg1,
	--                                             gint arg2,
	--                                             gpointer user_data);

feature {ANY} -- The "row_activated" signal
	row_activated_signal_name: STRING is "row-activated"
		-- "row-activated"
		--             void        user_function      (GtkTreeView *treeview,
		--                                             GtkTreePath *arg1,
		--                                             GtkTreeViewColumn *arg2,
		--                                             gpointer user_data);

	on_row_activated
			-- Built-in row_activated signal handler; empty by design; redefine it.
		do
		end

	enable_on_row_activated
			-- Connects "row_activated" signal to `on_row_activated' feature.
		do
			connect (Current, row_activated_signal_name, $on_row_activated)
		end

	connect_agent_to_row_activated_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_PATH,
																									 GTK_TREE_VIEW_COLUMN,
																									 GTK_TREE_VIEW]])
		require valid_procedure: a_procedure /= Void
		local row_activated_callback: ROW_ACTIVATED_CALLBACK
		do
			create row_activated_callback.make
			row_activated_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "row_collapsed" signal
	row_collapsed_signal_name: STRING is "row-collapsed"
			--             void        user_function      (GtkTreeView *treeview,
			--                                             GtkTreeIter *arg1,
			--                                             GtkTreePath *arg2,
			--                                             gpointer user_data);

	on_row_collapsed
			-- Built-in row_collapsed signal handler; empty by design; redefine it.
		do
		end

	enable_on_row_collapsed
			-- Connects "row_collapsed" signal to `on_row_collapsed' feature.
		do
			connect (Current, row_collapsed_signal_name, $on_row_collapsed)
		end

	connect_agent_to_row_collapsed_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_ITER,
																									 GTK_TREE_PATH,
																									 GTK_TREE_VIEW]])
		require valid_procedure: a_procedure /= Void
		local row_collapsed_callback: ROW_COLLAPSED_CALLBACK
		do
			create row_collapsed_callback.make
			row_collapsed_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "row_expanded" signal
	row_expanded_signal_name: STRING is "row-expanded"
			--             void        user_function      (GtkTreeView *treeview,
			--                                             GtkTreeIter *arg1,
			--                                             GtkTreePath *arg2,
			--                                             gpointer user_data);

	on_row_expanded
			-- Built-in row_expanded signal handler; empty by design; redefine it.
		do
		end

	enable_on_row_expanded
			-- Connects "row_expanded" signal to `on_row_expanded' feature.
		do
			connect (Current, row_expanded_signal_name, $on_row_expanded)
		end

	connect_agent_to_row_expanded_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_ITER,
																									GTK_TREE_PATH,
																									GTK_TREE_VIEW]])
		require valid_procedure: a_procedure /= Void
		local row_expanded_callback: ROW_EXPANDED_CALLBACK
		do
			create row_expanded_callback.make
			row_expanded_callback.connect (Current, a_procedure)
		end

feature {ANY}
	-- "select-all"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             gpointer user_data);
	-- "select-cursor-parent"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             gpointer user_data);
	-- "select-cursor-row"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             gboolean arg1,
	--                                             gpointer user_data);
	-- "set-scroll-adjustments"
	--             void        user_function      (GtkTreeView *treeview,
	--                                             GtkAdjustment *arg1,
	--                                             GtkAdjustment *arg2,
	--                                             gpointer user_data);
	-- "start-interactive-search"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             gpointer user_data);
	-- "test-collapse-row"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             GtkTreeIter *arg1,
	--                                             GtkTreePath *arg2,
	--                                             gpointer user_data);
	-- "test-expand-row"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             GtkTreeIter *arg1,
	--                                             GtkTreePath *arg2,
	--                                             gpointer user_data);
	-- "toggle-cursor-row"
	--             gboolean    user_function      (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- Description

	-- Widget that displays any object that implements the GtkTreeModel interface.

	-- Please refer to the tree widget conceptual overview for an overview of all the objects and data types related to the tree widget and how they work together.
	-- Details
	-- GtkTreeView

	-- typedef struct _GtkTreeView GtkTreeView;

	-- enum GtkTreeViewDropPosition

	-- typedef enum
	-- {
	--   /* drop before/after this row */
	--   GTK_TREE_VIEW_DROP_BEFORE,
	--   GTK_TREE_VIEW_DROP_AFTER,
	--   /* drop as a child of this row (with fallback to before or after
	--    * if into is not possible)
	--    */
	--   GTK_TREE_VIEW_DROP_INTO_OR_BEFORE,
	--   GTK_TREE_VIEW_DROP_INTO_OR_AFTER
	-- } GtkTreeViewDropPosition;

	-- An enum for determining where a dropped row goes.
	-- GtkTreeViewPrivate

	-- typedef struct _GtkTreeViewPrivate GtkTreeViewPrivate;

	-- A private struct for internal use only. The definition of this structure is not publically available.
	-- GtkTreeViewColumnDropFunc ()

	-- gboolean    (*GtkTreeViewColumnDropFunc)    (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column,
	--                                              GtkTreeViewColumn *prev_column,
	--                                              GtkTreeViewColumn *next_column,
	--                                              gpointer data);

	-- Function type for determining whether column can be dropped in a particular spot (as determined by prev_column and next_column). In left to right locales, prev_column is on the left of the potential drop spot, and next_column is on the right. In right to left mode, this is reversed. This function should return TRUE if the spot is a valid drop spot. Please note that returning TRUE does not actually indicate that the column drop was made, but is meant only to indicate a possible drop spot to the user.
	-- tree_view : 	A GtkTreeView
	-- column : 	The GtkTreeViewColumn being dragged
	-- prev_column : 	A GtkTreeViewColumn on one side of column
	-- next_column : 	A GtkTreeViewColumn on the other side of column
	-- data : 	user data
	-- Returns : 	TRUE, if column can be dropped in this spot
	-- GtkTreeViewMappingFunc ()

	-- void        (*GtkTreeViewMappingFunc)       (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              gpointer user_data);

	-- Function used for gtk_tree_view_map_expanded_rows.
	-- tree_view : 	A GtkTreeView
	-- path : 	The path that's expanded
	-- user_data : 	user data
	-- GtkTreeViewSearchEqualFunc ()

	-- gboolean    (*GtkTreeViewSearchEqualFunc)   (GtkTreeModel *model,
	--                                              gint column,
	--                                              const gchar *key,
	--                                              GtkTreeIter *iter,
	--                                              gpointer search_data);

	-- A function used for checking whether a row in model matches a search key string entered by the user. Note the return value is reversed from what you would normally expect, though it has some similarity to strcmp() returning 0 for equal strings.
	-- model : 	the GtkTreeModel being searched
	-- column : 	the search column set by gtk_tree_view_set_search_column()
	-- key : 	the key string to compare with
	-- iter : 	a GtkTreeIter pointing the row of model that should be compared with key.
	-- search_data : 	user data from gtk_tree_view_set_search_equal_func()
	-- Returns : 	FALSE if the row matches, TRUE otherwise.
	-- gtk_tree_view_new ()

	-- GtkWidget*  gtk_tree_view_new               (void);

	-- Creates a new GtkTreeView widget.

	-- Returns : 	A newly created GtkTreeView widget.
	-- gtk_tree_view_new_with_model ()

	-- GtkWidget*  gtk_tree_view_new_with_model    (GtkTreeModel *model);

	-- Creates a new GtkTreeView widget with the model initialized to model.

	-- model : 	the model.
	-- Returns : 	A newly created GtkTreeView widget.
	-- gtk_tree_view_get_model ()

	-- GtkTreeModel* gtk_tree_view_get_model       (GtkTreeView *tree_view);

	-- Returns the model the GtkTreeView is based on. Returns NULL if the model is unset.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	A GtkTreeModel, or NULL if none is currently being used.
	-- gtk_tree_view_set_model ()

	-- void        gtk_tree_view_set_model         (GtkTreeView *tree_view,
	--                                              GtkTreeModel *model);

	-- Sets the model for a GtkTreeView. If the tree_view already has a model set, it will remove it before setting the new model. If model is NULL, then it will unset the old model.

	-- tree_view : 	A GtkTreeNode.
	-- model : 	The model.
	-- gtk_tree_view_get_selection ()

	-- GtkTreeSelection* gtk_tree_view_get_selection
	--                                             (GtkTreeView *tree_view);

	-- Gets the GtkTreeSelection associated with tree_view.

	-- tree_view : 	A GtkTreeView.
	-- Returns : 	A GtkTreeSelection object.
	-- gtk_tree_view_get_hadjustment ()

	-- GtkAdjustment* gtk_tree_view_get_hadjustment
	--                                             (GtkTreeView *tree_view);

	-- Gets the GtkAdjustment currently being used for the horizontal aspect.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	A GtkAdjustment object, or NULL if none is currently being used.
	-- gtk_tree_view_set_hadjustment ()

	-- void        gtk_tree_view_set_hadjustment   (GtkTreeView *tree_view,
	--                                              GtkAdjustment *adjustment);

	-- Sets the GtkAdjustment for the current horizontal aspect.

	-- tree_view : 	A GtkTreeView
	-- adjustment : 	The GtkAdjustment to set, or NULL
	-- gtk_tree_view_get_vadjustment ()

	-- GtkAdjustment* gtk_tree_view_get_vadjustment
	--                                             (GtkTreeView *tree_view);

	-- Gets the GtkAdjustment currently being used for the vertical aspect.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	A GtkAdjustment object, or NULL if none is currently being used.
	-- gtk_tree_view_set_vadjustment ()

	-- void        gtk_tree_view_set_vadjustment   (GtkTreeView *tree_view,
	--                                              GtkAdjustment *adjustment);

	-- Sets the GtkAdjustment for the current vertical aspect.

	-- tree_view : 	A GtkTreeView
	-- adjustment : 	The GtkAdjustment to set, or NULL
	-- gtk_tree_view_get_headers_visible ()

	-- gboolean    gtk_tree_view_get_headers_visible
	--                                             (GtkTreeView *tree_view);

	-- Returns TRUE if the headers on the tree_view are visible.

	-- tree_view : 	A GtkTreeView.
	-- Returns : 	Whether the headers are visible or not.
	-- gtk_tree_view_set_headers_visible ()

	-- void        gtk_tree_view_set_headers_visible
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean headers_visible);

	-- Sets the visibility state of the headers.

	-- tree_view : 	A GtkTreeView.
	-- headers_visible : 	TRUE if the headers are visible
	-- gtk_tree_view_columns_autosize ()

	-- void        gtk_tree_view_columns_autosize  (GtkTreeView *tree_view);

	-- Resizes all columns to their optimal width. Only works after the treeview has been realized.

	-- tree_view : 	A GtkTreeView.
	-- gtk_tree_view_set_headers_clickable ()

	-- void        gtk_tree_view_set_headers_clickable
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean setting);

	-- Allow the column title buttons to be clicked.

	-- tree_view : 	A GtkTreeView.
	-- setting : 	TRUE if the columns are clickable.
	-- gtk_tree_view_set_rules_hint ()

	-- void        gtk_tree_view_set_rules_hint    (GtkTreeView *tree_view,
	--                                              gboolean setting);

	-- This function tells GTK+ that the user interface for your application requires users to read across tree rows and associate cells with one another. By default, GTK+ will then render the tree with alternating row colors. Do not use it just because you prefer the appearance of the ruled tree; that's a question for the theme. Some themes will draw tree rows in alternating colors even when rules are turned off, and users who prefer that appearance all the time can choose those themes. You should call this function only as a semantic hint to the theme engine that your tree makes alternating colors useful from a functional standpoint (since it has lots of columns, generally).

	-- tree_view : 	a GtkTreeView
	-- setting : 	TRUE if the tree requires reading across rows
	-- gtk_tree_view_get_rules_hint ()

	-- gboolean    gtk_tree_view_get_rules_hint    (GtkTreeView *tree_view);

	-- Gets the setting set by gtk_tree_view_set_rules_hint().

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if rules are useful for the user of this tree
	-- gtk_tree_view_append_column ()

	-- gint        gtk_tree_view_append_column     (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column);

	-- Appends column to the list of columns. If tree_view has "fixed_height" mode enabled, then column must have its "sizing" property set to be GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	A GtkTreeView.
	-- column : 	The GtkTreeViewColumn to add.
	-- Returns : 	The number of columns in tree_view after appending.
	-- gtk_tree_view_remove_column ()

	-- gint        gtk_tree_view_remove_column     (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column);

	-- Removes column from tree_view.

	-- tree_view : 	A GtkTreeView.
	-- column : 	The GtkTreeViewColumn to remove.
	-- Returns : 	The number of columns in tree_view after removing.
	-- gtk_tree_view_insert_column ()

	-- gint        gtk_tree_view_insert_column     (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column,
	--                                              gint position);

	-- This inserts the column into the tree_view at position. If position is -1, then the column is inserted at the end. If tree_view has "fixed_height" mode enabled, then column must have its "sizing" property set to be GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	A GtkTreeView.
	-- column : 	The GtkTreeViewColumn to be inserted.
	-- position : 	The position to insert column in.
	-- Returns : 	The number of columns in tree_view after insertion.
	-- gtk_tree_view_insert_column_with_attributes ()

	-- gint        gtk_tree_view_insert_column_with_attributes
	--                                             (GtkTreeView *tree_view,
	--                                              gint position,
	--                                              const gchar *title,
	--                                              GtkCellRenderer *cell,
	--                                              ...);

	-- Creates a new GtkTreeViewColumn and inserts it into the tree_view at position. If position is -1, then the newly created column is inserted at the end. The column is initialized with the attributes given. If tree_view has "fixed_height" mode enabled, then column must have its sizing property set to be GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	A GtkTreeView
	-- position : 	The position to insert the new column in.
	-- title : 	The title to set the header to.
	-- cell : 	The GtkCellRenderer.
	-- ... : 	A NULL-terminated list of attributes.
	-- Returns : 	The number of columns in tree_view after insertion.
	-- gtk_tree_view_insert_column_with_data_func ()

	-- gint        gtk_tree_view_insert_column_with_data_func
	--                                             (GtkTreeView *tree_view,
	--                                              gint position,
	--                                              const gchar *title,
	--                                              GtkCellRenderer *cell,
	--                                              GtkTreeCellDataFunc func,
	--                                              gpointer data,
	--                                              GDestroyNotify dnotify);

	-- Convenience function that inserts a new column into the GtkTreeView with the given cell renderer and a GtkCellDataFunc to set cell renderer attributes (normally using data from the model). See also gtk_tree_view_column_set_cell_data_func(), gtk_tree_view_column_pack_start(). If tree_view has "fixed_height" mode enabled, then column must have its "sizing" property set to be GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	a GtkTreeView
	-- position : 	Position to insert, -1 for append
	-- title : 	column title
	-- cell : 	cell renderer for column
	-- func : 	function to set attributes of cell renderer
	-- data : 	data for func
	-- dnotify : 	destroy notifier for data
	-- Returns : 	number of columns in the tree view post-insert
	-- gtk_tree_view_get_column ()

	-- GtkTreeViewColumn* gtk_tree_view_get_column (GtkTreeView *tree_view,
	--                                              gint n);

	-- Gets the GtkTreeViewColumn at the given position in the tree_view.

	-- tree_view : 	A GtkTreeView.
	-- n : 	The position of the column, counting from 0.
	-- Returns : 	The GtkTreeViewColumn, or NULL if the position is outside the range of columns.
	-- gtk_tree_view_get_columns ()

	-- GList*      gtk_tree_view_get_columns       (GtkTreeView *tree_view);

	-- Returns a GList of all the GtkTreeViewColumn s currently in tree_view. The returned list must be freed with g_list_free().

	-- tree_view : 	A GtkTreeView
	-- Returns : 	A list of GtkTreeViewColumn s
	-- gtk_tree_view_move_column_after ()

	-- void        gtk_tree_view_move_column_after (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column,
	--                                              GtkTreeViewColumn *base_column);

	-- Moves column to be after to base_column. If base_column is NULL, then column is placed in the first position.

	-- tree_view : 	A GtkTreeView
	-- column : 	The GtkTreeViewColumn to be moved.
	-- base_column : 	The GtkTreeViewColumn to be moved relative to, or NULL.
	-- gtk_tree_view_set_expander_column ()

	-- void        gtk_tree_view_set_expander_column
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumn *column);

	-- Sets the column to draw the expander arrow at. It must be in tree_view. If column is NULL, then the expander arrow is always at the first visible column.

	-- If you do not want expander arrow to appear in your tree, set the expander column to a hidden column.

	-- tree_view : 	A GtkTreeView
	-- column : 	NULL, or the column to draw the expander arrow at.
	-- gtk_tree_view_get_expander_column ()

	-- GtkTreeViewColumn* gtk_tree_view_get_expander_column
	--                                             (GtkTreeView *tree_view);

	-- Returns the column that is the current expander column. This column has the expander arrow drawn next to it.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	The expander column.
	-- gtk_tree_view_set_column_drag_function ()

	-- void        gtk_tree_view_set_column_drag_function
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewColumnDropFunc func,
	--                                              gpointer user_data,
	--                                              GtkDestroyNotify destroy);

	-- Sets a user function for determining where a column may be dropped when dragged. This function is called on every column pair in turn at the beginning of a column drag to determine where a drop can take place. The arguments passed to func are: the tree_view, the GtkTreeViewColumn being dragged, the two GtkTreeViewColumn s determining the drop spot, and user_data. If either of the GtkTreeViewColumn arguments for the drop spot are NULL, then they indicate an edge. If func is set to be NULL, then tree_view reverts to the default behavior of allowing all columns to be dropped everywhere.

	-- tree_view : 	A GtkTreeView.
	-- func : 	A function to determine which columns are reorderable, or NULL.
	-- user_data : 	User data to be passed to func, or NULL
	-- destroy : 	Destroy notifier for user_data, or NULL
	-- gtk_tree_view_scroll_to_point ()

	-- void        gtk_tree_view_scroll_to_point   (GtkTreeView *tree_view,
	--                                              gint tree_x,
	--                                              gint tree_y);

	-- Scrolls the tree view such that the top-left corner of the visible area is tree_x, tree_y, where tree_x and tree_y are specified in tree window coordinates. The tree_view must be realized before this function is called. If it isn't, you probably want to be using gtk_tree_view_scroll_to_cell().

	-- If either tree_x or tree_y are -1, then that direction isn't scrolled.

	-- tree_view : 	a GtkTreeView
	-- tree_x : 	X coordinate of new top-left pixel of visible area, or -1
	-- tree_y : 	Y coordinate of new top-left pixel of visible area, or -1
	-- gtk_tree_view_scroll_to_cell ()

	-- void        gtk_tree_view_scroll_to_cell    (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              gboolean use_align,
	--                                              gfloat row_align,
	--                                              gfloat col_align);

	-- Moves the alignments of tree_view to the position specified by column and path. If column is NULL, then no horizontal scrolling occurs. Likewise, if path is NULL no vertical scrolling occurs. At a minimum, one of column or path need to be non-NULL. row_align determines where the row is placed, and col_align determines where column is placed. Both are expected to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means center.

	-- If use_align is FALSE, then the alignment arguments are ignored, and the tree does the minimum amount of work to scroll the cell onto the screen. This means that the cell will be scrolled to the edge closest to its current position. If the cell is currently visible on the screen, nothing is done.

	-- This function only works if the model is set, and path is a valid row on the model. If the model changes before the tree_view is realized, the centered path will be modified to reflect this change.

	-- tree_view : 	A GtkTreeView.
	-- path : 	The path of the row to move to, or NULL.
	-- column : 	The GtkTreeViewColumn to move horizontally to, or NULL.
	-- use_align : 	whether to use alignment arguments, or FALSE.
	-- row_align : 	The vertical alignment of the row specified by path.
	-- col_align : 	The horizontal alignment of the column specified by column.
	-- gtk_tree_view_set_cursor ()

	-- void        gtk_tree_view_set_cursor        (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *focus_column,
	--                                              gboolean start_editing);

	-- Sets the current keyboard focus to be at path, and selects it. This is useful when you want to focus the user's attention on a particular row. If focus_column is not NULL, then focus is given to the column specified by it. Additionally, if focus_column is specified, and start_editing is TRUE, then editing should be started in the specified cell. This function is often followed by gtk_widget_grab_focus (tree_view) in order to give keyboard focus to the widget. Please note that editing can only happen when the widget is realized.

	-- tree_view : 	A GtkTreeView
	-- path : 	A GtkTreePath
	-- focus_column : 	A GtkTreeViewColumn, or NULL
	-- start_editing : 	TRUE if the specified cell should start being edited.
	-- gtk_tree_view_set_cursor_on_cell ()

	-- void        gtk_tree_view_set_cursor_on_cell
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *focus_column,
	--                                              GtkCellRenderer *focus_cell,
	--                                              gboolean start_editing);

	-- Sets the current keyboard focus to be at path, and selects it. This is useful when you want to focus the user's attention on a particular row. If focus_column is not NULL, then focus is given to the column specified by it. If focus_column and focus_cell are not NULL, and focus_column contains 2 or more editable or activatable cells, then focus is given to the cell specified by focus_cell. Additionally, if focus_column is specified, and start_editing is TRUE, then editing should be started in the specified cell. This function is often followed by gtk_widget_grab_focus (tree_view) in order to give keyboard focus to the widget. Please note that editing can only happen when the widget is realized.

	-- tree_view : 	A GtkTreeView
	-- path : 	A GtkTreePath
	-- focus_column : 	A GtkTreeViewColumn, or NULL
	-- focus_cell : 	A GtkCellRenderer, or NULL
	-- start_editing : 	TRUE if the specified cell should start being edited.

	-- Since 2.2
	-- gtk_tree_view_get_cursor ()

	-- void        gtk_tree_view_get_cursor        (GtkTreeView *tree_view,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewColumn **focus_column);

	-- Fills in path and focus_column with the current path and focus column. If the cursor isn't currently set, then *path will be NULL. If no column currently has focus, then *focus_column will be NULL.

	-- The returned GtkTreePath must be freed with gtk_tree_path_free() when you are done with it.

	-- tree_view : 	A GtkTreeView
	-- path : 	A pointer to be filled with the current cursor path, or NULL
	-- focus_column : 	A pointer to be filled with the current focus column, or NULL
	-- gtk_tree_view_row_activated ()

	-- void        gtk_tree_view_row_activated     (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column);

	-- Activates the cell determined by path and column.

	-- tree_view : 	A GtkTreeView
	-- path : 	The GtkTreePath to be activated.
	-- column : 	The GtkTreeViewColumn to be activated.
	-- gtk_tree_view_expand_all ()

	-- void        gtk_tree_view_expand_all        (GtkTreeView *tree_view);

	-- Recursively expands all nodes in the tree_view.

	-- tree_view : 	A GtkTreeView.
	-- gtk_tree_view_collapse_all ()

	-- void        gtk_tree_view_collapse_all      (GtkTreeView *tree_view);

	-- Recursively collapses all visible, expanded nodes in tree_view.

	-- tree_view : 	A GtkTreeView.
	-- gtk_tree_view_expand_to_path ()

	-- void        gtk_tree_view_expand_to_path    (GtkTreeView *tree_view,
	--                                              GtkTreePath *path);

	-- Expands the row at path. This will also expand all parent rows of path as necessary.

	-- tree_view : 	A GtkTreeView.
	-- path : 	path to a row.

	-- Since 2.2
	-- gtk_tree_view_map_expanded_rows ()

	-- void        gtk_tree_view_map_expanded_rows (GtkTreeView *tree_view,
	--                                              GtkTreeViewMappingFunc func,
	--                                              gpointer data);

	-- Calls func on all expanded rows.

	-- tree_view : 	A GtkTreeView
	-- func : 	A function to be called
	-- data : 	User data to be passed to the function.
	-- gtk_tree_view_row_expanded ()

	-- gboolean    gtk_tree_view_row_expanded      (GtkTreeView *tree_view,
	--                                              GtkTreePath *path);

	-- Returns TRUE if the node pointed to by path is expanded in tree_view.

	-- tree_view : 	A GtkTreeView.
	-- path : 	A GtkTreePath to test expansion state.
	-- Returns : 	TRUE if path is expanded.
	-- gtk_tree_view_set_reorderable ()

	-- void        gtk_tree_view_set_reorderable   (GtkTreeView *tree_view,
	--                                              gboolean reorderable);

	-- This function is a convenience function to allow you to reorder models that support the GtkDragSourceIface and the GtkDragDestIface. Both GtkTreeStore and GtkListStore support these. If reorderable is TRUE, then the user can reorder the model by dragging and dropping rows. The developer can listen to these changes by connecting to the model's row_inserted and row_deleted signals.

	-- This function does not give you any degree of control over the order -- any reordering is allowed. If more control is needed, you should probably handle drag and drop manually.

	-- tree_view : 	A GtkTreeView.
	-- reorderable : 	TRUE, if the tree can be reordered.
	-- gtk_tree_view_get_reorderable ()

	-- gboolean    gtk_tree_view_get_reorderable   (GtkTreeView *tree_view);

	-- Retrieves whether the user can reorder the tree via drag-and-drop. See gtk_tree_view_set_reorderable().

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if the tree can be reordered.
	-- gtk_tree_view_get_path_at_pos ()

	-- gboolean    gtk_tree_view_get_path_at_pos   (GtkTreeView *tree_view,
	--                                              gint x,
	--                                              gint y,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewColumn **column,
	--                                              gint *cell_x,
	--                                              gint *cell_y);

	-- Finds the path at the point (x, y), relative to widget coordinates. That is, x and y are relative to an events coordinates. x and y must come from an event on the tree_view only where event->window == gtk_tree_view_get_bin (). It is primarily for things like popup menus. If path is non-NULL, then it will be filled with the GtkTreePath at that point. This path should be freed with gtk_tree_path_free(). If column is non-NULL, then it will be filled with the column at that point. cell_x and cell_y return the coordinates relative to the cell background (i.e. the background_area passed to gtk_cell_renderer_render()). This function is only meaningful if tree_view is realized.

	-- tree_view : 	A GtkTreeView.
	-- x : 	The x position to be identified.
	-- y : 	The y position to be identified.
	-- path : 	A pointer to a GtkTreePath pointer to be filled in, or NULL
	-- column : 	A pointer to a GtkTreeViewColumn pointer to be filled in, or NULL
	-- cell_x : 	A pointer where the X coordinate relative to the cell can be placed, or NULL
	-- cell_y : 	A pointer where the Y coordinate relative to the cell can be placed, or NULL
	-- Returns : 	TRUE if a row exists at that coordinate.
	-- gtk_tree_view_get_cell_area ()

	-- void        gtk_tree_view_get_cell_area     (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              GdkRectangle *rect);

	-- Fills the bounding rectangle in tree window coordinates for the cell at the row specified by path and the column specified by column. If path is NULL, or points to a path not currently displayed, the y and height fields of the rectangle will be filled with 0. If column is NULL, the x and width fields will be filled with 0. The sum of all cell rects does not cover the entire tree; there are extra pixels in between rows, for example. The returned rectangle is equivalent to the cell_area passed to gtk_cell_renderer_render(). This function is only valid if tree_view is realized.

	-- tree_view : 	a GtkTreeView
	-- path : 	a GtkTreePath for the row, or NULL to get only horizontal coordinates
	-- column : 	a GtkTreeViewColumn for the column, or NULL to get only vertical coordinates
	-- rect : 	rectangle to fill with cell rect
	-- gtk_tree_view_get_background_area ()

	-- void        gtk_tree_view_get_background_area
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewColumn *column,
	--                                              GdkRectangle *rect);

	-- Fills the bounding rectangle in tree window coordinates for the cell at the row specified by path and the column specified by column. If path is NULL, or points to a node not found in the tree, the y and height fields of the rectangle will be filled with 0. If column is NULL, the x and width fields will be filled with 0. The returned rectangle is equivalent to the background_area passed to gtk_cell_renderer_render(). These background areas tile to cover the entire tree window (except for the area used for header buttons). Contrast with the cell_area, returned by gtk_tree_view_get_cell_area(), which returns only the cell itself, excluding surrounding borders and the tree expander area.

	-- tree_view : 	a GtkTreeView
	-- path : 	a GtkTreePath for the row, or NULL to get only horizontal coordinates
	-- column : 	a GtkTreeViewColumn for the column, or NULL to get only vertical coordiantes
	-- rect : 	rectangle to fill with cell background rect
	-- gtk_tree_view_get_visible_rect ()

	-- void        gtk_tree_view_get_visible_rect  (GtkTreeView *tree_view,
	--                                              GdkRectangle *visible_rect);

	-- Fills visible_rect with the currently-visible region of the buffer, in tree coordinates. Convert to widget coordinates with gtk_tree_view_tree_to_widget_coords(). Tree coordinates start at 0,0 for row 0 of the tree, and cover the entire scrollable area of the tree.

	-- tree_view : 	a GtkTreeView
	-- visible_rect : 	rectangle to fill
	-- gtk_tree_view_get_visible_range ()

	-- gboolean    gtk_tree_view_get_visible_range (GtkTreeView *tree_view,
	--                                              GtkTreePath **start_path,
	--                                              GtkTreePath **end_path);

	-- Sets start_path and end_path to be the first and last visible path. Note that there may be invisible paths in between.

	-- The paths should be freed with gtk_tree_path_free() after use.

	-- tree_view : 	A GtkTreeView
	-- start_path : 	Return location for start of region, or NULL.
	-- end_path : 	Return location for end of region, or NULL.
	-- Returns : 	TRUE, if valid paths were placed in start_path and end_path.

	-- Since 2.8
	-- gtk_tree_view_get_bin_window ()

	-- GdkWindow*  gtk_tree_view_get_bin_window    (GtkTreeView *tree_view);

	-- Returns the window that tree_view renders to. This is used primarily to compare to event->window to confirm that the event on tree_view is on the right window.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	A GdkWindow, or NULL when tree_view hasn't been realized yet
	-- gtk_tree_view_widget_to_tree_coords ()

	-- void        gtk_tree_view_widget_to_tree_coords
	--                                             (GtkTreeView *tree_view,
	--                                              gint wx,
	--                                              gint wy,
	--                                              gint *tx,
	--                                              gint *ty);

	-- Converts widget coordinates to coordinates for the tree window (the full scrollable area of the tree).

	-- tree_view : 	a GtkTreeView
	-- wx : 	widget X coordinate
	-- wy : 	widget Y coordinate
	-- tx : 	return location for tree X coordinate
	-- ty : 	return location for tree Y coordinate
	-- gtk_tree_view_tree_to_widget_coords ()

	-- void        gtk_tree_view_tree_to_widget_coords
	--                                             (GtkTreeView *tree_view,
	--                                              gint tx,
	--                                              gint ty,
	--                                              gint *wx,
	--                                              gint *wy);

	-- Converts tree coordinates (coordinates in full scrollable area of the tree) to widget coordinates.

	-- tree_view : 	a GtkTreeView
	-- tx : 	tree X coordinate
	-- ty : 	tree Y coordinate
	-- wx : 	return location for widget X coordinate
	-- wy : 	return location for widget Y coordinate
	-- gtk_tree_view_enable_model_drag_dest ()

	-- void        gtk_tree_view_enable_model_drag_dest
	--                                             (GtkTreeView *tree_view,
	--                                              const GtkTargetEntry *targets,
	--                                              gint n_targets,
	--                                              GdkDragAction actions);

	-- Turns tree_view into a drop destination for automatic DND.

	-- tree_view : 	a GtkTreeView
	-- targets : 	the table of targets that the drag will support
	-- n_targets : 	the number of items in targets
	-- actions : 	the bitmask of possible actions for a drag from this widget
	-- gtk_tree_view_enable_model_drag_source ()

	-- void        gtk_tree_view_enable_model_drag_source
	--                                             (GtkTreeView *tree_view,
	--                                              GdkModifierType start_button_mask,
	--                                              const GtkTargetEntry *targets,
	--                                              gint n_targets,
	--                                              GdkDragAction actions);

	-- Turns tree_view into a drag source for automatic DND.

	-- tree_view : 	a GtkTreeView
	-- start_button_mask : 	Mask of allowed buttons to start drag
	-- targets : 	the table of targets that the drag will support
	-- n_targets : 	the number of items in targets
	-- actions : 	the bitmask of possible actions for a drag from this widget
	-- gtk_tree_view_unset_rows_drag_source ()

	-- void        gtk_tree_view_unset_rows_drag_source
	--                                             (GtkTreeView *tree_view);

	-- Undoes the effect of gtk_tree_view_enable_model_drag_source().

	-- tree_view : 	a GtkTreeView
	-- gtk_tree_view_unset_rows_drag_dest ()

	-- void        gtk_tree_view_unset_rows_drag_dest
	--                                             (GtkTreeView *tree_view);

	-- Undoes the effect of gtk_tree_view_enable_model_drag_dest().

	-- tree_view : 	a GtkTreeView
	-- gtk_tree_view_set_drag_dest_row ()

	-- void        gtk_tree_view_set_drag_dest_row (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              GtkTreeViewDropPosition pos);

	-- Sets the row that is highlighted for feedback.

	-- tree_view : 	a GtkTreeView
	-- path : 	The path of the row to highlight, or NULL.
	-- pos : 	Specifies whether to drop before, after or into the row
	-- gtk_tree_view_get_drag_dest_row ()

	-- void        gtk_tree_view_get_drag_dest_row (GtkTreeView *tree_view,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewDropPosition *pos);

	-- Gets information about the row that is highlighted for feedback.

	-- tree_view : 	a GtkTreeView
	-- path : 	Return location for the path of the highlighted row, or NULL.
	-- pos : 	Return location for the drop position, or NULL
	-- gtk_tree_view_get_dest_row_at_pos ()

	-- gboolean    gtk_tree_view_get_dest_row_at_pos
	--                                             (GtkTreeView *tree_view,
	--                                              gint drag_x,
	--                                              gint drag_y,
	--                                              GtkTreePath **path,
	--                                              GtkTreeViewDropPosition *pos);

	-- Determines the destination row for a given position.

	-- tree_view : 	a GtkTreeView
	-- drag_x : 	the position to determine the destination row for
	-- drag_y : 	the position to determine the destination row for
	-- path : 	Return location for the path of the highlighted row, or NULL.
	-- pos : 	Return location for the drop position, or NULL
	-- Returns : 	whether there is a row at the given position.
	-- gtk_tree_view_create_row_drag_icon ()

	-- GdkPixmap*  gtk_tree_view_create_row_drag_icon
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreePath *path);

	-- Creates a GdkPixmap representation of the row at path. This image is used for a drag icon.

	-- tree_view : 	a GtkTreeView
	-- path : 	a GtkTreePath in tree_view
	-- Returns : 	a newly-allocated pixmap of the drag icon.
	-- gtk_tree_view_set_enable_search ()

	-- void        gtk_tree_view_set_enable_search (GtkTreeView *tree_view,
	--                                              gboolean enable_search);

	-- If enable_search is set, then the user can type in text to search through the tree interactively (this is sometimes called "typeahead find").

	-- Note that even if this is FALSE, the user can still initiate a search using the "start-interactive-search" key binding.

	-- tree_view : 	A GtkTreeView
	-- enable_search : 	TRUE, if the user can search interactively
	-- gtk_tree_view_get_enable_search ()

	-- gboolean    gtk_tree_view_get_enable_search (GtkTreeView *tree_view);

	-- Returns whether or not the tree allows to start interactive searching by typing in text.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	whether or not to let the user search interactively
	-- gtk_tree_view_get_search_column ()

	-- gint        gtk_tree_view_get_search_column (GtkTreeView *tree_view);

	-- Gets the column searched on by the interactive search code.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	the column the interactive search code searches in.
	-- gtk_tree_view_set_search_column ()

	-- void        gtk_tree_view_set_search_column (GtkTreeView *tree_view,
	--                                              gint column);

	-- Sets column as the column where the interactive search code should search in.

	-- If the sort column is set, users can use the "start-interactive-search" key binding to bring up search popup. The enable-search property controls whether simply typing text will also start an interactive search.

	-- Note that column refers to a column of the model.

	-- tree_view : 	A GtkTreeView
	-- column : 	the column of the model to search in, or -1 to disable searching
	-- gtk_tree_view_get_search_equal_func ()

	-- GtkTreeViewSearchEqualFunc gtk_tree_view_get_search_equal_func
	--                                             (GtkTreeView *tree_view);

	-- Returns the compare function currently in use.

	-- tree_view : 	A GtkTreeView
	-- Returns : 	the currently used compare function for the search code.
	-- gtk_tree_view_set_search_equal_func ()

	-- void        gtk_tree_view_set_search_equal_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewSearchEqualFunc search_equal_func,
	--                                              gpointer search_user_data,
	--                                              GtkDestroyNotify search_destroy);

	-- Sets the compare function for the interactive search capabilities; note that somewhat like strcmp() returning 0 for equality GtkTreeViewSearchEqualFunc returns FALSE on matches.

	-- tree_view : 	A GtkTreeView
	-- search_equal_func : 	the compare function to use during the search
	-- search_user_data : 	user data to pass to search_equal_func, or NULL
	-- search_destroy : 	Destroy notifier for search_user_data, or NULL
	-- gtk_tree_view_get_fixed_height_mode ()

	-- gboolean    gtk_tree_view_get_fixed_height_mode
	--                                             (GtkTreeView *tree_view);

	-- Returns whether fixed height mode is turned on for tree_view.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if tree_view is in fixed height mode

	-- Since 2.6
	-- gtk_tree_view_set_fixed_height_mode ()

	-- void        gtk_tree_view_set_fixed_height_mode
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean enable);

	-- Enables or disables the fixed height mode of tree_view. Fixed height mode speeds up GtkTreeView by assuming that all rows have the same height. Only enable this option if all rows are the same height and all columns are of type GTK_TREE_VIEW_COLUMN_FIXED.

	-- tree_view : 	a GtkTreeView
	-- enable : 	TRUE to enable fixed height mode

	-- Since 2.6
	-- gtk_tree_view_get_hover_selection ()

	-- gboolean    gtk_tree_view_get_hover_selection
	--                                             (GtkTreeView *tree_view);

	-- Returns whether hover selection mode is turned on for tree_view.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if tree_view is in hover selection mode

	-- Since 2.6
	-- gtk_tree_view_set_hover_selection ()

	-- void        gtk_tree_view_set_hover_selection
	--                                             (GtkTreeView *tree_view,
	--                                              gboolean hover);

	-- Enables of disables the hover selection mode of tree_view. Hover selection makes the selected row follow the pointer. Currently, this works only for the selection modes GTK_SELECTION_SINGLE and GTK_SELECTION_BROWSE.

	-- tree_view : 	a GtkTreeView
	-- hover : 	TRUE to enable hover selection mode

	-- Since 2.6
	-- gtk_tree_view_get_hover_expand ()

	-- gboolean    gtk_tree_view_get_hover_expand  (GtkTreeView *tree_view);

	-- Returns whether hover expansion mode is turned on for tree_view.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	TRUE if tree_view is in hover expansion mode

	-- Since 2.6
	-- gtk_tree_view_set_hover_expand ()

	-- void        gtk_tree_view_set_hover_expand  (GtkTreeView *tree_view,
	--                                              gboolean expand);

	-- Enables of disables the hover expansion mode of tree_view. Hover expansion makes rows expand or collaps if the pointer moves over them.

	-- tree_view : 	a GtkTreeView
	-- expand : 	TRUE to enable hover selection mode

	-- Since 2.6
	-- GtkTreeDestroyCountFunc ()

	-- void        (*GtkTreeDestroyCountFunc)      (GtkTreeView *tree_view,
	--                                              GtkTreePath *path,
	--                                              gint children,
	--                                              gpointer user_data);

	-- tree_view : 	
	-- path : 	
	-- children : 	
	-- user_data : 	
	-- gtk_tree_view_set_destroy_count_func ()

	-- void        gtk_tree_view_set_destroy_count_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeDestroyCountFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- This function should almost never be used. It is meant for private use by ATK for determining the number of visible children that are removed when the user collapses a row, or a row is deleted.

	-- tree_view : 	A GtkTreeView
	-- func : 	Function to be called when a view row is destroyed, or NULL
	-- data : 	User data to be passed to func, or NULL
	-- destroy : 	Destroy notifier for data, or NULL
	-- GtkTreeViewRowSeparatorFunc ()

	-- gboolean    (*GtkTreeViewRowSeparatorFunc)  (GtkTreeModel *model,
	--                                              GtkTreeIter *iter,
	--                                              gpointer data);

	-- Function type for determining whether the row pointed to by iter should be rendered as a separator. A common way to implement this is to have a boolean column in the model, whose values the GtkTreeViewRowSeparatorFunc returns.
	-- model : 	the GtkTreeModel
	-- iter : 	a GtkTreeIter pointing at a row in model
	-- data : 	user data
	-- Returns : 	TRUE if the row is a separator
	-- gtk_tree_view_get_row_separator_func ()

	-- GtkTreeViewRowSeparatorFunc gtk_tree_view_get_row_separator_func
	--                                             (GtkTreeView *tree_view);

	-- Returns the current row separator function.

	-- tree_view : 	a GtkTreeView
	-- Returns : 	the current row separator function.

	-- Since 2.6
	-- gtk_tree_view_set_row_separator_func ()

	-- void        gtk_tree_view_set_row_separator_func
	--                                             (GtkTreeView *tree_view,
	--                                              GtkTreeViewRowSeparatorFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- Sets the row separator function, which is used to determine whether a row should be drawn as a separator. If the row separator function is NULL, no separators are drawn. This is the default value.

	-- tree_view : 	a GtkTreeView
	-- func : 	a GtkTreeViewRowSeparatorFunc
	-- data : 	user data to pass to func, or NULL
	-- destroy : 	destroy notifier for data, or NULL

	-- Since 2.6
	-- Property Details
	-- The "enable-search" property

	--   "enable-search"        gboolean              : Read / Write

	-- View allows user to search through columns interactively.

	-- Default value: TRUE
	-- The "expander-column" property

	--   "expander-column"      GtkTreeViewColumn     : Read / Write

	-- Set the column for the expander column.
	-- The "fixed-height-mode" property

	--   "fixed-height-mode"    gboolean              : Read / Write

	-- Setting the ::fixed-height-mode property to TRUE speeds up GtkTreeView by assuming that all rows have the same height. Only enable this option if all rows are the same height. Please see gtk_tree_view_set_fixed_height_mode() for more information on this option.

	-- Default value: FALSE

	-- Since 2.4
	-- The "hadjustment" property

	--   "hadjustment"          GtkAdjustment         : Read / Write

	-- Horizontal Adjustment for the widget.
	-- The "headers-clickable" property

	--   "headers-clickable"    gboolean              : Read / Write

	-- Column headers respond to click events.

	-- Default value: FALSE
	-- The "headers-visible" property

	--   "headers-visible"      gboolean              : Read / Write

	-- Show the column header buttons.

	-- Default value: TRUE
	-- The "hover-expand" property

	--   "hover-expand"         gboolean              : Read / Write

	-- Enables of disables the hover expansion mode of tree_view. Hover expansion makes rows expand or collaps if the pointer moves over them.

	-- This mode is primarily indended for treeviews in popups, e.g. in GtkComboBox or GtkEntryCompletion.

	-- Default value: FALSE

	-- Since 2.6
	-- The "hover-selection" property

	--   "hover-selection"      gboolean              : Read / Write

	-- Enables of disables the hover selection mode of tree_view. Hover selection makes the selected row follow the pointer. Currently, this works only for the selection modes GTK_SELECTION_SINGLE and GTK_SELECTION_BROWSE.

	-- This mode is primarily indended for treeviews in popups, e.g. in GtkComboBox or GtkEntryCompletion.

	-- Default value: FALSE

	-- Since 2.6
	-- The "model" property

	--   "model"                GtkTreeModel          : Read / Write

	-- The model for the tree view.
	-- The "reorderable" property

	--   "reorderable"          gboolean              : Read / Write

	-- View is reorderable.

	-- Default value: FALSE
	-- The "rules-hint" property

	--   "rules-hint"           gboolean              : Read / Write

	-- Set a hint to the theme engine to draw rows in alternating colors.

	-- Default value: FALSE
	-- The "search-column" property

	--   "search-column"        gint                  : Read / Write

	-- Model column to search through when searching through code.

	-- Allowed values: >= -1

	-- Default value: -1
	-- The "vadjustment" property

	--   "vadjustment"          GtkAdjustment         : Read / Write

	-- Vertical Adjustment for the widget.
	-- Style Property Details
	-- The "allow-rules" style property

	--   "allow-rules"          gboolean              : Read

	-- Allow drawing of alternating color rows.

	-- Default value: TRUE
	-- The "even-row-color" style property

	--   "even-row-color"       GdkColor              : Read

	-- Color to use for even rows.
	-- The "expander-size" style property

	--   "expander-size"        gint                  : Read

	-- Size of the expander arrow.

	-- Allowed values: >= 0

	-- Default value: 12
	-- The "horizontal-separator" style property

	--   "horizontal-separator" gint                  : Read

	-- Horizontal space between cells. Must be an even number.

	-- Allowed values: >= 0

	-- Default value: 2
	-- The "indent-expanders" style property

	--   "indent-expanders"     gboolean              : Read

	-- Make the expanders indented.

	-- Default value: TRUE
	-- The "odd-row-color" style property

	--   "odd-row-color"        GdkColor              : Read

	-- Color to use for odd rows.
	-- The "vertical-separator" style property

	--   "vertical-separator"   gint                  : Read

	-- Vertical space between cells. Must be an even number.

	-- Allowed values: >= 0

	-- Default value: 2
	-- Signal Details
	-- The "columns-changed" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "cursor-changed" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "expand-collapse-cursor-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gboolean arg1,
	--                                             gboolean arg2,
	--                                             gboolean arg3,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- arg3 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "move-cursor" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             GtkMovementStep arg1,
	--                                             gint arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "row-activated" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             GtkTreePath *arg1,
	--                                             GtkTreeViewColumn *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "select-all" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "select-cursor-parent" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "select-cursor-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gboolean arg1,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "set-scroll-adjustments" signal

	-- void        user_function                  (GtkTreeView *treeview,
	--                                             GtkAdjustment *arg1,
	--                                             GtkAdjustment *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "start-interactive-search" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "test-collapse-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             GtkTreeIter *arg1,
	--                                             GtkTreePath *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "test-expand-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             GtkTreeIter *arg1,
	--                                             GtkTreePath *arg2,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "toggle-cursor-row" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- The "unselect-all" signal

	-- gboolean    user_function                  (GtkTreeView *treeview,
	--                                             gpointer user_data);

	-- treeview : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- Returns : 	
	-- See Also

	-- GtkTreeViewColumn, GtkTreeSelection, GtkTreeDnd, GtkTreeMode, GtkTreeSortable, GtkTreeModelSort, GtkListStore, GtkTreeStore, GtkCellRenderer, GtkCellEditable, GtkCellRendererPixbuf, GtkCellRendererText, GtkCellRendererToggle
feature {ANY} -- struct size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeView)"
		end
end
