note
	description: "GtkCellRenderer An object for rendering a single cell on a GdkDrawable."
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

deferred class GTK_CELL_RENDERER
	-- The GtkCellRenderer is a base class of a set of objects used for
	-- rendering a cell to a GdkDrawable. These objects are used
	-- primarily by the GtkTreeView widget, though they aren't tied to
	-- them in any specific way. It is worth noting that
	-- GtkCellRenderer is not a GtkWidget and cannot be treated as
	-- such.
	
	-- The primary use of a GtkCellRenderer is for drawing a certain
	-- graphical elements on a GdkDrawable. Typically, one cell
	-- renderer is used to draw many cells on the screen. To this
	-- extent, it isn't expected that a CellRenderer keep any permanent
	-- state around. Instead, any state is set just prior to use using
	-- GObjects property system. Then, the cell is measured using
	-- `size'. Finally, the cell is rendered in the correct location
	-- using `render'.
	
	-- There are a number of rules that must be followed when
	-- writing a new GtkCellRenderer. First and formost, it's
	-- important that a certain set of properties will always
	-- yield a cell renderer of the same size, barring a GtkStyle
	-- change. The GtkCellRenderer also has a number of generic
	-- properties that are expected to be honored by all
	-- children.

	-- Beyond merely rendering a cell, cell renderers can optionally
	-- provide active user interface elements. A cell renderer can be
	-- activatable like GtkCellRendererToggle, which toggles when it
	-- gets activated by a mouse click, or it can be editable like
	-- GtkCellRendererText, which allows the user to edit the text
	-- using a GtkEntry. To make a cell renderer activatable or
	-- editable, you have to implement the activate or start_editing
	-- virtual functions, respectively.

inherit
	GTK_OBJECT

insert
	GTK_CELL_RENDERER_EXTERNALS

