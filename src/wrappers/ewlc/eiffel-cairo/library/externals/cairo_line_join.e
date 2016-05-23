note
	description: "Enum cairo_line_join_t"
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team,
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

deferred class CAIRO_LINE_JOIN
	-- Specifies how to render the junction of two lines when stroking.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum

	is_valid_line_join (a_join :INTEGER): BOOLEAN is
		do
			Result := ((a_join = cairo_line_join_miter) or else
						(a_join = cairo_line_join_round) or else
						(a_join = cairo_line_join_bevel))
		end

	cairo_line_join_miter: INTEGER is
			-- Use a sharp (angled) corner, see 'set_miter_limit'
		external "C macro use <cairo.h>"
		alias "CAIRO_LINE_JOIN_MITER"
		end

	cairo_line_join_round: INTEGER is
			-- Use a rounded join, the center of the circle is the joint point
		external "C macro use <cairo.h>"
		alias "CAIRO_LINE_JOIN_ROUND"
		end

	cairo_line_join_bevel: INTEGER is
			-- Use a cut-off join, the join is cut off at half the line width
			-- from the joint point 
		external "C macro use <cairo.h>"
		alias "CAIRO_LINE_JOIN_BEVEL"
		end

end
