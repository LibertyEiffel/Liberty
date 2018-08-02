note
	description: "A container that adds scrollbars to its child widget"
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTK+ team
					
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
			
class GTK_SCROLLED_WINDOW
	-- A container the accepts a single child widget. GtkScrolledWindow
	-- adds scrollbars to the child widget and optionally draws a
	-- beveled frame around the child widget.
			
	-- The scrolled window can work in two ways. Some widgets have
	-- native scrolling support; these widgets have "slots" for
	-- GtkAdjustment objects.  Widgets with native scroll support
	-- include GtkTreeView, GtkTextView, and GtkLayout.

	-- For widgets that lack native scrolling support, the GtkViewport
	-- widget acts as an adaptor class, implementing scrollability for
	-- child widgets that lack their own scrolling capabilities. Use
	-- GtkViewport to scroll child widgets such as GtkTable, GtkBox,
	-- and so on.
	
	-- If a widget has native scrolling abilities, it can be added to
	-- the GtkScrolledWindow with `add'. If a widget does not, you must
	-- first add the widget to a GtkViewport, then add the GtkViewport
	-- to the scrolled window. The convenience function
	-- gtk_scrolled_window_add_with_viewport() does exactly this, so
	-- you can ignore the presence of the viewport.
	
	-- The position of the scrollbars is controlled by the scroll
	-- adjustments. See GtkAdjustment for the fields in an adjustment -
	-- for GtkScrollbar, used by GtkScrolledWindow, the "value" field
	-- represents the position of the scrollbar, which must be between
	-- the "lower" field and "upper - page_size." The "page_size" field
	-- represents the size of the visible scrollable area. The
	-- "step_increment" and "page_increment" fields are used when the
	-- user asks to step down (using the small stepper arrows) or page
	-- down (using for example the PageDown key).

	-- If a GtkScrolledWindow doesn't behave quite as you would like,
	-- or doesn't have exactly the right layout, it's very possible to
	-- set up your own scrolling with GtkScrollbar and for example a
	-- GtkTable.

inherit
	GTK_BIN
		-- GtkScrolledWindow implements AtkImplementorIface interface.
insert
	GTK_POLICY_TYPE
	GTK_CORNER_TYPE
	GTK_SHADOW_TYPE
	
create {ANY} make, make_default, from_external_pointer

feature {} -- Creation
	make_default
			-- Creates a new scrolled window. The adjustments will be 
			-- created with it.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_scrolled_window_new (default_pointer,default_pointer))
		end
	
	make (an_horizontal_adjustment, a_vertical_adjustment: GTK_ADJUSTMENT)
			-- Creates a new scrolled window. The two arguments are the
			-- scrolled window's adjustments; these will be shared with
			-- the scrollbars and the child widget to keep the bars in
			-- sync with the child. Usually you want to pass `Void' for
			-- the adjustments, which will cause the scrolled window to
			-- create them for you.
		
			-- `an_horizontal_adjustment' : Horizontal adjustment.
			--  `a_vertical_adjustment': Vertical adjustment.
		do
			from_external_pointer (gtk_scrolled_window_new (null_or(an_horizontal_adjustment), null_or(a_vertical_adjustment)))
		end

feature {ANY} -- Adjustments
	horizontal_adjustment: GTK_ADJUSTMENT
			-- the horizontal scrollbar's adjustment, used to connect the
			-- horizontal scrollbar to the child widget's horizontal
			-- scroll functionality.
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_ADJUSTMENT]
		do
			Result := factory.wrapper_or_void (gtk_scrolled_window_get_hadjustment (handle))
		end
	
	vertical_adjustment: GTK_ADJUSTMENT
			-- the vertical scrollbar's adjustment, used to connect the
			-- vertical scrollbar to the child widget's vertical
			-- scroll functionality.
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_ADJUSTMENT]
		do
			Result := factory.wrapper_or_void (gtk_scrolled_window_get_vadjustment (handle))
		end

	
	set_horizontal_adjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Sets the GtkAdjustment for the horizontal scrollbar.
		require
			adjustment_not_void: an_adjustment /= Void
		do
			gtk_scrolled_window_set_hadjustment (handle, an_adjustment.handle)
		ensure adjustment_set: an_adjustment = horizontal_adjustment
		end

	set_vertical_adjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Sets the GtkAdjustment for the vertical scrollbar.
		require
			adjustment_not_void: an_adjustment /= Void
		do
			gtk_scrolled_window_set_vadjustment (handle, an_adjustment.handle)
		ensure adjustment_set: an_adjustment = vertical_adjustment
		end

