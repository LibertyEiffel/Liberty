indexing
	description: "."
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

class PANGO_RECTANGLE

inherit
	C_STRUCT
	MIXED_MEMORY_HANDLING

insert PANGO_RECTANGLE_EXTERNALS

create {ANY} from_external_pointer

feature {ANY} -- Access

	x: INTEGER is
		do
			Result := pango_rectangle_get_x (handle)
		end

	y: INTEGER is
		do
			Result := pango_rectangle_get_y (handle)
		end

	width: INTEGER is
		do
			Result := pango_rectangle_get_width (handle)
		end

	height: INTEGER is
		do
			Result := pango_rectangle_get_height (handle)
		end

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <pango/pango-types.h>"
		alias "sizeof(PangoRectangle)"
		end

end -- class PANGO_RECTANGLE
