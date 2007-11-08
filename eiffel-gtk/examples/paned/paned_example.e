indexing
	description: "GtkPaned example."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class PANED_EXAMPLE
insert GTK_MAIN
	
creation make

feature {} -- Creation
	make is
			-- TODO: Eiffelize this example Example 1. Creating a paned widget with minimum sizes.
		do
			gtk.initialize
			create paned.make
			create frame1.make; create frame2.make

			frame1.set_shadow_type(gtk_shadow_in)
			frame2.set_shadow_type(gtk_shadow_in)

			paned.set_size_request(200 + paned.gutter_size, -1)
	
			paned.pack1(frame1, True, False)
			frame1.set_size_request(50, -1)
	
			paned.pack2 (frame2, False, False)
			frame2.set_size_request(50, -1)
		end
	
feature -- Widgets
	window: GTK_WINDOW
	paned: GTK_HPANED
	frame1, frame2: GTK_FRAME

end

