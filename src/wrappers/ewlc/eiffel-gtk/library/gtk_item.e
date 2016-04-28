note
	description: "GtkItem -- base class for GtkMenuItem, GtkListItem and GtkTreeItem."
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ITEM

inherit
	GTK_BIN
		-- GtkItem implements AtkImplementorIface.

insert
	GTK_ITEM_EXTERNALS

feature {ANY}
	select_signal is
			-- Emits the "select" signal on the given item.
		do
			gtk_item_select (handle)
		end

	deselect is
			-- Emits the "deselect" signal on the given item.
		do
			gtk_item_deselect (handle)
		end

	toggle is
			-- Emits the "toggle" signal on the given item.
		do
			gtk_item_toggle (handle)
		end


	-- TODO: Signals
-- The "deselect" signal

-- void        user_function (handle,
--                                             gpointer user_data)      : Run first

-- Emitted when the item is deselected.
-- item : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "select" signal

-- void        user_function (handle,
--                                             gpointer user_data)      : Run first

-- Emitted when the item is selected.
-- item : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "toggle" signal

-- void        user_function                  (GtkItem *item,
--                                             gpointer user_data)      : Run first

-- Emitted when the item is toggled.
-- item : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.

end
