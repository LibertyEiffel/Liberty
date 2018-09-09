note
	description: "GtkMenuShell -- A base class for menu objects."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_MENU_SHELL
	-- A GtkMenuShell is the abstract base class used to derive the
	-- GtkMenu and GtkMenuBar subclasses.

	-- A GtkMenuShell is a container of GtkMenuItem objects arranged in
	-- a list which can be navigated, selected, and activated by the
	-- user to perform application functions. A GtkMenuItem can have a
	-- submenu associated with it, allowing for nested hierarchical
	-- menus.

inherit GTK_CONTAINER
	-- GtkMenuShell implements AtkImplementorIface Interface

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMenuShell)"
		end

feature {ANY}
	-- TODO: check if all those `a_child' shall be GTK_MENU_ITEM
	-- instead of GTK_WIDGET

	append (a_child: GTK_WIDGET)
			-- Adds a new GtkMenuItem to the end of the menu shell's item
			-- list.
		require widget_not_void: a_child /= Void
		do
			gtk_menu_shell_append (handle, a_child.handle)
		end

	prepend (a_child: GTK_WIDGET)
			-- Adds a new GtkMenuItem to the beginning of the menu
			-- shell's item list.
		require widget_not_void: a_child /= Void
		do
			gtk_menu_shell_prepend (handle, a_child.handle)
		end
	
	insert_child (a_child: GTK_WIDGET; a_position: INTEGER)
			-- Adds a new GtkMenuItem to the menu shell's item list at
			-- `a_position'. Positions are numbered from 0 to n-1.
		require 
			widget_not_void: a_child /= Void
			valid_position: a_position>=0
		do
			gtk_menu_shell_insert  (handle, a_child.handle, a_position)
		end


	deactivate
			-- Deactivates the menu shell. Typically this results in the
			-- menu shell being erased from the screen.
		do
			gtk_menu_shell_deactivate (handle)
		end

	select_item (a_menu_item: GTK_WIDGET)
			-- Selects `a_menu_item' (a GtkMenuItem) from the menu shell.
		require item_not_void: a_menu_item /= Void
		do
			gtk_menu_shell_select_item (handle, a_menu_item.handle)
		end

	select_first (search_sensitive: BOOLEAN)
			-- Select the first visible or selectable child of the menu
			-- shell; don't select tearoff items unless the only item is
			-- a tearoff item.

			-- `search_sensitive': if TRUE, search for the first
			-- selectable menu item, otherwise select nothing if the
			-- first item isn't sensitive. This should be FALSE if the
			-- menu is being popped up initially.
		do
			gtk_menu_shell_select_first (handle, search_sensitive.to_integer);
		end

	deselect
			-- Deselects the currently selected item from the menu shell,
			-- if any.
		do
			gtk_menu_shell_deselect (handle)
		end

	activate_item (a_menu_item: GTK_WIDGET; force_deactivate: BOOLEAN)
			-- Activates `a_menu_item' within the menu shell. If
			-- `force_deactivate' is True, force the deactivation of the
			-- menu shell after the menu item is activated.
		require item_not_void: a_menu_item /= Void
		do
			gtk_menu_shell_activate_item (handle, a_menu_item.handle, force_deactivate.to_integer)
		end

	cancel
			-- Cancels the selection within the menu shell.
		do
			gtk_menu_shell_cancel (handle)
		end


	set_take_focus
			-- Makes the menu shell to take the keyboard focus so that it
			-- will receive all keyboard events which is needed to enable
			-- keyboard navigation in menus.
		
			-- The state of a menu or menu bar is automatically
			-- propagated to submenus whenever a submenu is popped up, so
			-- you don't have to worry about recursively setting it for
			-- your entire menu hierarchy. Only when programmatically
			-- picking a submenu and popping it up manually, the
			-- take_focus property of the submenu needs to be set
			-- explicitely.

			-- See also GDK_KEYBOARD.grab
		do
			gtk_menu_shell_set_take_focus (handle,1)
		end
	
	unset_take_focus
			-- This is useful only for special applications like virtual
			-- keyboard implementations which should not take keyboard
			-- focus.

			-- The take_focus state of a menu or menu bar is
			-- automatically propagated to submenus whenever a submenu is
			-- popped up, so you don't have to worry about recursively
			-- setting it for your entire menu hierarchy. Only when
			-- programmatically picking a submenu and popping it up
			-- manually, the take_focus property of the submenu needs to
			-- be set explicitely.

			-- Note that this setting has side-effects:

			-- If the focus is in some other app, it keeps the focus and
			-- keynav in the menu doesn't work. Consequently, keynav on
			-- the menu will only work if the focus is on some toplevel
			-- owned by the onscreen keyboard.

			-- To avoid confusing the user, menus with take_focus set to
			-- FALSE should not display mnemonics or accelerators, since
			-- it cannot be guaranteed that they will work.

			-- See also GDK_KEYBOARD.grab
		do
			gtk_menu_shell_set_take_focus (handle,0)
		end
	
	is_focus_taken: BOOLEAN
			-- Will the menu shell will take the keyboard focus on popup.
		do
			Result:=(gtk_menu_shell_get_take_focus(handle).to_boolean)
		end

