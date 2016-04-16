note
	description: "GDK_COLORSPACE - Colorspaces supported by gdk-pixbuf"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDK_COLORSPACE

inherit ANY undefine is_equal, copy end

-- This enumeration defines the color spaces that are supported by
-- the gdk-pixbuf library. Currently only RGB is supported.

feature {} -- enum

	gdk_colorspace_rgb: INTEGER is
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_COLORSPACE_RGB"
		end

end -- class GDK_COLORSPACE
