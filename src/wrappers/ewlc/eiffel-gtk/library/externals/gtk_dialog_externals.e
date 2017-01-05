note
	description: "External calls for gtkdialog"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_DIALOG_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GTK_DIALOG_FLAGS
	GTK_RESPONSE_TYPE

feature {} -- Externals
	gtk_dialog_new: POINTER
		external "C use <gtk/gtk.h>"
		end
	
	-- TODO: wrap variadic GtkWidget* gtk_dialog_new_with_buttons
	-- (const gchar *title, GtkWindow *parent, GtkDialogFlags flags,
	-- const gchar *first_button_text,
	
	gtk_dialog_run (a_dialog: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_dialog_response (a_dialog: POINTER; response_id: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_dialog_add_button (a_dialog, a_button_text: POINTER; response_id: INTEGER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	-- TODO wrap variadic void gtk_dialog_add_buttons (a_dialog: POINTER,
	-- const gchar *first_button_text, ...
	
	gtk_dialog_add_action_widget    (a_dialog, a_child: POINTER; response_idis: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_dialog_get_has_separator    (a_dialog: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_dialog_set_default_response (a_dialog: POINTER; response_idis:INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_dialog_set_has_separator (a_dialog: POINTER; a_setting:INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_dialog_set_response_sensitive (a_dialog: POINTER; response_id, a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_dialog_get_response_for_widget (a_dialog, a_widget: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	-- TODOgboolean gtk_alternative_dialog_button_order -- (GdkScreen
	-- *screen)
	
	-- TODO wrap variadi void gtk_dialog_set_alternative_button_order
	-- (a_dialog: POINTER, gint_first_response_id:int, ...);
	
	-- void        gtk_dialog_set_alternative_button_order_from_array
	--                                             (a_dialog: POINTER,
	--                                              gint_n_params:int,
	--                                              gint *new_orderis
	-- external "C use <gtk/gtk.h>"
	-- end

feature {} -- GtkDialog struct

	gtkwidget_vbox (a_dialog: POINTER): POINTER
		external "C struct get vbox use <gtk/gtk.h>"
		end

	set_gtkwidget_vbox (a_dialog: POINTER; a_vbox: POINTER): POINTER
		external "C struct set vbox use <gtk/gtk.h>"
		end

	gtkwidget_action_area (a_dialog: POINTER): POINTER
		external "C struct get action_area use <gtk/gtk.h>"
		end

	set_gtkwidget_action_area (a_dialog: POINTER; an_action_area: POINTER): POINTER
		external "C struct set action_area use <gtk/gtk.h>"
		end

feature {} -- Signals TODO
-- TODO Signal Details
-- The "close" signal

-- void        user_function                  (GtkDialog *dialog,
--                                             gpointer   user_data)      : Run last / Action

-- dialog : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "response" signal

-- void        user_function                  (GtkDialog *dialog,
--                                             gint       arg1,

end
