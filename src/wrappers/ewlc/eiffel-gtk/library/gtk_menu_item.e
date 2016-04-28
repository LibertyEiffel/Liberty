note
	description: "GtkMenuItem -- The widget used for item in menus."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
					

class GTK_MENU_ITEM
	-- The GtkMenuItem widget and the derived widgets are the only
	-- valid childs for menus. Their function is to correctly handle
	-- highlighting, alignment, events and submenus.

	-- As it derives from GtkBin it can hold any valid
	-- child widget, altough only a few are really useful.
	
inherit
	GTK_ITEM --redefine make end
		-- GtkMenuItem implements AtkImplementorIface.

insert
	G_OBJECT_FACTORY  [GTK_WIDGET]

create {ANY} make, with_label, with_mnemonic, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a new GtkMenuItem.
		require 
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_menu_item_new)
		end

	with_label (a_label: STRING) is
			-- Creates a new GtkMenuItem whose child is a GtkLabel.
		require
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_menu_item_new_with_label (a_label.to_external))
		end

	with_mnemonic (a_label: STRING) is
			-- Creates a new GtkMenuItem containing a label. Underscores
			-- in label indicate the mnemonic for the menu item.
		require
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_menu_item_new_with_mnemonic (a_label.to_external))
		end

feature {ANY} 
	set_right_justified is
			-- Makes the menu item appears justified at the right
			-- side of a menu bar. This was traditionally done for "Help"
			-- menu items, but is now considered a bad idea. (If the
			-- widget layout is reversed for a right-to-left language
			-- like Hebrew or Arabic, right-justified-menu-items appear
			-- at the left.)
		do
			gtk_menu_item_set_right_justified (handle, 1)
		end

	set_left_justified is
			-- Makes whether the menu item appears justified at the left
			-- side of a menu bar. 
		do
			gtk_menu_item_set_right_justified (handle, 0)
		end

	set_submenu (a_submenu: GTK_WIDGET) is
			-- Sets the widget submenu, or changes it.
		require submenu_not_void: a_submenu /= Void
		do
			gtk_menu_item_set_submenu (handle, a_submenu.handle)
		end

	set_accel_path (an_accel_path: STRING) is
			-- Set the accelerator path on menu item, through which
			-- runtime changes of the menu item's accelerator caused by
			-- the user can be identified and saved to persistant storage
			-- (see (TODO) GTK_ACCEL_MAP.save on this). To setup a
			-- default accelerator for this menu item, call (TODO)
			-- GTK_ACCEL_MAP.add_entry with the same accel_path. See also
			-- GTK_ACCEL_MAP on the specifics of accelerator paths, and
			-- GTK_MENU.set_accel_path for a more convenient variant of
			-- this function.
		
			-- This function is basically a convenience wrapper that
			-- handles calling (TODO) GTK_WIDGET.set_accel_path() with the
			-- appropriate accelerator group for the menu item.
		
			-- Note that you do need to set an accelerator on the parent menu with
			-- gtk_menu_set_accel_group() for this to work.
		
			--    accel_path : accelerator path, corresponding to this
			--    menu item's functionality, or NULL to unset the current
			--    path.
		require path_not_void: an_accel_path /= Void
		do
			gtk_menu_item_set_accel_path (handle, an_accel_path.to_external)
		end

	unset_accel_path is
			-- Unset the accelerator path on menu item.
		do
			gtk_menu_item_set_accel_path (handle, default_pointer)
		end

	remove_submenu is
			--    Removes the widget's submenu.
		do
			gtk_menu_item_remove_submenu (handle)
		end

	emit_select is 
			-- Emits the "select" signal on the given item. Behaves
			-- exactly like GTK_ITEM.select_signal.
		do
			gtk_menu_item_select (handle)
		end
	
	emit_deselect is
			-- Emits the "deselect" signal on the given item. Behaves
			-- exactly like GTK_ITEM.deselect.
		do
			gtk_menu_item_deselect (handle)
		end

	activate is
			--    Emits the "activate" signal on the given item
		do
			gtk_menu_item_activate (handle)
		end

--    -----------------------------------------------------------------------

--   gtk_menu_item_toggle_size_request ()

--  void        gtk_menu_item_toggle_size_request
--                                              (GtkMenuItem *menu_item,
--                                               gint *requisition);

--    Emits the "toggle_size_request" signal on the given item.

--    menu_item :   the menu item
--    requisition : the requisition to use as signal data.

--    -----------------------------------------------------------------------

--   gtk_menu_item_toggle_size_allocate ()

--  void        gtk_menu_item_toggle_size_allocate
--                                              (GtkMenuItem *menu_item,
--                                               gint allocation);

--    Emits the "toggle_size_allocate" signal on the given item.

