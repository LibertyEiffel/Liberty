note
	description: "Enum "
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

deferred class GDK_GRAVITY
	-- Defines the reference point of a window and the meaning of
	-- coordinates passed to GTK_WINDOW's `move'. See that feature
	-- and the "implementation notes" section of the Extended Window
	-- Manager Hints specification for more details.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gravity (a_gravity :INTEGER): BOOLEAN
		do	
			Result:=((a_gravity = gdk_gravity_north_west) or else
						(a_gravity = gdk_gravity_north) or else
						(a_gravity = gdk_gravity_north_east) or else
						(a_gravity = gdk_gravity_west) or else
						(a_gravity = gdk_gravity_center) or else
						(a_gravity = gdk_gravity_east) or else
						(a_gravity = gdk_gravity_south_west) or else
						(a_gravity = gdk_gravity_south) or else
						(a_gravity = gdk_gravity_south_east) or else
						(a_gravity = gdk_gravity_static))
		end

	gdk_gravity_north_west: INTEGER
			-- the reference point is at the top left corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_NORTH_WEST"
		end

	gdk_gravity_north: INTEGER
			-- the reference point is in the middle of the top edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_NORTH"
		end

	gdk_gravity_north_east: INTEGER
			-- the reference point is at the top right corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_NORTH_EAST"
		end

	gdk_gravity_west: INTEGER
			-- the reference point is at the middle of the left edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_WEST"
		end

	gdk_gravity_center: INTEGER
			-- the reference point is at the center of the window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_CENTER"
		end

	gdk_gravity_east: INTEGER
			-- the reference point is at the middle of the right edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_EAST"
		end

	gdk_gravity_south_west: INTEGER
			-- the reference point is at the lower left corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_SOUTH_WEST"
		end

	gdk_gravity_south: INTEGER
			-- the reference point is at the middle of the lower edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_SOUTH"
		end

	gdk_gravity_south_east: INTEGER
			-- the reference point is at the lower right corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_SOUTH_EAST"
		end

	gdk_gravity_static: INTEGER
			-- the reference point is at the top left corner of the
			-- window itself, ignoring window manager decorations.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_STATIC"
		end
end
