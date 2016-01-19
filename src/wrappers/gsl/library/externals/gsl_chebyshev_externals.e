-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_CHEBYSHEV_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_cheb_alloc (an_order: like size_t): POINTER is
 		-- gsl_cheb_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_alloc"
		}"
		end

	gsl_cheb_calc_deriv (a_deriv: POINTER; a_cs: POINTER): INTEGER is
 		-- gsl_cheb_calc_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_calc_deriv"
		}"
		end

	gsl_cheb_calc_integ (an_integ: POINTER; a_cs: POINTER): INTEGER is
 		-- gsl_cheb_calc_integ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_calc_integ"
		}"
		end

	gsl_cheb_coeffs (a_cs: POINTER): POINTER is
 		-- gsl_cheb_coeffs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_coeffs"
		}"
		end

	gsl_cheb_eval (a_cs: POINTER; a_x: REAL): REAL is
 		-- gsl_cheb_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_eval"
		}"
		end

	gsl_cheb_eval_err (a_cs: POINTER; a_x: REAL; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_cheb_eval_err
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_eval_err"
		}"
		end

	gsl_cheb_eval_mode (a_cs: POINTER; a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_cheb_eval_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_eval_mode"
		}"
		end

	gsl_cheb_eval_mode_e (a_cs: POINTER; a_x: REAL; a_mode: NATURAL; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_cheb_eval_mode_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_eval_mode_e"
		}"
		end

	gsl_cheb_eval_n (a_cs: POINTER; an_order: like size_t; a_x: REAL): REAL is
 		-- gsl_cheb_eval_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_eval_n"
		}"
		end

	gsl_cheb_eval_n_err (a_cs: POINTER; an_order: like size_t; a_x: REAL; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_cheb_eval_n_err
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_eval_n_err"
		}"
		end

	gsl_cheb_free (a_cs: POINTER) is
 		-- gsl_cheb_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_free"
		}"
		end

	gsl_cheb_init (a_cs: POINTER; a_func: POINTER; an_a: REAL; a_b: REAL): INTEGER is
 		-- gsl_cheb_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_init"
		}"
		end

	gsl_cheb_order (a_cs: POINTER): like size_t is
 		-- gsl_cheb_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_order"
		}"
		end

	gsl_cheb_size (a_cs: POINTER): like size_t is
 		-- gsl_cheb_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_size"
		}"
		end


end -- class GSL_CHEBYSHEV_EXTERNALS
