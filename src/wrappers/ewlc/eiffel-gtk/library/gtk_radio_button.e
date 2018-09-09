note
	description: "GTK_RADIO_BUTTON -- A choice from multiple check buttons."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_RADIO_BUTTON
	-- A single radio button performs the same basic function as a
	-- GtkCheckButton, as its position in the object hierarchy
	-- reflects. It is only when multiple radio buttons are grouped
	-- together that they become a different user interface component
	-- in their own right.

	-- Every radio button is a member of some group of radio
	-- buttons. When one is selected, all other radio buttons in the
	-- same group are deselected. A GtkRadioButton is one way of giving
	-- the user a choice from many options.

	-- Create the first radio button of a group with `in_a_new_group',
	-- then add further buttons with the other cration procedures
	-- (i.e.: `from_group', `from_widget' and so on)

	-- Retrieve the group a GtkRadioButton is assigned to use gtk_radio_button_get_group().

-- To remove a GtkRadioButton from one group and make it part of a new one, use gtk_radio_button_set_group().

-- The group list does not need to be freed, as each GtkRadioButton will remove itself and its list item when it is destroyed.

	-- Example 1. How to create a group of two radio buttons.

-- void create_radio_buttons (void) {

--    GtkWidget *window, *radio1, *radio2, *box, *entry;
--    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
--    box = gtk_vbox_new (TRUE, 2);
	
--    /* Create a radio button with a GtkEntry widget */
--    radio1 = gtk_radio_button_new (NULL);
--    entry = gtk_entry_new ();
--    gtk_container_add (GTK_CONTAINER (radio1), entry);
	
	
--    /* Create a radio button with a label */
--    radio2 = gtk_radio_button_new_with_label_from_widget (GTK_RADIO_BUTTON (radio1),
-- 							"I'm the second radio button.");
	
--    /* Pack them into a box, then show all the widgets */
--    gtk_box_pack_start (GTK_BOX (box), radio1, TRUE, TRUE, 2);
--    gtk_box_pack_start (GTK_BOX (box), radio2, TRUE, TRUE, 2);
--    gtk_container_add (GTK_CONTAINER (window), box);
--    gtk_widget_show_all (window);
--    return;
-- }


-- When an unselected button in the group is clicked the clicked button receives the "toggled" signal, as does the previously selected button. Inside the "toggled" handler, gtk_toggle_button_get_active() can be used to determine if the button has been selected or deselected.

inherit
	GTK_CHECK_BUTTON
		rename
			with_label as make_check_with_label,
			with_mnemonic as make_check_with_mnemonic
		export {} make_check_with_label, make_check_with_mnemonic
			-- Instead of undefining, which would turn this class into a 
			-- deferred one.
		end

insert
	GTK_RADIO_BUTTON_EXTERNALS
		-- GtkRadioButton implements AtkImplementorIface.	

create {ANY}
	in_a_new_group,
	from_group,
	from_widget,
	with_label,
	with_label_from_widget,
	with_mnemonic,
	with_mnemonic_from_widget,
	from_external_pointer

