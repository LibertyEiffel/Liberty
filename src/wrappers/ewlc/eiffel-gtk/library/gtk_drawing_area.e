note
	description: "GtkDrawingArea - A widget for custom user interface elements."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

class GTK_DRAWING_AREA
	-- The GtkDrawingArea widget is used for creating custom user
	-- interface elements. It's essentially a blank widget; you can
	-- draw on widget->window.  After creating a drawing area, the
	-- application may want to connect to:

	-- o Mouse and button press signals to respond to input from the
	-- user. (Use `add_events' to enable events you wish to receive.)

	-- o The "realize" signal to take any necessary actions when the
	-- widget is instantiated on a particular display. (Create GDK
	-- resources in response to this signal.)

	-- o The "configure_event" signal to take any necessary actions
	-- when the widget changes size.

	-- o The "expose_event" signal to handle redrawing the contents of
	-- the widget.

	-- The following code portion demonstrates using a drawing area to
	-- display a circle in the normal widget foreground color. Note
	-- that GDK automatically clears the exposed area to the background
	-- color before sending the expose event, and that drawing is
	-- implicitly clipped to the exposed area.

	-- Example 1. Simple GtkDrawingArea usage.
	
	-- gboolean expose_event_callback (GtkWidget *widget,
	-- GdkEventExpose *event, gpointer data) { gdk_draw_arc
	-- (widget->window, widget->style->fg_gc[GTK_WIDGET_STATE
	-- (widget)], TRUE, 0, 0, widget->allocation.width,
	-- widget->allocation.height, 0, 64 * 360); return TRUE; } [...]
	
	-- GtkWidget *drawing_area = gtk_drawing_area_new ();
	-- gtk_widget_set_size_request (drawing_area, 100, 100);
	-- g_signal_connect (G_OBJECT (drawing_area), "expose_event",
	-- G_CALLBACK (expose_event_callback), NULL);

	-- Expose events are normally delivered when a drawing area first
	-- comes onscreen, or when it's covered by another window and then
	-- uncovered (exposed). You can also force an expose event by
	-- adding to the "damage region" of the drawing area's window;
	-- `queue_draw_area' and GDK_WINDOW. `invalidate_rect'
	-- are equally good ways to do this. You'll then get an expose
	-- event for the invalid region.

	-- The available routines for drawing are documented on the GDK
	-- Drawing Primitives page. See also
	-- gdk_pixbuf_render_to_drawable() for drawing a GdkPixbuf.

	-- To receive mouse events on a drawing area, you will need to
	-- enable them with gtk_widget_add_events(). To receive keyboard
	-- events, you will need to set the GTK_CAN_FOCUS flag on the
	-- drawing area, and should probably draw some user-visible
	-- indication that the drawing area is focused. Use the
	-- GTK_HAS_FOCUS() macro in your expose event handler to decide
	-- whether to draw the focus indicator. See gtk_paint_focus() for
	-- one way to draw focus.

	-- See Also: Sometimes GtkImage is a useful alternative to a
	-- drawing area. You can put a GdkPixmap in the GtkImage and draw
	-- to the GdkPixmap, calling gtk_widget_queue_draw() on the
	-- GtkImage when you want to refresh to the screen.

inherit GTK_WIDGET

	-- GtkDrawingArea implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new drawing area.
		do
			from_external_pointer(gtk_drawing_area_new)
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkDrawingArea)"
		end

feature {} -- External calls

	gtk_drawing_area_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_drawing_area_size (a_darea: POINTER; a_width, an_height: INTEGER)
			-- gtk_drawing_area_size (GtkDrawingArea *darea, gint width, gint 
			-- height);
		external "C use <gtk/gtk.h>"
		end
		
end -- class GTK_DRAWING_AREA
