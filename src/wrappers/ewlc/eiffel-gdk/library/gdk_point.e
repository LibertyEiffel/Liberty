note
	description: "GdkPoint is a simple structure containing an x and y coordinate of a point.."
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
class GDK_POINT

inherit G_STRUCT

create {ANY} from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkPoint)"
		end

feature {ANY} -- Getters
	x: INTEGER
			-- x coordinate of the point
		do
			Result := get_x (handle)
		end

	y: INTEGER
			-- y coordinate of the point.
		do
			Result := get_y (handle)
		end

feature {ANY} -- TODO: Setters (if needed)
	
feature {} -- Struct accesing

	get_x (span: POINTER): INTEGER
		external "C struct GdkPoint get x use <gdk/gdk.h>"
		end

	get_y (span: POINTER): INTEGER
		external "C struct GdkPoint get y use <gdk/gdk.h>"
		end
end
