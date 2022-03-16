note
	description: "A GdkSpan represents a horizontal line of pixels starting at the pixel with coordinates x, y and ending before x + width, y."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

class GDK_SPAN

inherit G_STRUCT

create {ANY} from_external_pointer

feature {ANY} -- Getters
	x: INTEGER
			-- x coordinate of the first pixel.
		do
			Result := get_x (handle)
		end

	y: INTEGER
			-- y coordinate of the first pixel.
		do
			Result := get_y (handle)
		end

	width: INTEGER
			-- number of pixels in the span.
		do
			Result := get_width (handle)
		end

feature {ANY} -- TODO: Setters (if needed)
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkSpan)"
		end

feature {} -- Struct accesing

	get_x (span: POINTER): INTEGER
		external "C struct GdkSpan get x use <gdk/gdk.h>"
		end

	get_y (span: POINTER): INTEGER
		external "C struct GdkSpan get y use <gdk/gdk.h>"
		end
	
	get_width (span: POINTER): INTEGER
		external "C struct GdkSpan get width use <gdk/gdk.h>"
		end
end
