note
	description: "External calls for PANGO_FONT_MAP"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, Pango team
					
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

deferred class PANGO_FONT_MAP_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	pango_font_map_get_shape_engine_type (a_handle: POINTER): POINTER
		external "C use <pango/pango.h>"
		end

end -- class PANGO_FONT_MAP_EXTERNALS