feature {} -- Creation
	in_a_new_group
			-- Creates a new GTK_RADIO_BUTTON in a new group.
		do
			from_external_pointer (gtk_radio_button_new (default_pointer))
		end
	
	from_group (a_group: G_SLIST[GTK_RADIO_BUTTON])
			-- Creates a new GTK_RADIO_BUTTON. To be of any practical
			-- value, a widget should then be packed into the radio
			-- button. `a_group': an existing radio button group, or Void
			-- if you are creating a new group.
		require
			gtk_initialized: gtk.is_initialized
			group_not_void: a_group/=Void
		do
			from_external_pointer (gtk_radio_button_new (a_group.handle))
		end
	
	from_widget (a_widget: GTK_RADIO_BUTTON)
			-- Creates a new GtkRadioButton, adding it to the same group
			-- of `a_widget'. As with `make', a widget should be packed
			-- into the radio button.
		require
			gtk_initialized: gtk.is_initialized
			widget_not_void: a_widget /= Void
		do
			from_external_pointer (gtk_radio_button_new_from_widget (a_widget.handle))
		end

	with_label (a_group: G_SLIST[GTK_RADIO_BUTTON]; a_label: STRING)
			-- Creates a new GTK_RADIO_BUTTON with `a_label' displayed
			-- next to the radio button; `a_group' is an existing radio
			-- button group, or Void if you are creating a new group.
		require
			gtk_initialized: gtk.is_initialized
			group_not_void: a_group/=Void implies not a_group.is_empty
			label_not_void: a_label /= Void
		local ptr: POINTER
		do
			if a_group/=Void then ptr:=a_group.handle end
			from_external_pointer (gtk_radio_button_new_with_label (ptr, a_label.to_external))
		end

	with_label_from_widget (a_widget: GTK_RADIO_BUTTON; a_label: STRING)
			-- Creates a new GtkRadioButton, adding it to the same group
			-- of `a_widget'; `a_label' displayed next to the radio
			-- button.
		require
			gtk_initialized: gtk.is_initialized
			widget_not_void: a_widget /= Void
			label_not_void: a_label /= Void
		do
			from_external_pointer(gtk_radio_button_new_with_label_from_widget
										 (a_widget.handle, a_label.to_external))
		end


	with_mnemonic (a_group: G_SLIST[GTK_RADIO_BUTTON]; a_label: STRING)
			-- Creates a new GtkRadioButton containing `a_label', adding
			-- it to `a_group'. The label will be created using
			-- GTK_LABEL.with_mnemonic, so underscores in label indicate
			-- the mnemonic for the button.
		require
			gtk_initialized: gtk.is_initialized
			group_not_void: a_group/=Void implies not a_group.is_empty	
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_radio_button_new_with_mnemonic (a_group.handle, a_label.to_external))
		end

	with_mnemonic_from_widget (a_widget: GTK_RADIO_BUTTON; a_label: STRING)
			-- Creates a new GTK_RADIO_BUTTON containing `a_label' to the
			-- same group of `a_widget'. The label will be created using
			-- GTK_LABEL.with_mnemonic, so underscores in label indicate
			-- the mnemonic for the button.
		require
			gtk_initialized: gtk.is_initialized
			widget_not_void: a_widget /= Void
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_radio_button_new_with_mnemonic_from_widget
										  (a_widget.handle, a_label.to_external))
		end

feature {ANY} -- group
	set_group (a_group: G_SLIST[GTK_RADIO_BUTTON])
			-- Sets a Current's group to `a_group'. It should be noted
			-- that this does not change the layout of your interface in
			-- any way, so if you are changing the group, it is likely
			-- you will need to re-arrange the user interface to reflect
			-- these changes. See also `set_group_from'
		do
			gtk_radio_button_set_group (handle,a_group.handle)
		end

	set_group_from (another: GTK_RADIO_BUTTON)
			-- Makes Current belong to the same group of `another'. The
			-- implementation is (slightly) faster than
			-- a_radio_button.set_group (another.group)
		do
			gtk_radio_button_set_group (handle,
												 gtk_radio_button_get_group(another.handle))
		end

	group: G_SLIST[GTK_RADIO_BUTTON]
			-- the group assigned to a radio button.
		do
			create {G_OBJECT_SLIST[GTK_RADIO_BUTTON]} Result.from_external_pointer (gtk_radio_button_get_group(handle))
		end

feature {ANY} -- Property Details TODO
-- The "group" property

--   "group"                GtkRadioButton        : Write

-- Sets a new group for a radio button.
feature {ANY} -- Signal Details TODO
-- The "group-changed" signal

-- void        user_function                  (GtkRadioButton *style,
--                                             gpointer        user_data)      : Run first

-- Emitted when the group of radio buttons that a radio button belongs to changes. This is emitted when a radio button switches from being alone to being part of a group of 2 or more buttons, or vice-versa, and when a buttton is moved from one group of 2 or more buttons to a different one, but not when the composition of the group that a button belongs to changes.

-- style : 	the object which received the signal
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.4
-- See Also

-- GtkOptionMenu 	

-- Another way of offering the user a single choice from many.
end
