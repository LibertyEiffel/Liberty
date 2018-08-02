note
	description: "GtkVPaned -- A container with two panes arranged vertically"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

	-- The Vpaned widget is a container widget with two children
	-- arranged vertically. The division between the two panes is
	-- adjustable by the user by dragging a handle. See GtkPaned for
	-- details.

class GTK_VPANED
inherit GTK_PANED
	-- GtkVpaned implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkVpaned)"
		end

feature {} -- Creation
	make
			-- Create a new GtkVpaned
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer(gtk_vpaned_new)
		end
	
feature {} 
	gtk_vpaned_new: POINTER
		external "C use <gtk/gtk.h>"
		end
end
