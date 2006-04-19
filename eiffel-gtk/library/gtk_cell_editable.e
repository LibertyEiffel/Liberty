indexing
	description: "GtkCellEditable -- Interface for widgets which can are used for editing cells."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_EDITABLE
inherit
	--   GInterface
	
	-- TODO: check if this tense in GTK documentation: "Prerequisites:
	-- GtkCellEditable requires GtkWidget" actually means that every
	-- GTK_CELL_EDITABLE is a GTK_WIDGET. Poor GTK programmers, they
	-- don't have Eiffel's multiple inheritance. I assume it is. Paolo
	-- 2006-01-21
	GTK_WIDGET undefine make end
		-- GtkCellEditable is implemented by GtkEntry, GtkComboBox,
		-- GtkSpinButton and GtkComboBoxEntry.
insert
	GTK_CELL_EDITABLE_EXTERNALS

feature -- Editing
	start_editing (a_gdkevent: GDK_EVENT) is
			-- Begins editing on a cell_editable. `a_gdkevent' began the
			-- editing process; it may be Void, in the instance that
			-- editing was initiated through programatic means.
		do
			if a_gdkevent=Void
			then gtk_cell_editable_start_editing (handle, default_pointer)
			else gtk_cell_editable_start_editing (handle, a_gdkevent.handle)
			end
		end

	editing_done is
			-- Emits the "editing_done" signal. This signal is a sign for
			-- the cell renderer to update its value from the cell.
		do
			gtk_cell_editable_editing_done  (handle)
		end

	remove_widget is
			-- Emits the "remove_widget" signal. This signal is meant to
			-- indicate that the cell is finished editing, and the widget
			-- may now be destroyed.
		do
			gtk_cell_editable_remove_widget (handle)
		end


	-- The "editing-done" signal

	-- void        user_function                  (GtkCellEditable *celleditable,
	--                                             gpointer         user_data)         : Run last
	
	-- celleditable : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "remove-widget" signal

	-- void        user_function                  (GtkCellEditable *celleditable,
	--                                             gpointer         user_data)         : Run last
	
	-- celleditable : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
	
end
