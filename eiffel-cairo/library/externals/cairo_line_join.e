indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team, Cairo team
					
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

deferred class CAIRO_LINE_JOIN

inherit ANY undefine is_equal, copy end

feature  -- enum
	is_valid_line_join (a_join :INTEGER): BOOLEAN is
		do	
			result:=((a_join=cairo_line_join_miter) or else
						(a_join=cairo_line_join_round) or else
						(a_join=cairo_line_join_bevel))
		end

	cairo_line_join_miter: INTEGER is
			-- CAIRO_LINE_JOIN_MITER
		external "C macro use <pango.h>"
		alias "CAIRO_LINE_JOIN_MITER"
		end

	cairo_line_join_round: INTEGER is
			-- CAIRO_LINE_JOIN_ROUND
		external "C macro use <pango.h>"
		alias "CAIRO_LINE_JOIN_ROUND"
		end

	cairo_line_join_bevel: INTEGER is
			-- CAIRO_LINE_JOIN_BEVEL
		external "C macro use <pango.h>"
		alias "CAIRO_LINE_JOIN_BEVEL"
		end
end
