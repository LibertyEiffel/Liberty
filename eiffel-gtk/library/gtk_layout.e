indexing
	description: "GtkLayout: Infinite scrollable area containing child widgets and/or custom drawing."
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

creation make, from_external_pointer

feature {} -- Creation


--    --------------------------------------------------------------------------

--   gtk_layout_new ()

--  GtkWidget*  gtk_layout_new                  (GtkAdjustment *hadjustment,
--                                               GtkAdjustment *vadjustment);

--    Creates a new GtkLayout. Unless you have a specific adjustment you'd like
--    the layout to use for scrolling, pass NULL for hadjustment and
--    vadjustment.

--    hadjustment : horizontal scroll adjustment, or NULL
--    vadjustment : vertical scroll adjustment, or NULL
--    Returns :     a new GtkLayout

--    --------------------------------------------------------------------------

--   gtk_layout_put ()

--  void        gtk_layout_put                  (GtkLayout *layout,
--                                               GtkWidget *child_widget,
--                                               gint x,
--                                               gint y);

--    Adds child_widget to layout, at position (x,y). layout becomes the new
--    parent container of child_widget.

--    layout :       a GtkLayout
--    child_widget : child widget
--    x :            X position of child widget
--    y :            Y position of child widget

--    --------------------------------------------------------------------------

--   gtk_layout_move ()

--  void        gtk_layout_move                 (GtkLayout *layout,
--                                               GtkWidget *child_widget,
--                                               gint x,
--                                               gint y);

--    Moves a current child of layout to a new position.

--    layout :       a GtkLayout
--    child_widget : a current child of layout
--    x :            X position to move to
--    y :            Y position to move to

--    --------------------------------------------------------------------------

--   gtk_layout_set_size ()

--  void        gtk_layout_set_size             (GtkLayout *layout,
--                                               guint width,
--                                               guint height);

--    Sets the size of the scrollable area of the layout.

--    layout : a GtkLayout
--    width :  width of entire scrollable area
--    height : height of entire scrollable area

--    --------------------------------------------------------------------------

--   gtk_layout_get_size ()

--  void        gtk_layout_get_size             (GtkLayout *layout,
--                                               guint *width,
--                                               guint *height);

--    Gets the size that has been set on the layout, and that determines the
--    total extents of the layout's scrollbar area. See gtk_layout_set_size().

--    layout : a GtkLayout
--    width :  location to store the width set on layout, or NULL
--    height : location to store the height set on layout, or NULL

--    --------------------------------------------------------------------------

--   gtk_layout_get_hadjustment ()

--  GtkAdjustment* gtk_layout_get_hadjustment   (GtkLayout *layout);

--    This function should only be called after the layout has been placed in a
--    GtkScrolledWindow or otherwise configured for scrolling. It returns the
--    GtkAdjustment used for communication between the horizontal scrollbar and
--    layout.

--    See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

--    layout :  a GtkLayout
--    Returns : horizontal scroll adjustment

--    --------------------------------------------------------------------------

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
             GtkLayout;
 GtkWidget*  gtk_layout_new                  (GtkAdjustment *hadjustment,
                                              GtkAdjustment *vadjustment);
 void        gtk_layout_put                  (GtkLayout *layout,
                                              GtkWidget *child_widget,
                                              gint x,
                                              gint y);
 void        gtk_layout_move                 (GtkLayout *layout,
                                              GtkWidget *child_widget,
                                              gint x,
                                              gint y);
 void        gtk_layout_set_size             (GtkLayout *layout,
                                              guint width,
                                              guint height);
 void        gtk_layout_get_size             (GtkLayout *layout,
                                              guint *width,
                                              guint *height);
 GtkAdjustment* gtk_layout_get_hadjustment   (GtkLayout *layout);
 GtkAdjustment* gtk_layout_get_vadjustment   (GtkLayout *layout);
 void        gtk_layout_set_hadjustment      (GtkLayout *layout,
                                              GtkAdjustment *adjustment);
 void        gtk_layout_set_vadjustment      (GtkLayout *layout,
                                              GtkAdjustment *adjustment);

feature -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(Foo)"
		end

end -- class GTK_LAYOUT
