indexing
	description: "complex number"
	copyright: "(C) 2006 "
	authors: "Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
         -- TODO: pluginize
   
class GSL_COMPLEX_REAL_64

inherit GSL_COMPLEX_GENERAL[REAL_64]

insert MATH_CONSTANTS
		undefine
			copy,
			is_equal,
			out
		end
	
create
	make_zero, make_rect, make_polar

feature -- creation
	make_zero is
			-- Create a complex number with value (0 + 0i)
		do
			allocate
			gsl_set_real(handle, 0)
			gsl_set_real(handle, 0)
		end

feature -- Properties
	arg: REAL_64 is
			-- arg(`Current`)
			-- gsl tells that: -pi < Result <= +pi
		do
			Result := gsl_complex_arg(handle)
		ensure
			-- TODO: check this
			in_range_neg: - Pi < Result
			in_range_pos: Result <= Pi
		end

	abs: REAL_64 is
			-- |Current|
		do
			Result := gsl_complex_abs(handle)
		ensure
			positive: Result >= 0
		end

	abs2: REAL_64 is
			-- |Current|^2
		do
			Result := gsl_complex_abs2(handle)
		ensure
			positive: Result >= 0
		end

	logabs: REAL_64 is
			-- log|Current| (logarithmus naturalis)
		do
			Result := gsl_complex_logabs(handle)
		ensure
			positive: Result >= 0
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

feature {WRAPPER, WRAPPER_HANDLER} -- externals
	struct_size: INTEGER is
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


	
	gsl_complex_arg(z: POINTER): REAL_64 is
		require
			valid_z: z.is_not_null
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "gsl_complex_arg(*(gsl_complex*)$z)"
		end

	gsl_complex_abs(z: POINTER): REAL_64 is
		require
			valid_z: z.is_not_null
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "gsl_complex_abs(*(gsl_complex*)$z)"
		end

	gsl_complex_abs2(z: POINTER): REAL_64 is
		require
			valid_z: z.is_not_null
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "gsl_complex_abs2(*(gsl_complex*)$z)"
		end

	gsl_complex_logabs(z: POINTER): REAL_64 is
		require
			valid_z: z.is_not_null
		external "C inline use <gsl/gsl_complex_math.h>"
		alias "gsl_complex_logabs(*(gsl_complex*)$z)"
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
