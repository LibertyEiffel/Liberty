indexing
	description: "Operations on Multi Precision integers."
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

class PKINT_MPZ

inherit
	PKINT
		redefine
			from_natural, from_integer, from_string, copy,
			is_pkint_mpz,
			infix ">", is_equal, dispose
		end

insert
	PKINT_MPZ_EXTERNALS

creation
	make, copy, from_natural, from_integer, from_string, from_external_pointer

feature {PKINT_MPZ} -- Internal

	rep : POINTER is
		do
			Result := mpz_rep (handle)
		end

feature {} -- Creation

	make is
		do
			allocate
			mpz_init (rep)
		end

	from_natural (a_natural: INTEGER) is
		do
			allocate
			mpz_init_set_ui (rep, a_natural)
		end

	from_integer (an_integer: INTEGER) is
		do
			allocate
			mpz_init_set_si (rep, an_integer)
		end

	from_string (a_string: STRING) is
		do
			allocate
			mpz_init_set_str (rep, a_string.to_external, 10)
		end

feature -- Operations

	copy (other: like Current) is
		do
			dispose
			if other.handle.is_not_null then
				allocate
				mpz_init_set (rep, other.rep)
			end
		end

	set_from_pkint (other: like Current) is
			-- Set the value of Current from `other'.
		do
			mpz_set (rep, other.rep)
		end

	set_from_natural (a_natural: INTEGER) is
		do
			mpz_set_ui (rep, a_natural)
		end

	set_from_integer (an_integer: INTEGER) is
			-- Set the value of Current from `an_integer'.
		do
			mpz_set_si (rep, an_integer)
		end

	set_from_string (a_string: STRING) is
		do
			mpz_set_str (rep, a_string.to_external, 10)
		end

feature -- Access

	to_natural: INTEGER_64 is
		do
			Result := mpz_get_ui (rep)
		end

	to_integer: INTEGER is
		do
			Result := mpz_get_si (rep)
		end

	to_string: STRING is
		do
			create Result.from_external (mpz_get_str (default_pointer, 10, rep))
		end

	digits: INTEGER is
		do
			Result := mpz_sizeinbase (rep, 10)
		end

feature -- from NUMERIC

	infix "+" (other: like Current): like Current is
		local
			tmp: like Current
		do
			mpz_add (tmp.rep, rep, other.rep)
			Result := tmp
		end

	infix "-" (other: like Current): like Current is
		local
			tmp: like Current
		do
			mpz_sub (tmp.rep, rep, other.rep)
			Result := tmp
		end

	infix "*" (other: like Current): like Current is
		local
			tmp: like Current
		do
			mpz_mul (tmp.rep, rep, other.rep)
			Result := tmp
		end

	infix "/" (other: like Current): NUMERIC is
		local
			tmp: like Current
		do
			mpz_divexact (tmp.rep, rep, other.rep)
			Result := tmp
		end

	prefix "+": like Current is
		do
			Result := Current
		end

	prefix "-": like Current is
		local
			tmp: like Current
		do
			mpz_neg (tmp.rep, rep)
			Result := tmp
		end

	divisible (other: like Current): BOOLEAN is
		local
			tmp: like Current
		do
			mpz_tdiv_r (tmp.rep, rep, other.rep)
			Result := tmp.is_equal (zero)
		end

	one: like Current is
		do
			create Result.from_integer (1)
		end

	zero: like Current is
		do
			create Result.from_integer (0)
		end

	sign: INTEGER_8 is
		do
			Result := mpz_sgn (rep).to_integer_8
		end

feature -- from COMPARABLE

	is_equal (other: like Current): BOOLEAN is
		do
			Result := mpz_cmp (rep, other.rep) = 0
		end

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := mpz_cmp (rep, other.rep) < 0
		end

	infix ">" (other: like Current): BOOLEAN is
			-- Compare op1 and op2. Return a positive value if op1 >
			-- op2, zero if op1 = op2, and a negative value if op1 < op2.
		do
			Result := mpz_cmp (rep, other.rep) > 0
		end

feature -- from HASHABLE

	hash_code: INTEGER is
		do
			Result := to_integer
		end

feature -- Identification

	is_pkint_mpz: BOOLEAN is True

feature -- Other

	print_to_stdout is
			-- Prints integer on the standard output.
		do
			crash
		end

feature {} -- Destruction

	dispose is
			-- Free the space possibly used by integer. Make sure to
			-- call this function for all pkint_t variables when you are
			-- done with them.
		do
			if not is_shared then mpz_clear (rep) end
			Precursor
		end

end -- class PKINT_MPZ
