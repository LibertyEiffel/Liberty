note
	description: "enum cairo_path_data_type_t"
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

deferred class CAIRO_PATH_DATA_TYPE

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_path_data_type (a_type: INTEGER): BOOLEAN
		do	
			Result:=((a_type = cairo_path_move_to) or else
						(a_type = cairo_path_line_to) or else
						(a_type = cairo_path_curve_to) or else
						(a_type = cairo_path_close_path))
		end

	cairo_path_move_to: INTEGER
			-- CAIRO_PATH_MOVE_TO
		external "C macro use <pango.h>"
		alias "CAIRO_PATH_MOVE_TO"
		end

	cairo_path_line_to: INTEGER
			-- CAIRO_PATH_LINE_TO
		external "C macro use <pango.h>"
		alias "CAIRO_PATH_LINE_TO"
		end

	cairo_path_curve_to: INTEGER
			-- CAIRO_PATH_CURVE_TO
		external "C macro use <pango.h>"
		alias "CAIRO_PATH_CURVE_TO"
		end

	cairo_path_close_path: INTEGER
			-- CAIRO_PATH_CLOSE_PATH
		external "C macro use <pango.h>"
		alias "CAIRO_PATH_CLOSE_PATH"
		end
end
