note
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

					
				license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GTK_WINDOW

inherit
	GTK_BIN

insert
	GTK
	GTK_WINDOW_EXTERNALS
	GTK_WINDOW_TYPE

create {ANY}
	make, make_toplevel, from_external_pointer

feature {} -- Creation

	make, make_toplevel
			-- Create a new window managed by the window manager, having
			-- a frame by default
		require
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_window_new (gtk_window_toplevel))
		end

feature {ANY}

	set_title (a_title: STRING)
		require
			a_title_not_void: a_title/=Void
		do
			gtk_window_set_title (handle, a_title.to_external)
		end

	-- TODO: wrap gtk_window_set_wmclass ()

feature {ANY} -- Resizability

	set_resizable
			-- Makes current window resizable by the user.
		do
			gtk_window_set_resizable (handle, 1)
		end

	unset_resizable
			-- Makes current window not resizable by the user.
		do
			gtk_window_set_resizable (handle, 0)
		end
		
	is_resizable: BOOLEAN
			-- Is Current window resizable by the user?
		do
			Result:=gtk_window_get_resizable (handle).to_boolean
		end

	-- TODO: wrap gtk_window_add_accel_group (window,accel_group: POINTER)
	-- TODO: wrap gtk_window_remove_accel_group (window,accel_group: POINTER)

	is_focus_activated: BOOLEAN
			-- Has the current focused widget been activated by `activate_focus'?
	
	activate_focus
			-- Try to activate the current focused widget within the
			-- window. `is_focus_activated' will be true if a widget got
			-- activated.
		do
			is_focus_activated:=gtk_window_activate_focus (handle).to_boolean
		end

	is_default_activated: BOOLEAN
			-- Has the default widget been activated by `activate_default'?

	activate_default: INTEGER
			-- Activates the default widget for the window, unless the
			-- current focused widget has been configured to receive the
			-- default action (see GTK_RECEIVES_DEFAULT in
			-- GtkWidgetFlags), in which case the focused widget is
			-- activated.
		do
			is_default_activated := gtk_window_activate_default (handle).to_boolean
		end

feature {ANY} -- Window modal mode

	set_modal
			-- Sets a window modal. Modal windows prevent interaction
			-- with other windows in the same application. To keep modal
			-- dialogs on top of main application windows, use
			-- `set_transient_for' to make the dialog transient for the
			-- parent; most window managers will then disallow lowering
			-- the dialog below the parent.
		do
			gtk_window_set_modal (handle,1)
		end

	unset_modal
			-- Sets a window non-modal.
		do
			gtk_window_set_modal (handle,0)
		end

	is_modal: BOOLEAN
			-- Is Current window modal? See `set_modal'
		do
			Result:=gtk_window_get_modal (handle).to_boolean
		end

feature {ANY} -- Window size

	set_default_size (a_width, an_height: INTEGER)
			-- Sets the default size of a window. If the window's
			-- "natural" size (its size request) is larger than the
			-- default, the default will be ignored. More generally, if
			-- the default size does not obey the geometry hints for the
			-- window (`set_geometry_hints' can be used to set these
			-- explicitly), the default size will be clamped to the
			-- nearest permitted size.

			-- Unlike `set_size_request', which sets a size request for a
			-- widget and thus would keep users from shrinking the
			-- window, this function only sets the initial size, just as
			-- if the user had resized the window themselves. Users can
			-- still shrink the window again as they normally
			-- would. Setting a default size of -1 means to use the
			-- "natural" default size (the size request of the window).

			-- For more control over a window's initial size and how
			-- resizing works, investigate `set_geometry_hints'.

			-- For some uses, `resize' is a more appropriate
			-- function. `resize' changes the current size of the window,
			-- rather than the size to be used on initial
			-- display. `resize' always affects the window itself, not
			-- the geometry widget.

			-- The default size of a window only affects the first time a
			-- window is shown; if a window is hidden and re-shown, it
			-- will remember the size it had prior to hiding, rather than
			-- using the default size.

			-- Windows can't actually be 0x0 in size, they must be at
			-- least 1x1, but passing 0 for width and height is OK,
			-- resulting in a 1x1 default size.

			-- `a_width': 	width in pixels, or -1 to unset the default width
			-- `an_height': 	height in pixels, or -1 to unset the default height
		do
			gtk_window_set_default_size (handle,a_width,an_height)
		end

	-- TODO: wrap gtk_window_set_geometry_hints (window,
	-- geometry_widget, geometry: POINTER; gdkwindowhints_geom_mask:
	-- INTEGER) which require wrapping of GdkGeometry

feature {ANY} -- Window "gravity"

	-- TODO implement set_gravity_[north/south/east/west] etc

	set_gravity (a_gravity: INTEGER)
			-- Window gravity defines the meaning of coordinates passed
			-- to `move'. See GDK_GRAVITY for more details.  The default
			-- window gravity is `gdk_gravity_north_west' which will
			-- typically "do what you mean."
		
			-- `a_gravity': window gravity
		require valid_gravity: is_valid_gravity (a_gravity)
		do
			gtk_window_set_gravity (handle, a_gravity)
		end

	gravity: INTEGER
			-- Window gravity; it defines the meaning of coordinates
			-- passed to `move'. See GDK_GRAVITY for more details.
		do
			Result := gtk_window_get_gravity (handle)
		ensure  valid_gravity: is_valid_gravity (Result)
		end

feature {ANY} -- Window position

	no_position
			-- No influence is made on placement.
		do
			gtk_window_set_position (handle,gtk_win_pos_none)
		end

	midscreen
			-- Window should be placed in the center of the screen.
		do
			gtk_window_set_position (handle, gtk_win_pos_center)
		end

	at_mouse
			-- Window should be placed at the current mouse position.
		do
			gtk_window_set_position (handle, gtk_win_pos_mouse)
		end

	always_centered
			-- Keep window centered as it changes size, etc.
		do
			gtk_window_set_position (handle, gtk_win_pos_center_always)
		end

	center_on_parent
			-- Center the window on its transient parent (see `set_transient_for').
		do
			gtk_window_set_position (handle, gtk_win_pos_center_on_parent)
		end

	set_position (a_position: INTEGER)
			-- Sets position constraint for this window to
			-- `a_position'. If the old or new constraint is
			-- `gtk_win_pos_center_always', this will also cause the
			-- window to be repositioned to satisfy the new constraint.
			-- `a_position': a position constraint.
		require valid_position: is_valid_gtk_window_position (a_position)
		do
			gtk_window_set_position (handle,a_position)
		end

feature {ANY} -- Transiency

	set_transient_for (a_parent: GTK_WINDOW)
			-- Dialog windows should be set transient for the main
			-- application window they were spawned from. This allows
			-- window managers to e.g. keep the dialog on top of the main
			-- window, or center the dialog over the main
			-- window. `GTK_DIALOG.make_with_buttons' and other convenience
			-- functions in GTK+ will sometimes call `set_transient_for' on
			-- your behalf.

			-- On Windows, this function will and put the child window on
			-- top of the parent, much as the window manager would have
			-- done on X.

			-- parent : 	parent window
		require valid_parent: a_parent/=Void
		do
			gtk_window_set_transient_for (handle,a_parent.handle)
		end

feature {ANY} -- window lifecycle

	set_destroy_with_parent
			-- destroying the transient parent of Current window will
			-- also destroy window itself. This is useful for dialogs
			-- that shouldn't persist beyond the lifetime of the main
			-- window they're associated with, for example.
		do
			gtk_window_set_destroy_with_parent (handle, 1)
		end

	unset_destroy_with_parent
			-- opposite of `set_destroy_with_parent'
		do
			gtk_window_set_destroy_with_parent (handle, 0)
		end

	-- TODO: wrap void gtk_window_set_screen (GtkWindow *window,
	-- GdkScreen *screen);
	
	-- TODO: wrap GdkScreen* gtk_window_get_screen (GtkWindow *window);

