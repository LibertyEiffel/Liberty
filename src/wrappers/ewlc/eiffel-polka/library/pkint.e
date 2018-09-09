note
	description: "Generic operations on integers."
	copyright: "[
					Copyright (C) 2001-2018: Natalia B. Bidart
					
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

class PKINT

		-- The generic type of coefficients in vectors and matrices.
		-- The naming scheme and the semantics of these operations comes
		-- from the GMP library.

		-- datatype: pkint_t
		--     typedef struct pkint_t {
		--       ACTUALTYPE rep;
		--     } pkint_t;

inherit
	NUMERIC
		undefine
         copy
      end
   
	COMPARABLE
		undefine
         copy
		redefine
         is_equal, infix ">"
		end
   
	C_STRUCT
		undefine
         is_equal,
         from_external_pointer
		redefine
         copy,
         free_handle
		end
   
   GLOBALLY_CACHED
		redefine
         from_external_pointer
      end
   
insert
	PKINT_EXTERNALS

create {ANY} make, copy, from_natural, from_integer, from_string, from_external_pointer

feature {WRAPPER, WRAPPER_HANDLER} -- Creation

	from_external_pointer (a_ptr: POINTER)
		do
			Precursor (a_ptr)
		end

feature {} -- Creation

	make
			-- Initialize integer and set its value to 0.
		do
			allocate
			pkint_init (handle)
		end

	from_natural (a_natural: INTEGER)
			-- Create an instance and set its value from `a_natural'.
		require
			a_natural >= 0
		do
			allocate
			pkint_init_set_ui (handle, a_natural)
		end

	from_integer (an_integer: INTEGER)
			-- Create an instance and set its value from `an_integer'.
		do
			allocate
			pkint_init_set_si (handle, an_integer)
		end

	from_string (a_string: STRING)
			-- Create an instance and set its value from `a_string'.
		require
			a_string /= Void
			a_string.is_integer
		do
			allocate
			from_integer (a_string.to_integer)
		end

feature {ANY} -- Creation

	copy (other: like Current)
		do
			dispose
			if other.handle.is_not_null then
				allocate
				pkint_init_set (handle, other.handle)
			end
		end

feature {ANY} -- Operations

	set_from_pkint (other: like Current)
			-- Set the value of Current from `other'.
		do
			if other.handle.is_not_null then
				pkint_set (handle, other.handle)
			end
		end

	set_from_natural (a_natural: INTEGER)
			-- Set the value of Current from `a_natural'.
		require
			a_natural >= 0
		do
			pkint_set_ui (handle, a_natural)
		end

	set_from_integer (an_integer: INTEGER)
			-- Set the value of Current from `an_integer'.
		do
			pkint_set_si (handle, an_integer)
		end

	set_from_string (a_string: STRING)
			-- Put in integer the string representation in base 10 str
			-- of an integer.
		require
			a_string /= Void
			a_string.is_integer
		do
			pkint_set_str10 (handle, a_string.to_external)
		end

feature {ANY} -- Access

	to_natural: INTEGER_64
			-- Return the least significant part from integer.
		do
			Result := pkint_get_ui (handle)
		ensure
			Result >= 0
		end

	to_integer: INTEGER
			-- If integer fits into a signed long int return the value
			-- of integer. Otherwise return the least significant part of
			-- integer, with the same sign as integer.
			
			-- If integer is too large to fit in a signed long int, the
			-- returned result is probably not very useful. To find out if
			-- the value will fit, use the function pkint_fits_slong_p.
		do
			Result := pkint_get_si (handle)
		end

	to_string: STRING
			-- Convert integer to a string of digits in base 10.
			
			-- If str is NULL, the result string is allocated using
			-- malloc. The block will be strlen(str)+1 bytes, that being
			-- exactly enough for the string and null-terminator.
			
			-- If str is not NULL, it should point to a block of storage
			-- large enough for the result, that being
			-- pkint_sizeinbase10(integer) + 2. The two extra bytes are for
			-- a possible minus sign, and the null-terminator.
			
			-- A pointer to the result string is returned, being either
			-- the allocated block, or the given str.
		do
			create Result.from_external (pkint_get_str10 (default_pointer, handle))
		end

	digits: INTEGER
			-- Return the size of integer measured in number of digits
			-- in base 10. The sign of integer is ignored. The result may
			-- be too big than the exact value.
			
			-- This function is useful in order to allocate the right
			-- amount of space before converting OP to a string. The right
			-- amount of allocation is normally two more than the value
			-- returned by pkint_sizeinbase10.
		do
			
		end

