indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ITEM_EXTERNALS
	
creation make

feature {NONE} -- externals 
	gtk_item_select (an_item: POINTER) is external "C use <gtk/gtk.h>" end
	gtk_item_deselect (an_item: POINTER) is external "C use <gtk/gtk.h>" end
	gtk_item_toggle (an_item: POINTER) is external "C use <gtk/gtk.h>" end

	-- TODO wrap Signals
	
-- The "deselect" signal

-- void        user_function                  (GtkItem *item,
--                                             gpointer user_data)      : Run first

-- Emitted when the item is deselected.
-- item : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "select" signal

-- void        user_function                  (GtkItem *item,
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
