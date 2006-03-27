indexing
	description: "External calls for GtkCellEditable"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_EDITABLE_EXTERNALS

feature {NONE} -- External calls
--             GtkCellEditable;
--             GtkCellEditableIface;
	gtk_cell_editable_start_editing (a_gtkcelleditable, a_gdkevent: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_editable_editing_done  (a_gtkcelleditable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_editable_remove_widget (a_gtkcelleditable: POINTER) is
		external "C use <gtk/gtk.h>"
		end

-- TODO wrap the interface GtkCellEditableIface

-- typedef struct {
--   GTypeInterface g_iface;

--   /* signals */
--   void (* editing_done)  (GtkCellEditable *cell_editable);
--   void (* remove_widget) (GtkCellEditable *cell_editable);

--   /* virtual table */
--   void (* start_editing) (GtkCellEditable *cell_editable,
-- 			  GdkEvent        *event);
-- } GtkCellEditableIface;

	-- Signal Details
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
