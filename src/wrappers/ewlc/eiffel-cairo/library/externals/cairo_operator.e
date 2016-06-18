note
	description: "enum cairo_operator_t "
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

deferred class CAIRO_OPERATOR

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_operator (an_operator: INTEGER): BOOLEAN
		do	
			Result:=((an_operator = cairo_operator_clear) or else
						(an_operator = cairo_operator_source) or else
						(an_operator = cairo_operator_over) or else
						(an_operator = cairo_operator_in) or else
						(an_operator = cairo_operator_out) or else
						(an_operator = cairo_operator_atop) or else
	
						(an_operator = cairo_operator_dest) or else
						(an_operator = cairo_operator_dest_over) or else
						(an_operator = cairo_operator_dest_in) or else
						(an_operator = cairo_operator_dest_out) or else
						(an_operator = cairo_operator_dest_atop) or else
						
						(an_operator = cairo_operator_xor) or else
						(an_operator = cairo_operator_add) or else
						(an_operator = cairo_operator_saturate))
		end

	cairo_operator_clear: INTEGER
			-- CAIRO_OPERATOR_CLEAR
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_CLEAR"
		end
	
	cairo_operator_source: INTEGER
			-- CAIRO_OPERATOR_SOURCE
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_SOURCE"
		end

	cairo_operator_over: INTEGER
			-- CAIRO_OPERATOR_OVER
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_OVER"
		end

	cairo_operator_in: INTEGER
			-- CAIRO_OPERATOR_IN
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_IN"
		end
	
	cairo_operator_out: INTEGER
			-- CAIRO_OPERATOR_OUT
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_OUT"
		end

	cairo_operator_atop: INTEGER
			-- CAIRO_OPERATOR_ATOP
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_ATOP"
		end

	cairo_operator_dest: INTEGER
			-- CAIRO_OPERATOR_DEST
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_DEST"
		end
	
	cairo_operator_dest_over: INTEGER
			-- CAIRO_OPERATOR_DEST_OVER
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_DEST_OVER"
		end

	cairo_operator_dest_in: INTEGER
			-- CAIRO_OPERATOR_DEST_IN
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_DEST_IN"
		end

	cairo_operator_dest_out: INTEGER
			-- CAIRO_OPERATOR_DEST_OUT
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_DEST_OUT"
		end

	cairo_operator_dest_atop: INTEGER
			-- CAIRO_OPERATOR_DEST_ATOP
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_DEST_ATOP"
		end

	cairo_operator_xor: INTEGER
			-- CAIRO_OPERATOR_XOR
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_XOR"
		end

	cairo_operator_add: INTEGER
			-- CAIRO_OPERATOR_ADD
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_ADD"
		end

	cairo_operator_saturate: INTEGER
			-- CAIRO_OPERATOR_SATURATE
		external "C macro use <pango.h>"
		alias "CAIRO_OPERATOR_SATURATE"
		end
end
