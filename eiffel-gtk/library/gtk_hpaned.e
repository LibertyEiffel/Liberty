indexing
	description: "GtkHPaned -- A container with two panes arranged horizontally"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- The HPaned widget is a container widget with two children
	-- arranged horizontally. The division between the two panes is
	-- adjustable by the user by dragging a handle. See GtkPaned for
	-- details.

class GTK_HPANED
inherit GTK_PANED
	-- GtkHPaned implements AtkImplementorIface.
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkHPaned)"
		end

feature {NONE} -- Creation
	make is
			-- Create a new GtkHPaned
		do
			handle:=gtk_hpaned_new
			store_eiffel_wrapper
		end
   

feature {NONE} 
	gtk_hpaned_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
end
