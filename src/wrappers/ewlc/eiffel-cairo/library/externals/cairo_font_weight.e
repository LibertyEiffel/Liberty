note
	description: "enum cairo_font_weight_t"
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, Cairo team
					
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

deferred class CAIRO_FONT_WEIGHT

	-- Specifies variants of a font face based on their weight.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_font_weight (a_weight: INTEGER): BOOLEAN
		do
			Result := ((a_weight = cairo_font_weight_normal) or else
						(a_weight = cairo_font_weight_bold))
		end

	cairo_font_weight_normal: INTEGER
			-- Normal font weight
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_WEIGHT_BOLD"
		end

	cairo_font_weight_bold: INTEGER
			--  Bold font weight
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_WEIGHT_BOLD"
		end
end
