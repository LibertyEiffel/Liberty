note
	description: "GtkLayout: Infinite scrollable area containing child widgets and/or custom drawing."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

class GTK_LAYOUT
	-- GtkLayout is similar to GtkDrawingArea in that it's a "blank
	-- slate" and doesn't do anything but paint a blank background by
	-- default. It's different in that it supports scrolling natively
	-- (you can add it to a GtkScrolledWindow), and it can contain
	-- child widgets, since it's a GtkContainer. However if you're just
	-- going to draw, a GtkDrawingArea is a better choice since it has
	-- lower overhead.

	-- When handling expose events on a GtkLayout, you must draw to
	-- GTK_LAYOUT (layout)->bin_window, rather than to GTK_WIDGET
	-- (layout)->window, as you would for a drawing area.

inherit GTK_CONTAINER
   -- GtkLayout implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (an_h_adjustment, a_v_adjustment: GTK_ADJUSTMENT)
			--  Creates a new GtkLayout. Unless you have a specific
			--  adjustment you'd like the layout to use for scrolling,
			--  pass Void for `an_h_adjustment' (horizontal scroll
			--  adjustment) and `a_v_adjustment' (vertical scroll
			--  adjustment).
		do
			from_external_pointer(gtk_layout_new(null_or(an_h_adjustment),null_or(a_v_adjustment)))
		end

feature {ANY} -- Operations

	put (a_child: GTK_WIDGET; an_x, an_y: INTEGER)
			-- Adds `a_child' to layout, at position (`an_x',`an_y').
			-- Current becomes the new parent container of `a_child'.
		require child_not_void: a_child/=Void
		do
			gtk_layout_put(handle, a_child.handle, an_x, an_y)
		end

	move (a_child: GTK_WIDGET; an_x, an_y: INTEGER)
			-- Moves `a_child' of layout to a new position.
		require child_not_void: a_child/=Void
		do
			gtk_layout_move(handle,a_child.handle, an_x, an_y)
		end

	set_size (a_width, an_height: INTEGER)
			-- Sets the size of the scrollable area of the layout.
		
			-- `a_width': width of entire scrollable area

			-- `an_height': height of entire scrollable area
		do
			gtk_layout_set_size(handle,a_width,an_height)
		end

