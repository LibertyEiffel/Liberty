note
	description: "enum cairo_content_t"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team,
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

deferred class CAIRO_CONTENT
	-- cairo_content_t is used to describe the content that a surface
	-- will contain, whether color information, alpha information
	-- (translucence vs. opacity), or both.

	-- Note: The large values here are designed to keep cairo_content_t
	-- values distinct from cairo_format_t values so that the
	-- implementation can detect the error if users confuse the two
	-- types.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum

	is_valid_content (a_content: INTEGER): BOOLEAN
		do
			Result := ((a_content = cairo_content_color) or else
						(a_content = cairo_content_alpha) or else
						(a_content = cairo_content_color_alpha))
		end

	cairo_content_color: INTEGER
			-- The surface will hold color content only.
		external "C macro use <cairo.h>"
		alias "CAIRO_CONTENT_COLOR"
		end

	cairo_content_alpha: INTEGER
			-- The surface will hold alpha content only.
		external "C macro use <cairo.h>"
		alias "CAIRO_CONTENT_ALPHA"
		end

	cairo_content_color_alpha: INTEGER
			-- The surface will hold color and alpha content.
		external "C macro use <cairo.h>"
		alias "CAIRO_CONTENT_COLOR_ALPHA"
		end

end
