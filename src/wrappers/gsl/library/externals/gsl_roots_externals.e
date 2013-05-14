-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ROOTS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_root_fdfsolver_alloc (a_t: POINTER): POINTER is
 		-- gsl_root_fdfsolver_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_alloc"
		}"
		end

	gsl_root_fdfsolver_free (a_s: POINTER) is
 		-- gsl_root_fdfsolver_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_free"
		}"
		end

	gsl_root_fdfsolver_iterate (a_s: POINTER): INTEGER is
 		-- gsl_root_fdfsolver_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_iterate"
		}"
		end

	gsl_root_fdfsolver_name (a_s: POINTER): POINTER is
 		-- gsl_root_fdfsolver_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_name"
		}"
		end

	gsl_root_fdfsolver_newton: POINTER is
 		-- gsl_root_fdfsolver_newton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_newton"
		}"
		end

	address_of_gsl_root_fdfsolver_newton: POINTER is
 		-- Address of gsl_root_fdfsolver_newton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_root_fdfsolver_newton"
		}"
		end

	set_gsl_root_fdfsolver_newton (a_value: POINTER) is
		-- Set variable gsl_root_fdfsolver_newton value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_root_fdfsolver_newton"
		}"
		end

	gsl_root_fdfsolver_root (a_s: POINTER): REAL is
 		-- gsl_root_fdfsolver_root
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_root"
		}"
		end

	gsl_root_fdfsolver_secant: POINTER is
 		-- gsl_root_fdfsolver_secant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_secant"
		}"
		end

	address_of_gsl_root_fdfsolver_secant: POINTER is
 		-- Address of gsl_root_fdfsolver_secant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_root_fdfsolver_secant"
		}"
		end

	set_gsl_root_fdfsolver_secant (a_value: POINTER) is
		-- Set variable gsl_root_fdfsolver_secant value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_root_fdfsolver_secant"
		}"
		end

	gsl_root_fdfsolver_set (a_s: POINTER; a_fdf: POINTER; a_root: REAL): INTEGER is
 		-- gsl_root_fdfsolver_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_set"
		}"
		end

	gsl_root_fdfsolver_steffenson: POINTER is
 		-- gsl_root_fdfsolver_steffenson
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fdfsolver_steffenson"
		}"
		end

	address_of_gsl_root_fdfsolver_steffenson: POINTER is
 		-- Address of gsl_root_fdfsolver_steffenson
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_root_fdfsolver_steffenson"
		}"
		end

	set_gsl_root_fdfsolver_steffenson (a_value: POINTER) is
		-- Set variable gsl_root_fdfsolver_steffenson value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_root_fdfsolver_steffenson"
		}"
		end

	gsl_root_fsolver_alloc (a_t: POINTER): POINTER is
 		-- gsl_root_fsolver_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_alloc"
		}"
		end

	gsl_root_fsolver_bisection: POINTER is
 		-- gsl_root_fsolver_bisection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_bisection"
		}"
		end

	address_of_gsl_root_fsolver_bisection: POINTER is
 		-- Address of gsl_root_fsolver_bisection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_root_fsolver_bisection"
		}"
		end

	set_gsl_root_fsolver_bisection (a_value: POINTER) is
		-- Set variable gsl_root_fsolver_bisection value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_root_fsolver_bisection"
		}"
		end

	gsl_root_fsolver_brent: POINTER is
 		-- gsl_root_fsolver_brent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_brent"
		}"
		end

	address_of_gsl_root_fsolver_brent: POINTER is
 		-- Address of gsl_root_fsolver_brent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_root_fsolver_brent"
		}"
		end

	set_gsl_root_fsolver_brent (a_value: POINTER) is
		-- Set variable gsl_root_fsolver_brent value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_root_fsolver_brent"
		}"
		end

	gsl_root_fsolver_falsepos: POINTER is
 		-- gsl_root_fsolver_falsepos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_falsepos"
		}"
		end

	address_of_gsl_root_fsolver_falsepos: POINTER is
 		-- Address of gsl_root_fsolver_falsepos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_root_fsolver_falsepos"
		}"
		end

	set_gsl_root_fsolver_falsepos (a_value: POINTER) is
		-- Set variable gsl_root_fsolver_falsepos value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_root_fsolver_falsepos"
		}"
		end

	gsl_root_fsolver_free (a_s: POINTER) is
 		-- gsl_root_fsolver_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_free"
		}"
		end

	gsl_root_fsolver_iterate (a_s: POINTER): INTEGER is
 		-- gsl_root_fsolver_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_iterate"
		}"
		end

	gsl_root_fsolver_name (a_s: POINTER): POINTER is
 		-- gsl_root_fsolver_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_name"
		}"
		end

	gsl_root_fsolver_root (a_s: POINTER): REAL is
 		-- gsl_root_fsolver_root
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_root"
		}"
		end

	gsl_root_fsolver_set (a_s: POINTER; a_f: POINTER; a_x_lower: REAL; a_x_upper: REAL): INTEGER is
 		-- gsl_root_fsolver_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_set"
		}"
		end

	gsl_root_fsolver_x_lower (a_s: POINTER): REAL is
 		-- gsl_root_fsolver_x_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_x_lower"
		}"
		end

	gsl_root_fsolver_x_upper (a_s: POINTER): REAL is
 		-- gsl_root_fsolver_x_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_x_upper"
		}"
		end

	gsl_root_test_delta (a_x1: REAL; a_x0: REAL; an_epsabs: REAL; an_epsrel: REAL): INTEGER is
 		-- gsl_root_test_delta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_test_delta"
		}"
		end

	gsl_root_test_interval (a_x_lower: REAL; a_x_upper: REAL; an_epsabs: REAL; an_epsrel: REAL): INTEGER is
 		-- gsl_root_test_interval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_test_interval"
		}"
		end

	gsl_root_test_residual (a_f: REAL; an_epsabs: REAL): INTEGER is
 		-- gsl_root_test_residual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_test_residual"
		}"
		end


end -- class GSL_ROOTS_EXTERNALS
