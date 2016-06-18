note
	description: "External calls for GtkCellEditable"
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

deferred class GTK_CELL_EDITABLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

--             GtkCellEditable;
--             GtkCellEditableIface;
	gtk_cell_editable_start_editing (a_gtkcelleditable, a_gdkevent: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_editable_editing_done  (a_gtkcelleditable: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_editable_remove_widget (a_gtkcelleditable: POINTER)
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
