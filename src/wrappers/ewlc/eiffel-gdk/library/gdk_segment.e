note
	description: "GdkSegment."
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

	-- Specifies the start and end point of a line for use by the
	-- gdk_draw_segments() function.

class GDK_SEGMENT

inherit G_STRUCT

create {ANY} from_external_pointer

feature {ANY}
	x1: INTEGER is
			-- the x coordinate of the start point.
		do
			Result := get_x1 (handle)
		end
	y1: INTEGER is
			-- the y coordinate of the start point.
		do
			Result := get_y1 (handle)
		end
	x2: INTEGER is
			-- the x coordinate of the end point.
		do
			Result := get_x2 (handle)
		end
	y2: INTEGER is
			-- the y coordinate of the end point.
		do
			Result := get_y2 (handle)
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkSegment)"
		end
feature {} -- External calls
	get_x1 (segment: POINTER): INTEGER is
		external "C struct GdkSegment get x1 use <gdk/gdk.h>"
		end
	get_y1 (segment: POINTER): INTEGER is
		external "C struct GdkSegment get y1 use <gdk/gdk.h>"
		end
	get_x2 (segment: POINTER): INTEGER is
		external "C struct GdkSegment get x2 use <gdk/gdk.h>"
		end
	get_y2 (segment: POINTER): INTEGER is
		external "C struct GdkSegment get y2 use <gdk/gdk.h>"
		end
end
