note
	description: "GtkMenu -- A menu widget."
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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
	
class GTK_MENU
	-- A GtkMenu is a GtkMenuShell that implements a drop down menu
	-- consisting of a list of GtkMenuItem objects which can be
	-- navigated and activated by the user to perform application
	-- functions.
	
	-- A GtkMenu is most commonly dropped down by activating a
	-- GtkMenuItem in a GtkMenuBar or popped up by activating a
	-- GtkMenuItem in another GtkMenu.
	
	-- A GtkMenu can also be popped up by activating a
	-- GtkOptionMenu. Other composite widgets such as the GtkNotebook
	-- can pop up a GtkMenu as well.
	
	-- Applications can display a GtkMenu as a popup menu by calling
	-- the gtk_menu_popup() function. The example below shows how an
	-- application can pop up a menu when the 3rd mouse button is
	-- pressed.

	-- TODO: Eiffelize this Example 1. Connecting the popup signal
	-- handler.
	
	-- /* connect our handler which will popup the menu */
	-- g_signal_connect_swapped (window, "button_press_event",
	-- G_CALLBACK (my_popup_handler), menu);
	
	-- TODO: Eiffelize this Example 2. Signal handler which
	-- displays a popup menu.

	-- static gint
	-- my_popup_handler (GtkWidget *widget, GdkEvent *event)
	-- {
	-- GtkMenu *menu;
	-- GdkEventButton *event_button;
	
	-- g_return_val_if_fail (widget != NULL, FALSE);
	-- g_return_val_if_fail (GTK_IS_MENU (widget), FALSE);
	-- g_return_val_if_fail (event != NULL, FALSE);
	
	-- /* The "widget" is the menu that was supplied when
	-- * g_signal_connect_swapped() was called.
	-- */
	-- menu = GTK_MENU (widget);
	
	-- if (event->type == GDK_BUTTON_PRESS)
	-- {
	-- event_button = (GdkEventButton *) event;
	-- if (event_button->button == 3)
	-- {
	-- gtk_menu_popup (menu, NULL, NULL, NULL, NULL,
	-- event_button->button, event_button->time);
	-- return TRUE;
	-- }
	-- }
	
	-- return FALSE;
	-- }

inherit
	GTK_MENU_SHELL redefine struct_size end
		-- GtkMenu implements AtkImplementorIface interface.

insert
	G_OBJECT_FACTORY [GTK_WIDGET]
	GTK_MENU_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkMenu.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_menu_new)
		end