feature {ANY} -- TODO: Scrollbars
	
-- gtk_scrolled_window_get_hscrollbar ()

-- GtkWidget*  gtk_scrolled_window_get_hscrollbar
--                                             (GtkScrolledWindow *scrolled_window);

-- Returns the horizontal scrollbar of scrolled_window.

-- scrolled_window : 	a GtkScrolledWindow
-- Returns : 	the horizontal scrollbar of the scrolled window, or NULL if it does not have one.

-- Since 2.8
-- gtk_scrolled_window_get_vscrollbar ()

-- GtkWidget*  gtk_scrolled_window_get_vscrollbar
--                                             (GtkScrolledWindow *scrolled_window);

-- Returns the vertical scrollbar of scrolled_window.

-- scrolled_window : 	a GtkScrolledWindow
-- Returns : 	the vertical scrollbar of the scrolled window, or NULL if it does not have one.

-- Since 2.8
	set_policy (an_horizontal_policy, a_vertical_policy: INTEGER)
			-- Sets the scrollbar policy for the horizontal and vertical
			-- scrollbars. The policy determines when the scrollbar
			-- should appear; it is a value from the GtkPolicyType
			-- enumeration. If `GTK_POLICY_ALWAYS', the scrollbar is
			-- always present; if `GTK_POLICY_NEVER', the scrollbar is
			-- never present; if `GTK_POLICY_AUTOMATIC', the scrollbar is
			-- present only if needed (that is, if the slider part of the
			-- bar would be smaller than the trough - the display is
			-- larger than the page size).
		require
			valid_horizontal_policy: is_valid_gtk_policy (an_horizontal_policy)
			valid_vertical_policy: is_valid_gtk_policy (a_vertical_policy)
		do
			gtk_scrolled_window_set_policy (handle, an_horizontal_policy, a_vertical_policy)
		ensure -- TODO: h and v policy_set
		end

feature {ANY} 
	add_with_viewport (a_child: GTK_WIDGET)
			-- Adds children without native scrolling capabilities. This
			-- is simply a convenience function; it is equivalent to
			-- adding the unscrollable child to a viewport, then adding
			-- the viewport to the scrolled window. If a child has native
			-- scrolling, use `add' instead of this function.

			-- The viewport scrolls the child by moving its GdkWindow,
			-- and takes the size of the child to be the size of its
			-- toplevel GdkWindow. This will be very wrong for most
			-- widgets that support native scrolling; for example, if you
			-- add a widget such as GtkTreeView with a viewport, the
			-- whole widget will scroll, including the column
			-- headings. Thus, widgets with native scrolling support
			-- should not be used with the GtkViewport proxy.

			-- A widget supports scrolling natively if the
			-- set_scroll_adjustments_signal field in GtkWidgetClass is
			-- non-zero, i.e. has been filled in with a valid signal
			-- identifier.

			-- TODO: wrap GTK_VIEWPORT
		require
			child_not_void: a_child /= Void
		do
			gtk_scrolled_window_add_with_viewport (handle, a_child.handle)
		end

	set_placement (a_window_placement: INTEGER)
			-- Determines the location of the child widget with respect
			-- to the scrollbars. The default is `gtk_corner_top_left',
			-- meaning the child is in the top left, with the scrollbars
			-- underneath and to the right. Other values in GtkCornerType
			-- are `gtk_corner_top_right', `gtk_corner_bottom_left', and
			-- `gtk_corner_bottom_right'.
		require
			valid_placement: is_valid_gtk_corner_type (a_window_placement)
		do
			gtk_scrolled_window_set_placement (handle, a_window_placement)
			ensure placement_set: a_window_placement = placement
		end

	set_shadow_type (a_type: INTEGER)
			-- Changes the type of shadow drawn around the contents of
			-- scrolled_window.
		require
			valid_shadow: is_valid_gtk_shadow_type(a_type)
		do
			gtk_scrolled_window_set_shadow_type (handle, a_type)
		ensure value_set: shadow_type = a_type
		end

	placement: INTEGER
			-- The placement of the scrollbars for the scrolled
			-- window. See `set_placement'.
		do
			Result := gtk_scrolled_window_get_placement (handle)
		ensure valid: is_valid_gtk_corner_type (Result)
		end

	horizontal_policy: INTEGER
			-- The current policy values for the horizontal
			-- scrollbar. See `set_policy'.
		do
			gtk_scrolled_window_get_policy (handle, $Result, default_pointer)
		ensure valid: is_valid_gtk_policy (Result)
		end
	
	vertical_policy: INTEGER
			-- The current policy values for the vertical scrollbar. See
			-- `set_policy'.
		do
			gtk_scrolled_window_get_policy (handle, default_pointer, $Result)
		ensure valid: is_valid_gtk_policy (Result)
		end

	policies: TUPLE [INTEGER,INTEGER]
			-- The current policy values for the horizontal
			-- scrollbar. See `set_policy'.
		local hpol, vpol: INTEGER
		do
			gtk_scrolled_window_get_policy (handle, $hpol,$vpol)
			create Result.make_2 (hpol,vpol)
		ensure
			valid_horizontal: is_valid_gtk_policy (Result.item_1)
			valid_vertical: is_valid_gtk_policy (Result.item_1)
		end
	
	shadow_type: INTEGER
			-- The shadow type of the scrolled window. See
			-- `set_shadow_type'.
		do
			Result := gtk_scrolled_window_get_shadow_type (handle)
		ensure valid: is_valid_gtk_shadow_type (Result)
		end
	
