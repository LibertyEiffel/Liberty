indexing
	description: "Externals calls for PKINT implemented with GMP"
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

deferred class PKINT_MPZ_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	mpz_rep (a_handle: POINTER): POINTER is
		external "C struct pkint_t access rep use <polka/pkint.h>"
		end

	mpz_init (rep: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_init_set (tmp, rep: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_init_set_ui (rep: POINTER; a_natural: INTEGER) is
		external "C use <gmp.h>"
		end

	mpz_init_set_si (rep: POINTER; an_integer: INTEGER) is
		external "C use <gmp.h>"
		end

	mpz_init_set_str (rep, a_string: POINTER; a_base: INTEGER) is
		external "C use <gmp.h>"
		end

	mpz_clear (rep: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_set (tmp, rep: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_set_ui (rep: POINTER; a_natural: INTEGER) is
		external "C use <gmp.h>"
		end

	mpz_set_si (rep: POINTER; an_integer: INTEGER) is
		external "C use <gmp.h>"
		end

	mpz_add (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_sub (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_neg (tmp, rep: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_mul (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_tdiv_q (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_tdiv_r (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_abs (tmp, rep: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_gcd (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_divexact (tmp, rep, other: POINTER) is
		external "C use <gmp.h>"
		end

	mpz_sgn (rep: POINTER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_cmp (rep1, rep2: POINTER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_cmp_ui (rep: POINTER; a_natural: INTEGER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_cmp_si (rep: POINTER; an_integer: INTEGER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_get_ui (rep: POINTER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_get_si (rep: POINTER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_set_str (rep, a_string: POINTER; a_base: INTEGER) is
		external "C use <gmp.h>"
		end

	mpz_sizeinbase (rep: POINTER; a_base: INTEGER): INTEGER is
		external "C use <gmp.h>"
		end

	mpz_get_str (str: POINTER; a_base: INTEGER; rep: POINTER): POINTER is
		external "C use <gmp.h>"
		end

end -- class PKINT_MPZ_EXTERNALS
