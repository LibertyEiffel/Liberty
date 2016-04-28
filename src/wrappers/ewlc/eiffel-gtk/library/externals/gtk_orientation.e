note
	description: "Enum GtkOrientation"
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

deferred class GTK_ORIENTATION
	-- Represents the orientation of widgets which can be switched
	-- between horizontal and vertical orientation on the fly, like
	-- GtkToolbar.
	
inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_gtk_orientation (an_orientation :INTEGER): BOOLEAN is
		do	
			Result:=((an_orientation = gtk_orientation_horizontal) or else
						(an_orientation = gtk_orientation_vertical))
		end

	gtk_orientation_horizontal: INTEGER is
			-- The widget is in horizontal orientation.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ORIENTATION_HORIZONTAL"
		end
		
	gtk_orientation_vertical: INTEGER is
			-- The widget is in vertical orientation. 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ORIENTATION_VERTICAL"
		end
end
