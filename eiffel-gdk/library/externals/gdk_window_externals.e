indexing
	description: "External calls for GdkWindow"
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

deferred class GDK_WINDOW_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gdk_window_new (parent, attributes: POINTER; attributes_mask: INTEGER): POINTER is
		external "C use <gdk/gdk.h>"
		end

	gdk_window_get_pointer (window, x_ptr, y_ptr, mask_ptr: POINTER): POINTER is
		external "C use <gdk/gdk.h>"
		end

	gdk_window_set_cursor (window, cursor: POINTER) is
		external "C use <gdk/gdk.h>"
		end

	gdk_window_get_children (window: POINTER): POINTER is
		external "C use <gdk/gdk.h>"
		end

	gdk_window_get_position (a_handle, an_x_ptr, an_y_ptr: POINTER) is
		external "C use <gdk/gdk.h>"
		end

end -- class GDK_WINDOW_EXTERNALS