feature {ANY} 
	-- TODO: set_screen (a_screen: GDK_SCREEN) is Sets the GdkScreen on
	-- which the menu will be displayed. If `a_screen0 is Void it
	-- should be determined by the widget the menu is attached to.
	-- do
	-- gtk_menu_set_screen (handle, a_screen.handle)
	--end

	reorder_child (a_child: GTK_WIDGET; a_new_position: INTEGER)
			-- Moves GtkMenuItem `a_child' to `a_new_position' within the
			-- GtkMenu.Positions are numbered from 0 to n-1.
		require 
			valid_child: a_child/=Void
		do
			gtk_menu_reorder_child (handle, a_child.handle, a_new_position)
		end
 
	attach (a_child: GTK_WIDGET; 
			  left_attach, right_attach, top_attach, bottom_attach: INTEGER)
			-- Adds a new GtkMenuItem to a (table) menu. The number of
			-- 'cells' that an item will occupy is specified by
			-- left_attach, right_attach, top_attach and
			-- bottom_attach. These each represent the leftmost,
			-- rightmost, uppermost and lower column and row numbers of
			-- the table. (Columns and rows are indexed from zero).

			-- Note that this function is not related to gtk_menu_detach.
		
			-- `left_attach': The column number to attach the left side
			-- of the item to.

			-- `right_attach': The column number to attach the right side
			-- of the item to.  

			-- `top_attach' : The row number to attach the top of the
			-- item to.  

			-- `bottom_attach' : The row number to attach the bottom of
			-- the item to.

		require
			positive_left_attach: left_attach >= 0 -- since it is a guint
			positive_right_attach: right_attach >= 0 -- since it is a guint
			positive_top_attach: top_attach >= 0 -- since it is a guint
			positive_bottom_attach: bottom_attach >= 0 -- since it is a guint

		do
			gtk_menu_attach (handle, a_child.handle, 
								  left_attach, right_attach,
								  top_attach, bottom_attach)
		end

	-- TODO: understand then wrap popup (a_parent_shell, a_parent_item:
	-- GTK_WIDGET; a) do

	-- void gtk_menu_popup (GtkMenu *menu, GtkWidget
	-- *parent_menu_shell, GtkWidget *parent_menu_item,
	-- GtkMenuPositionFunc func, gpointer data, guint button, guint32
	-- activate_time);

	-- Displays a menu and makes it available for
	-- selection. Applications can use this function to display
	-- context-sensitive menus, and will typically supply NULL for the
	-- parent_menu_shell, parent_menu_item, func and data
	-- parameters. The default menu positioning function will position
	-- the menu at the current mouse cursor position.

	-- The button parameter should be the mouse button pressed to
	-- initiate the menu popup. If the menu popup was initiated by
	-- something other than a mouse button press, such as a mouse
	-- button release or a keypress, button should be 0.

	-- The activate_time parameter should be the time stamp of the
	-- event that initiated the popup. If such an event is not
	-- available, use gtk_get_current_event_time() instead.
	
	-- menu : a GtkMenu.
	-- parent_menu_shell : the menu shell containing the triggering menu item,
	-- or NULL
	-- parent_menu_item : the menu item whose activation triggered the popup,
	-- or NULL
	-- func : a user supplied function used to position the menu,
	-- or NULL
	-- data : user supplied data to be passed to func.
	-- button : the mouse button which was pressed to initiate the
	-- event.
	-- activate_time : the time at which the activation event occurred.

	-- TODO: gtk_menu_set_accel_group ()

	-- void gtk_menu_set_accel_group (GtkMenu *menu, GtkAccelGroup
	-- *accel_group);

	-- Set the GtkAccelGroup which holds global accelerators for the
	-- menu.  This accelerator group needs to also be added to all
	-- windows that this menu is being used in with
	-- gtk_window_add_accel_group(), in order for those windows to
	-- support all the accelerators contained in this group.

	-- menu : a GtkMenu.
	-- accel_group : the GtkAccelGroup to be associated with the menu.

	-- -----------------------------------------------------------------------
	
	-- gtk_menu_get_accel_group ()
	
	-- GtkAccelGroup* gtk_menu_get_accel_group (GtkMenu *menu);
	
	-- Gets the GtkAccelGroup which holds global accelerators for the
	-- menu.  See gtk_menu_set_accel_group().
	
	-- menu : a GtkMenu.
	-- Returns : the GtkAccelGroup associated with the menu.

	-- -----------------------------------------------------------------------

	-- gtk_menu_set_accel_path ()

	-- void gtk_menu_set_accel_path (GtkMenu *menu, const gchar
	-- *accel_path);

	-- Sets an accelerator path for this menu from which accelerator
	-- paths for its immediate children, its menu items, can be
	-- constructed. The main purpose of this function is to spare the
	-- programmer the inconvenience of having to call
	-- gtk_menu_item_set_accel_path() on each menu item that should
	-- support runtime user changable accelerators. Instead, by just
	-- calling gtk_menu_set_accel_path() on their parent, each menu
	-- item of this menu, that contains a label describing its purpose,
	-- automatically gets an accel path assigned. For example, a menu
	-- containing menu items "New" and "Exit", will, after
	-- gtk_menu_set_accel_path (menu, "<Gnumeric-Sheet>/File"); has
	-- been called, assign its items the accel paths:
	-- "<Gnumeric-Sheet>/File/New" and "<Gnumeric-Sheet>/File/Exit".
	-- Assigning accel paths to menu items then enables the user to
	-- change their accelerators at runtime. More details about
	-- accelerator paths and their default setups can be found at
	-- gtk_accel_map_add_entry().
	
	-- menu : a valid GtkMenu accel_path : a valid accelerator path

	-- -----------------------------------------------------------------------

	set_title (a_title: STRING)
			-- Sets `a_title' as the title for the menu. The title is
			-- displayed when the menu is shown as a tearoff menu.
		require title_not_void: a_title /= Void
		do
			gtk_menu_set_title (handle, a_title.to_external)
		end

	title: STRING
			-- the title of the menu. See `set_title'. Can be Void if
			-- the menu has no title set on it.
		local ptr: POINTER
		do
			ptr := gtk_menu_get_title (handle)
			if ptr.is_not_null then 
				-- create Result.from_external_copy (ptr)
				create {CONST_STRING} Result.from_external (ptr)
			end
		end

	is_torn_off: BOOLEAN
		-- Is the menu currently torn off.
		do
			Result := gtk_menu_get_tearoff_state (handle).to_boolean
		end

	popdown
			-- Removes the menu from the screen.
		do
			gtk_menu_popdown (handle)
		end

	reposition
			-- Repositions the menu according to its position function.
		do
			gtk_menu_reposition (handle)
		end

	active_item: GTK_WIDGET
			-- the selected menu item from the menu. This is used by the
			-- GtkOptionMenu. If a selection has not yet been made, the
			-- first menu item is selected.
		do
			Result := wrapper(gtk_menu_get_active (handle))
		end

	set_active (an_index: INTEGER)
			-- Selects the specified menu item within the menu. This is
			-- used by the GtkOptionMenu and should not be used by anyone
			-- else. `an_index' is values are from 0 to n-1.

		require natural_index: an_index >= 0 
		do
			gtk_menu_set_active (handle, an_index)
		end

	set_tearoff
			-- Changes the tearoff state of the menu. A menu is normally
			-- displayed as drop down menu which persists as long as the
			-- menu is active. It can also be displayed as a tearoff menu
			-- which persists until it is closed or reattached.
		do
			gtk_menu_set_tearoff_state (handle, 1)
		ensure is_torn_off
		end

	unset_tearoff
			-- Changes the tearoff state of the menu. A menu is normally
			-- displayed as drop down menu which persists as long as the
			-- menu is active. It can also be displayed as a tearoff menu
			-- which persists until it is closed or reattached.
		do
			gtk_menu_set_tearoff_state (handle, 0)
		ensure not is_torn_off
		end


	-- TODO: wrap gtk_menu_attach_to_widget ()

	-- void gtk_menu_attach_to_widget (GtkMenu *menu, GtkWidget
	-- *attach_widget, GtkMenuDetachFunc detacher);

	-- Attaches the menu to the widget and provides a callback function
	-- that will be invoked when the menu calls gtk_menu_detach()
	-- during its destruction.

	-- menu : a GtkMenu.
	-- attach_widget : the GtkWidget that the menu will be attached to.
	-- detacher : the user supplied callback function that will be called
	-- when the menu calls gtk_menu_detach(), or NULL

	-- TODO: wrap gtk_menu_detach ()

	-- void gtk_menu_detach (GtkMenu *menu);
	
	-- Detaches the menu from the widget to which it had been
	-- attached. This function will call the callback function,
	-- detacher, provided when the gtk_menu_attach_to_widget() function
	-- was called.

	-- menu : a GtkMenu.

	-- -----------------------------------------------------------------------

	-- TODO: wrap gtk_menu_get_attach_widget ()

	-- GtkWidget* gtk_menu_get_attach_widget (GtkMenu *menu);

	-- Returns the GtkWidget that the menu is attached to.

	-- menu : a GtkMenu.
	-- Returns : the GtkWidget that the menu is attached to.

	-- -----------------------------------------------------------------------

	-- TODO: wrap gtk_menu_get_for_attach_widget ()

	-- GList* gtk_menu_get_for_attach_widget (GtkWidget *widget);

	-- widget : a GtkWidget * Returns a list of the menus which are attached
	-- to this widget. This list is owned by GTK+ and must not be
	-- modified.
	-- Returns : the list of menus attached to his widget.

	-- Since 2.6

	-- -----------------------------------------------------------------------

	-- GtkMenuPositionFunc ()

	-- void (*GtkMenuPositionFunc) (GtkMenu *menu,
	-- gint *x,
	-- gint *y,
	-- gboolean *push_in,
	-- gpointer user_data);

	-- A user function supplied when calling gtk_menu_popup() which controls
	-- the positioning of the menu when it is displayed. The function sets the
	-- x and y parameters to the coordinates where the menu is to be drawn.

	-- menu : a GtkMenu.
	-- x : address of the gint representing the horizontal position
	-- where the menu shall be drawn. This is an output parameter.
	-- y : address of the gint representing the vertical position
	-- where the menu shall be drawn. This is an output parameter.
	-- push_in : whether the menu should be pushed in to be completely
	-- inside the screen instead of just clamped to the size to
	-- the screen.
	-- user_data : the data supplied by the user in the gtk_menu_popup() data
	-- parameter.

	-- -----------------------------------------------------------------------

	-- GtkMenuDetachFunc ()

	-- void (*GtkMenuDetachFunc) (GtkWidget *attach_widget,
	-- GtkMenu *menu);

	-- A user function supplied when calling gtk_menu_attach_to_widget() which
	-- will be called when the menu is later detached from the widget.

	-- attach_widget : the GtkWidget that the menu is being detached from.
	-- menu : the GtkMenu being detached.

	-- -----------------------------------------------------------------------

	-- TODO: wrap  gtk_menu_set_monitor ()

	-- void gtk_menu_set_monitor (GtkMenu *menu,
	-- gint monitor_num);

	-- Informs GTK+ on which monitor a menu should be popped up. See
	-- gdk_screen_get_monitor_geometry().

	-- This function should be called from a GtkMenuPositionFunc if the menu
	-- should not appear on the same monitor as the pointer. This information
	-- can't be reliably inferred from the coordinates returned by a
	-- GtkMenuPositionFunc, since, for very long menus, these coordinates may
	-- extend beyond the monitor boundaries or even the screen boundaries.

	-- menu : a GtkMenu
	-- monitor_num : the number of the monitor on which the menu should be
	-- popped up

	-- Since 2.4

feature {ANY} -- Properties
	-- "tearoff-state" gboolean : Read / Write
	-- "tearoff-title" gchararray : Read / Write
	-- The "tearoff-state" property

	-- "tearoff-state" gboolean : Read / Write

	-- A boolean that indicates whether the menu is torn-off.

	-- Default value: FALSE

	-- Since 2.6

	-- -----------------------------------------------------------------------

	-- The "tearoff-title" property

	-- "tearoff-title" gchararray : Read / Write

	-- A title that may be displayed by the window manager when this menu is
	-- torn-off.

	-- Default value: ""

feature {ANY} -- Child Properties


	-- "bottom-attach" gint : Read / Write
	-- "left-attach" gint : Read / Write
	-- "right-attach" gint : Read / Write
	-- "top-attach" gint : Read / Write
	-- Child Property Details

	-- The "bottom-attach" child property

	-- "bottom-attach" gint : Read / Write

	-- The row number to attach the bottom of the child to.

	-- Allowed values: >= -1

	-- Default value: -1

	-- -----------------------------------------------------------------------

	-- The "left-attach" child property

	-- "left-attach" gint : Read / Write

	-- The column number to attach the left side of the child to.

	-- Allowed values: >= -1

	-- Default value: -1

	-- -----------------------------------------------------------------------

	-- The "right-attach" child property

	-- "right-attach" gint : Read / Write

	-- The column number to attach the right side of the child to.

	-- Allowed values: >= -1

	-- Default value: -1

	-- -----------------------------------------------------------------------

	-- The "top-attach" child property

	-- "top-attach" gint : Read / Write

	-- The row number to attach the top of the child to.

	-- Allowed values: >= -1

	-- Default value: -1

feature {ANY} -- Style Properties
	-- "horizontal-offset" gint : Read
	-- "vertical-offset" gint : Read
	-- "vertical-padding" gint : Read

	-- Style Property Details

	-- The "horizontal-offset" style property

	-- "horizontal-offset" gint : Read

	-- When the menu is a submenu, position it this number of pixels offset
	-- horizontally.

	-- Default value: -2

	-- -----------------------------------------------------------------------

	-- The "vertical-offset" style property

	-- "vertical-offset" gint : Read

	-- When the menu is a submenu, position it this number of pixels offset
	-- vertically.

	-- Default value: 0

	-- -----------------------------------------------------------------------

	-- The "vertical-padding" style property

	-- "vertical-padding" gint : Read

	-- Extra space at the top and bottom of the menu.

	-- Allowed values: >= 0

	-- Default value: 1
	-- Signals


	-- "move-scroll"
	-- void user_function (GtkMenu *menu,
	-- GtkScrollType *arg1,
	-- gpointer user_data) : Run last / Action


feature {ANY} -- Signal Details

	-- The "move-scroll" signal

	-- void user_function (GtkMenu *menu,
	-- GtkScrollType *arg1,
	-- gpointer user_data) : Run last / Action

	-- menu : the object which received the signal.
	-- arg1 :
	-- user_data : user data set when the signal handler was connected.
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMenu)"
		end

end
