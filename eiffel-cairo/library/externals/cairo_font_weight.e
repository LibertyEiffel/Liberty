indexing
	description: "enum cairo_font_weight_t"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Cairo team
					
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
	--  enum cairo_font_weight_t

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_font_weight (a_weight: INTEGER): BOOLEAN is
		do	
			Result:=((a_weight = CAIRO_FONT_WEIGHT_NORMAL) or else
						(a_weight = CAIRO_FONT_WEIGHT_BOLD))
		end

	cairo_font_weight_normal: INTEGER is
			-- CAIRO_FONT_WEIGHT_NORMAL
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_WEIGHT_BOLD"
		end

	cairo_font_weight_bold: INTEGER is
			-- CAIRO_FONT_WEIGHT_BOLD
		external "C macro use <pango.h>"
		alias "CAIRO_FONT_WEIGHT_BOLD"
		end
end
