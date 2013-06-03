-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SYS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_acosh (a_x: REAL): REAL is
 		-- gsl_acosh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_acosh"
		}"
		end

	gsl_asinh (a_x: REAL): REAL is
 		-- gsl_asinh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_asinh"
		}"
		end

	gsl_atanh (a_x: REAL): REAL is
 		-- gsl_atanh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_atanh"
		}"
		end

	gsl_coerce_double (a_x: REAL): REAL is
 		-- gsl_coerce_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_coerce_double"
		}"
		end

	gsl_coerce_float (a_x: REAL_32): REAL_32 is
 		-- gsl_coerce_float
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_coerce_float"
		}"
		end

	gsl_coerce_long_double (a_x: REAL_EXTENDED): REAL_EXTENDED is
 		-- gsl_coerce_long_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_coerce_long_double"
		}"
		end

	gsl_expm1 (a_x: REAL): REAL is
 		-- gsl_expm1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_expm1"
		}"
		end

	gsl_fcmp (a_x1: REAL; a_x2: REAL; an_epsilon: REAL): INTEGER is
 		-- gsl_fcmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fcmp"
		}"
		end

	gsl_fdiv (a_x: REAL; a_y: REAL): REAL is
 		-- gsl_fdiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fdiv"
		}"
		end

	gsl_finite (a_x: REAL): INTEGER is
 		-- gsl_finite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_finite"
		}"
		end

	gsl_frexp (a_x: REAL; an_e: POINTER): REAL is
 		-- gsl_frexp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_frexp"
		}"
		end

	gsl_hypot (a_x: REAL; a_y: REAL): REAL is
 		-- gsl_hypot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_hypot"
		}"
		end

	gsl_hypot3 (a_x: REAL; a_y: REAL; a_z: REAL): REAL is
 		-- gsl_hypot3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_hypot3"
		}"
		end

	gsl_isinf (a_x: REAL): INTEGER is
 		-- gsl_isinf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_isinf"
		}"
		end

	gsl_isnan (a_x: REAL): INTEGER is
 		-- gsl_isnan
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_isnan"
		}"
		end

	gsl_ldexp (a_x: REAL; an_e: INTEGER): REAL is
 		-- gsl_ldexp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ldexp"
		}"
		end

	gsl_log1p (a_x: REAL): REAL is
 		-- gsl_log1p
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_log1p"
		}"
		end

	gsl_nan: REAL is
 		-- gsl_nan
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_nan()"
		}"
		end

	gsl_neginf: REAL is
 		-- gsl_neginf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_neginf()"
		}"
		end

	gsl_posinf: REAL is
 		-- gsl_posinf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_posinf()"
		}"
		end


end -- class GSL_SYS_EXTERNALS