--    menu_item :  the menu item.
--    allocation : the allocation to use as signal data.

--    -----------------------------------------------------------------------

	is_right_justified: BOOLEAN is
			-- Does the menu item appears justified at the right side of
			-- the menu bar?
		do
			Result:= (gtk_menu_item_get_right_justified(handle).to_boolean)
		end

	submenu: GTK_WIDGET is 
			-- The submenu underneath this menu item, or Void. See
			-- `set_submenu'.
		do
			Result := wrapper_or_void (gtk_menu_item_get_submenu (handle))
			-- gtk_menu_item_get_submenu returns : submenu for this menu
			-- item, or NULL if none.
		end


--    menu_item : a GtkMenuItem


-- Style Property Details

--   The "arrow-spacing" style property

--    "arrow-spacing"        gint                  : Read

--    Space between label and arrow.

--    Allowed values: >= 0

--    Default value: 10

--    -----------------------------------------------------------------------

--   The "horizontal-padding" style property

--    "horizontal-padding"   gint                  : Read

--    Padding to left and right of the menu item.

--    Allowed values: >= 0

--    Default value: 3

--    -----------------------------------------------------------------------

--   The "selected-shadow-type" style property

--    "selected-shadow-type" GtkShadowType         : Read

--    Shadow type when item is selected.

--    Default value: GTK_SHADOW_NONE

--    -----------------------------------------------------------------------

--   The "toggle-spacing" style property

--    "toggle-spacing"       gint                  : Read

--    Space between icon and label.

--    Allowed values: >= 0

--    Default value: 5

feature {ANY} -- Signals

	activate_signal_name: STRING is "activate"

	on_activate is
			-- Built-in activate signal handler; empty by design; redefine it.
		do
		end

	enable_on_activate is
			-- Connects "activate" signal to `on_activate' feature.
			-- Emitted when the item is activated.
		do
			connect (Current, activate_signal_name, $on_activate)
		end

	connect_agent_to_activate_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_MENU_ITEM]]) is
		require
			valid_procedure: a_procedure /= Void
		local
			activate_callback: ACTIVATE_CALLBACK [like Current]
		do
			create activate_callback.make
			activate_callback.connect (Current, a_procedure)
		end

--   The "activate-item" signal

--  void        user_function                  (GtkMenuItem *menuitem,
--                                              gpointer     user_data)      : Run first

--    Emitted when the item is activated, but also if the menu item has a
--    submenu. For normal applications, the relevant signal is "activate".

--    menuitem :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "toggle-size-allocate" signal

--  void        user_function                  (GtkMenuItem *menuitem,
--                                              gint         arg1,
--                                              gpointer     user_data)      : Run first

--    menuitem :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

--    -----------------------------------------------------------------------

--   The "toggle-size-request" signal

--  void        user_function                  (GtkMenuItem *menuitem,
--                                              gpointer     arg1,
--                                              gpointer     user_data)      : Run first

--    menuitem :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

-- end


-- Synopsis



-- Style Properties


--    "arrow-spacing"        gint                  : Read
--    "horizontal-padding"   gint                  : Read
--    "selected-shadow-type" GtkShadowType         : Read
--    "toggle-spacing"       gint                  : Read

-- Signals


--  "activate"  void        user_function      (GtkMenuItem *menuitem,
--                                              gpointer     user_data)      : Run first / Action
--  "activate-item"
--              void        user_function      (GtkMenuItem *menuitem,
--                                              gpointer     user_data)      : Run first
--  "toggle-size-allocate"
--              void        user_function      (GtkMenuItem *menuitem,
--                                              gint         arg1,
--                                              gpointer     user_data)      : Run first
--  "toggle-size-request"
--              void        user_function      (GtkMenuItem *menuitem,
--                                              gpointer     arg1,
--                                              gpointer     user_data)      : Run first


-- Details

--   GtkMenuItem

--  typedef struct _GtkMenuItem GtkMenuItem;


-- See Also

--    GtkBin       for how to handle the child.
--    GtkItem      is the abstract class for all sorts of items.
--    GtkMenuShell is always the parent of GtkMenuItem.

-- References

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMenuItem)"
		end

feature {} -- External calls
	gtk_menu_item_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_new_with_label (a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_set_right_justified (a_menu_item: POINTER; right_justified_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_set_submenu (a_menu_item, a_submenu: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_set_accel_path (a_menu_item, an_accel_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_item_remove_submenu (a_menu_item: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_item_select (a_menu_item: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_deselect (a_menu_item: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_activate (a_menu_item: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_toggle_size_request (a_menu_item, gint_requisition: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_toggle_size_allocate (a_menu_item: POINTER; an_allocation: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_item_get_right_justified (a_menu_item: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_item_get_submenu (a_menu_item: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
end