feature {ANY} -- various queries

	is_active: BOOLEAN
			-- Is current window part of the current active toplevel?
			-- (That is, the toplevel window receiving keystrokes.) The
			-- return value is TRUE if the window is active toplevel
			-- itself, but also if it is, say, a GTK_PLUG embedded in the
			-- active toplevel. You might use this function if you wanted
			-- to draw a widget differently in an active window from a
			-- widget in an inactive window. See `has_toplevel_focus'
		do
			Result:=(gtk_window_is_active (handle)).to_boolean
		end

	has_toplevel_focus: BOOLEAN
			-- Is the input focus within Current GTK_WINDOW? For real
			-- toplevel windows, this is identical to `is_active', but
			-- for embedded windows, like GTK_PLUG, the results will
			-- differ.
		do
			Result:=gtk_window_has_toplevel_focus (handle).to_boolean
		end

	-- TODO: wrap gtk_window_list_toplevels: POINTER (GList *) needs
	-- G_LIST[WRAPPED]. Returns a list of all existing toplevel
	-- windows. The widgets in the list are not individually
	-- referenced. If you want to iterate through the list and perform
	-- actions involving callbacks that might destroy the widgets, you
	-- must call g_list_foreach (result, (GFunc)g_object_ref, NULL)
	-- first, and then unref all the widgets afterwards.

	-- TODO: wrap void gtk_window_add_mnemonic (GtkWindow *window, guint keyval,
	-- GtkWidget *target);

	-- TODO: wrap void gtk_window_remove_mnemonic (GtkWindow *window,
	-- guint keyval, GtkWidget *target);
	
	-- TODO: wrap gboolean gtk_window_mnemonic_activate (GtkWindow
	-- *window, guint keyval, GdkModifierType modifier);

	-- TODO: wrap gboolean gtk_window_activate_key (GtkWindow *window,
	-- GdkEventKey *event);

	-- TODO: wrap gboolean gtk_window_propagate_key_event (GtkWindow
	-- *window, GdkEventKey *event);

	focus: GTK_WIDGET
			-- the current focused widget within the window. Note that
			-- this is the widget that would have the focus if the
			-- toplevel window focused; if the toplevel window is not
			-- focused then `has_focus' will be False.
		local ptr: POINTER
		do
			ptr:=gtk_window_get_focus (handle)
			if ptr.is_not_null then
				-- TODO: black magic to retrieve the Eiffel wrapper object
				-- if it exists or to create the correct Eiffel object
				-- from it!  If it has already been wrapped it can be
				-- stored as a property. If it hasn't been already wrapped
				-- things get misty; a possible implementation of it is to
				-- link each GtkClass to its Eiffel counterpart.
				not_yet_implemented
			else
				Result := Void
			end
		end

feature {ANY} -- Focusing
	unset_focus
			-- Unsets the focus widget for this window. 
		do
			gtk_window_set_focus (handle, default_pointer)
		ensure focus_unset: -- TODO
		end

	set_focus (a_widget: GTK_WIDGET)
			-- If `a_widget' is not the current focus widget, and is focusable,
			-- sets it as the focus widget for the window. To set the focus to
			-- a particular widget in the toplevel, it is usually more
			-- convenient to use `GTK_WIDGET.grab_focus' instead of this
			-- function.
		require 
			widget_not_void: a_widget /= Void
			widget_is_contained_in_window: -- TODO
		do
			gtk_window_set_focus (handle, a_widget.handle)
		end

	set_default (a_default: GTK_WIDGET)
			-- Sets the default widget for Current GtkWindow.  The
			-- default widget is the widget that's activated when the
			-- user presses Enter in a dialog (for example). When setting
			-- the default widget it's generally easier to call
			-- `GTK_WIDGET.grab_focus' on the widget. Before making a
			-- widget the default widget, you must set the
			-- `gtk_can_default' flag on the widget you'd like to make
			-- the default using `set_flags' (TODO?).
		require 
			default_not_void: a_default /= Void
		do
			gtk_window_set_default (handle,a_default.handle)
		end

	unset_default
			-- Unsets the default widget. See also `set_default'
		do
			gtk_window_set_default (handle, default_pointer)
		end

	present
			-- Presents a window to the user. This may mean raising the
			-- window in the stacking order, deiconifying it, moving it
			-- to the current desktop, and/or giving it the keyboard
			-- focus, possibly dependent on the user's platform, window
			-- manager, and preferences.

			-- If window is hidden, this function calls `show' as well.

			-- This feature should be used when the user tries to open a
			-- window that's already open. Say for example the
			-- preferences dialog is currently open, and the user chooses
			-- Preferences from the menu a second time; use `present' to
			-- move the already-open dialog where the user can see it.

			-- If you are calling this feature in response to a user
			-- interaction, it is preferable to use `present_with_time'.
		do
			gtk_window_present (handle)
		end

	present_with_time (a_timestamp: INTEGER_32)
			-- Presents a window to the user in response to a user
			-- interaction. If you need to present a window without a
			-- timestamp, use `present'; see `present' for details.

			-- `a_timestamp' is usually derived from the user interaction
			-- (typically a button or key press event) which triggered
			-- this call.
			-- TODO: a_timestamp shall be NATURAL_32
		require positive_stamp: a_timestamp >= 0
		do 
			gtk_window_present_with_time(handle,a_timestamp)
		end

	iconify
			-- Asks to iconify (i.e. minimize) the specified window. Note
			-- that you shouldn't assume the window is definitely
			-- iconified afterward, because other entities (e.g. the user
			-- or window manager) could deiconify it again, or there may
			-- not be a window manager in which case iconification isn't
			-- possible, etc. But normally the window will end up
			-- iconified. Just don't write code that crashes if not.

			-- It's permitted to call this function before showing a
			-- window, in which case the window will be iconified before
			-- it ever appears onscreen.

			-- You can track iconification via the "window_state_event"
			-- signal on GtkWidget.
		do
			gtk_window_iconify (handle)
		end

	deiconify
			-- Asks to deiconify (i.e. unminimize) the specified
			-- window. Note that you shouldn't assume the window is
			-- definitely deiconified afterward, because other entities
			-- (e.g. the user or window manager) could iconify it again
			-- before your code which assumes deiconification gets to
			-- run.
		
			-- You can track iconification via the "window_state_event"
			-- signal on GtkWidget.
		do
			gtk_window_deiconify (handle)
		end

	stick
			-- Asks to stick the window, which means that it will appear
			-- on all user desktops. Note that you shouldn't assume the
			-- window is definitely stuck afterward, because other
			-- entities (e.g. the user or window manager) could unstick
			-- it again, and some window managers do not support sticking
			-- windows. But normally the window will end up stuck. Just
			-- don't write code that crashes if not.

			-- It's permitted to call this function before showing a
			-- window.

			-- You can track stickiness via the "window_state_event"
			-- signal on GtkWidget.
		do
			gtk_window_stick (handle)
		end

	unstick
			-- Asks to unstick window, which means that it will appear on
			-- only one of the user's desktops. Note that you shouldn't
			-- assume the window is definitely unstuck afterward, because
			-- other entities (e.g. the user or window manager) could
			-- stick it again. But normally the window will end up
			-- stuck. Just don't write code that crashes if not.

			-- You can track stickiness via the "window_state_event" signal on GtkWidget.
		do
			gtk_window_unstick (handle)
		end

	maximize
			-- Asks to maximize window, so that it becomes
			-- full-screen. Note that you shouldn't assume the window is
			-- definitely maximized afterward, because other entities
			-- (e.g. the user or window manager) could unmaximize it
			-- again, and not all window managers support
			-- maximization. But normally the window will end up
			-- maximized. Just don't write code that crashes if not.

			-- It's permitted to call this function before showing a
			-- window, in which case the window will be maximized when it
			-- appears onscreen initially.

			-- You can track maximization via the "window_state_event"
			-- signal on GtkWidget.
		do
			gtk_window_maximize (handle)
		end

	unmaximize
			-- Asks to unmaximize window. Note that you shouldn't assume
			-- the window is definitely unmaximized afterward, because
			-- other entities (e.g. the user or window manager) could
			-- maximize it again, and not all window managers honor
			-- requests to unmaximize. But normally the window will end
			-- up unmaximized. Just don't write code that crashes if not.

			-- You can track maximization via the "window_state_event"
			-- signal on GtkWidget.
		do
			gtk_window_unmaximize (handle)
		end


	fullscreen
			-- Asks to place window in the fullscreen state. Note that
			-- you shouldn't assume the window is definitely full screen
			-- afterward, because other entities (e.g. the user or window
			-- manager) could unfullscreen it again, and not all window
			-- managers honor requests to fullscreen windows. But
			-- normally the window will end up fullscreen. Just don't
			-- write code that crashes if not.

			-- You can track the fullscreen state via the
			-- "window_state_event" signal on GtkWidget.
		do
			gtk_window_fullscreen (handle)
		end


	unfullscreen
			-- Asks to toggle off the fullscreen state for window. Note
			-- that you shouldn't assume the window is definitely not
			-- full screen afterward, because other entities (e.g. the
			-- user or window manager) could fullscreen it again, and not
			-- all window managers honor requests to unfullscreen
			-- windows. But normally the window will end up restored to
			-- its normal state. Just don't write code that crashes if
			-- not.

			-- You can track the fullscreen state via the
			-- "window_state_event" signal on GtkWidget.
		do
			gtk_window_unfullscreen (handle)
		end


	
-- 	gtk_window_set_keep_above (window: POINTER; setting: INTEGER) is 
-- 			-- Asks to keep window above, so that it stays on top. Note
-- 			-- that you shouldn't assume the window is definitely above
-- 			-- afterward, because other entities (e.g. the user or window
-- 			-- manager) could not keep it above, and not all window
-- 			-- managers support keeping windows above. But normally the
-- 			-- window will end kept above. Just don't write code that
-- 			-- crashes if not.

-- 			-- It's permitted to call this function before showing a
-- 			-- window, in which case the window will be kept above when
-- 			-- it appears onscreen initially.

-- 			-- You can track the above state via the "window_state_event"
-- 			-- signal on GtkWidget.

-- 			-- Note that, according to the Extended Window Manager Hints
-- 			-- specification, the above state is mainly meant for user
-- 			-- preferences and should not be used by applications
-- 			-- e.g. for drawing attention to their dialogs.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	whether to keep window above other windows
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- TODO: 	gtk_window_set_keep_below (window:POINTER; setting: INTEGER) is
-- 			-- Asks to keep window below, so that it stays in
-- 			-- bottom. Note that you shouldn't assume the window is
-- 			-- definitely below afterward, because other entities
-- 			-- (e.g. the user or window manager) could not keep it below,
-- 			-- and not all window managers support putting windows
-- 			-- below. But normally the window will be kept below. Just
-- 			-- don't write code that crashes if not.

-- 			-- It's permitted to call this function before showing a
-- 			-- window, in which case the window will be kept below when
-- 			-- it appears onscreen initially.

-- 			-- You can track the below state via the "window_state_event"
-- 			-- signal on GtkWidget.

-- 			-- Note that, according to the Extended Window Manager Hints
-- 			-- specification, the above state is mainly meant for user
-- 			-- preferences and should not be used by applications
-- 			-- e.g. for drawing attention to their dialogs.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	whether to keep window below other windows
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- TODO:	gtk_window_begin_resize_drag (window: POINTER;
-- 											edge, button, root_x, root_y: INTEGER;
-- 											guint32_timestamp: INTEGER) is
-- 			-- Starts resizing a window. This function is used if an
-- 			-- application has window resizing controls. When GDK can
-- 			-- support it, the resize will be done using the standard
-- 			-- mechanism for the window manager or windowing
-- 			-- system. Otherwise, GDK will try to emulate window
-- 			-- resizing, potentially not all that well, depending on the
-- 			-- windowing system.

-- 			-- window : 	a GtkWindow
-- 			-- edge : 	(GdkWindowEdge) position of the resize control
-- 			-- button : 	mouse button that initiated the drag
-- 			-- root_x : 	X position where the user clicked to initiate the drag, in root window coordinates
-- 			-- root_y : 	Y position where the user clicked to initiate the drag
-- 			-- timestamp : 	timestamp from the click event that initiated the drag
-- 		external "C use <gtk/gtk.h>"
-- 		end

-- TODO:	gtk_window_begin_move_drag      (GtkWindow *window,
-- 												button, root_x, root_y: INTEGER;
-- 												guint32_timestamp: INTEGER_32) is
-- 			-- Starts moving a window. This function is used if an
-- 			-- application has window movement grips. When GDK can support
-- 			-- it, the window movement will be done using the standard
-- 			-- mechanism for the window manager or windowing
-- 			-- system. Otherwise, GDK will try to emulate window movement,
-- 			-- potentially not all that well, depending on the windowing
-- 			-- system.

-- 			-- window : 	a GtkWindow
-- 			-- button : 	mouse button that initiated the drag
-- 			-- root_x : X position where the user clicked to initiate the
-- 			-- drag, in root window coordinates
-- 			-- root_y : 	Y position where the user clicked to initiate the drag
-- 			-- timestamp : 	timestamp from the click event that initiated the drag
-- 		external "C use <gtk/gtk.h>"
-- 		end

-- TODO:	gtk_window_set_decorated (window: POINTER; setting: INTEGER) is
-- 			-- By default, windows are decorated with a title bar, resize
-- 			-- controls, etc. Some window managers allow GTK+ to disable
-- 			-- these decorations, creating a borderless window. If you
-- 			-- set the decorated property to FALSE using this function,
-- 			-- GTK+ will do its best to convince the window manager not
-- 			-- to decorate the window. Depending on the system, this
-- 			-- function may not have any effect when called on a window
-- 			-- that is already visible, so you should call it before
-- 			-- calling gtk_window_show().

-- 			-- On Windows, this function always works, since there's no
-- 			-- window manager policy involved.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	TRUE to decorate the window
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- TODO:	gtk_window_set_frame_dimensions (window: POINTER; left,top,right,bottom: INTEGER) is
-- 			-- (Note: this is a special-purpose function intended for the
-- 			-- framebuffer port; see gtk_window_set_has_frame(). It will
-- 			-- have no effect on the window border drawn by the window
-- 			-- manager, which is the normal case when using the X Window
-- 			-- system.)

-- 			-- For windows with frames (see gtk_window_set_has_frame()) this function can be used to change the size of the frame border.
		
-- 			-- window : 	a GtkWindow that has a frame
-- 			-- left : 	The width of the left border
-- 			-- top : 	The height of the top border
-- 			-- right : 	The width of the right border
-- 			-- bottom : 	The height of the bottom border
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_set_has_frame (window: POINTER; setting: INTEGER) is
-- 			-- (Note: this is a special-purpose function for the
-- 			-- framebuffer port, that causes GTK+ to draw its own window
-- 			-- border. For most applications, you want
-- 			-- gtk_window_set_decorated() instead, which tells the window
-- 			-- manager whether to draw the window border.)

-- 			-- If this function is called on a window with setting of
-- 			-- TRUE, before it is realized or showed, it will have a
-- 			-- "frame" window around window->window, accessible in
-- 			-- window->frame. Using the signal frame_event you can
-- 			-- receive all events targeted at the frame.

-- 			-- This function is used by the linux-fb port to implement
-- 			-- managed windows, but it could concievably be used by
-- 			-- X-programs that want to do their own window decorations.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	a boolean
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- -- void        gtk_window_set_mnemonic_modifier
-- --                                             (GtkWindow *window,
-- --                                              GdkModifierType modifier);

-- -- Sets the mnemonic modifier for this window.

-- -- window : 	a GtkWindow
-- -- modifier : 	the modifier mask used to activate mnemonics on this window.
-- --		external "C use <gtk/gtk.h>"
-- --		end


-- -- void        gtk_window_set_role             (GtkWindow *window,
-- --                                              const gchar *role);

-- -- This function is only useful on X11, not with other GTK+ targets.

-- -- In combination with the window title, the window role allows a window manager to identify "the same" window when an application is restarted. So for example you might set the "toolbox" role on your app's toolbox window, so that when the user restarts their session, the window manager can put the toolbox back in the same place.

-- -- If a window already has a unique title, you don't need to set the role, since the WM can use the title to identify the window when restoring the session.

-- -- window : 	a GtkWindow
-- -- role : 	unique identifier for the window to be used when restoring a session
-- --		external "C use <gtk/gtk.h>"
-- --		end


-- 	gtk_window_set_type_hint (window: POINTER; a_hint: INTEGER) is
-- 			-- By setting the type hint for the window, you allow the window
-- 			-- manager to decorate and handle the window in a way which is
-- 			-- suitable to the function of the window in your application.

-- 			-- This function should be called before the window becomes visible.

-- 			-- gtk_dialog_new_with_buttons() and other convenience functions in GTK+ will sometimes call gtk_window_set_type_hint() on your behalf.
		
-- 			-- window : 	a GtkWindow
-- 			-- hint : 	(GDKWINDOWTYPEHINT) the window type
-- 		require valid_hint: is_valid_window_type_hint (a_hint)
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_set_skip_taskbar_hint (window: POINTER; setting: INTEGER) is
-- 			-- Windows may set a hint asking the desktop environment not
-- 			-- to display the window in the task bar. This function sets
-- 			-- this hint.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	TRUE to keep this window from appearing in the task bar
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_set_skip_pager_hint (window: POINTER; setting: INTEGER) is
-- 			-- Windows may set a hint asking the desktop environment not to display the window in the pager. This function sets this hint. (A "pager" is any desktop navigation tool such as a workspace switcher that displays a thumbnail representation of the windows on the screen.)

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	TRUE to keep this window from appearing in the pager
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_set_urgency_hint (window: POINTER; setting: INTEGER) is
-- 			-- Windows may set a hint asking the desktop environment to
-- 			-- draw the users attention to the window. This function sets
-- 			-- this hint.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	TRUE to mark this window as urgent
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_set_accept_focus (window: POINTER; setting: INTEGER) is
-- 			-- Windows may set a hint asking the desktop environment not
-- 			-- to receive the input focus. This function sets this hint.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	TRUE to let this window receive input focus
-- 		external "C use <gtk/gtk.h>"
-- 		end

-- 	gtk_window_set_focus_on_map (window: POINTER; setting: INTEGER) is
-- 			-- Windows may set a hint asking the desktop environment not
-- 			-- to receive the input focus when the window is mapped. This
-- 			-- function sets this hint.

-- 			-- window : 	a GtkWindow
-- 			-- setting : 	TRUE to let this window receive input focus on map
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_decorated (window: POINTER): INTEGER is
-- 			-- Returns whether the window has been set to have
-- 			-- decorations such as a title bar via
-- 			-- gtk_window_set_decorated().

-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	TRUE if the window has been set to have decorations
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	-- GList*      gtk_window_get_default_icon_list
-- 	--                                             (void);
	
-- 	-- Gets the value set by gtk_window_set_default_icon_list(). The list is a copy and should be freed with g_list_free(), but the pixbufs in the list have not had their reference count incremented.
	
-- 	-- Returns : 	copy of default icon list
-- 	--external "C use <gtk/gtk.h>"
-- 	--end


-- 	gtk_window_get_default_size (window, gint_width, gint_height: POINTER) is
-- 			-- Gets the default size of the window. A value of -1 for the
-- 			-- width or height indicates that a default size has not been
-- 			-- explicitly set for that dimension, so the "natural" size
-- 			-- of the window will be used.

-- 			-- window : 	a GtkWindow
-- 			-- width : 	(gint *) location to store the default width, or NULL
-- 			-- height : (gint *) location to store the default height, or NULL
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_destroy_with_parent (window: POINTER): INTEGER is
-- 			-- Returns whether the window will be destroyed with its
-- 			-- transient parent. See
-- 			-- gtk_window_set_destroy_with_parent().
		
-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	TRUE if the window will be destroyed with its transient parent.
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_frame_dimensions (window,left,top,right,bottom: POINTER) is
-- 			-- (Note: this is a special-purpose function intended for the
-- 			-- framebuffer port; see gtk_window_set_has_frame(). It will
-- 			-- not return the size of the window border drawn by the
-- 			-- window manager, which is the normal case when using a
-- 			-- windowing system. See gdk_window_get_frame_extents() to
-- 			-- get the standard window border extents.)

-- 			-- Retrieves the dimensions of the frame window for this
-- 			-- toplevel. See gtk_window_set_has_frame(),
-- 			-- gtk_window_set_frame_dimensions().
		
-- 			-- window : 	a GtkWindow
-- 			-- left: (gint*) location to store the width of the frame at the left, or NULL
-- 			-- top : (gint*) location to store the height of the frame at the top, or NULL
-- 			-- right :(gint*) location to store the width of the frame at the returns, or NULL
-- 			-- bottom :(gint*) location to store the height of the frame at the bottom, or NULL
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_has_frame (window: POINTER): INTEGER is
-- 			-- Accessor for whether the window has a frame window
-- 			-- exterior to window->window. Gets the value set by
-- 			-- gtk_window_set_has_frame().

-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	TRUE if a frame has been added to the window via gtk_window_set_has_frame().
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_icon (window: POINTER): POINTER is
-- 		-- Gets the value set by gtk_window_set_icon() (or if you've
-- 		-- called gtk_window_set_icon_list(), gets the first icon in the
-- 		-- icon list).
		
-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	icon for window (GdkPixbuf*)
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_icon_list (window: POINTER): POINTER is
-- 			-- Retrieves the list of icons set by
-- 			-- gtk_window_set_icon_list(). The list is copied, but the
-- 			-- reference count on each member won't be incremented.

-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	copy of window's icon list (GList*)
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_icon_name (window: POINTER): POINTER is
-- 			-- Returns the name of the themed icon for the window, see
-- 			-- gtk_window_set_icon_name().
-- 			-- window : a GtkWindow
-- 			-- Returns : the icon name or NULL if the window has no
-- 			-- themed icon (gchar *)
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- -- GdkModifierType gtk_window_get_mnemonic_modifier
-- --                                             (GtkWindow *window);

-- -- Returns the mnemonic modifier for this window. See gtk_window_set_mnemonic_modifier().

-- -- window : 	a GtkWindow
-- -- Returns : 	the modifier mask used to activate mnemonics on this window.
-- --		external "C use <gtk/gtk.h>"
-- --		end


-- 	gtk_window_get_position (window, root_x, root_y: POINTER) is
-- 			-- This function returns the position you need to pass to
-- 			-- gtk_window_move() to keep window in its current
-- 			-- position. This means that the meaning of the returned
-- 			-- value varies with window gravity. See gtk_window_move()
-- 			-- for more details.

-- 			-- If you haven't changed the window gravity, its gravity
-- 			-- will be GDK_GRAVITY_NORTH_WEST. This means that
-- 			-- gtk_window_get_position() gets the position of the
-- 			-- top-left corner of the window manager frame for the
-- 			-- window. gtk_window_move() sets the position of this same
-- 			-- top-left corner.

-- 			-- gtk_window_get_position() is not 100% reliable because the
-- 			-- X Window System does not specify a way to obtain the
-- 			-- geometry of the decorations placed on a window by the
-- 			-- window manager. Thus GTK+ is using a "best guess" that
-- 			-- works with most window managers.

-- 			-- Moreover, nearly all window managers are historically
-- 			-- broken with respect to their handling of window
-- 			-- gravity. So moving a window to its current position as
-- 			-- returned by gtk_window_get_position() tends to result in
-- 			-- moving the window slightly. Window managers are slowly
-- 			-- getting better over time.

-- 			-- If a window has gravity GDK_GRAVITY_STATIC the window
-- 			-- manager frame is not relevant, and thus
-- 			-- gtk_window_get_position() will always produce accurate
-- 			-- results. However you can't use static gravity to do things
-- 			-- like place a window in a corner of the screen, because
-- 			-- static gravity ignores the window manager decorations.

-- 			-- If you are saving and restoring your application's window
-- 			-- positions, you should know that it's impossible for
-- 			-- applications to do this without getting it somewhat wrong
-- 			-- because applications do not have sufficient knowledge of
-- 			-- window manager state. The Correct Mechanism is to support
-- 			-- the session management protocol (see the "GnomeClient"
-- 			-- object in the GNOME libraries for example) and allow the
-- 			-- window manager to save your window sizes and positions.
		
-- 			-- window : 	a GtkWindow
		
-- 			-- root_x : (gint*) return location for X coordinate of
-- 			-- gravity-determined reference p\oint
		
-- 			-- root_y : (gint*) return location for Y coordinate of
-- 			-- gravity-determined reference p\oint
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	-- const gchar* gtk_window_get_role            (GtkWindow *window);
	
-- 	-- Returns the role of the window. See gtk_window_set_role() for further explanation.
	
-- 	-- window : 	a GtkWindow
-- 	-- Returns : 	the role of the window if set, or NULL. The returned is owned by the widget and must not be modified or freed.
-- 	--external "C use <gtk/gtk.h>"
-- 	--end


-- 	gtk_window_get_size (window, width, height: POINTER) is
-- 			-- Obtains the current size of window. If window is not
-- 			-- onscreen, it returns the size GTK+ will suggest to the
-- 			-- window manager for the initial window size (but this is
-- 			-- not reliably the same as the size the window manager will
-- 			-- actually select). The size obtained by
-- 			-- gtk_window_get_size() is the last size received in a
-- 			-- GdkEventConfigure, that is, GTK+ uses its locally-stored
-- 			-- size, rather than querying the X server for the size. As a
-- 			-- result, if you call gtk_window_resize() then immediately
-- 			-- call gtk_window_get_size(), the size won't have taken
-- 			-- effect yet. After the window manager processes the resize
-- 			-- request, GTK+ receives notification that the size has
-- 			-- changed via a configure event, and the size of the window
-- 			-- gets updated.

-- 			-- Note 1: Nearly any use of this function creates a race
-- 			-- condition, because the size of the window may change
-- 			-- between the time that you get the size and the time that
-- 			-- you perform some action assuming that size is the current
-- 			-- size. To avoid race conditions, connect to
-- 			-- "configure_event" on the window and adjust your
-- 			-- size-dependent state to match the size delivered in the
-- 			-- GdkEventConfigure.
		
-- 			-- Note 2: The returned size does not include the size of the
-- 			-- window manager decorations (aka the window frame or
-- 			-- border). Those are not drawn by GTK+ and GTK+ has no
-- 			-- reliable method of determining their size.

-- 			-- Note 3: If you are getting a window size in order to
-- 			-- position the window onscreen, there may be a better
-- 			-- way. The preferred way is to simply set the window's
-- 			-- semantic type with gtk_window_set_type_hint(), which
-- 			-- allows the window manager to e.g. center dialogs. Also, if
-- 			-- you set the transient parent of dialogs with
-- 			-- gtk_window_set_transient_for() window managers will often
-- 			-- center the dialog over its parent window. It's much
-- 			-- preferred to let the window manager handle these things
-- 			-- rather than doing it yourself, because all apps will
-- 			-- behave consistently and according to user prefs if the
-- 			-- window manager handles it. Also, the window manager can
-- 			-- take the size of the window decorations/border into
-- 			-- account, while your application cannot.

-- 			-- In any case, if you insist on application-specified window
-- 			-- positioning, there's still a better way than doing it
-- 			-- yourself - gtk_window_set_position() will frequently
-- 			-- handle the details for you.

-- 			-- window : 	a GtkWindow
-- 			-- width : (gint*) return location for width, or NULL
-- 			-- height : (gint *) return location for height, or NULL
-- 		external "C use <gtk/gtk.h>"
-- 		end


	title: CONST_STRING
		-- The title of the window, or Void if none has been set explicitely. 
	local p: POINTER
	do
		p:=gtk_window_get_title (handle)
		if p.is_not_null then 
			create Result.from_external(p) 
		end
	end

-- 	gtk_window_get_transient_for (window: POINTER): POINTER is
-- 			-- Fetches the transient parent for this window. See
-- 			-- gtk_window_set_transient_for().

-- 			-- window : a GtkWindow; Returns: (GtkWindow*) the transient
-- 			-- parent for this window, or NULL if no transient parent has
-- 			-- been set.
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_type_hint  (window: POINTER): INTEGER is
-- 			-- Gets the type hint for this window. See gtk_window_set_type_hint().

-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	the type hint for window. GdkWindowTypeHint
-- 		external "C use <gtk/gtk.h>"
-- 		ensure valid_type_hint: is_valid_window_type_hint (Result)
-- 		end


-- 	gtk_window_get_skip_taskbar_hint (window: POINTER): INTEGER is
-- 			-- Gets the value set by gtk_window_set_skip_taskbar_hint()
-- 			-- window : a GtkWindow Returns : TRUE if window shouldn't be
-- 			-- in taskbar
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_skip_pager_hint (window: POINTER): INTEGER is
-- 			-- Gets the value set by gtk_window_set_skip_pager_hint().
-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	TRUE if window shouldn't be in pager
-- 		external "C use <gtk/gtk.h>"
-- 		end

-- 	gtk_window_get_urgency_hint (window: POINTER): INTEGER is
-- 			-- Gets the value set by gtk_window_set_urgency_hint()
-- 			-- window : 	a GtkWindow
-- 			-- Returns : 	TRUE if window is urgent
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- 	gtk_window_get_accept_focus     (window: POINTER): INTEGER
-- 		-- Gets the value set by gtk_window_set_accept_focus().  window
-- 		-- : a GtkWindow Returns : TRUE if window should receive the
-- 		-- input focus
-- 		external "C use <gtk/gtk.h>"
-- 		end


-- -- gboolean    gtk_window_get_focus_on_map     (GtkWindow *window);

-- -- Gets the value set by gtk_window_set_focus_on_map().

-- -- window : 	a GtkWindow
-- -- Returns : 	TRUE if window should receive the input focus when mapped.

-- -- Since 2.6
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


	move (an_x, an_y: INTEGER)
			-- Asks the window manager to move window to the given position.
			-- Window managers are free to ignore this; most window managers
			-- ignore requests for initial window positions (instead using a
			-- user-defined placement algorithm) and honor requests after the
			-- window has already been shown.
			--
			-- Note: the position is the position of the gravity-determined
			-- reference point for the window. The gravity determines two
			-- things: first, the location of the reference point in root
			-- window coordinates; and second, which point on the window is
			-- positioned at the reference point.
			--
			-- By default the gravity is GDK_GRAVITY_NORTH_WEST, so the
			-- reference point is simply the x, y supplied to `move'.
			-- The top-left corner of the window decorations (aka window
			-- frame or border) will be placed at x, y. Therefore, to
			-- position a window at the top left of the screen, you want to
			-- use the default gravity (which is GDK_GRAVITY_NORTH_WEST)
			-- and move the window to 0,0.
			--
			-- To position a window at the bottom right corner of the screen,
			-- you would set GDK_GRAVITY_SOUTH_EAST, which means that the
			-- reference point is at x + the window width and y + the window
			-- height, and the bottom-right corner of the window border will
			-- be placed at that reference point. So, to place a window in
			-- the bottom right corner you would first set gravity to south
			-- east, then write:
			-- gtk_window_move (window, gdk_screen_width() - window_width, gdk_screen_height() - window_height).
			--
			-- The Extended Window Manager Hints specification at
			-- http://www.freedesktop.org/Standards/wm-spec has a nice table
			-- of gravities in the "implementation notes" section.
			--
			-- The gtk_window_get_position() documentation may also be relevant.
			--
			-- an_x : X coordinate to move window to
			-- an_y : Y coordinate to move window to
		do
			gtk_window_move (handle, an_x, an_y)
		end


