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

	-- Specifies a trapezpoid for use by the gdk_draw_trapezoids(). The
	-- trapezoids used here have parallel, horizontal top and bottom
	-- edges.

class GDK_TRAPEZOID

inherit G_STRUCT

create {ANY} from_external_pointer

feature {ANY}

	y1: REAL
			-- the y coordinate of the start point.
		do
			Result := get_y1 (handle)
		end
	x11: REAL
			-- the x coordinate of the top left corner
		do
			Result := get_x11 (handle)
		end
	x21: REAL
			-- the x coordinate of the top right corner
		do
			Result := get_x21 (handle)
		end
	y2: REAL
			-- the y coordinate of the end point.
		do
			Result := get_y2 (handle)
		end
	x12: REAL
			-- the x coordinate of the bottom left corner
		do
			Result := get_x12 (handle)
		end
	x22: REAL
			-- the x coordinate of the bottom right corner
		do
			Result := get_x22 (handle)
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkSegment)"
		end

feature {} -- External calls
	get_x11 (segment: POINTER): REAL
		external "C struct GdkTrapezoid get x11 use <gdk/gdk.h>"
		end
	get_x21 (segment: POINTER): REAL
		external "C struct GdkTrapezoid get x21 use <gdk/gdk.h>"
		end
	get_y1 (segment: POINTER): REAL
		external "C struct GdkTrapezoid get y1 use <gdk/gdk.h>"
		end
	get_x12 (segment: POINTER): REAL
		external "C struct GdkTrapezoid get x12 use <gdk/gdk.h>"
		end
	get_x22 (segment: POINTER): REAL
		external "C struct GdkTrapezoid get x22 use <gdk/gdk.h>"
		end
	get_y2 (segment: POINTER): REAL
		external "C struct GdkTrapezoid get y2 use <gdk/gdk.h>"
		end
end
