note
	description: "Operations on Polka's matrices"
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

class POLKA_MATRIX

		-- A matrix is represented by a structure whose elements
		-- prefixed by _ should be considered as private. You access to the
		-- element of row i and column j of the matrix matrix_t* mat with
		-- the expression mat->p[i][j], whereas the vector (of type
		-- vector_t) corresponding to the row i is accessed with mat->p[i].
		-- mat->nbrows and mat->nbcolumns gives you the actual number of
		-- rows and columns (the used part), on which ordinary functions
		-- operates, but space is allocated for up to mat->_maxrows rows.
		-- 
		-- For information, it is defined as follows:
		--  
		-- 
		-- typedef struct matrix_t {
		--   /* public part */
		--   pkint_t** p;     /* array of pointers to rows */
		--   int nbrows;      /* number of effective rows */
		--   int nbcolumns;   /* size of rows */
		-- 
		--   /* private part */
		--   pkint_t* _pinit;  /* array of coefficients */
		--   int  _maxrows;   /* number of rows allocated */
		--   bool _sorted;
		-- } matrix_t;

inherit
	C_STRUCT
      undefine
         from_external_pointer
      redefine
         copy,
         free_handle
		end
   GLOBALLY_CACHED

insert
	POLKA_MATRIX_EXTERNALS   

create {ANY} make, copy, copy_from_pointer

feature {} -- Creation

	make (n_rows, n_cols: INTEGER; is_sorted: BOOLEAN)
			-- Allocates a new matrix with `rows' rows and `columns' columns
			-- and sets all elements to zero. `is_sorted' indicates if once
			-- filled the matrix should be considered as already sorted or not,
			-- according to the lexicographic order.
			
			-- If either `rows' or `columns' is zero, the matrix is said
			-- to be degenerated and no space is allocated for coefficients
			-- (fields p and _pinit of the matrix are null). Only functions
			-- of this paragraph handle correctly such matrices (this
			-- happens to be useful, for instance when interfacing with
			-- OCAML language).
		do
			from_external_pointer (matrix_alloc (n_rows, n_cols, is_sorted.to_integer))
		end

feature {ANY} -- Operations

	copy_from_pointer (other_ptr: POINTER)
			-- Return a new matrix copy of `other_ptr'.
		require
			other_ptr.is_not_null
		do
			from_external_pointer (matrix_copy (other_ptr))
		end

	copy (other: like Current)
			-- Return a copy of `other'. The new matrix is dimensionned
			-- from the active part of `other'.
		do
			dispose
			if other.handle.is_not_null then
				copy_from_pointer (other.handle)
			end
		end

	clear
			-- Sets to zeros the active coefficients of Current.
		do
			matrix_clear (handle)
		end

	print_to_stdout
			-- Prints the Current matrix.
		do
			matrix_print (handle)
		end

	set (i, j: INTEGER; value: PKINT)
		require
			i.in_range (0, rows-1)
			j.in_range (0, columns-1)
			value /= Void
		do
			at (i, j).set_from_pkint (value)
		end

feature {ANY} -- Access

	rows: INTEGER
		do
			Result := matrix_get_nbrows (handle)
		ensure
			Result >= 0
		end

	columns: INTEGER
		do
			Result := matrix_get_nbcolumns (handle)
		ensure
			Result >= 0
		end

	at (i, j: INTEGER): PKINT
		require
			i.in_range (0, rows-1)
			j.in_range (0, columns-1)
		local
			c_ptr: POINTER
		do
			c_ptr := matrix_get_value (handle, i, j)
			if wrappers.has (c_ptr) then
				Result ::= wrappers.at (c_ptr)
			else
				create Result.from_external_pointer (c_ptr)
			end
		ensure
			Result /= Void
		end

feature {WRAPPER_HANDLER} -- Destruction
	free_handle
			-- release the external memory
		do
			matrix_free (handle)
		end


feature {} -- size

	struct_size: INTEGER
		external "C inline use <polka/matrix.h>"
		alias "sizeof (matrix_t)"
		end

end -- class POLKA_MATRIX
