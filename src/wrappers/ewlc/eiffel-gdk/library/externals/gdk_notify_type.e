note
	description: "Enum GdkCrossingMode"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team, Anthony Lenton
					
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

deferred class GDK_NOTIFY_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gdk_notify_type (a_notify_type: INTEGER) : BOOLEAN
		do
			Result := a_notify_type.in_range (gdk_notify_ancestor,
			                                  gdk_notify_unknown)
		end

	gdk_notify_ancestor: INTEGER
			-- the window is entered from an ancestor or left towards an
			-- ancestor.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTIFY_ANCESTOR"
		end

	gdk_notify_virtual: INTEGER
			-- the pointer moves between an ancestor and an inferior of the
			-- window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTIFY_VIRTUAL"
		end

	gdk_notify_inferior: INTEGER
			-- the window is entered from an inferior or left towards an
			-- inferior.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTIFY_INFERIOR"
		end

	gdk_notify_nonlinear: INTEGER
			-- the window is entered from or left towards a window which is
			-- neither an ancestor nor an inferior.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTIFY_NONLINEAR"
		end

	gdk_notify_nonlinear_virtual: INTEGER
			-- the pointer moves between two windows which are not ancestors of
			-- each other and the window is part of the ancestor chain between
			-- one of these windows and their least common ancestor.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTIFY_NONLINEAR_VIRTUAL"
		end

	gdk_notify_unknown: INTEGER
			-- an unknown type of enter/leave event occurred.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_NOTIFY_UNKNOWN"
		end

end -- GDK_NOTIFY_TYPE
