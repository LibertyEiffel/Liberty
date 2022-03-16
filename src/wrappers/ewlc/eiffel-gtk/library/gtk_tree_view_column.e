note
	description: "GtkTreeViewColumn - A visible column in a GtkTreeView widget."
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
				
class GTK_TREE_VIEW_COLUMN
	-- The GtkTreeViewColumn object represents a visible column in a
	-- GtkTreeView widget. It allows to set properties of the column
	-- header, and functions as a holding pen for the cell renderers
	-- which determine how the data in the column is displayed.

	-- Please refer to the tree widget conceptual overview for an
	-- overview of all the objects and data types related to the
	-- tree widget and how they work together.class
	-- GTK_TREE_VIEW_COLUMN_EXTERNALS

inherit
	GTK_OBJECT
	GTK_CELL_LAYOUT
		undefine store_eiffel_wrapper 
		redefine 
			clear, 
			add_attribute, clear_attributes, set_attributes,
			pack_start, pack_end
		end 

insert
	GTK_TREE_VIEW_COLUMN_EXTERNALS
	GTK_TREE_VIEW_COLUMN_SIZING
	GTK_SORT_TYPE
	
create {ANY} make, with_attributes
	
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer, secondary_wrapper_from	

feature {} -- Creation

	make
			-- Creates a new GtkTreeViewColumn.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_tree_view_column_new)
		end

	with_attributes (a_title: STRING; a_renderer: GTK_CELL_RENDERER; some_attributes: COLLECTION [TUPLE[STRING,INTEGER]])
			-- Creates a new GtkTreeViewColumn with a number of default
			-- values. This is equivalent to calling `set_title',
			-- `pack_start', and `set_attributes' on the newly created
			-- GtkTreeViewColumn.

			-- TODO: Eiffelize this:
			-- Here's a simple example:
			
			--  enum { TEXT_COLUMN, COLOR_COLUMN, N_COLUMNS };
			--  ...
			--  {
			--    GtkTreeViewColumn *column;
			--    GtkCellRenderer   *renderer = gtk_cell_renderer_text_new ();
			
			--    column = gtk_tree_view_column_new_with_attributes ("Title",
			--    renderer, "text", TEXT_COLUMN, "foreground", COLOR_COLUMN,
			--    NULL); }
		require
			gtk_initialized: gtk.is_initialized
			title_not_void: a_title /= Void
			renderer_not_void: a_renderer /= Void
		do
			make
			set_title (a_title)
			pack_start(a_renderer, True)
			set_attributes (a_renderer, some_attributes)
		end

