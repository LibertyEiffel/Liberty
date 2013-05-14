-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MIN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_min_find_bracket (a_f: POINTER; a_x_minimum: POINTER; a_f_minimum: POINTER; a_x_lower: POINTER; a_f_lower: POINTER; a_x_upper: POINTER; a_f_upper: POINTER; an_eval_max: like size_t): INTEGER is
 		-- gsl_min_find_bracket
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_find_bracket"
		}"
		end

	gsl_min_fminimizer_alloc (a_t: POINTER): POINTER is
 		-- gsl_min_fminimizer_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_alloc"
		}"
		end

	gsl_min_fminimizer_brent: POINTER is
 		-- gsl_min_fminimizer_brent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_brent"
		}"
		end

	address_of_gsl_min_fminimizer_brent: POINTER is
 		-- Address of gsl_min_fminimizer_brent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_min_fminimizer_brent"
		}"
		end

	set_gsl_min_fminimizer_brent (a_value: POINTER) is
		-- Set variable gsl_min_fminimizer_brent value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_min_fminimizer_brent"
		}"
		end

	gsl_min_fminimizer_f_lower (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_f_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_f_lower"
		}"
		end

	gsl_min_fminimizer_f_minimum (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_f_minimum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_f_minimum"
		}"
		end

	gsl_min_fminimizer_f_upper (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_f_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_f_upper"
		}"
		end

	gsl_min_fminimizer_free (a_s: POINTER) is
 		-- gsl_min_fminimizer_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_free"
		}"
		end

	gsl_min_fminimizer_goldensection: POINTER is
 		-- gsl_min_fminimizer_goldensection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_goldensection"
		}"
		end

	address_of_gsl_min_fminimizer_goldensection: POINTER is
 		-- Address of gsl_min_fminimizer_goldensection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_min_fminimizer_goldensection"
		}"
		end

	set_gsl_min_fminimizer_goldensection (a_value: POINTER) is
		-- Set variable gsl_min_fminimizer_goldensection value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_min_fminimizer_goldensection"
		}"
		end

	gsl_min_fminimizer_iterate (a_s: POINTER): INTEGER is
 		-- gsl_min_fminimizer_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_iterate"
		}"
		end

	gsl_min_fminimizer_minimum (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_minimum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_minimum"
		}"
		end

	gsl_min_fminimizer_name (a_s: POINTER): POINTER is
 		-- gsl_min_fminimizer_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_name"
		}"
		end

	gsl_min_fminimizer_quad_golden: POINTER is
 		-- gsl_min_fminimizer_quad_golden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_quad_golden"
		}"
		end

	address_of_gsl_min_fminimizer_quad_golden: POINTER is
 		-- Address of gsl_min_fminimizer_quad_golden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_min_fminimizer_quad_golden"
		}"
		end

	set_gsl_min_fminimizer_quad_golden (a_value: POINTER) is
		-- Set variable gsl_min_fminimizer_quad_golden value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_min_fminimizer_quad_golden"
		}"
		end

	gsl_min_fminimizer_set (a_s: POINTER; a_f: POINTER; a_x_minimum: REAL; a_x_lower: REAL; a_x_upper: REAL): INTEGER is
 		-- gsl_min_fminimizer_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_set"
		}"
		end

	gsl_min_fminimizer_set_with_values (a_s: POINTER; a_f: POINTER; a_x_minimum: REAL; a_f_minimum: REAL; a_x_lower: REAL; a_f_lower: REAL; a_x_upper: REAL; a_f_upper: REAL): INTEGER is
 		-- gsl_min_fminimizer_set_with_values
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_set_with_values"
		}"
		end

	gsl_min_fminimizer_x_lower (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_x_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_x_lower"
		}"
		end

	gsl_min_fminimizer_x_minimum (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_x_minimum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_x_minimum"
		}"
		end

	gsl_min_fminimizer_x_upper (a_s: POINTER): REAL is
 		-- gsl_min_fminimizer_x_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_fminimizer_x_upper"
		}"
		end

	gsl_min_test_interval (a_x_lower: REAL; a_x_upper: REAL; an_epsabs: REAL; an_epsrel: REAL): INTEGER is
 		-- gsl_min_test_interval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_min_test_interval"
		}"
		end


end -- class GSL_MIN_EXTERNALS
