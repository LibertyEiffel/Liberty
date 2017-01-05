note
	description: "GtkCheckMenuItem -- A menu item with a check box."
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

class GTK_CHECK_MENU_ITEM
	-- A GtkCheckMenuItem is a menu item that maintains the state of a
	-- boolean value in addition to a GtkMenuItem's usual role in
	-- activating application code.

	-- A check box indicating the state of the boolean value is
	-- displayed at the left side of the GtkMenuItem. Activating the
	-- GtkMenuItem toggles the value.
	
inherit
	GTK_MENU_ITEM
		redefine
			make, with_label, with_mnemonic, struct_size
		end
	-- Known heirs: GtkRadioMenuItem

	-- GtkCheckMenuItem implements AtkImplementorIface.

	
create {ANY} make, with_label, with_mnemonic, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkCheckMenuItem.
		do
			from_external_pointer (gtk_check_menu_item_new)
		end

	with_label (a_label: STRING)
			-- Creates a new GtkCheckMenuItem with `a_label'.
		do
			from_external_pointer (gtk_check_menu_item_new_with_label (a_label.to_external))
		end

	with_mnemonic (a_label: STRING)
			-- Creates a new GtkCheckMenuItem containing `a_label'. An
			-- underscore in the text of the button marks the mnemonic
			-- character.
		do
			from_external_pointer (gtk_check_menu_item_new_with_mnemonic (a_label.to_external))
		end
	
feature {ANY}
	is_active: BOOLEAN
			-- Is the check menu item active? See `set_active'
		do
			Result:=(gtk_check_menu_item_get_active (handle).to_boolean)
		end

	set_active
			-- Makes the menu item's check box active.
		do
			gtk_check_menu_item_set_active (handle,1)
		end

	set_inactive
			-- Makes the menu item's check box inactive.
		do
			gtk_check_menu_item_set_active (handle,0)
		end


	toggled
			-- Emits the GtkCheckMenuItem::toggled signal.
		do
			gtk_check_menu_item_toggled (handle)
		end

	is_inconsistent: BOOLEAN
			-- Has Current been made inconsistent using `set_inconsistent'?
		do
			Result := (gtk_check_menu_item_get_inconsistent(handle).to_boolean)
		end

	set_inconsistent
			-- If the user has selected a range of elements (such as some
			-- text or spreadsheet cells) that are affected by a boolean
			-- setting, and the current values in that range are
			-- inconsistent, you may want to display the check in an "in
			-- between" state. This function turns on "in between"
			-- display. Normally you would turn off the inconsistent
			-- state again if the user explicitly selects a setting. This
			-- has to be done manually, `set_inconsistent' only affects
			-- visual appearance, it doesn't affect the semantics of the
			-- widget.
		do
			gtk_check_menu_item_set_inconsistent (handle, 1)
		end

	-- ------------------------------------------------------------------------------------------------------------

	-- gtk_check_menu_item_set_draw_as_radio ()

	-- void gtk_check_menu_item_set_draw_as_radio
	-- (GtkCheckMenuItem *check_menu_item,
	-- gboolean draw_as_radio);

	-- Sets whether check_menu_item is drawn like a GtkRadioMenuItem

	-- check_menu_item : a GtkCheckMenuItem
	-- draw_as_radio : whether check_menu_item is drawn like a GtkRadioMenuItem

	-- Since 2.4

	-- ------------------------------------------------------------------------------------------------------------

	-- gtk_check_menu_item_get_draw_as_radio ()

	-- gboolean gtk_check_menu_item_get_draw_as_radio
	-- (GtkCheckMenuItem *check_menu_item);

	-- Returns whether check_menu_item looks like a GtkRadioMenuItem

	-- check_menu_item : a GtkCheckMenuItem
	-- Returns : Whether check_menu_item looks like a GtkRadioMenuItem

	-- Since 2.4


	-- Properties


	-- "active" gboolean : Read / Write
	-- "draw-as-radio" gboolean : Read / Write
	-- "inconsistent" gboolean : Read / Write

	-- Style Properties


	-- "indicator-size" gint : Read

	-- Signals

feature {ANY} -- Signals

	toggle_signal_name: STRING is "toggle"

	on_toggle
			-- Built-in toggle signal handler; empty by design; redefine it.
		do
		end

	enable_on_toggle
			-- Connects "toggle" signal to `on_toggle' feature.
			-- Emitted when the item is toggled.
		do
			connect (Current, toggle_signal_name, $on_toggle)
		end

	connect_agent_to_toggle_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_CHECK_MENU_ITEM]])
		require
			valid_procedure: a_procedure /= Void
		local
			toggle_callback: TOGGLED_CALLBACK [like Current]
		do
			create toggle_callback.make
			toggle_callback.connect (Current, a_procedure)
		end


	-- "toggled" void user_function (GtkCheckMenuItem *checkmenuitem,
	-- gpointer user_data) : Run first

	-- Property Details

	-- The "active" property

	-- "active" gboolean : Read / Write

	-- Whether the menu item is checked.

	-- Default value: FALSE

	-- ------------------------------------------------------------------------------------------------------------

	-- The "draw-as-radio" property

	-- "draw-as-radio" gboolean : Read / Write

	-- Whether the menu item looks like a radio menu item.

	-- Default value: FALSE

	-- ------------------------------------------------------------------------------------------------------------

	-- The "inconsistent" property

	-- "inconsistent" gboolean : Read / Write

	-- Whether to display an "inconsistent" state.

	-- Default value: FALSE

	-- Style Property Details

	-- The "indicator-size" style property

	-- "indicator-size" gint : Read

	-- Size of check or radio indicator.

	-- Allowed values: >= 0

	-- Default value: 12

	-- Signal Details

	-- The "toggled" signal

	-- void user_function (GtkCheckMenuItem *checkmenuitem,
	-- gpointer user_data) : Run first

	-- This signal is emitted when the state of the check box is changed.

	-- A signal handler can examine the active field of the GtkCheckMenuItem-struct struct to discover the new
	-- state.

	-- checkmenuitem : the object which received the signal.
	-- user_data : user data set when the signal handler was connected.
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCheckMenuItem)"
		end

feature {} -- External calls
	
	gtk_check_menu_item_new: POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_new_with_label (a_label: POINTER):POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_new_with_mnemonic (a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_get_active (a_check_menu_item: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_set_active (a_check_menu_item: POINTER; an_is_active: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_set_show_toggle (a_gtkcheckmenuitem: POINTER; a_always: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_toggled (a_check_menu_item: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_get_inconsistent (a_check_menu_item: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_set_inconsistent (a_check_menu_item: POINTER; a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_set_draw_as_radio (a_check_menu_item: POINTER; a_draw_as_radio: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_menu_item_get_draw_as_radio (a_check_menu_item: POINTER): INTEGER is 	-- gboolean
		external "C use <gtk/gtk.h>"
		end
end