feature {ANY}

	size (a_widget: GTK_WIDGET): TUPLE[INTEGER,INTEGER,INTEGER,INTEGER,GDK_RECTANGLE]
			-- The x and y offset width and height needed to render the
			-- cell. Used by view widgets to determine the appropriate
			-- size for the cell_area passed to `render'. x and y offsets
			-- are relative to the GDK_RECTANGLE. Please note that the
			-- values set in width and height, as well as those in
			-- x_offset and y_offset are inclusive of the xpad and ypad
			-- properties.
		require
			widget_not_void: a_widget/=Void
		local
			an_x_offset, an_y_offset, a_width, an_height: INTEGER
			a_rectangle: GDK_RECTANGLE
		do
			create a_rectangle.make
			-- cell : 	a GtkCellRenderer
			-- widget : 	the widget the renderer is rendering to
			-- cell_area : 	The area a cell will be allocated, or NULL
			-- x_offset : 	location to return x offset of cell relative to cell_area, or NULL
			-- y_offset : 	location to return y offset of cell relative to cell_area, or NULL
			-- width : 	location to return width needed to render a cell, or NULL
			-- height : 	location to return height needed to render a cell, or NULL
			gtk_cell_renderer_get_size (handle, a_widget.handle,
												 a_rectangle.handle, $an_x_offset, $an_y_offset,
												 $a_width, $an_height)
			create Result.make_5(an_x_offset, an_y_offset, a_width, an_height, a_rectangle)
		ensure
			not_void: Result/=Void
			rectangle_not_void: Result.item_5 /= Void
		end

	-- render (a_window: GTK_WINDOW; a_widget: GTK_WIDGET)
	
	-- void        gtk_cell_renderer_render        (GtkCellRenderer *cell,
	--                                              GdkWindow *window,
	--                                              GtkWidget *widget,
	--                                              GdkRectangle *background_area,
	--                                              GdkRectangle *cell_area,
	--                                              GdkRectangle *expose_area,
	--                                              GtkCellRendererState flags);

	-- Invokes the virtual render function of the GtkCellRenderer. The
	-- three passed-in rectangles are areas of window. Most renderers
	-- will draw within cell_area; the xalign, yalign, xpad, and ypad
	-- fields of the GtkCellRenderer should be honored with respect to
	-- cell_area. background_area includes the blank space around the
	-- cell, and also the area containing the tree expander; so the
	-- background_area rectangles for all cells tile to cover the
	-- entire window. expose_area is a clip rectangle.

	-- cell : 	a GtkCellRenderer
	-- window : 	a GdkDrawable to draw to
	-- widget : 	the widget owning window
	-- background_area : 	entire cell area (including tree expanders and maybe padding on the sides)
	-- cell_area : 	area normally rendered by a cell renderer
	-- expose_area : 	area that actually needs updating
	-- flags : 	flags that affect rendering
	-- gtk_cell_renderer_activate ()

	-- gboolean    gtk_cell_renderer_activate      (GtkCellRenderer *cell,
	--                                              GdkEvent *event,
	--                                              GtkWidget *widget,
	--                                              const gchar *path,
	--                                              GdkRectangle *background_area,
	--                                              GdkRectangle *cell_area,
	--                                              GtkCellRendererState flags);

	-- Passes an activate event to the cell renderer for possible processing. Some cell renderers may use events; for example, GtkCellRendererToggle toggles when it gets a mouse click.

	-- cell : 	a GtkCellRenderer
	-- event : 	a GdkEvent
	-- widget : 	widget that received the event
	-- path : 	widget-dependent string representation of the event location; e.g. for GtkTreeView, a string representation of GtkTreePath
	-- background_area : 	background area as passed to gtk_cell_renderer_render
	-- cell_area : 	cell area as passed to gtk_cell_renderer_render
	-- flags : 	render flags
	-- Returns : 	TRUE if the event was consumed/handled

	-- gtk_cell_renderer_start_editing ()

	-- GtkCellEditable* gtk_cell_renderer_start_editing
	--                                             (GtkCellRenderer *cell,
	--                                              GdkEvent *event,
	--                                              GtkWidget *widget,
	--                                              const gchar *path,
	--                                              GdkRectangle *background_area,
	--                                              GdkRectangle *cell_area,
	--                                              GtkCellRendererState flags);

	-- Passes an activate event to the cell renderer for possible processing.

	-- cell : 	a GtkCellRenderer
	-- event : 	a GdkEvent
	-- widget : 	widget that received the event
	-- path : 	widget-dependent string representation of the event location; e.g. for GtkTreeView, a string representation of GtkTreePath
	-- background_area : 	background area as passed to gtk_cell_renderer_render
	-- cell_area : 	cell area as passed to gtk_cell_renderer_render
	-- flags : 	render flags
	-- Returns : 	A new GtkCellEditable, or NULL

	stop_editing (emit_editing_canceled_signal: BOOLEAN)
			-- Informs the cell renderer that the editing is stopped. If
			-- `emit_editing_canceled_signal' is True, the cell renderer
			-- will emit the "editing-canceled" signal. This function
			-- should be called by cell renderer implementations in
			-- response to the "editing-done" signal of GtkCellEditable.
		do
			gtk_cell_renderer_stop_editing (handle, emit_editing_canceled_signal.to_integer)
		end

	fixed_size: TUPLE[INTEGER,INTEGER]
			-- the fixed width  and  height of the widget
		local a_width, an_height: INTEGER
		do
			gtk_cell_renderer_get_fixed_size (handle, $a_width, $an_height)
			create Result.make_2 (a_width, an_height)
		end

	set_fixed_size (a_width, an_height: INTEGER)
			-- Sets the renderer size to be explicit, independent of the
			-- properties set. `a_width': the width of the cell renderer,
			-- or -1; `an_height': the height of the cell renderer, or -1

		do
			gtk_cell_renderer_set_fixed_size (handle, a_width, an_height)
		end