feature {ANY} -- from HASHABLE

	hash_code: INTEGER
		do
			Result := to_integer
		end

feature {ANY} -- from NUMERIC

	infix "+" (other: like Current): like Current
		do
			create Result.make
			pkint_add (Result.handle, handle, other.handle)
		end

	infix "-" (other: like Current): like Current
		do
			create Result.make
			pkint_sub (Result.handle, handle, other.handle)
		end

	infix "*" (other: like Current): like Current
		do
			create Result.make
			pkint_mul (Result.handle, handle, other.handle)
		end

	infix "/" (other: like Current): NUMERIC
		local
			tmp: PKINT
		do
			create tmp.make
			pkint_divexact (tmp.handle, handle, other.handle)
			Result := tmp
		end

	prefix "+": like Current
		do
			Result := Current
		end

	prefix "-": like Current
		do
			create Result.make
			pkint_neg (Result.handle, handle)
		end

	divisible (other: like Current): BOOLEAN
		local
			tmp: like Current
		do
			create tmp.make
			pkint_div (tmp.handle, handle, other.handle)
			Result := tmp.is_equal (zero)
		end

	one: like Current
		do
			create Result.from_integer (1)
		end

	zero: like Current
		do
			create Result.from_integer (0)
		end

	sign: INTEGER_8
		do
			Result := pkint_sgn (handle).to_integer_8
		end

			-- void pkint_addmul (pkint_t rop, pkint_t op1, pkint_t op2)
			-- Set rop to rop + op1 * op2.

			-- void pkint_submul (pkint_t rop, pkint_t op1, pkint_t op2)
			-- Set rop to rop - op1 * op2.

			-- void pkint_div (pkint_t rop, pkint_t op1, pkint_t op2)
			-- Set rop to op1 / op2.

			-- void pkint_mod (pkint_t rop, pkint_t op1, pkint_t op2)
			-- Set rop to op1 modulo op2.

			-- void pkint_abs (pkint_t rop, pkint_t op)
			-- Set rop to the absolute value of op.

			-- void pkint_gcd (pkint_t rop, pkint_t op1, pkint_t op2)
			-- Set rop to Greatest Common Divisor of op1 and op2.

			-- void pkint_sizeinbase10 (pkint_t integer)
			-- Return the size of integer measured in number of digits in base 10. The
			-- sign of integer is ignored. The result may be too big than the exact
			-- value.
			-- 
			-- This function is useful in order to allocate the right amount of space
			-- before converting OP to a string. The right amount of allocation is
			-- normally two more than the value returned by pkint_sizeinbase10

feature {ANY} -- from COMPARABLE

	is_equal (other: like Current): BOOLEAN
		do
			Result := pkint_cmp (handle, other.handle) = 0
		end

	infix "<" (other: like Current): BOOLEAN
		do
			Result := pkint_cmp (handle, other.handle) < 0
		end

	infix ">" (other: like Current): BOOLEAN
			-- Compare op1 and op2. Return a positive value if op1 >
			-- op2, zero if op1 = op2, and a negative value if op1 < op2.
		do
			Result := pkint_cmp (handle, other.handle) > 0
		end

	compare_to_natural (a_natural: INTEGER): INTEGER
			-- Compare op1 and op2. Return a positive value if op1 >
			-- op2, zero if op1 = op2, and a negative value if op1 < op2.
		require
			a_natural >= 0
		do
			Result := pkint_cmp_ui (handle, a_natural)
		end

	compare_to_integer (an_integer: INTEGER): INTEGER
			-- Compare op1 and op2. Return a positive value if op1 >
			-- op2, zero if op1 = op2, and a negative value if op1 < op2.
		do
			Result := pkint_cmp_ui (handle, an_integer)
		end

feature {ANY} -- Other

	print_to_stdout
			-- Prints integer on the standard output.
		do
			pkint_print (handle)
		end

feature {WRAPPER_HANDLER} -- Destruction
	free_handle
			-- release the external memory
		do
         pkint_clear (handle)
		end

feature {} -- size

	struct_size: INTEGER
		external "C inline use <polka/pkint.h>"
		alias "sizeof (pkint_t)"
		end

end -- class PKINT
