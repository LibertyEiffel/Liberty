note
	description: "enum cairo_antialias_t"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	wrapped_version: "1.2.4"

deferred class CAIRO_ANTIALIAS_TYPE
	-- Specifies the type of antialiasing to do when rendering text or
	-- shapes.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum

	is_valid_antialias_type (a_type: INTEGER): BOOLEAN
		do
			Result := ((a_type = cairo_antialias_default) or else
						(a_type = cairo_antialias_none) or else
						(a_type = cairo_antialias_gray) or else
						(a_type = cairo_antialias_subpixel))
		end

	cairo_antialias_default: INTEGER
			-- Use the default antialiasing for the subsystem and target device
		external "C macro use <cairo.h>"
		alias "CAIRO_ANTIALIAS_DEFAULT"
		end

	cairo_antialias_none: INTEGER
			-- Use a bilevel alpha mask
		external "C macro use <cairo.h>"
		alias "CAIRO_ANTIALIAS_NONE"
		end

	cairo_antialias_gray: INTEGER
			-- Perform single-color antialiasing (using shades of gray for black
			-- text on a white background, for example).
		external "C macro use <cairo.h>"
		alias "CAIRO_ANTIALIAS_GRAY"
		end

	cairo_antialias_subpixel: INTEGER
			-- Perform antialiasing by taking advantage of the order of subpixel
			-- elements on devices such as LCD panels
		external "C macro use <cairo.h>"
		alias "CAIRO_ANTIALIAS_SUBPIXEL"
		end

end
