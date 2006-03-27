indexing
	description: "GtkCellRenderer An object for rendering a single cell on a GdkDrawable."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Description

			-- The GtkCellRenderer is a base class of a set of objects
			-- used for rendering a cell to a GdkDrawable. These objects
			-- are used primarily by the GtkTreeView widget, though they
			-- aren't tied to them in any specific way. It is worth
			-- noting that GtkCellRenderer is not a GtkWidget and cannot
			-- be treated as such.

			-- The primary use of a GtkCellRenderer is for drawing a
			-- certain graphical elements on a GdkDrawable. Typically,
			-- one cell renderer is used to draw many cells on the
			-- screen. To this extent, it isn't expected that a
			-- CellRenderer keep any permanent state around. Instead, any
			-- state is set just prior to use using GObjects property
			-- system. Then, the cell is measured using
			-- gtk_cell_renderer_get_size(). Finally, the cell is
			-- rendered in the correct location using
			-- gtk_cell_renderer_render().
	
			-- There are a number of rules that must be followed when
			-- writing a new GtkCellRenderer. First and formost, it's
			-- important that a certain set of properties will always
			-- yield a cell renderer of the same size, barring a GtkStyle
			-- change. The GtkCellRenderer also has a number of generic
			-- properties that are expected to be honored by all
			-- children.

			-- Beyond merely rendering a cell, cell renderers can
			-- optionally provide active user interface elements. A cell
			-- renderer can be activatable like GtkCellRendererToggle,
			-- which toggles when it gets activated by a mouse click, or
			-- it can be editable like GtkCellRendererText, which allows
			-- the user to edit the text using a GtkEntry. To make a cell
			-- renderer activatable or editable, you have to implement
			-- the activate or start_editing virtual functions,
			-- respectively.

deferred class GTK_CELL_RENDERER
inherit
	GTK_OBJECT
	GTK_CELL_RENDERER_EXTERNALS

feature
	-- TODO: wrap gtk_cell_renderer_get_size ()

	-- void gtk_cell_renderer_get_size (GtkCellRenderer *cell,
	-- GtkWidget *widget, GdkRectangle *cell_area, gint *x_offset, gint
	-- *y_offset, gint *width, gint *height);

	-- Obtains the width and height needed to render the cell. Used by
	-- view widgets to determine the appropriate size for the cell_area
	-- passed to gtk_cell_renderer_render(). If cell_area is not NULL,
	-- fills in the x and y offsets (if set) of the cell relative to
	-- this location. Please note that the values set in width and
	-- height, as well as those in x_offset and y_offset are inclusive
	-- of the xpad and ypad properties.

	-- cell : 	a GtkCellRenderer
	-- widget : 	the widget the renderer is rendering to
	-- cell_area : 	The area a cell will be allocated, or NULL
	-- x_offset : 	location to return x offset of cell relative to cell_area, or NULL
	-- y_offset : 	location to return y offset of cell relative to cell_area, or NULL
	-- width : 	location to return width needed to render a cell, or NULL
	-- height : 	location to return height needed to render a cell, or NULL

	-- gtk_cell_renderer_render ()

	
-- void        gtk_cell_renderer_render        (GtkCellRenderer *cell,
--                                              GdkWindow *window,
--                                              GtkWidget *widget,
--                                              GdkRectangle *background_area,
--                                              GdkRectangle *cell_area,
--                                              GdkRectangle *expose_area,
--                                              GtkCellRendererState flags);

-- Invokes the virtual render function of the GtkCellRenderer. The three passed-in rectangles are areas of window. Most renderers will draw within cell_area; the xalign, yalign, xpad, and ypad fields of the GtkCellRenderer should be honored with respect to cell_area. background_area includes the blank space around the cell, and also the area containing the tree expander; so the background_area rectangles for all cells tile to cover the entire window. expose_area is a clip rectangle.

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

	stop_editing (emit_editing_canceled_signal: BOOLEAN) is
			-- Informs the cell renderer that the editing is stopped. If
			-- `emit_editing_canceled_signal' is True, the cell renderer
			-- will emit the "editing-canceled" signal. This function
			-- should be called by cell renderer implementations in
			-- response to the "editing-done" signal of GtkCellEditable.
		do
			gtk_cell_renderer_stop_editing (handle, emit_editing_canceled_signal.to_integer)
		end			

	fixed_size: TUPLE[INTEGER,INTEGER] is
			-- the fixed width  and  height of the widget
		local a_width, an_height: INTEGER
		do
			gtk_cell_renderer_get_fixed_size (handle, $a_width, $an_height)
			create Result.make (a_width, an_height)
		end

	set_fixed_size (a_width, an_height: INTEGER) is
			-- Sets the renderer size to be explicit, independent of the
			-- properties set. `a_width': the width of the cell renderer,
			-- or -1; `an_height': the height of the cell renderer, or -1

		do
			gtk_cell_renderer_set_fixed_size (handle, a_width, an_height)
		end

feature -- Property Details
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
-- Signal Details
-- The "editing-canceled" signal

-- void        user_function                  (GtkCellRenderer *renderer,
--                                             gpointer user_data);

-- This signal gets emitted when the user cancels the process of editing a cell. For example, an editable cell renderer could be written to cancel editing when the user presses Escape.

-- See also: gtk_cell_renderer_editing_canceled()

-- renderer : 	the object which received the signal
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.4
-- The "editing-started" signal

-- void        user_function                  (GtkCellRenderer *renderer,
--                                             GtkCellEditable *editable,
--                                             gchar *path,
--                                             gpointer user_data);

-- This signal gets emitted when a cell starts to be edited. The indended use of this signal is to do special setup on editable, e.g. adding a GtkEntryCompletion or setting up additional columns in a GtkComboBox.

-- Note that GTK+ doesn't guarantee that cell renderers will continue to use the same kind of widget for editing in future releases, therefore you should check the type of editable before doing any specific setup, as in the following example:

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

-- renderer : 	the object which received the signal
-- editable : 	the GtkCellEditable
-- path : 	the path identifying the edited cell
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.6
-- See Also

-- 													GtkCellRendererText,GtkCellRendererPixbuf,GtkCellRendererToggle
													
end
