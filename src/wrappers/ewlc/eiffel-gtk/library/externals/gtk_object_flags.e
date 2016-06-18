note
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
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_OBJECT_FLAGS

inherit ANY undefine is_equal, copy end

feature {} -- enum

	gtk_in_destruction: INTEGER
			-- the object is currently being destroyed. This is used internally by
			-- GTK+ to prevent reinvokations during destruction.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IN_DESTRUCTION"
		end
	
	gtk_floating: INTEGER
			-- the object is orphaned. Objects that take strong hold of an object
			-- may gtk_object_sink() it, after obtaining their own references, if
			-- they believe they are nearly primary ownership of the object.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FLOATING"
		end
	
	gtk_connected: INTEGER
			-- signals are connected to this object.
		external "C macro use <gtk/gtk.h>"
		alias " GTK_CONNECTED"
		end
end
								 
