indexing
	description: "Generic operations on integers."
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

deferred class PKINT

		-- The generic type of coefficients in vectors and matrices.
		-- The naming scheme and the semantics of these operations comes
		-- from the GMP library.

		-- datatype: pkint_t
		--     typedef struct pkint_t {
		--       ACTUALTYPE rep;
		--     } pkint_t;

inherit
	NUMERIC
		undefine copy end
	COMPARABLE
		undefine copy end
	SHARED_C_STRUCT
		undefine is_equal
		redefine copy, from_external_pointer
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Creation

	from_external_pointer (a_ptr: POINTER) is
		do
			set_shared
			Precursor (a_ptr)
		end

feature {} -- Creation

	make is
			-- Initialize integer and set its value to 0.
		deferred
		ensure
			not is_shared
		end

	from_natural (a_natural: INTEGER) is
			-- Create an instance and set its value from `a_natural'.
		require
			a_natural >= 0
		do
			make
			set_from_natural (a_natural)
		ensure
			not is_shared
		end

	from_integer (an_integer: INTEGER) is
			-- Create an instance and set its value from `an_integer'.
		do
			make
			set_from_integer (an_integer)
		ensure
			not is_shared
		end

	from_string (a_string: STRING) is
			-- Create an instance and set its value from `a_string'.
		require
			a_string /= Void
			a_string.is_integer
		do
			make
			set_from_string (a_string)
		ensure
			not is_shared
		end

feature -- Creation

	copy (other: like Current) is
		do
			dispose
			if other.handle.is_not_null then
				make
				set_from_pkint (other)
			end
		ensure then
			not is_shared
		end

feature -- Operations

	set_from_pkint (other: like Current) is
			-- Set the value of Current from `other'.
		deferred
		end

	set_from_natural (a_natural: INTEGER) is
			-- Set the value of Current from `a_natural'.
		require
			a_natural >= 0
		deferred
		end

	set_from_integer (an_integer: INTEGER) is
			-- Set the value of Current from `an_integer'.
		deferred
		end

	set_from_string (a_string: STRING) is
			-- Put in integer the string representation in base 10 str
			-- of an integer.
		require
			a_string /= Void
			a_string.is_integer
		deferred
		end

feature -- Access

	to_natural: INTEGER_64 is
			-- Return the least significant part from integer.
		deferred
		ensure
			Result >= 0
		end

	to_integer: INTEGER is
			-- If integer fits into a signed long int return the value
			-- of integer. Otherwise return the least significant part of
			-- integer, with the same sign as integer.
			
			-- If integer is too large to fit in a signed long int, the
			-- returned result is probably not very useful. To find out if
			-- the value will fit, use the function pkint_fits_slong_p.
		deferred
		end

	to_string: STRING is
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
		deferred
		end

	digits: INTEGER is
			-- Return the size of integer measured in number of digits
			-- in base 10. The sign of integer is ignored. The result may
			-- be too big than the exact value.
			
			-- This function is useful in order to allocate the right
			-- amount of space before converting OP to a string. The right
			-- amount of allocation is normally two more than the value
			-- returned by pkint_sizeinbase10.
		deferred
		end

feature -- from NUMERIC

			-- void pkint_add (pkint_t rop, pkint_t op1, pkint_t op2)
			-- void pkint_sub (pkint_t rop, pkint_t op1, pkint_t op2)
			-- void pkint_mul (pkint_t rop, pkint_t op1, pkint_t op2)
			-- void pkint_neg (pkint_t rop, pkint_t op)
			-- int pkint_sgn (pkint_t integer)

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

			-- void pkint_divexact (pkint_t rop, pkint_t op1, pkint_t op2)
			-- Set rop to op1 / op2, assuming that op2 is a divisor of op1.

feature -- from COMPARABLE

			-- Compare op1 and op2. Return a positive value if op1 >
			-- op2, zero if op1 = op2, and a negative value if op1 < op2.

			-- int pkint_cmp (pkint_t op1, pkint_t op2)
			-- int pkint_cmp_ui (pkint_t op1, unsigned long int op2)
			-- int pkint_cmp_si (pkint_t op1, signed long int op2)

feature -- Identification

	is_pkint_mpz: BOOLEAN

	is_pkint_int64: BOOLEAN

feature -- Other

	print_to_stdout is
			-- Prints integer on the standard output.
		deferred
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "sizeof (pkint_t)"
		end

end -- class PKINT
