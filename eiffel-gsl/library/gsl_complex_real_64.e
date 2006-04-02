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
	make_rect, make_polar

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
	
end