-- -- gboolean    gtk_window_parse_geometry       (GtkWindow *window,
-- --                                              const gchar *geometry);

-- -- Parses a standard X Window System geometry string - see the manual page for X (type 'man X') for details on this. gtk_window_parse_geometry() does work on all GTK+ ports including Win32 but is primarily intended for an X environment.

-- -- If either a size or a position can be extracted from the geometry string, gtk_window_parse_geometry() returns TRUE and calls gtk_window_set_default_size() and/or gtk_window_move() to resize/move the window.

-- -- If gtk_window_parse_geometry() returns TRUE, it will also set the GDK_HINT_USER_POS and/or GDK_HINT_USER_SIZE hints indicating to the window manager that the size/position of the window was user-specified. This causes most window managers to honor the geometry.

-- -- Note that for gtk_window_parse_geometry() to work as expected, it has to be called when the window has its "final" size, i.e. after calling gtk_widget_show_all() on the contents and gtk_window_set_geometry_hints() on the window.

-- -- include <gtk/gtk.h>
	
-- -- static void
-- -- fill_with_content (GtkWidget *vbox)
-- -- {
-- --   /* fill with content... */
-- -- }
	
-- -- int
-- -- main (int argc, char *argv[])
-- -- {
-- --   GtkWidget *window, *vbox;
-- --   GdkGeometry size_hints = {
-- --     100, 50, 0, 0, 100, 50, 10, 10, 0.0, 0.0, GDK_GRAVITY_NORTH_WEST  
-- --   };
	
-- --   gtk_init (&argc, &argv);
  
-- --   window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
-- --   vbox = gtk_vbox_new (FALSE, 0);
  
-- --   gtk_container_add (GTK_CONTAINER (window), vbox);
-- --   fill_with_content (vbox);
-- --   gtk_widget_show_all (vbox);
  
-- --   gtk_window_set_geometry_hints (GTK_WINDOW (window),
-- -- 	  			    window,
-- -- 				    &size_hints,
-- -- 				    GDK_HINT_MIN_SIZE | 
-- -- 				    GDK_HINT_BASE_SIZE | 
-- -- 				    GDK_HINT_RESIZE_INC);
  
-- --   if (argc > 1)
-- --     {
-- --       if (!gtk_window_parse_geometry (GTK_WINDOW (window), argv[1]))
-- --         fprintf (stderr, "Failed to parse '%s'\n", argv[1]);
-- --     }
	
-- --   gtk_widget_show_all (window);
-- --   gtk_main();
	
-- --   return 0;
-- -- }