feature {ANY} -- Properties

--   "hadjustment"          GtkAdjustment         : Read / Write / Construct
--   "hscrollbar-policy"    GtkPolicyType         : Read / Write
--   "shadow-type"          GtkShadowType         : Read / Write
--   "vadjustment"          GtkAdjustment         : Read / Write / Construct
--   "vscrollbar-policy"    GtkPolicyType         : Read / Write
--   "window-placement"     GtkCornerType         : Read / Write

-- Style Properties

--   "scrollbar-spacing"    gint                  : Read

-- Property Details
-- The "hadjustment" property

--   "hadjustment"          GtkAdjustment         : Read / Write / Construct

-- The GtkAdjustment for the horizontal position.
-- The "hscrollbar-policy" property

--   "hscrollbar-policy"    GtkPolicyType         : Read / Write

-- When the horizontal scrollbar is displayed.

-- Default value: GTK_POLICY_ALWAYS
-- The "shadow-type" property

--   "shadow-type"          GtkShadowType         : Read / Write

-- Style of bevel around the contents.

-- Default value: GTK_SHADOW_NONE
-- The "vadjustment" property

--   "vadjustment"          GtkAdjustment         : Read / Write / Construct

-- The GtkAdjustment for the vertical position.
-- The "vscrollbar-policy" property

--   "vscrollbar-policy"    GtkPolicyType         : Read / Write

-- When the vertical scrollbar is displayed.

-- Default value: GTK_POLICY_ALWAYS
-- The "window-placement" property

--   "window-placement"     GtkCornerType         : Read / Write

-- Where the contents are located with respect to the scrollbars.

-- Default value: GTK_CORNER_TOP_LEFT
-- Style Property Details
-- The "scrollbar-spacing" style property

--   "scrollbar-spacing"    gint                  : Read

-- Number of pixels between the scrollbars and the scrolled window.

-- Allowed values: >= 0

-- Default value: 3

