note
	description: "Enum "
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GDK_WINDOW_EDGE
	-- enum GdkWindowEdge determines a window edge or corner.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_window_edge (an_edge :INTEGER): BOOLEAN
		do	
			Result:=((an_edge = gdk_window_edge_north_west) or else
						(an_edge = gdk_window_edge_north) or else
						(an_edge = gdk_window_edge_north_east) or else
						(an_edge = gdk_window_edge_west) or else
						(an_edge = gdk_window_edge_east) or else
						(an_edge = gdk_window_edge_south_west) or else
						(an_edge = gdk_window_edge_south) or else
						(an_edge = gdk_window_edge_south_east))
		end
	
	gdk_window_edge_north_west: INTEGER
			-- the top left corner.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_NORTH_WEST"
		end

	gdk_window_edge_north: INTEGER
			-- the top edge.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_NORTH"
		end

	gdk_window_edge_north_east: INTEGER
			-- the top right corner.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_NORTH_EAST"
		end

	gdk_window_edge_west: INTEGER
			-- the left edge.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_WEST"
		end

	gdk_window_edge_east: INTEGER
			-- the right edge.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_EAST"
		end

	gdk_window_edge_south_west: INTEGER
			-- the lower left corner.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_SOUTH_WEST"
		end

	gdk_window_edge_south: INTEGER
			-- the lower edge.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_SOUTH"
		end

	gdk_window_edge_south_east: INTEGER
			-- the lower right corner.
		external "C macro <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_SOUTH_EAST"
		end
end
