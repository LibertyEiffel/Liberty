note
	description: "Enum GdkScrollDirection: Specifies the direction of a scroll event."
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

		-- Do not confuse these events with the signals that GTK+
		-- widgets emit. Although many of these events result in
		-- corresponding signals being emitted, the events are often
		-- transformed or filtered along the way.

deferred class GDK_SCROLL_DIRECTION

inherit ANY undefine is_equal, copy end

feature {} --  enum

	is_valid_gdk_scroll_direction (a_direction: INTEGER) : BOOLEAN
		do
			Result:=((a_direction=gdk_scroll_up) or else
			         (a_direction=gdk_scroll_down) or else
			         (a_direction=gdk_scroll_left) or else
			         (a_direction=gdk_scroll_right))
		end

	gdk_scroll_up: INTEGER
			-- The window is scrolled up
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SCROLL_UP"
		end

	gdk_scroll_down: INTEGER
			-- The window is scrolled down
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SCROLL_DOWN"
		end

	gdk_scroll_left: INTEGER
			-- The window is scrolled to the left
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SCROLL_LEFT"
		end

	gdk_scroll_right: INTEGER
			-- The window is scrolled to the right
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SCROLL_RIGHT"
		end

end -- GDK_SCROLL_DIRECTION
