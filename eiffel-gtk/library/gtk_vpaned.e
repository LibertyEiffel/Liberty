indexing
	description: "GtkVPaned -- A container with two panes arranged vertically"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- The Vpaned widget is a
	-- container widget with two
	-- children arranged
	-- vertically. The division
	-- between the two panes is
	-- adjustable by the user by
	-- dragging a handle. See
	-- GtkPaned for details.

class GTK_VPANED
inherit GTK_PANED
	-- GtkVpaned implements AtkImplementorIface.
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkVpaned)"
		end

feature {NONE} -- Creation
	make is
			-- Create a new GtkVpaned
		do
			handle:=gtk_vpaned_new
			store_eiffel_wrapper
		end
   

feature {NONE} 
	gtk_vpaned_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
end
