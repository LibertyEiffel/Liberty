note
	description: "GtkPaned example."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class PANED_EXAMPLE
insert GTK_MAIN
	
create {ANY} make

feature {} -- Creation
	make
			-- TODO: Eiffelize this example Example 1. Creating a paned widget with minimum sizes.
		do
			-- GtkWidget *hpaned = gtk_hpaned_new ();
			-- GtkWidget *frame1 = gtk_frame_new (NULL);
			-- GtkWidget *frame2 = gtk_frame_new (NULL);
			-- gtk_frame_set_shadow_type (GTK_FRAME (frame1), GTK_SHADOW_IN);
			-- gtk_frame_set_shadow_type (GTK_FRAME (frame2), GTK_SHADOW_IN);
	
			-- gtk_widget_set_size_request (hpaned, 200 + GTK_PANED (hpaned)->gutter_size, -1);
	
			-- gtk_paned_pack1 (GTK_PANED (hpaned), frame1, TRUE, FALSE);
			-- gtk_widget_set_size_request (frame1, 50, -1);
	
			-- gtk_paned_pack2 (GTK_PANED (hpaned), frame2, FALSE, FALSE);
			-- gtk_widget_set_size_request (frame2, 50, -1);
		end
end

