indexing
	description: "comlex number"
	copyright: "(C) 2006 "
	authors: "Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	
class GSL_COMPLEX_REAL_64

inherit GSL_COMPLEX_GENERAL[REAL_64]
	
create
	make_zero, make_rect, make_polar

feature -- creation
	make_zero is
			-- Create a complex number with value (0 + 0i)
		do
			make
			gsl_set_real(handle, 0)
			gsl_set_real(handle, 0)
		end

feature  -- Arithmetic operations

	add (other: like Current) is
			-- adds `other' to Current
		require
			other /= Void
		do
			gsl_complex_add(handle, handle, other.handle)
		end

	sub (other: like Current) is
			-- Subtract  `other' from Current
		do
			gsl_complex_sub(handle, handle, other.handle)
		end

feature {WRAPPER} -- externals
	size: INTEGER is
		external "C inline use <gsl/gsl_complex.h>"
		alias "sizeof(gsl_complex)"
		end
	
feature {} -- externals
	gsl_set_complex (ptr: POINTER; a, b: REAL_64)  is
		external "C macro signature (gsl_complex*, double, double) use <gsl/gsl_complex.h>"
		alias "GSL_SET_COMPLEX"
		end

	gsl_set_real(ptr: POINTER; a: REAL_64) is
		external "C macro signature (gsl_complex*, double) use <gsl/gsl_complex.h>"
		alias "GSL_SET_REAL"
		end

	gsl_set_imag(ptr: POINTER; b: REAL_64) is
		external "C macro signature (gsl_complex*, double) use <gsl/gsl_complex.h>"
		alias "GSL_SET_IMAG"
		end

	gsl_complex_polar(ptr: POINTER; r, theta: REAL_64) is
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "[
				 *(gsl_complex*)$ptr = gsl_complex_polar($r, $theta);

				 ]"
		end

	gsl_complex_add(dest, a, b: POINTER) is
		require
			valid_dest: dest.is_not_null
			valid_a: a.is_not_null
			valid_b: b.is_not_null
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "*(gsl_complex*)$dest = gsl_complex_add(*(gsl_complex*)$a, *(gsl_complex*)$b);"
		end

	gsl_complex_sub(dest, a, b: POINTER) is
		require
			valid_dest: dest.is_not_null
			valid_a: a.is_not_null
			valid_b: b.is_not_null
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "*(gsl_complex*)$dest = gsl_complex_sub(*(gsl_complex*)$a, *(gsl_complex*)$b);"
		end
	
end
