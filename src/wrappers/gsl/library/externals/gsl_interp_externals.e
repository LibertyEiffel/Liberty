-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTERP_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_interp_accel_alloc: POINTER is
 		-- gsl_interp_accel_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_alloc()"
		}"
		end

	gsl_interp_accel_find (an_a: POINTER; a_x_array: POINTER; a_size: like size_t; a_x: REAL): like size_t is
 		-- gsl_interp_accel_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_find"
		}"
		end

	gsl_interp_accel_free (an_a: POINTER) is
 		-- gsl_interp_accel_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_free"
		}"
		end

	gsl_interp_accel_reset (an_a: POINTER): INTEGER is
 		-- gsl_interp_accel_reset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_reset"
		}"
		end

	gsl_interp_akima: POINTER is
 		-- gsl_interp_akima
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_akima"
		}"
		end

	address_of_gsl_interp_akima: POINTER is
 		-- Address of gsl_interp_akima
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_interp_akima"
		}"
		end

	set_gsl_interp_akima (a_value: POINTER) is
		-- Set variable gsl_interp_akima value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_interp_akima"
		}"
		end

	gsl_interp_akima_periodic: POINTER is
 		-- gsl_interp_akima_periodic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_akima_periodic"
		}"
		end

	address_of_gsl_interp_akima_periodic: POINTER is
 		-- Address of gsl_interp_akima_periodic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_interp_akima_periodic"
		}"
		end

	set_gsl_interp_akima_periodic (a_value: POINTER) is
		-- Set variable gsl_interp_akima_periodic value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_interp_akima_periodic"
		}"
		end

	gsl_interp_alloc (a_t: POINTER; a_n: like size_t): POINTER is
 		-- gsl_interp_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_alloc"
		}"
		end

	gsl_interp_bsearch (a_x_array: POINTER; a_x: REAL; an_index_lo: like size_t; an_index_hi: like size_t): like size_t is
 		-- gsl_interp_bsearch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_bsearch"
		}"
		end

	gsl_interp_cspline: POINTER is
 		-- gsl_interp_cspline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_cspline"
		}"
		end

	address_of_gsl_interp_cspline: POINTER is
 		-- Address of gsl_interp_cspline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_interp_cspline"
		}"
		end

	set_gsl_interp_cspline (a_value: POINTER) is
		-- Set variable gsl_interp_cspline value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_interp_cspline"
		}"
		end

	gsl_interp_cspline_periodic: POINTER is
 		-- gsl_interp_cspline_periodic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_cspline_periodic"
		}"
		end

	address_of_gsl_interp_cspline_periodic: POINTER is
 		-- Address of gsl_interp_cspline_periodic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_interp_cspline_periodic"
		}"
		end

	set_gsl_interp_cspline_periodic (a_value: POINTER) is
		-- Set variable gsl_interp_cspline_periodic value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_interp_cspline_periodic"
		}"
		end

	gsl_interp_eval (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_x: REAL; an_a: POINTER): REAL is
 		-- gsl_interp_eval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval"
		}"
		end

	gsl_interp_eval_deriv (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_x: REAL; an_a: POINTER): REAL is
 		-- gsl_interp_eval_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_deriv"
		}"
		end

	gsl_interp_eval_deriv2 (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_x: REAL; an_a: POINTER): REAL is
 		-- gsl_interp_eval_deriv2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_deriv2"
		}"
		end

	gsl_interp_eval_deriv2_e (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_x: REAL; an_a: POINTER; a_d2: POINTER): INTEGER is
 		-- gsl_interp_eval_deriv2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_deriv2_e"
		}"
		end

	gsl_interp_eval_deriv_e (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_x: REAL; an_a: POINTER; a_d: POINTER): INTEGER is
 		-- gsl_interp_eval_deriv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_deriv_e"
		}"
		end

	gsl_interp_eval_e (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_x: REAL; an_a: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_interp_eval_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_e"
		}"
		end

	gsl_interp_eval_integ (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; an_a: REAL; a_b: REAL; an_acc: POINTER): REAL is
 		-- gsl_interp_eval_integ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_integ"
		}"
		end

	gsl_interp_eval_integ_e (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; an_a: REAL; a_b: REAL; an_acc: POINTER; a_result: POINTER): INTEGER is
 		-- gsl_interp_eval_integ_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_eval_integ_e"
		}"
		end

	gsl_interp_free (an_interp: POINTER) is
 		-- gsl_interp_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_free"
		}"
		end

	gsl_interp_init (an_obj: POINTER; a_xa: POINTER; a_ya: POINTER; a_size: like size_t): INTEGER is
 		-- gsl_interp_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_init"
		}"
		end

	gsl_interp_linear: POINTER is
 		-- gsl_interp_linear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_linear"
		}"
		end

	address_of_gsl_interp_linear: POINTER is
 		-- Address of gsl_interp_linear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_interp_linear"
		}"
		end

	set_gsl_interp_linear (a_value: POINTER) is
		-- Set variable gsl_interp_linear value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_interp_linear"
		}"
		end

	gsl_interp_min_size (an_interp: POINTER): NATURAL is
 		-- gsl_interp_min_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_min_size"
		}"
		end

	gsl_interp_name (an_interp: POINTER): POINTER is
 		-- gsl_interp_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_name"
		}"
		end

	gsl_interp_polynomial: POINTER is
 		-- gsl_interp_polynomial
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_polynomial"
		}"
		end

	address_of_gsl_interp_polynomial: POINTER is
 		-- Address of gsl_interp_polynomial
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_interp_polynomial"
		}"
		end

	set_gsl_interp_polynomial (a_value: POINTER) is
		-- Set variable gsl_interp_polynomial value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_interp_polynomial"
		}"
		end

	gsl_interp_type_min_size (a_t: POINTER): NATURAL is
 		-- gsl_interp_type_min_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_min_size"
		}"
		end


end -- class GSL_INTERP_EXTERNALS
