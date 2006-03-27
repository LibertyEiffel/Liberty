itndexing
	description: "GtkItem -- base class for GtkMenuItem, GtkListItem and GtkTreeItem."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ITEM
inherit
	GTK_BIN
	GTK_ITEM_EXTERNALS
	C_STRUCT
	-- GtkItem implements AtkImplementorIface.

feature
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
