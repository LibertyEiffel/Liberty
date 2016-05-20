note
	description: "Externals calls for EQUATION"
	copyright: "[
					Copyright (C) 2001 Natalia B. Bidart
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

deferred class EQUATION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	equation_set_var (handle: POINTER; a_variable: INTEGER) is
		external "C struct equation_t set var use <polka/matrix.h>"
		end

	equation_set_expr (handle: POINTER; an_assignment: POINTER) is
		external "C struct equation_t set expr use <polka/matrix.h>"
		end

	equation_get_var (handle: POINTER): INTEGER is
		external "C struct equation_t access var use <polka/matrix.h>"
		end

	equation_get_expr (handle: POINTER): POINTER is
		external "C struct equation_t access expr use <polka/matrix.h>"
		end

end -- class EQUATION_EXTERNALS
