note
	description: "."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTK+ team
					
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

class PICKERS

create {ANY} make
	
feature {ANY}
-- /* Pickers 
--  *
--  * These widgets are mainly intended for use in preference dialogs.
--  * They allow to select colors, fonts, files and directories.
--  */

-- #include <gtk/gtk.h>

-- GtkWidget *
-- do_pickers (GtkWidget *do_widget)
-- {
--   static GtkWidget *window = NULL;
--   GtkWidget *table, *label, *picker;

--   if (!window)
--   {
--     window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
--     gtk_window_set_screen (GTK_WINDOW (window),
--                            gtk_widget_get_screen (do_widget));
--     gtk_window_set_title (GTK_WINDOW (window), "Pickers");
	
--     g_signal_connect (window, "destroy",
--                       G_CALLBACK (gtk_widget_destroyed),
--                       &window);
	
--     gtk_container_set_border_width (GTK_CONTAINER (window), 10);

--     table = gtk_table_new (4, 2, FALSE);    
--     gtk_table_set_col_spacing (GTK_TABLE (table), 0, 10);
--     gtk_table_set_row_spacings (GTK_TABLE (table), 3);
--     gtk_container_add (GTK_CONTAINER (window), table);

--     gtk_container_set_border_width (GTK_CONTAINER (table), 10);

--     label = gtk_label_new ("Color:");
--     gtk_misc_set_alignment (GTK_MISC (label), 0.0, 0.5);
--     picker = gtk_color_button_new ();
--     gtk_table_attach_defaults (GTK_TABLE (table), label, 0, 1, 0, 1);
--     gtk_table_attach_defaults (GTK_TABLE (table), picker, 1, 2, 0, 1);

--     label = gtk_label_new ("Font:");
--     gtk_misc_set_alignment (GTK_MISC (label), 0.0, 0.5);
--     picker = gtk_font_button_new ();
--     gtk_table_attach_defaults (GTK_TABLE (table), label, 0, 1, 1, 2);
--     gtk_table_attach_defaults (GTK_TABLE (table), picker, 1, 2, 1, 2);

--     label = gtk_label_new ("File:");
--     gtk_misc_set_alignment (GTK_MISC (label), 0.0, 0.5);
--     picker = gtk_file_chooser_button_new ("Pick a File", 
--                                           GTK_FILE_CHOOSER_ACTION_OPEN);
--     gtk_table_attach_defaults (GTK_TABLE (table), label, 0, 1, 2, 3);
--     gtk_table_attach_defaults (GTK_TABLE (table), picker, 1, 2, 2, 3);

--     label = gtk_label_new ("Folder:");
--     gtk_misc_set_alignment (GTK_MISC (label), 0.0, 0.5);
--     picker = gtk_file_chooser_button_new ("Pick a Folder", 
--                                           GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER);
--     gtk_table_attach_defaults (GTK_TABLE (table), label, 0, 1, 3, 4);
--     gtk_table_attach_defaults (GTK_TABLE (table), picker, 1, 2, 3, 4);
--   }

--   if (!GTK_WIDGET_VISIBLE (window))
--     {
--       gtk_widget_show_all (window);
--     }
--   else
--     {    
--       gtk_widget_destroy (window);
--       window = NULL;
--     }

--   return window;
-- }
end