feature {ANY} -- TODO: Properties
--    "take-focus"           gboolean              : Read / Write

-- Property Details

--   The "take-focus" property

--    "take-focus"           gboolean              : Read / Write

--    A boolean that determines whether the menu and its submenus grab the
--    keyboard focus. See gtk_menu_shell_set_take_focus() and
--    gtk_menu_shell_get_take_focus().

--    Default value: TRUE

--    Since 2.8

feature {ANY} -- TODO: Signals


--  "activate-current"
--              void        user_function      (GtkMenuShell *menushell,
--                                              gboolean      force_hide,
--                                              gpointer      user_data)       : Run last / Action
--  "cancel"    void        user_function      (GtkMenuShell *menushell,
--                                              gpointer      user_data)      : Run last / Action
--  "cycle-focus"
--              void        user_function      (GtkMenuShell     *menushell,
--                                              GtkDirectionType *arg1,
--                                              gpointer          user_data)      : Run last / Action
--  "deactivate"
--              void        user_function      (GtkMenuShell *menushell,
--                                              gpointer      user_data)      : Run first
--  "move-current"
--              void        user_function      (GtkMenuShell        *menushell,
--                                              GtkMenuDirectionType direction,
--                                              gpointer             user_data)      : Run last / Action
--  "selection-done"
--              void        user_function      (GtkMenuShell *menushell,
--                                              gpointer      user_data)      : Run first
-- Signal Details

--   The "activate-current" signal

--  void        user_function                  (GtkMenuShell *menushell,
--                                              gboolean      force_hide,
--                                              gpointer      user_data)       : Run last / Action

--    An action signal that activates the current menu item within the menu
--    shell.

--    menushell :  the object which received the signal.
--    force_hide : if TRUE, hide the menu after activating the menu item.
--    user_data :  user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "cancel" signal

--  void        user_function                  (GtkMenuShell *menushell,
--                                              gpointer      user_data)      : Run last / Action

--    An action signal which cancels the selection within the menu shell.
--    Causes the GtkMenuShell::selection-done signal to be emitted.

--    menushell : the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "cycle-focus" signal

--  void        user_function                  (GtkMenuShell     *menushell,
--                                              GtkDirectionType *arg1,
--                                              gpointer          user_data)      : Run last / Action

--    menushell : the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "deactivate" signal

--  void        user_function                  (GtkMenuShell *menushell,
--                                              gpointer      user_data)      : Run first

--    This signal is emitted when a menu shell is deactivated.

--    menushell : the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "move-current" signal

--  void        user_function                  (GtkMenuShell        *menushell,
--                                              GtkMenuDirectionType direction,
--                                              gpointer             user_data)      : Run last / Action

--    An action signal which moves the current menu item in the direction
--    specified by direction.

--    menushell : the object which received the signal.
--    direction : the direction to move.
--    user_data : user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "selection-done" signal

--  void        user_function                  (GtkMenuShell *menushell,
--                                              gpointer      user_data)      : Run first

--    This signal is emitted when a selection has been completed within a
--    menu shell.

--    menushell : the object which received the signal.
--    user_data : user data set when the signal handler was connected.

feature {} -- External calls
	--   GtkMenuShell

	--  typedef struct _GtkMenuShell GtkMenuShell;
	
	-- The GtkMenuShell-struct struct contains the following
	-- fields. (These fields should be considered read-only. They
	-- should never be set by an application.)
	
	-- GList *children; The list of GtkMenuItem objects contained by
	-- this GtkMenuShell.

	get_children (a_menu_shell: POINTER): POINTER
		external "C struct GtkMenuShell get children use <gtk/gtk.h>"
		end
	
	gtk_menu_shell_append (a_menu_shell: POINTER; a_child: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_shell_prepend (a_menu_shell: POINTER; a_child: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_insert (a_menu_shell: POINTER; a_child: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_deactivate (a_menu_shell: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_select_item (a_menu_shell: POINTER; a_menu_item: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_select_first (a_menu_shell: POINTER; search_sensitive: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_deselect (a_menu_shell: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_activate_item (a_menu_shell: POINTER; a_menu_item: POINTER; force_deactivate: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_cancel (a_menu_shell: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_set_take_focus (a_menu_shell: POINTER; take_focus: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_shell_get_take_focus (a_menu_shell: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
end
