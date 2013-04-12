indexing
	description: "complex number"
	copyright: "(C) 2006 - 2008"
	authors: "Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
         -- TODO: pluginize
   
expanded class GSL_COMPLEX_REAL_64

external "plug_in"
alias "{
   location: "externals"
	module_name: "plugin"
	type_name: "gsl_complex"
	default_value: "gsl_complex_zero"
	}"

-- inherit GSL_COMPLEX_GENERAL[REAL_64]

insert MATH_CONSTANTS
		undefine
			copy,
			is_equal,
			out
		end
	
feature {ANY}
	make_zero is
			-- Create a complex number with value (0 + 0i)
		do
			gsl_set_real(Current, 0)
			gsl_set_imag(Current, 0)
		end

	make_polar(r, theta: REAL_64) is
			-- Create complex with value (r * e^(i * theta))
		do
			gsl_complex_polar(Current, r, theta)
		end

	make_rect(a, b: REAL_64) is
			-- Create complex with value (a+bi)
		do
			gsl_complex_rect(Current, a, b)
		end

feature {ANY} -- value
   set_real(i: REAL_64) is
      do
         gsl_set_real(Current, i)
      ensure
         True
      end
   
   real: REAL_64 is
      do
         Result := gsl_real(Current)
      end
   
   set_imag(i: REAL_64) is
      do
         gsl_set_imag(Current, i)
      ensure
         True
      end
   
   imag: REAL_64 is
      do
         Result := gsl_imag(Current)
      end
   
feature {ANY} -- Properties
	arg: REAL_64 is
			-- arg(`Current`)
			-- gsl tells that: -pi < Result <= +pi
		do
			Result := gsl_complex_arg(Current)
		ensure
			-- TODO: check this
			in_range_neg: - Pi < Result
			in_range_pos: Result <= Pi
		end

	abs: REAL_64 is
			-- |Current|
		do
			Result := gsl_complex_abs(Current)
		ensure
			positive: Result >= 0
		end

	abs2: REAL_64 is
			-- |Current|^2
		do
			Result := gsl_complex_abs2(Current)
		ensure
			positive: Result >= 0
		end

	logabs: REAL_64 is
			-- log|Current| (logarithmus naturalis)
		do
			Result := gsl_complex_logabs(Current)
		ensure
			positive: Result >= 0
		end

	
feature {ANY}  -- Arithmetic operations

	add (other: like Current) is
			-- adds `other' to Current
		do
			gsl_complex_add(Current, other, Current)
		end

	sub (other: like Current) is
			-- Subtract  `other' from Current
		do
			gsl_complex_sub(Current, other, Current)
		end

   infix "-" (other: like Current): like Current is
         -- Current - other
      do
         gsl_complex_sub(Current, other, Result)
      end

   infix "+" (other: like Current): like Current is
         -- Current - other
      do
         gsl_complex_add(Current, other, Result)
      end

feature {ANY}
	is_equal(other: like Current): BOOLEAN is
		do
			Result := real = other.real and imag = other.imag
		end

   copy(other: like Current) is
		do
         make_rect(other.real, other.imag)
      end
   
   out: STRING is
      do
         Result := real.out + "+" + imag.out + "i"
      end
   
feature {} -- externals
	gsl_complex_rect(c: like Current; a, b: REAL_64) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_rect_wrapper"
		}"
		end

	gsl_complex_polar(c: like Current; r, theta: REAL_64) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_polar_wrapper"
		}"
		end

	gsl_set_real(c: like Current; a: REAL_64) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "GSL_SET_REAL_W"
		}"
		end

	gsl_set_imag(c: like Current; b: REAL_64) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "GSL_SET_IMAG_W"
		}"
		end

	gsl_imag(c: like Current): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "GSL_IMAG"
		}"
		end

	gsl_real(c: like Current): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "GSL_REAL"
		}"
		end

 	gsl_complex_arg(c: like Current): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_arg_wrapper"
		}"
		end

 	gsl_complex_abs(c: like Current): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_abs_wrapper"
		}"
		end

 	gsl_complex_abs2(c: like Current): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_abs2_wrapper"
		}"
		end

 	gsl_complex_logabs(c: like Current): REAL_64 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_logabs_wrapper"
		}"
		end

	
 	gsl_complex_add(a, b, c: like Current) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_add_wrapper"
		}"
		end

 	gsl_complex_sub(a, b, c: like Current) is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "gsl_complex_sub_wrapper"
		}"
		end

end