feature {ANY} -- scroll-child signal

	scroll_child_signal_name: STRING is "scroll-child"
		-- "scroll-child"
		--             void        user_function      (GtkScrolledWindow *scrolledwindow,
		--                                             GtkScrollType     *arg1,
		--                                             gboolean           arg2,
		--                                             gpointer           user_data)           : Run last / Action

	enable_on_scroll_child
			-- Connects "scroll-child" signal to `on_scroll_child' feature.
		do
			connect (Current, scroll_child_signal_name, $on_scroll_child)
		end

	on_scroll_child: INTEGER
			-- Built-in scroll-child signal handler; empty by design; redefine it.
			
			-- The `scroll-child' signal is emitted on the drag source
			-- when a drag is started. A typical reason to connect to this
			-- signal is to set up a custom drag icon with
			-- gtk_drag_source_set_icon().
		do
		end

	connect_agent_to_scroll_child_signal (a_function: FUNCTION[ANY, TUPLE [INTEGER, BOOLEAN, GTK_SCROLLED_WINDOW],
																				  BOOLEAN])
			-- scrolledwindow : 	the object which received the signal.
			-- arg1 : 	
			-- arg2 : 	
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			scroll_child_callback: SCROLL_CHILD_CALLBACK
		do
			create scroll_child_callback.make
			scroll_child_callback.connect (Current, a_function)
		end

feature {ANY} -- Signals

-- "move-focus-out"
--             void        user_function      (GtkScrolledWindow *scrolledwindow,
--                                             GtkDirectionType  *arg1,
--                                             gpointer           user_data)           : Run last / Action

-- Signal Details
-- The "move-focus-out" signal

-- void        user_function                  (GtkScrolledWindow *scrolledwindow,
--                                             GtkDirectionType  *arg1,
--                                             gpointer           user_data)           : Run last / Action

-- scrolledwindow : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- GtkViewport, GtkAdjustment, GtkWidgetClass

-- [5] The scrolled window installs GtkAdjustment objects in the child window's slots using the set_scroll_adjustments_signal, found in GtkWidgetClass. (Conceptually, these widgets implement a "Scrollable" interface; because GTK+ 1.2 lacked interface support in the object system, this interface is hackily implemented as a signal in GtkWidgetClass. The GTK+ 2.0 object system would allow a clean implementation, but it wasn't worth breaking the API.)

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkScrolledWindow)"
		end

feature {} -- External calls
	gtk_scrolled_window_new (a_hadjustment, a_vadjustment: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_get_hadjustment (a_scrolled_window: POINTER): POINTER is --  GtkAdjustment*
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_get_vadjustment (a_scrolled_window: POINTER): POINTER is -- GtkAdjustment*
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_get_hscrollbar (a_scrolled_window: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_get_vscrollbar (a_scrolled_window: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_set_policy (a_scrolled_window: POINTER; hscrollbar_policy, vscrollbar_policy: INTEGER)
		require
			valid_horizontal_policy: is_valid_gtk_policy (hscrollbar_policy)
			valid_vorizontal_policy: is_valid_gtk_policy (vscrollbar_policy)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_add_with_viewport(a_scrolled_window, a_child_gtkwidget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_set_placement (a_scrolled_window: POINTER;  window_placement: INTEGER)
		require
			valid_placement: is_valid_gtk_corner_type (window_placement)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_set_shadow_type (a_scrolled_window: POINTER; a_shadow_type: INTEGER)
		require
			valid_shadow_type: is_valid_gtk_shadow_type (a_shadow_type)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_set_hadjustment (a_scrolled_window, an_hadjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_set_vadjustment (a_scrolled_window, a_vadjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_get_placement (a_scrolled_window: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure
			valid_result: is_valid_gtk_corner_type (Result)
		end

	gtk_scrolled_window_get_policy (a_scrolled_window, a_hscrollbar_policy_pointer, a_vscrollbar_policy_pointer: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_scrolled_window_get_shadow_type (a_scrolled_window: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_shadow_type (Result)
		end

-- GtkScrolledWindow struct has no public fields; it should only be
-- accessed using the functions above. Nevertheless the original GTK+
-- documentation still provides this detail:

-- typedef struct {
--	GtkWidget *hscrollbar;
--	GtkWidget *vscrollbar;
-- } GtkScrolledWindow;

end -- class GTK_SCROLLED_WINDOW
