note
	description: "enum cairo_font_slant_t"
	copyright: "[
					Copyright (C) 2007-2017: eiffel-libraries team, Pango team
					
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

deferred class CAIRO_FONT_SLANT

	-- Specifies variants of a font face based on their slant.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_font_slant (a_slant: INTEGER): BOOLEAN
		do
			Result := ((a_slant = cairo_font_slant_normal) or else
						(a_slant = cairo_font_slant_italic) or else
						(a_slant = cairo_font_slant_oblique))
		end

	cairo_font_slant_normal: INTEGER
			-- Upright font style
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_SLANT_NORMAL"
		end

	cairo_font_slant_italic: INTEGER
			-- 	Italic font style
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_SLANT_ITALIC"
		end

	cairo_font_slant_oblique: INTEGER
			-- Oblique font style
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_SLANT_OBLIQUE"
		end

end -- class CAIRO_FONT_SLANT
