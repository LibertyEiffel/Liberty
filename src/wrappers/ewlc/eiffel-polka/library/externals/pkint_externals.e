note
	description: "Externals calls for PKINT"
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

deferred class PKINT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	pkint_init (handle: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_init ((pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_init_set (handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_init_set ((pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_init_set_ui (handle: POINTER; n: INTEGER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_init_set_ui ((pkint_t)(*(pkint_t*)($handle)), ($n)))"
		end

	pkint_init_set_si (handle: POINTER; i: INTEGER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_init_set_si ((pkint_t)(*(pkint_t*)($handle)), ($i)))"
		end

	pkint_clear (handle: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_clear ((pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_set (handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_set ((pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_set_ui (handle: POINTER; n: INTEGER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_set_ui ((pkint_t)(*(pkint_t*)($handle)), ($n)))"
		end

	pkint_set_si (handle: POINTER; i: INTEGER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_set_si ((pkint_t)(*(pkint_t*)($handle)), ($i)))"
		end

	pkint_add (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_add ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_sub (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_sub ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_neg (res, handle: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_neg ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_mul (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_mul ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_div (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_div ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_mod (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_mod ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_abs (res, handle: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_abs ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_gcd (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_gcd ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_divexact (res, handle, other: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_divexact ((pkint_t)(*(pkint_t*)($res)), (pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_sgn (handle: POINTER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_sgn ((pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_cmp (handle, other: POINTER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_cmp ((pkint_t)(*(pkint_t*)($handle)), (pkint_t)(*(pkint_t*)($other))))"
		end

	pkint_cmp_ui (handle: POINTER; n: INTEGER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_cmp_ui ((pkint_t)(*(pkint_t*)($handle)), ($n)))"
		end

	pkint_cmp_si (handle: POINTER; i: INTEGER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_cmp_si ((pkint_t)(*(pkint_t*)($handle)), ($i)))"
		end

	pkint_get_ui (handle: POINTER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_get_ui ((pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_get_si (handle: POINTER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_get_si ((pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_set_str10 (handle, str: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_set_str10 ((pkint_t)(*(pkint_t*)($handle)), ($str)))"
		end

	pkint_sizeinbase10 (handle: POINTER): INTEGER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_sizeinbase10 ((pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_get_str10 (str, handle: POINTER): POINTER is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_get_str10 (($str), (pkint_t)(*(pkint_t*)($handle))))"
		end

	pkint_print (handle: POINTER) is
		external "C inline use <polka/pkint.h>"
		alias "(pkint_print ((pkint_t)(*(pkint_t*)($handle))))"
		end

end -- class PKINT_EXTERNALS
