indexing
	description: "."
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

class EXPANDER

creation make

feature
-- /* Expander
--  *
--  * GtkExpander allows to provide additional content that is initially hidden.
--  * This is also known as "disclosure triangle".
--  *
--  */

-- #include <gtk/gtk.h>

-- static GtkWidget *window = NULL;


-- GtkWidget *
-- do_expander (GtkWidget *do_widget)
-- {
--   GtkWidget *vbox;
--   GtkWidget *label;
--   GtkWidget *expander;
  
--   if (!window)
--   {
--     window = gtk_dialog_new_with_buttons ("GtkExpander",
-- 					  GTK_WINDOW (do_widget),
-- 					  0,
-- 					  GTK_STOCK_CLOSE,
-- 					  GTK_RESPONSE_NONE,
-- 					  NULL);
--     gtk_window_set_resizable (GTK_WINDOW (window), FALSE);

--     g_signal_connect (window, "response",
-- 		      G_CALLBACK (gtk_widget_destroy), NULL);
--     g_signal_connect (window, "destroy",
-- 		      G_CALLBACK (gtk_widget_destroyed), &window);

--     vbox = gtk_vbox_new (FALSE, 5);
--     gtk_box_pack_start (GTK_BOX (GTK_DIALOG (window)->vbox), vbox, TRUE, TRUE, 0);
--     gtk_container_set_border_width (GTK_CONTAINER (vbox), 5);

--     label = gtk_label_new ("Expander demo. Click on the triangle for details.");
--     gtk_box_pack_start (GTK_BOX (vbox), label, FALSE, FALSE, 0);

--     /* Create the expander */
--     expander = gtk_expander_new ("Details");
--     gtk_box_pack_start (GTK_BOX (vbox), expander, FALSE, FALSE, 0);

--     label = gtk_label_new ("Details can be shown or hidden.");
--     gtk_container_add (GTK_CONTAINER (expander), label);
--   }

--   if (!GTK_WIDGET_VISIBLE (window))
--     gtk_widget_show_all (window);
--   else
--     gtk_widget_destroy (window);

--   return window;
	--}
end



