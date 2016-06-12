note
	description: "GtkWindowGroup -- Limit the effect of grabs."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GTK_WINDOW_GROUP

inherit G_OBJECT 

create {ANY} make, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new GtkWindowGroup object. Grabs added with
			-- gtk_grab_add() only affect windows within the same
			-- GtkWindowGroup.
		do
			from_external_pointer (gtk_window_group_new)
		end

	add (a_window: GTK_WINDOW) is
			-- Adds `a_window' to a GtkWindowGroup.
		require window_not_void: a_window/=Void
		do
			gtk_window_group_add_window(handle,a_window.handle)
		end

	remove (a_window: GTK_WINDOW) is
			-- Removes `a_window' from a GtkWindowGroup.
		require window_not_void: a_window/=Void
		do
			gtk_window_group_remove_window (handle, a_window.handle)
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkWindowGroup)"
		end

feature {} -- External calls
	gtk_window_group_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_window_group_add_window (window_group, window: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_window_group_remove_window  (window_group, window: POINTER) is
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_WINDOW_GROUP
