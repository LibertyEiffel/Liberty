note
	description: "GtkRadioMenuItem -- A choice from multiple check menu items."
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
					
class GTK_RADIO_MENU_ITEM
	-- A radio menu item is a check menu item that belongs to a
	-- group. At each instant exactly one of the radio menu items from
	-- a group is selected.
					
	-- The group list does not need to be freed, as each
	-- GtkRadioMenuItem will remove itself and its list item when it is
	-- destroyed.

	-- The correct way to create a group of radio menu items is
	-- approximatively this:
	
	-- TODO: Eiffelize this example 
	-- Example 3. How to create a group of radio menu items.

	--  GSList *group = NULL;
	--  GtkWidget *item;
	--  gint i;
					
	--  for (i = 0; i < 5; i++) {
	--    item = gtk_radio_menu_item_new_with_label (group, "This is an example");
	--    group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
	--    if (i == 1)
	--      gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
	--  }

inherit
	GTK_MENU_ITEM
		rename
			with_mnemonic as as_menu_item_with_mnemomic
		export
			{}  as_menu_item_with_mnemomic
		redefine
			struct_size
		end
	
	-- TODO: GtkRadioMenuItem implements AtkImplementorIface.

create {ANY} 
	from_group, with_group_label, with_mnemonic, from_widget,
	with_label_from_widget, with_mnemonic_from_widget,
	from_external_pointer

feature {} -- Creation
	from_group (a_group: G_SLIST [GTK_RADIO_MENU_ITEM])
			-- Creates a new GtkRadioMenuItem; the radio menu item is to
			-- attached to `a_group'. If `a_group' is Void a new group 
			-- is made.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_radio_menu_item_new (null_or(a_group)))
		end

	with_group_label (a_group: G_SLIST [GTK_RADIO_MENU_ITEM]; a_label: STRING)
			-- Creates a new GtkRadioMenuItem whose child is
			-- `a_label'. The radio menu item is to be attached to
			-- `a_group'. If `a_group' is Void a new group will be
			-- created.
		require
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label/=Void
		do
			from_external_pointer (gtk_radio_menu_item_new_with_label
										  (null_or(a_group), a_label.to_external))
		end

	with_mnemonic (a_group: G_SLIST [GTK_RADIO_MENU_ITEM]; a_label: STRING)
			-- Creates a new GtkRadioMenuItem containing `a_label'. An
			-- underscores in label indicate the mnemonic for the menu
			-- item. The menu item will be added to `a_group'; if it is
			-- Void a new group will be created.
		require
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label/=Void
		do
			from_external_pointer (gtk_radio_menu_item_new_with_mnemonic
										  (null_or(a_group), a_label.to_external))
		end

	from_widget (a_widget: GTK_RADIO_MENU_ITEM)
			-- Creates a new GtkRadioMenuItem adding it to the same group
			-- of `a_widget'.
		require
			gtk_initialized: gtk.is_initialized
			widget_not_void: a_widget /= Void
		do
			from_external_pointer (gtk_radio_menu_item_new_from_widget (a_widget.handle))
		end


	with_label_from_widget (a_widget: GTK_RADIO_MENU_ITEM; a_label: STRING)
			-- Creates a new GtkRadioMenuItem whose child is a simple
			-- GtkLabel with `a_label' as text. The new GtkRadioMenuItem
			-- is added to the same group of `a_widget'.
		require
			gtk_initialized: gtk.is_initialized
			widget_not_void: a_widget /= Void
			label_not_void: a_label /= Void
		do
			handle:=(gtk_radio_menu_item_new_with_label_from_widget
						(a_widget.handle, a_label.to_external))
			store_eiffel_wrapper
		end

	with_mnemonic_from_widget (a_widget: GTK_RADIO_MENU_ITEM; a_label: STRING)
			-- Creates a new GtkRadioMenuItem containing a label. An
			-- underscore in `a_label' indicates the mnemonic for the
			-- menu item. The new GtkRadioMenuItem is added to the same
			-- group of `a_widget'.
		require
			gtk_initialized: gtk.is_initialized
			widget_not_void: a_widget /= Void
			label_not_void: a_label /= Void
		do
			handle:=(gtk_radio_menu_item_new_with_mnemonic_from_widget
						(a_widget.handle, a_label.to_external))
			store_eiffel_wrapper
		end

feature {ANY} 
	set_group (a_group: G_SLIST [GTK_RADIO_MENU_ITEM])
			--    Sets the group of a radio menu item, or changes it.		
		do
			gtk_radio_menu_item_set_group (handle, a_group.handle)
		end

	group: G_SLIST [GTK_RADIO_MENU_ITEM]
			--    Returns the group to which the radio menu item belongs, as a GList of
			--    GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.
		do
			create {G_OBJECT_SLIST[GTK_RADIO_MENU_ITEM]} Result.from_external_pointer 
			(gtk_radio_menu_item_get_group (handle))
			-- gtk_radio_menu_item_get_group returns the group to which
			-- the radio menu item belongs, as a GList of
			-- GtkRadioMenuItem. The list belongs to GTK+ and should not
			-- be freed. Therefore
			-- Result.set_shared
		end

feature {ANY} -- TODO:  The "group-changed" signal
	group_changed_signal_name: STRING is "group-changed"
	
	on_group_changed do  end

	enable_on_group_changed
		do
			connect (Current, group_changed_signal_name, $on_group_changed)
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkRadioMenuItem)"
		end

feature {} -- External calls
	gtk_radio_menu_item_new (a_group: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	gtk_radio_menu_item_new_with_label (a_group, a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_menu_item_new_with_mnemonic (a_group, a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_menu_item_new_from_widget (a_gtkradiomenuitem: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_menu_item_new_with_label_from_widget (a_gtkradiomenuitem, a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_menu_item_new_with_mnemonic_from_widget (a_gtkradiomenuitem, a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_menu_item_set_group (radio_menu_item, a_group: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_menu_item_get_group (a_radio_menu_item: POINTER): POINTER is -- GSList*
		external "C use <gtk/gtk.h>"
		end
end
