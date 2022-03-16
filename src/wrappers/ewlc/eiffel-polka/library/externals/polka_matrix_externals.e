note
	description: "Externals calls for POLKA_MATRIX"
	copyright: "[
					Copyright (C) 2001-2022: Natalia B. Bidart
					
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

deferred class POLKA_MATRIX_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	matrix_alloc (rows, columns, is_sorted: INTEGER): POINTER
		external "C use <polka/matrix.h>"
		end

	matrix_copy (other: POINTER): POINTER
		external "C use <polka/matrix.h>"
		end

	matrix_clear (handle: POINTER)
		external "C use <polka/matrix.h>"
		end

	matrix_print (handle: POINTER)
		external "C use <polka/matrix.h>"
		end

	matrix_free (handle: POINTER)
		external "C use <polka/matrix.h>"
		end

	matrix_get_nbrows (handle: POINTER): INTEGER
		external "C struct matrix_t access nbrows use <polka/matrix.h>"
		end

	matrix_get_nbcolumns (handle: POINTER): INTEGER
		external "C struct matrix_t access nbcolumns use <polka/matrix.h>"
		end

	matrix_get_p (handle: POINTER): POINTER
		external "C struct matrix_t access p use <polka/matrix.h>"
		end

	matrix_get_value (handle: POINTER; i, j: INTEGER): POINTER
		--do
		--	Result := (matrix_get_p (handle) + i) + j
		external "C inline use <polka/matrix.h>"
		alias "&(((matrix_t *)($handle))->p[($i)][($j)])"
		end

end -- class POLKA_MATRIX_EXTERNALS
