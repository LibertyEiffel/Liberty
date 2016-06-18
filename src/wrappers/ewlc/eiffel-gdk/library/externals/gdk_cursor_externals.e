note
	description: "External calls for GdkCursor"
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDK_CURSOR_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GDK_CURSOR_TYPE

feature {} -- enum

	gdk_cursor_type (h: POINTER) : INTEGER
		external "C struct GdkCursor get type use <gdk/gdk.h>"
		ensure
			is_valid_gdk_cursor_type (Result)
		end

	gdk_cursor_new (a_cursor_type: INTEGER): POINTER
		require
			is_valid_gdk_cursor_type (a_cursor_type)
		external "C use <gdk/gdk.h>"
		end

	gdk_cursor_ref (handle: POINTER): POINTER
		external "C use <gdk/gdk.h>"
		end

	gdk_cursor_unref (handle: POINTER)
		external "C use <gdk/gdk.h>"
		end

end -- GDK_CURSOR_EXTERNALS
