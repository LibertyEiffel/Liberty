note
	description: "Enum GdkCrossingMode"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team, Anthony Lenton
					
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

	-- Specifies the crossing mode for GdkEventCrossing.

deferred class GDK_CROSSING_MODE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gdk_crossing_mode (a_crossing_mode: INTEGER) : BOOLEAN
		do
			Result := a_crossing_mode.in_range (gdk_crossing_mode_normal, gdk_crossing_mode_ungrab)
		end

	gdk_crossing_mode_normal: INTEGER
			-- crossing because of pointer motion.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CROSSING_MODE_NORMAL"
		end

	gdk_crossing_mode_grab: INTEGER
			-- crossing because a grab is activated.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CROSSING_MODE_GRAB"
		end

	gdk_crossing_mode_ungrab: INTEGER
			-- crossing because a grab is deactivated.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CROSSING_MODE_UNGRAB"
		end

end -- GDK_CROSSING_MODE
