indexing
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

deferred class GTK_FILE_CHOOSER_BUTTON_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_file_chooser_button_new (a_title: POINTER; an_action: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_button_new_with_backend (a_title: POINTER; an_action: INTEGER; a_backend: POINTER): POINTER is
			-- GtkWidget* gtk_file_chooser_button_new_with_backend (const gchar
			-- *title, GtkFileChooserAction action, const gchar *backend);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_button_new_with_dialog (a_dialog: POINTER): POINTER is
			-- GtkWidget* gtk_file_chooser_button_new_with_dialog (GtkWidget
			-- *dialog);
		external "C use <gtk/gtk.h>"
		end
			
	gtk_file_chooser_button_get_title (a_file_chooser_button: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_button_set_title (a_button, a_title: POINTER) is
			-- void gtk_file_chooser_button_set_title (GtkFileChooserButton
			-- *button, const gchar *title);
		external "C use <gtk/gtk.h>"
		end
			
	gtk_file_chooser_button_get_width_chars (a_button: POINTER): INTEGER is
			-- gint gtk_file_chooser_button_get_width_chars (GtkFileChooserButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_button_set_width_chars (a_button: POINTER; an_n_chars: INTEGER) is
			-- void gtk_file_chooser_button_set_width_chars (GtkFileChooserButton
			-- *button, gint n_chars);
		external "C use <gtk/gtk.h>"
		end
			
	gtk_file_chooser_button_get_focus_on_click (a_button: POINTER): INTEGER is
			-- gboolean gtk_file_chooser_button_get_focus_on_click
			-- (GtkFileChooserButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_button_set_focus_on_click (a_button: POINTER; a_focus_on_click_bool: INTEGER) is
			-- void gtk_file_chooser_button_set_focus_on_click (GtkFileChooserButton *button, gboolean focus_on_click);
		external "C use <gtk/gtk.h>"
		end
 
end