feature {ANY} -- Access

	width: INTEGER
			-- the width set on layout
		local a_result: INTEGER
		do
			gtk_layout_get_size (handle, $a_result, default_pointer)
			Result := a_result
		end

	height: INTEGER
			-- the height set on layout
		local a_result: INTEGER
		do
			gtk_layout_get_size (handle, default_pointer, $a_result)
			Result := a_result
		end

	--  void gtk_layout_get_size (GtkLayout *layout, guint *width,
	--  guint *height);

	--  Gets the size that has been set on the layout, and that
	--  determines the total extents of the layout's scrollbar
	--  area. See gtk_layout_set_size().

	-- layout : a GtkLayout
	-- width :  location to store the width set on layout, or NULL
	-- height : location to store the height set on layout, or NULL

	-- horizontal_adjustment: GTK_ADJUSTMENT is local ptr: POINTER do
	-- ptr:=gtk_layout_get_hadjustment(handle)
	
	-- This function should only be called after the layout has been
	-- placed in a GtkScrolledWindow or otherwise configured for
	-- scrolling. It returns the GtkAdjustment used for communication
	-- between the horizontal scrollbar and layout.

	--See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

	-- layout :  a GtkLayout
	-- Returns : horizontal scroll adjustment

	--   gtk_layout_get_vadjustment ()

	--  GtkAdjustment* gtk_layout_get_vadjustment   (GtkLayout *layout);

	--    This function should only be called after the layout has been placed in a
	--    GtkScrolledWindow or otherwise configured for scrolling. It returns the
	--    GtkAdjustment used for communication between the vertical scrollbar and
	--    layout.

	--    See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

	--    layout :  a GtkLayout
	--    Returns : vertical scroll adjustment

	--    --------------------------------------------------------------------------

	--   gtk_layout_set_hadjustment ()

	--  void        gtk_layout_set_hadjustment      (GtkLayout *layout,
	--                                               GtkAdjustment *adjustment);

	--    Sets the horizontal scroll adjustment for the layout.

	--    See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

	--    layout :     a GtkLayout
	--    adjustment : new scroll adjustment

	--    --------------------------------------------------------------------------

	--   gtk_layout_set_vadjustment ()

	--  void        gtk_layout_set_vadjustment      (GtkLayout *layout,
	--                                               GtkAdjustment *adjustment);

	--    Sets the vertical scroll adjustment for the layout.

	--    See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

	--    layout :     a GtkLayout
	--    adjustment : new scroll adjustment

	-- Properties


	--    "hadjustment"          GtkAdjustment         : Read / Write
	--    "height"               guint                 : Read / Write
	--    "vadjustment"          GtkAdjustment         : Read / Write
	--    "width"                guint                 : Read / Write

	-- Property Details

	--   The "hadjustment" property

	--    "hadjustment"          GtkAdjustment         : Read / Write

	--    The GtkAdjustment for the horizontal position.

	--    --------------------------------------------------------------------------

	--   The "height" property

	--    "height"               guint                 : Read / Write

	--    The height of the layout.

	--    Allowed values: <= G_MAXINT

	--    Default value: 100

	--    --------------------------------------------------------------------------

	--   The "vadjustment" property

	--    "vadjustment"          GtkAdjustment         : Read / Write

	--    The GtkAdjustment for the vertical position.

	--    --------------------------------------------------------------------------

	--   The "width" property

	--    "width"                guint                 : Read / Write

	--    The width of the layout.

	--    Allowed values: <= G_MAXINT

	--    Default value: 100

	-- Child Properties


	--    "x"                    gint                  : Read / Write
	--    "y"                    gint                  : Read / Write

	-- Child Property Details

	--   The "x" child property

	--    "x"                    gint                  : Read / Write

	--    X position of child widget.

	--    Default value: 0

	--    --------------------------------------------------------------------------

	--   The "y" child property

	--    "y"                    gint                  : Read / Write

	--    Y position of child widget.

	--    Default value: 0

	-- Signals


	--  "set-scroll-adjustments"
	--              void        user_function      (GtkLayout     *layout,
	--                                              GtkAdjustment *arg1,
	--                                              GtkAdjustment *arg2,
	--                                              gpointer       user_data)      : Run last / Action

	-- Signal Details

	--   The "set-scroll-adjustments" signal

	--  void        user_function                  (GtkLayout     *layout,
	--                                              GtkAdjustment *arg1,
	--                                              GtkAdjustment *arg2,
	--                                              gpointer       user_data)      : Run last / Action

	--    layout :    the object which received the signal.
	--    arg1 :
	--    arg2 :
	--    user_data : user data set when the signal handler was connected.

feature {} -- GtkLayout struct access
	--  typedef struct {
	--    GdkWindow *bin_window;
	--  } GtkLayout;
	
feature {} -- External calls
	gtk_layout_new (an_hadjustment, an_vadjustment: POINTER): POINTER
			-- GtkWidget* gtk_layout_new (GtkAdjustment *hadjustment,
			-- GtkAdjustment *vadjustment);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_put (a_layout, a_child_widget: POINTER; an_x, an_y: INTEGER)
			-- void gtk_layout_put (GtkLayout *layout, GtkWidget
			-- *child_widget, gint x, gint y);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_move (a_layout, a_child_widget: POINTER; an_x, an_y: INTEGER)
			-- void gtk_layout_move (GtkLayout *layout, GtkWidget
			-- *child_widget, gint x, gint y);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_set_size (a_layout: POINTER; a_width, a_height: INTEGER)
			-- void gtk_layout_set_size (GtkLayout *layout, guint width,
			-- guint height);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_get_size (a_layout, a_width, a_height: POINTER)
			-- void gtk_layout_get_size (GtkLayout *layout, guint *width,
			-- guint *height);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_get_hadjustment (a_layout: POINTER): POINTER
			-- 	GtkAdjustment* gtk_layout_get_hadjustment (GtkLayout *layout);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_get_vadjustment (a_layout: POINTER): POINTER
			-- 	GtkAdjustment* gtk_layout_get_vadjustment (GtkLayout *layout);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_set_hadjustment (a_layout, an_adjustment: POINTER)
			-- void gtk_layout_set_hadjustment (GtkLayout *layout,
			-- GtkAdjustment *adjustment);
		external "C use <gtk/gtk.h>"
		end

	gtk_layout_set_vadjustment (a_layout, an_adjustment: POINTER)
			-- void gtk_layout_set_vadjustment (GtkLayout *layout,
			-- GtkAdjustment *adjustment);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkLayout)"
		end
end -- class GTK_LAYOUT