feature {ANY}
	pack_start (a_cell: GTK_CELL_RENDERER; does_expand: BOOLEAN)
			-- Packs `a_cell' into the beginning of the column. If
			-- `does_expand' is False, then the cell is allocated no more
			-- space than it needs. Any unused space is divided evenly
			-- between cells for which expand is True.
		do
			gtk_tree_view_column_pack_start (handle, a_cell.handle, does_expand.to_integer)
		end

	pack_end (a_cell: GTK_CELL_RENDERER; does_expand: BOOLEAN)
			-- Adds `a_cell' to end of the column. If `does_expand' is
			-- False, then the cell is allocated no more space than it
			-- needs. Any unused space is divided evenly between cells
			-- for which expand is True.
		do
			gtk_tree_view_column_pack_end (handle, a_cell.handle, does_expand.to_integer)
		end

	clear
			-- Unsets all the mappings on all renderers on the column.
		do
			gtk_tree_view_column_clear (handle)
		end

	cell_renderers: G_LIST [GTK_CELL_RENDERER]
			-- a GList of all the cell renderers in the column, in no
			-- particular order.
		do
			-- Returns a newly-allocated GList of all the cell renderers
			-- in the column, in no particular order. The list must be
			-- freed with g_list_free().
			create {G_OBJECT_LIST[GTK_CELL_RENDERER]}
			Result.from_external_pointer (gtk_tree_view_column_get_cell_renderers (handle))
		ensure
			Result/=Void
		end

	add_attribute (a_cell_renderer: GTK_CELL_RENDERER; an_attribute: STRING; a_column: INTEGER)
			-- Adds `an_attribute' mapping to the list in
			-- tree_column. `a_column' is the column of the model to get
			-- a value from, and the attribute is the parameter on
			-- `a_cell_renderer' to be set from the value. So for example
			-- if column 2 of the model contains strings, you could have
			-- the "text" attribute of a GtkCellRendererText get its
			-- values from column 2.
			
			-- `a_cell_renderer': GtkCellRenderer to set attributes on
			
			-- `an_attribute' : An attribute on the renderer
			
			-- `a_column' : The column position on the model to get the
			-- attribute from.
		do
			gtk_tree_view_column_add_attribute (handle, a_cell_renderer.handle,
												an_attribute.to_external, a_column)
		end
	
	set_attributes (a_renderer: GTK_CELL_RENDERER; some_attributes: COLLECTION [TUPLE[STRING,INTEGER]])
			-- Sets the list as the attributes (`some_attributes') of
			-- tree column. All existing attributes are removed, and
			-- replaced with the new attributes.
		local iter: ITERATOR [TUPLE[STRING,INTEGER]]
		do
			clear_attributes (a_renderer)
			from iter:=some_attributes.get_new_iterator;iter.start
			until iter.is_off
			loop
				add_attribute (a_renderer, iter.item.item_1, iter.item.item_2)
				iter.next
			end
		end
	
	-- TODO: gtk_tree_view_column_set_cell_data_func ()

	-- void gtk_tree_view_column_set_cell_data_func (GtkTreeViewColumn
	-- *tree_column, GtkCellRenderer *cell_renderer, GtkTreeCellDataFunc
	-- func, gpointer func_data, GtkDestroyNotify destroy);
	
	-- Sets the GtkTreeViewColumnFunc to use for the column. This
	-- function is used instead of the standard attributes mapping for
	-- setting the column value, and should set the value of
	-- tree_column's cell renderer as appropriate. func may be NULL to
	-- remove an older one.
	
	-- tree_column : 	A GtkTreeViewColumn
	-- cell_renderer : 	A GtkCellRenderer
	-- func : 	The GtkTreeViewColumnFunc to use.
	-- func_data : 	The user data for func.
	-- destroy : 	The destroy notification for func_data
	
	clear_attributes (a_cell_renderer: GTK_CELL_RENDERER)
			-- Clears all existing attributes previously set with
			-- `set_attributes'.

			-- `a_cell_renderer': a GtkCellRenderer to clear the
			-- attribute mapping on.
		do
			gtk_tree_view_column_clear_attributes (handle, a_cell_renderer.handle)
		end

feature {ANY} -- Spacing
	set_spacing (a_spacing: INTEGER)
			-- Sets the spacing field of tree_column, which is the number
			-- of pixels to place between cell renderers packed into it.
		do
			gtk_tree_view_column_set_spacing (handle, a_spacing)
		end

	spacing: INTEGER
			-- the spacing of the tree column.
		do
			Result := gtk_tree_view_column_get_spacing (handle)
		end
	
feature {ANY} -- Visibility
	set_visible
			-- Makes the column visible
		do
			gtk_tree_view_column_set_visible (handle, 1)
		ensure visible: is_visible
		end

	set_invisible
			-- Makes the column visible
		do
			gtk_tree_view_column_set_visible (handle, 0)
		ensure invisible: not is_visible
		end

	is_visible: BOOLEAN
			-- Is the tree column visible, i.e. shown by the tree?
		do
			Result := (gtk_tree_view_column_get_visible (handle)).to_boolean
		end

feature {ANY} -- Resizability
	set_resizable
		-- Allow the user to explicitly resize the column by grabbing
		-- the outer edge of the column button. If sizing mode of
		-- the column is `gtk_tree_view_column_autosize', then the sizing
		-- mode is changed to `gtk_tree_view_column_grow_only'.
		do
			gtk_tree_view_column_set_resizable (handle, 1)
		ensure resizable: is_resizable
		end

	unset_resizable
		-- Forbid the user to  resize the column.
		do
			gtk_tree_view_column_set_resizable (handle, 0)
		ensure unresizable: not is_resizable
		end

	is_resizable: BOOLEAN
			-- Can the tree_column be resized by the end user?
		do
			Result:=gtk_tree_view_column_get_resizable(handle).to_boolean
		end


feature {ANY} -- Sizing

	set_sizing (a_type: INTEGER)
			-- Sets the growth behavior of tree_column to `a_type'.
		require valid_type: is_valid_gtk_tree_view_column_sizing (a_type)
		do
			gtk_tree_view_column_set_sizing (handle, a_type)
		end

	set_grow_only
			-- Makes the column bigger only in reaction to changes in the
			-- model
		do
			set_sizing (gtk_tree_view_column_grow_only)
		end

	set_autosize
			-- Makes the column size to be the optimal size everytime the
			-- model changes.
		do
			set_sizing (gtk_tree_view_column_autosize)
		end
	
	set_fixed
			-- Makes the column a fixed numbers of pixels wide.
		do
			set_sizing (gtk_tree_view_column_fixed)
		end

	sizing_type: INTEGER
			-- the current type of tree_column.
		do
			Result :=  gtk_tree_view_column_get_sizing (handle)
		ensure valid_type: is_valid_gtk_tree_view_column_sizing (Result)
		end

	is_grow_only: BOOLEAN
		do
			Result := (sizing_type = gtk_tree_view_column_grow_only)
		end

	is_autosize: BOOLEAN
		do
			Result := (sizing_type = gtk_tree_view_column_autosize)
		end
	
	is_fixed:BOOLEAN
		do
			Result := (sizing_type = gtk_tree_view_column_fixed)
		end

feature {ANY} -- Width
	width: INTEGER
			-- the current size of tree column in pixels.
		do
			Result := gtk_tree_view_column_get_width  (handle)
		end

	fixed_width: INTEGER
			-- The fixed width of the column. This value is only meaning
			-- may not be the actual width of the column on the screen,
			-- just what is requested.
		do
			Result := gtk_tree_view_column_get_fixed_width (handle)
		end

	set_fixed_width (a_width: INTEGER)
			-- Sets the size of the column in pixels. This is meaningful
			-- only if the sizing type is gtk_tree_view_column_fixed
			-- (is_fixed = True). The size of the column is clamped to
			-- the min/max width for the column. Please note that the
			-- min/max width of the column doesn't actually affect the
			-- "fixed_width" property of the widget, just the actual size
			-- when displayed.
		require valid_width: a_width > 0
		do
			gtk_tree_view_column_set_fixed_width (handle, a_width)
		end

	set_min_width (a_width: INTEGER)
			-- Sets the minimum width of the tree_column. If min_width is -1, then the minimum width is unset.
		require valid_width: a_width > 0
		do
			gtk_tree_view_column_set_min_width (handle, a_width)
		ensure set: min_width = a_width
		end

	unset_min_width
			-- Unsets the minimum width of the tree_column. If queried, min_width is -1,
		do
			gtk_tree_view_column_set_min_width (handle, -1)
		ensure unset: min_width = -1
		end

	min_width: INTEGER
			-- The minimum width in pixels of the tree_column, or -1 if no minimum width is set.
		do
			Result := gtk_tree_view_column_get_min_width (handle)
		ensure valid: Result >= -1
		end

	set_max_width (a_width: INTEGER)
			-- Sets the maximum width of the tree_column. If max_width is
			-- -1, then the maximum width is unset. Note, the column can
			-- actually be wider than max width if it's the last column
			-- in a view. In this case, the column expands to fill any
			-- extra space.
		do
			gtk_tree_view_column_set_max_width (handle, a_width)
		ensure set: max_width = a_width
		end

	unset_max_width
			-- Unset the maximum width. See `set_max_width'
		do
			gtk_tree_view_column_set_max_width (handle, -1)
		ensure unset: max_width = -1
		end


	max_width: INTEGER
			-- the maximum width in pixels of the tree_column, or -1 if
			-- no maximum width is set.
		do
			Result :=  gtk_tree_view_column_get_max_width (handle)
		end

feature {ANY}
	clicked
			-- Emits the "clicked" signal on the column. It will only
			-- work if tree_column is clickable.
		do
			gtk_tree_view_column_clicked (handle)
		end

	set_title (a_title: STRING)
			-- Sets the title of the tree column. If a custom widget has
			-- been set, then this value is ignored.
		require valid_title: a_title /= Void
		do
			gtk_tree_view_column_set_title  (handle, a_title.to_external)
		end

	title: STRING
		-- The title of the widget.
		do
			-- the title of the column. This string should not be
			-- modified or freed.
			create Result.from_external_copy (gtk_tree_view_column_get_title(handle))
		ensure not_void: Result/=Void
		end

feature {ANY} -- Expandability
	set_expand
			-- Sets the column to take available extra space. This space
			-- is shared equally amongst all columns that have the expand
			-- set to True. If no column has this option set, then the
			-- last column gets all extra space. By default, every column
			-- is created with is_expanded= False.
		do
			gtk_tree_view_column_set_expand (handle, 1)
		ensure is_expanded: is_expanded
		end

	unset_expand
			-- Makes the column unexpanded. This is the default. See
			-- `set_expand'
		do
			gtk_tree_view_column_set_expand (handle, 0)
		ensure not_expanded: not is_expanded
		end

	is_expanded: BOOLEAN
			-- Does the column expand to take any available space?
		do
			Result := gtk_tree_view_column_get_expand (handle).to_boolean
		end

feature {ANY} -- Clickability
	set_clickable
			-- Sets the header to be active if active. When the header is
			-- active, then it can take keyboard focus, and can be
			-- clicked.
		do
			gtk_tree_view_column_set_clickable (handle, 1)
		ensure clickable: is_clickable
		end

	unset_clickable
			-- Sets the header to be inactive.
		do
			gtk_tree_view_column_set_clickable (handle, 0)
		ensure unclickable: not is_clickable
		end

	is_clickable: BOOLEAN
			-- Can the user click on the header for the column?
		do
			Result := gtk_tree_view_column_get_clickable(handle).to_boolean
		end

	set_widget (a_widget: GTK_WIDGET)
			-- Sets the widget in the header to be widget.
		require valid_widget: a_widget/=Void
		do
			gtk_tree_view_column_set_widget (handle, a_widget.handle)
		end

	unset_widget
			-- The header button is set with a GtkLabel set to `title'.
		do
			gtk_tree_view_column_set_widget (handle, default_pointer)
		end


	widget: GTK_WIDGET
			-- the GtkWidget in the button on the column header. If a custom
			-- widget has not been set then Void is returned.
		do
			-- TODO: get the wrapper stored into into the gtkobject
			-- GtkWidget*  gtk_tree_view_column_get_widget (GtkTreeViewColumn *tree_column);
		ensure implemented: False
		end

	set_alignment (xalign: REAL_32)
			-- Sets the alignment of the title or custom widget inside
			-- the column header. The alignment determines its location
			-- inside the button 0.0 for left, 0.5 for center, 1.0 for
			-- right.
		require valid_align: xalign.in_range ({REAL_32 0.0}, {REAL_32 1.0})
		do
			gtk_tree_view_column_set_alignment (handle, xalign)
		end

	alignment: REAL_32
			-- the current x alignment of tree_column. This value can
			-- range between 0.0 and 1.0.
		do
			Result := gtk_tree_view_column_get_alignment (handle)
		ensure valid: Result.in_range ({REAL_32 0.0}, {REAL_32 1.0})
		end

feature {ANY} -- Reorderability

	set_reorderable
			-- The column can be reordered by the end user dragging the header.
		do
			gtk_tree_view_column_set_reorderable (handle, 1)
		ensure reorderable: is_reorderable
		end

	unset_reorderable
			-- Makes the column not reorderable
		do
			gtk_tree_view_column_set_reorderable (handle, 0)
		ensure not_reorderable: not is_reorderable
		end

	is_reorderable: BOOLEAN
			-- Can  the tree column be reordered by the user?
		do
			Result:=gtk_tree_view_column_get_reorderable(handle).to_boolean
		end

	set_sort_column_id (a_column_id: INTEGER)
			-- Sets the logical `a_column_id' that this column sorts on
			-- when this column is selected for sorting. Doing so makes
			-- the column header clickable.
		do
			gtk_tree_view_column_set_sort_column_id (handle, a_column_id)
		ensure set: sort_column_id = a_column_id
		end

	sort_column_id: INTEGER
			-- the logical sort_column_id that the model sorts on when
			-- this column is selected for sorting. See
			-- `set_sort_column_id'.  -1 if this column can't be used for
			-- sorting.
		do
			Result:=gtk_tree_view_column_get_sort_column_id(handle)
		end

	show_sort_indicator
			-- Display an arrow in the header button indicating the
			-- column is sorted. Call `set_sort_order' to change the
			-- direction of the arrow.
		do
			gtk_tree_view_column_set_sort_indicator (handle, 1)
		ensure shown: sort_indicator_shown
		end

	hide_sort_indicator
			-- Remove the arrow in the header button indicating the column is sorted.
		do
			gtk_tree_view_column_set_sort_indicator (handle, 0)
		ensure hided: sort_indicator_shown
		end

	sort_indicator_shown: BOOLEAN
		do
			Result:=gtk_tree_view_column_get_sort_indicator(handle).to_boolean
		end

	set_sort_order_ascending
			-- Changes the appearance of the sort indicator to ascending.
		
			-- This does not actually sort the model. Use
			-- `set_sort_column_id' if you want automatic sorting
			-- support. This function is primarily for custom sorting
			-- behavior, and should be used in conjunction with
			-- `set_sort_column' to do that. For custom models, the
			-- mechanism will vary.
		
			-- The sort indicator changes direction to indicate normal
			-- sort or reverse sort. Note that you must have the sort
			-- indicator enabled to see anything when calling this
			-- function; see `set_sort_indicator'.
		do
			gtk_tree_view_column_set_sort_order (handle,gtk_sort_ascending)
		ensure set: is_sort_order_ascending
		end

	set_sort_order_descending
			-- Changes the appearance of the sort indicator to
			-- descending. See also `set_sort_order_ascending'.
		do
			gtk_tree_view_column_set_sort_order (handle,gtk_sort_descending)
		end

	is_sort_order_ascending: BOOLEAN
			-- Is the sort order ascending?
		do
			Result:=(gtk_tree_view_column_get_sort_order(handle)=gtk_sort_ascending)
		end

	-- TODO: wrap gtk_tree_view_column_cell_set_cell_data (). When it
	-- is used?

	-- void gtk_tree_view_column_cell_set_cell_data (GtkTreeViewColumn
	-- *tree_column, GtkTreeModel *tree_model, GtkTreeIter *iter,
	-- gboolean is_expander, gboolean is_expanded);

	-- Sets the cell renderer based on the tree_model and iter. That
	-- is, for every attribute mapping in tree_column, it will get a
	-- value from the set column on the iter, and use that value to set
	-- the attribute on the cell renderer. This is used primarily by
	-- the GtkTreeView.

	-- tree_column : 	A GtkTreeViewColumn.
	
	-- tree_model : 	The GtkTreeModel to to get the cell renderers attributes from.
	
	-- iter : 	The GtkTreeIter to to get the cell renderer's attributes from.
	
	-- is_expander : 	TRUE, if the row has children
	
	-- is_expanded : 	TRUE, if the row has visible children
	
	cell_size: TUPLE[INTEGER,INTEGER,INTEGER,INTEGER]
			-- x_offset,y_offset,width,height needed to render the
			-- column.
		local an_x_offset,an_y_offset,a_width,an_height: INTEGER
		do
			-- Obtains the width and height needed to render the
			-- column. This is used primarily by the GtkTreeView.
			-- tree_column : 	A GtkTreeViewColumn.
			-- cell_area : 	The area a cell in the column will be allocated, or NULL
			-- x_offset : 	location to return x offset of a cell relative to cell_area, or NULL
			-- y_offset : 	location to return y offset of a cell relative to cell_area, or NULL
			-- width : 	location to return width needed to render a cell, or NULL
			-- height : 	location to return height needed to render a cell, or NULL
			gtk_tree_view_column_cell_get_size (handle, default_pointer,
															$an_x_offset,$an_y_offset,$a_width,$an_height)
			create Result.make_4 (an_x_offset,an_y_offset,a_width,an_height)
		end			
			
	-- TODO: gtk_tree_view_column_cell_get_position ()

	-- gboolean gtk_tree_view_column_cell_get_position
	-- (GtkTreeViewColumn *tree_column, GtkCellRenderer *cell_renderer,
	-- gint *start_pos, gint *width);

	-- Obtains the horizontal position and size of a cell in a
	-- column. If the cell is not found in the column, start_pos and
	-- width are not changed and FALSE is returned.
	
	-- tree_column : 	a GtkTreeViewColumn
	-- cell_renderer : 	a GtkCellRenderer
	-- start_pos : 	return location for the horizontal position of cell within tree_column, may be NULL
	-- width : 	return location for the width of cell, may be NULL
	-- Returns : 	TRUE if cell belongs to tree_column.

	is_cell_visible: BOOLEAN
			-- Is any of the cells packed into the tree_column visible?
			-- For this to be meaningful, you must first initialize the
			-- cells with `set_cell_data'.
		do
			Result:= gtk_tree_view_column_cell_is_visible(handle).to_boolean
		end

	focus_cell (a_cell_renderer: GTK_CELL_RENDERER)
			-- Sets the current keyboard focus to be at cell, if the
			-- column contains 2 or more editable and activatable cells.
		do
			gtk_tree_view_column_focus_cell (handle, a_cell_renderer.handle)
		end

	queue_resize
			-- Flags the column, and the cell renderers added to this column, to have their sizes renegotiated.
		do
			gtk_tree_view_column_queue_resize(handle)
		end

feature {ANY} -- TODO: Properties and signals
	--   "alignment"            gfloat                : Read / Write
	--   "clickable"            gboolean              : Read / Write
	--   "expand"               gboolean              : Read / Write
	--   "fixed-width"          gint                  : Read / Write
	--   "max-width"            gint                  : Read / Write
	--   "min-width"            gint                  : Read / Write
	--   "reorderable"          gboolean              : Read / Write
	--   "resizable"            gboolean              : Read / Write
	--   "sizing"               GtkTreeViewColumnSizing  : Read / Write
	--   "sort-indicator"       gboolean              : Read / Write
	--   "sort-order"           GtkSortType           : Read / Write
	--   "spacing"              gint                  : Read / Write
	--   "title"                gchararray            : Read / Write
	--   "visible"              gboolean              : Read / Write
	--   "widget"               GtkWidget             : Read / Write
	--   "width"                gint                  : Read

	-- Signals

	-- "clicked"   void        user_function      (GtkTreeViewColumn *treeviewcolumn,
	--                                             gpointer user_data);

	-- The "alignment" property

	--   "alignment"            gfloat                : Read / Write

	-- X Alignment of the column header text or widget.

	-- Allowed values: [0,1]

	-- Default value: 0
	-- The "clickable" property

	--   "clickable"            gboolean              : Read / Write

	-- Whether the header can be clicked.

	-- Default value: FALSE
	-- The "expand" property

	--   "expand"               gboolean              : Read / Write

	-- Column gets share of extra width allocated to the widget.

	-- Default value: FALSE
	-- The "fixed-width" property

	--   "fixed-width"          gint                  : Read / Write

	-- Current fixed width of the column.

	-- Allowed values: >= 1

	-- Default value: 1
	-- The "max-width" property

	--   "max-width"            gint                  : Read / Write

	-- Maximum allowed width of the column.

	-- Allowed values: >= -1

	-- Default value: -1
	-- The "min-width" property

	--   "min-width"            gint                  : Read / Write

	-- Minimum allowed width of the column.

	-- Allowed values: >= -1

	-- Default value: -1
	-- The "reorderable" property

	--   "reorderable"          gboolean              : Read / Write

	-- Whether the column can be reordered around the headers.

	-- Default value: FALSE
	-- The "resizable" property

	--   "resizable"            gboolean              : Read / Write

	-- Column is user-resizable.

	-- Default value: FALSE
	-- The "sizing" property

	--   "sizing"               GtkTreeViewColumnSizing  : Read / Write

	-- Resize mode of the column.

	-- Default value: GTK_TREE_VIEW_COLUMN_GROW_ONLY
	-- The "sort-indicator" property

	--   "sort-indicator"       gboolean              : Read / Write

	-- Whether to show a sort indicator.

	-- Default value: FALSE
	-- The "sort-order" property

	--   "sort-order"           GtkSortType           : Read / Write

	-- Sort direction the sort indicator should indicate.

	-- Default value: GTK_SORT_ASCENDING
	-- The "spacing" property

	--   "spacing"              gint                  : Read / Write

	-- Space which is inserted between cells.

	-- Allowed values: >= 0

	-- Default value: 0
	-- The "title" property

	--   "title"                gchararray            : Read / Write

	-- Title to appear in column header.

	-- Default value: ""
	-- The "visible" property

	--   "visible"              gboolean              : Read / Write

	-- Whether to display the column.

	-- Default value: TRUE
	-- The "widget" property

	--   "widget"               GtkWidget             : Read / Write

	-- Widget to put in column header button instead of column title.
	-- The "width" property

	--   "width"                gint                  : Read

	-- Current width of the column.

	-- Allowed values: >= 0

	-- Default value: 0
	-- Signal Details
	-- The "clicked" signal

	-- void        user_function                  (GtkTreeViewColumn *treeviewcolumn,
	--                                             gpointer user_data);

	-- treeviewcolumn : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeViewColumn)"
		end
end
