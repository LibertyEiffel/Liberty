indexing
	description: "Enum GdkInterpType"
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

deferred class GDK_INTERP_TYPE
-- typedef enum {
--	GDK_INTERP_NEAREST,
--	GDK_INTERP_TILES,
--	GDK_INTERP_BILINEAR,
--	GDK_INTERP_HYPER
-- } GdkInterpType;

feature  -- enum

	is_valid_gdk_interp_type (an_interp_type: INTEGER): BOOLEAN is
		do
			Result:=((an_interp_type=gdk_interp_nearest) or else
			         (an_interp_type=gdk_interp_tiles) or else
			         (an_interp_type=gdk_interp_bilinear) or else
			         (an_interp_type=gdk_interp_hyper))
		end

	gdk_interp_nearest: INTEGER is
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_NEAREST"
		end

	gdk_interp_tiles: INTEGER is
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_TILES"
		end

	gdk_interp_bilinear: INTEGER is
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_BILINEAR"
		end

	gdk_interp_hyper: INTEGER is
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_HYPER"
		end

end -- GDK_INTERP_TYPE