-- -- window : 	a GtkWindow
-- -- geometry : 	geometry string
-- -- Returns : 	TRUE if string was parsed successfully
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_reshow_with_initial_size
-- --                                             (GtkWindow *window);

-- -- Hides window, then reshows it, resetting the default size and position of the window. Used by GUI builders only.

-- -- window : 	a GtkWindow
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_resize               (GtkWindow *window,
-- --                                              gint width,
-- --                                              gint height);

-- -- Resizes the window as if the user had done so, obeying geometry constraints. The default geometry constraint is that windows may not be smaller than their size request; to override this constraint, call gtk_widget_set_size_request() to set the window's request to a smaller value.

-- -- If gtk_window_resize() is called before showing a window for the first time, it overrides any default size set with gtk_window_set_default_size().

-- -- Windows may not be resized smaller than 1 by 1 pixels.

-- -- window : 	a GtkWindow
-- -- width : 	width in pixels to resize the window to
-- -- height : 	height in pixels to resize the window to
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_set_default_icon_list
-- --                                             (GList *list);

-- -- Sets an icon list to be used as fallback for windows that haven't had gtk_window_set_icon_list() called on them to set up a window-specific icon list. This function allows you to set up the icon for all windows in your app at once.

-- -- See gtk_window_set_icon_list() for more details.