feature {ANY} -- Property Details
	-- The "cell-background" property

	--   "cell-background"      gchararray            : Write

	-- Cell background color as a string.

	-- Default value: NULL
	-- The "cell-background-gdk" property

	--   "cell-background-gdk"  GdkColor              : Read / Write

	-- Cell background color as a GdkColor.
	-- The "cell-background-set" property

	--   "cell-background-set"  gboolean              : Read / Write

	-- Whether this tag affects the cell background color.

	-- Default value: FALSE
	-- The "height" property

	--   "height"               gint                  : Read / Write

	-- The fixed height.

	-- Allowed values: >= -1

	-- Default value: -1
	-- The "is-expanded" property

	--   "is-expanded"          gboolean              : Read / Write

	-- Row is an expander row, and is expanded.

	-- Default value: FALSE
	-- The "is-expander" property

	--   "is-expander"          gboolean              : Read / Write

	-- Row has children.

	-- Default value: FALSE
	-- The "mode" property

	--   "mode"                 GtkCellRendererMode   : Read / Write

	-- Editable mode of the CellRenderer.

	-- Default value: GTK_CELL_RENDERER_MODE_INERT
	-- The "sensitive" property

	--   "sensitive"            gboolean              : Read / Write

	-- Display the cell sensitive.

	-- Default value: TRUE
	-- The "visible" property

	--   "visible"              gboolean              : Read / Write

	-- Display the cell.

	-- Default value: TRUE
	-- The "width" property

	--   "width"                gint                  : Read / Write

	-- The fixed width.

	-- Allowed values: >= -1

	-- Default value: -1
	-- The "xalign" property

	--   "xalign"               gfloat                : Read / Write

	-- The x-align.

	-- Allowed values: [0,1]

	-- Default value: 0.5
	-- The "xpad" property

	--   "xpad"                 guint                 : Read / Write

	-- The xpad.

	-- Default value: 0
	-- The "yalign" property

	--   "yalign"               gfloat                : Read / Write

	-- The y-align.

	-- Allowed values: [0,1]

	-- Default value: 0.5
	-- The "ypad" property

	--   "ypad"                 guint                 : Read / Write

	-- The ypad.

	-- Default value: 0

feature {ANY} -- "editing-canceled"

	editing_canceled_signal_name: STRING is "editing-canceled"
		-- "editing-canceled"
		-- void        user_function                  (GtkCellRenderer *renderer,
		--                                             gpointer user_data);

	enable_on_editing_canceled
			-- Connects "editing-canceled" signal to `on_editing_canceled' feature.
		do
			connect (Current, editing_canceled_signal_name, $on_editing_canceled)
		end

	on_editing_canceled: INTEGER
			-- This signal gets emitted when the user cancels the process of
			-- editing a cell. For example, an editable cell renderer could be
			-- written to cancel editing when the user presses Escape.
		do
		end

	connect_agent_to_editing_canceled_signal (a_procedure: PROCEDURE[ANY, TUPLE [GTK_CELL_RENDERER]])
			-- renderer : 	the object which received the signal
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			editing_canceled_callback: EDITING_CANCELED_CALLBACK
		do
			create editing_canceled_callback.make
			editing_canceled_callback.connect (Current, a_procedure)
		end

feature {ANY} -- "editing-started"

	editing_started_signal_name: STRING is "editing-started"
		-- "editing-started"
		-- void        user_function                  (GtkCellRenderer *renderer,
		--                                             GtkCellEditable *editable,
		--                                             gchar *path,
		--                                             gpointer user_data);

	enable_on_editing_started
			-- Connects "editing-started" signal to `on_editing_started' feature.
		do
			connect (Current, editing_started_signal_name, $on_editing_started)
		end

	on_editing_started: INTEGER
			-- This signal gets emitted when a cell starts to be edited. The
			-- indended use of this signal is to do special setup on editable, e.g.
			-- adding a GtkEntryCompletion or setting up additional columns in a
			-- GtkComboBox.
			
			-- Note that GTK+ doesn't guarantee that cell renderers will
			-- continue to use the same kind of widget for editing in future
			-- releases, therefore you should check the type of editable before
			-- doing any specific setup, as in the following example:
			
			-- static void
			-- text_editing_started (GtkCellRenderer *cell,
			--                       GtkCellEditable *editable,
			--                       const gchar     *path,
			--                       gpointer         data)
			-- {
			--   if (GTK_IS_ENTRY (editable)) 
			--     {
			--       GtkEntry *entry = GTK_ENTRY (editable);
			
			--       /* ... create a GtkEntryCompletion */
			
			--       gtk_entry_set_completion (entry, completion);
			--     }
			-- }
		do
		end

	connect_agent_to_editing_started_signal (a_procedure: PROCEDURE[ANY, TUPLE [GTK_CELL_EDITABLE,
																										 STRING, GTK_CELL_RENDERER]])
			-- renderer : 	the object which received the signal
			-- editable : 	the GtkCellEditable
			-- path     : 	the path identifying the edited cell
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			editing_started_callback: EDITING_STARTED_CALLBACK
		do
			create editing_started_callback.make
			editing_started_callback.connect (Current, a_procedure)
		end

end -- class GTK_CELL_RENDERER
