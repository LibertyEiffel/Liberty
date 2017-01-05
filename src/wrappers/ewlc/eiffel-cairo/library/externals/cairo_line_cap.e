note
	description: "enum cairo_line_cap_t"
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, Cairo team
					
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

deferred class CAIRO_LINE_CAP
	--   enumeration for style of line-endings
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_line_cap (a_cap: INTEGER): BOOLEAN
		do	
			Result:=((a_cap =	cairo_line_cap_butt) or else
						(a_cap =	cairo_line_cap_round) or else
						(a_cap =	cairo_line_cap_square))
		end
	
	cairo_line_cap_butt: INTEGER
			-- start(stop) the line exactly at the start(end) point
		external "C macro use <cairo.h>"
		alias "CAIRO_LINE_CAP_BUTT"
		end

	cairo_line_cap_round: INTEGER
			-- use a round ending, the center of the circle is the end
			-- point
		external "C macro use <cairo.h>"
		alias "CAIRO_LINE_CAP_ROUND"
		end

	cairo_line_cap_square: INTEGER
			-- use squared ending, the center of the square is the end
			-- point)
		external "C macro use <cairo.h>"
		alias "CAIRO_LINE_CAP_SQUARE"
		end


end
