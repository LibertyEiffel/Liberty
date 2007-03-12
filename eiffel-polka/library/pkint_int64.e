indexing
	description: "Operations on 64 bit integers."
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

class PKINT_INT64

inherit
	PKINT
		redefine is_pkint_int64 end

creation
	make, copy, from_natural, from_integer, from_string, from_external_pointer

feature {} -- Internal

	int64_rep (a_handle: POINTER): INTEGER_64 is
		external "C struct pkint_t access rep use <polka/pkint.h>"
		end

	int64_set_rep (a_handle: POINTER; a_value: like rep) is
		external "C struct pkint_t set rep use <polka/pkint.h>"
		end

feature {PKINT_INT64} -- Internal

	rep: INTEGER_64 is
		do
			Result := int64_rep (handle)
		end

	set_rep (an_integer_64: INTEGER_64) is
		do
			int64_set_rep (handle, an_integer_64)
		ensure
			rep = an_integer_64
		end

feature {} -- Creation

	make is
		do
			allocate
		end

feature -- Operations

	set_from_pkint (other: like Current) is
			-- Set the value of Current from `other'.
		do
			set_rep (other.rep)
		end

	set_from_natural (a_natural: INTEGER) is
		do
			set_rep (a_natural.to_integer_64)
		end

	set_from_integer (an_integer: INTEGER) is
			-- Set the value of Current from `an_integer'.
		do
			set_rep (an_integer.to_integer_64)
		end

	set_from_string (a_string: STRING) is
		do
			set_rep (a_string.to_integer_64)
		end

feature -- Access

	to_natural: INTEGER_64 is
		do
			Result := rep
		end

	to_integer: INTEGER is
		do
			Result := rep.to_integer_32
		end

	to_string: STRING is
		do
			Result := rep.to_string
		end

	digits: INTEGER is
		do
			Result := to_string.count
		end

feature -- from NUMERIC

	infix "+" (other: like Current): like Current is
		do
			create Result.make
			Result.set_rep (rep + other.rep)
		end

	infix "-" (other: like Current): like Current is
		do
			create Result.make
			Result.set_rep (rep - other.rep)
		end

	infix "*" (other: like Current): like Current is
		do
			create Result.make
			Result.set_rep (rep * other.rep)
		end

	infix "/" (other: like Current): NUMERIC is
		do
			--Result := rep / other.rep
			crash
		end

	prefix "+": like Current is
		do
			create Result.make
			Result.set_rep (+ rep)
		end

	prefix "-": like Current is
		do
			create Result.make
			Result.set_rep (- rep)
		end

	divisible (other: like Current): BOOLEAN is
		do
			Result := rep.divisible (other.rep)
		end

	one: like Current is
		do
			create Result.make
			Result.set_rep (rep.one)
		end

	zero: like Current is
		do
			create Result.make
			Result.set_rep (rep.zero)
		end

	sign: INTEGER_8 is
		do
			Result := rep.sign
		end

feature -- from COMPARABLE

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := rep < other.rep
		end

feature -- from HASHABLE

	hash_code: INTEGER is
		do
			Result := rep.hash_code
		end

feature -- Identification

	is_pkint_int64: BOOLEAN is True

feature -- Other

	print_to_stdout is
			-- Prints integer on the standard output.
		do
			crash
		end

end -- class PKINT_INT64