-- -- list : 	a list of GdkPixbuf
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_set_default_icon     (GdkPixbuf *icon);

-- -- Sets an icon to be used as fallback for windows that haven't had gtk_window_set_icon() called on them from a pixbuf.

-- -- icon : 	the icon

-- -- Since 2.4
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- gboolean    gtk_window_set_default_icon_from_file
-- --                                             (const gchar *filename,
-- --                                              GError **err);

-- -- Sets an icon to be used as fallback for windows that haven't had gtk_window_set_icon_list() called on them from a file on disk. Warns on failure if err is NULL.

-- -- filename : 	location of icon file
-- -- err : 	location to store error, or NULL.
-- -- Returns : 	TRUE if setting the icon succeeded.

-- -- Since 2.2
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_set_default_icon_name
-- --                                             (const gchar *name);

-- -- Sets an icon to be used as fallback for windows that haven't had gtk_window_set_icon_list() called on them from a named themed icon, see gtk_window_set_icon_name().

-- -- name : 	the name of the themed icon

-- -- Since 2.6
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


	set_icon (icon: GDK_PIXBUF)
			-- Sets up the icon representing Current. This icon is
			-- used when the window is minimized (also known as iconified).
			-- Some window managers or desktop environments may also place
			-- it in the window frame, or display it in other contexts.
			
			-- The icon should be provided in whatever size it was
			-- naturally drawn; that is, don't scale the image before
			-- passing it to GTK+. Scaling is postponed until the last
			-- minute, when the desired final size is known, to allow best
			-- quality.
			
			-- If you have your icon hand-drawn in multiple sizes, use
			-- `set_icon_list'. Then the best size will be used.
			-- This function is equivalent to calling `set_icon_list'
			-- with a 1-element list. See also `set_default_icon_list' to
			-- set the icon for all windows in your application in one go.
		require
			icon /= Void
		do
			gtk_window_set_icon (handle, icon.handle)
		end

-- -- window : 	a GtkWindow
-- -- icon : 	icon image, or NULL
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_set_icon_list        (GtkWindow *window,
-- --                                              GList *list);

-- -- Sets up the icon representing a GtkWindow. The icon is used when the window is minimized (also known as iconified). Some window managers or desktop environments may also place it in the window frame, or display it in other contexts.

-- -- gtk_window_set_icon_list() allows you to pass in the same icon in several hand-drawn sizes. The list should contain the natural sizes your icon is available in; that is, don't scale the image before passing it to GTK+. Scaling is postponed until the last minute, when the desired final size is known, to allow best quality.

-- -- By passing several sizes, you may improve the final image quality of the icon, by reducing or eliminating automatic image scaling.

-- -- Recommended sizes to provide: 16x16, 32x32, 48x48 at minimum, and larger images (64x64, 128x128) if you have them.

-- -- See also gtk_window_set_default_icon_list() to set the icon for all windows in your application in one go.

-- -- Note that transient windows (those who have been set transient for another window using gtk_window_set_transient_for()) will inherit their icon from their transient parent. So there's no need to explicitly set the icon on transient windows.

-- -- window : 	a GtkWindow
-- -- list : 	list of GdkPixbuf
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- gboolean    gtk_window_set_icon_from_file   (GtkWindow *window,
-- --                                              const gchar *filename,
-- --                                              GError **err);

-- -- Sets the icon for window. Warns on failure if err is NULL.

-- -- This function is equivalent to calling gtk_window_set_icon() with a pixbuf created by loading the image from filename.

-- -- window : 	a GtkWindow
-- -- filename : 	location of icon file
-- -- err : 	location to store error, or NULL.
-- -- Returns : 	TRUE if setting the icon succeeded.

-- -- Since 2.2
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_set_icon_name        (GtkWindow *window,
-- --                                              const gchar *name);

-- -- Sets the icon for the window from a named themed icon. See the docs for GtkIconTheme for more details.

-- -- Note that this has nothing to do with the WM_ICON_NAME property which is mentioned in the ICCCM.

-- -- window : 	a GtkWindow
-- -- name : 	the name of the themed icon

-- -- Since 2.6
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_window_set_auto_startup_notification
-- --                                             (gboolean setting);

-- -- By default, after showing the first GtkWindow for each GdkScreen, GTK+ calls gdk_screen_notify_startup_complete(). Call this function to disable the automatic startup notification. You might do this if your first window is a splash screen, and you want to delay notification until after your real main window has been shown, for example.

-- -- In that example, you would disable startup notification temporarily, show your splash screen, then re-enable it so that showing the main window would automatically result in notification.

-- -- setting : 	TRUE to automatically do startup notification

-- -- Since 2.2
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_decorated_window_init       (GtkWindow *window);

-- -- window : 	
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_decorated_window_calculate_frame_size
-- --                                             (GtkWindow *window);

-- -- window : 	
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_decorated_window_set_title  (GtkWindow *window,
-- --                                              const gchar *title);

-- -- window : 	
-- -- title : 	
-- 		--external "C use <gtk/gtk.h>"
-- 		--end


-- -- void        gtk_decorated_window_move_resize_window
-- --                                             (GtkWindow *window,
-- --                                              gint x,
-- --                                              gint y,
-- --                                              gint width,
-- --                                              gint height);

-- -- window : 	
-- -- x : 	
-- -- y : 	
-- -- width : 	
-- -- height : 	
-- -- Properties
-- -- The "accept-focus" property

-- --   "accept-focus"         gboolean              : Read / Write

-- -- TRUE if the window should receive the input focus.

-- -- Default value: TRUE
-- -- The "allow-grow" property

-- --   "allow-grow"           gboolean              : Read / Write

-- -- If TRUE, users can expand the window beyond its minimum size.

-- -- Default value: TRUE
-- -- The "allow-shrink" property

-- --   "allow-shrink"         gboolean              : Read / Write

-- -- If TRUE, the window has no mimimum size. Setting this to TRUE is 99% of the time a bad idea.

-- -- Default value: FALSE
-- -- The "decorated" property

-- --   "decorated"            gboolean              : Read / Write

-- -- Whether the window should be decorated by the window manager.

-- -- Default value: TRUE

-- -- Since 2.4
-- -- The "default-height" property

-- --   "default-height"       gint                  : Read / Write

-- -- The default height of the window, used when initially showing the window.

-- -- Allowed values: >= -1

-- -- Default value: -1
-- -- The "default-width" property

-- --   "default-width"        gint                  : Read / Write

-- -- The default width of the window, used when initially showing the window.

-- -- Allowed values: >= -1

-- -- Default value: -1
-- -- The "destroy-with-parent" property

-- --   "destroy-with-parent"  gboolean              : Read / Write

-- -- If this window should be destroyed when the parent is destroyed.

-- -- Default value: FALSE
-- -- The "focus-on-map" property

-- --   "focus-on-map"         gboolean              : Read / Write

-- -- TRUE if the window should receive the input focus when mapped.

-- -- Default value: TRUE
-- -- The "gravity" property

-- --   "gravity"              GdkGravity            : Read / Write

-- -- The window gravity of the window. See gtk_window_move() and GdkGravity for more details about window gravity.

-- -- Default value: GDK_GRAVITY_NORTH_WEST

-- -- Since 2.4
-- -- The "has-toplevel-focus" property

-- --   "has-toplevel-focus"   gboolean              : Read

-- -- Whether the input focus is within this GtkWindow.

-- -- Default value: FALSE
-- -- The "icon" property

-- --   "icon"                 GdkPixbuf             : Read / Write

-- -- Icon for this window.
-- -- The "icon-name" property

-- --   "icon-name"            gchararray            : Read / Write

-- -- The :icon-name property specifies the name of the themed icon to use as the window icon. See GtkIconTheme for more details.

-- -- Default value: NULL

-- -- Since 2.6
-- -- The "is-active" property

-- --   "is-active"            gboolean              : Read

-- -- Whether the toplevel is the current active window.

-- -- Default value: FALSE
-- -- The "modal" property

-- --   "modal"                gboolean              : Read / Write

-- -- If TRUE, the window is modal (other windows are not usable while this one is up).

-- -- Default value: FALSE
-- -- The "resizable" property

-- --   "resizable"            gboolean              : Read / Write

-- -- If TRUE, users can resize the window.

-- -- Default value: TRUE
-- -- The "role" property

-- --   "role"                 gchararray            : Read / Write

-- -- Unique identifier for the window to be used when restoring a session.

-- -- Default value: NULL
-- -- The "screen" property

-- --   "screen"               GdkScreen             : Read / Write

-- -- The screen where this window will be displayed.
-- -- The "skip-pager-hint" property

-- --   "skip-pager-hint"      gboolean              : Read / Write

-- -- TRUE if the window should not be in the pager.

-- -- Default value: FALSE
-- -- The "skip-taskbar-hint" property

-- --   "skip-taskbar-hint"    gboolean              : Read / Write

-- -- TRUE if the window should not be in the task bar.

-- -- Default value: FALSE
-- -- The "title" property

-- --   "title"                gchararray            : Read / Write

-- -- The title of the window.

-- -- Default value: NULL
-- -- The "type" property

-- --   "type"                 GtkWindowType         : Read / Write / Construct Only

-- -- The type of the window.

-- -- Default value: GTK_WINDOW_TOPLEVEL
-- -- The "type-hint" property

-- --   "type-hint"            GdkWindowTypeHint     : Read / Write

-- -- Hint to help the desktop environment understand what kind of window this is and how to treat it.

-- -- Default value: GDK_WINDOW_TYPE_HINT_NORMAL
-- -- The "urgency-hint" property

-- --   "urgency-hint"         gboolean              : Read / Write

-- -- TRUE if the window should be brought to the user's attention.

-- -- Default value: FALSE
-- -- The "window-position" property

-- --   "window-position"      GtkWindowPosition     : Read / Write

-- -- The initial position of the window.

-- -- Default value: GTK_WIN_POS_NONE
-- -- Signals
-- -- The "activate-default" signal

-- -- void        user_function                  (GtkWindow *window,
-- --                                             gpointer user_data);

-- -- window : 	the object which received the signal.
-- -- user_data : 	user data set when the signal handler was connected.
-- -- The "activate-focus" signal

-- -- void        user_function                  (GtkWindow *window,
-- --                                             gpointer user_data);

-- -- window : 	the object which received the signal.
-- -- user_data : 	user data set when the signal handler was connected.
-- -- The "frame-event" signal

-- -- gboolean    user_function                  (GtkWindow *window,
-- --                                             GdkEvent *event,
-- --                                             gpointer user_data);

-- -- window : 	the object which received the signal.
-- -- event : 	
-- -- user_data : 	user data set when the signal handler was connected.
-- -- Returns : 	
-- -- The "keys-changed" signal

-- -- void        user_function                  (GtkWindow *window,
-- --                                             gpointer user_data);

-- -- window : 	the object which received the signal.
-- -- user_data : 	user data set when the signal handler was connected.
-- -- The "move-focus" signal

-- -- void        user_function                  (GtkWindow *window,
-- --                                             GtkDirectionType arg1,
-- --                                             gpointer user_data);

-- -- window : 	the object which received the signal.
-- -- arg1 : 	
-- -- user_data : 	user data set when the signal handler was connected.
-- -- The "set-focus" signal

-- -- void        user_function                  (GtkWindow *window,
-- --                                             GtkWidget *widget,
-- --                                             gpointer user_data);

-- -- window : 	the object which received the signal.
-- -- widget : 	
-- -- user_data : 	user data set when the signal handler was connected.
-- -- << GtkMessageDialog 	GtkWindowGroup >>
feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkWindow)"
		end

end
