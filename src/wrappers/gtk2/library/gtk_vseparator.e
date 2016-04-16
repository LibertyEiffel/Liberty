note
	description: "GtkVSeparator -- A vertical separator."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "2.10.6"

class GTK_VSEPARATOR
	-- The GtkVSeparator widget is a vertical separator, used to group
	-- the widgets within a window. It displays a vertical line with a
	-- shadow to make it appear sunken into the interface.
	
inherit GTK_SEPARATOR
	-- GtkVSeparator implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a new GtkVSeparator.
		do	
			from_external_pointer(gtk_vseparator_new)
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkVSeparator)"
		end

feature {} -- External calls
	gtk_vseparator_new: POINTER is
			-- GtkWidget* gtk_vseparator_new (void);
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_VSEPARATOR
