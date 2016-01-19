-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTIMIN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_multimin_diff (a_f: POINTER; a_x: POINTER; a_g: POINTER): INTEGER is
 		-- gsl_multimin_diff
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_diff"
		}"
		end

	gsl_multimin_fdfminimizer_alloc (a_t: POINTER; a_n: like size_t): POINTER is
 		-- gsl_multimin_fdfminimizer_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_alloc"
		}"
		end

	gsl_multimin_fdfminimizer_conjugate_fr: POINTER is
 		-- gsl_multimin_fdfminimizer_conjugate_fr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_conjugate_fr"
		}"
		end

	address_of_gsl_multimin_fdfminimizer_conjugate_fr: POINTER is
 		-- Address of gsl_multimin_fdfminimizer_conjugate_fr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fdfminimizer_conjugate_fr"
		}"
		end

	set_gsl_multimin_fdfminimizer_conjugate_fr (a_value: POINTER) is
		-- Set variable gsl_multimin_fdfminimizer_conjugate_fr value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fdfminimizer_conjugate_fr"
		}"
		end

	gsl_multimin_fdfminimizer_conjugate_pr: POINTER is
 		-- gsl_multimin_fdfminimizer_conjugate_pr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_conjugate_pr"
		}"
		end

	address_of_gsl_multimin_fdfminimizer_conjugate_pr: POINTER is
 		-- Address of gsl_multimin_fdfminimizer_conjugate_pr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fdfminimizer_conjugate_pr"
		}"
		end

	set_gsl_multimin_fdfminimizer_conjugate_pr (a_value: POINTER) is
		-- Set variable gsl_multimin_fdfminimizer_conjugate_pr value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fdfminimizer_conjugate_pr"
		}"
		end

	gsl_multimin_fdfminimizer_dx (a_s: POINTER): POINTER is
 		-- gsl_multimin_fdfminimizer_dx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_dx"
		}"
		end

	gsl_multimin_fdfminimizer_free (a_s: POINTER) is
 		-- gsl_multimin_fdfminimizer_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_free"
		}"
		end

	gsl_multimin_fdfminimizer_gradient (a_s: POINTER): POINTER is
 		-- gsl_multimin_fdfminimizer_gradient
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_gradient"
		}"
		end

	gsl_multimin_fdfminimizer_iterate (a_s: POINTER): INTEGER is
 		-- gsl_multimin_fdfminimizer_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_iterate"
		}"
		end

	gsl_multimin_fdfminimizer_minimum (a_s: POINTER): REAL is
 		-- gsl_multimin_fdfminimizer_minimum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_minimum"
		}"
		end

	gsl_multimin_fdfminimizer_name (a_s: POINTER): POINTER is
 		-- gsl_multimin_fdfminimizer_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_name"
		}"
		end

	gsl_multimin_fdfminimizer_restart (a_s: POINTER): INTEGER is
 		-- gsl_multimin_fdfminimizer_restart
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_restart"
		}"
		end

	gsl_multimin_fdfminimizer_set (a_s: POINTER; a_fdf: POINTER; a_x: POINTER; a_step_size: REAL; a_tol: REAL): INTEGER is
 		-- gsl_multimin_fdfminimizer_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_set"
		}"
		end

	gsl_multimin_fdfminimizer_steepest_descent: POINTER is
 		-- gsl_multimin_fdfminimizer_steepest_descent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_steepest_descent"
		}"
		end

	address_of_gsl_multimin_fdfminimizer_steepest_descent: POINTER is
 		-- Address of gsl_multimin_fdfminimizer_steepest_descent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fdfminimizer_steepest_descent"
		}"
		end

	set_gsl_multimin_fdfminimizer_steepest_descent (a_value: POINTER) is
		-- Set variable gsl_multimin_fdfminimizer_steepest_descent value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fdfminimizer_steepest_descent"
		}"
		end

	gsl_multimin_fdfminimizer_vector_bfgs: POINTER is
 		-- gsl_multimin_fdfminimizer_vector_bfgs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_vector_bfgs"
		}"
		end

	address_of_gsl_multimin_fdfminimizer_vector_bfgs: POINTER is
 		-- Address of gsl_multimin_fdfminimizer_vector_bfgs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fdfminimizer_vector_bfgs"
		}"
		end

	set_gsl_multimin_fdfminimizer_vector_bfgs (a_value: POINTER) is
		-- Set variable gsl_multimin_fdfminimizer_vector_bfgs value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fdfminimizer_vector_bfgs"
		}"
		end

	gsl_multimin_fdfminimizer_vector_bfgs2: POINTER is
 		-- gsl_multimin_fdfminimizer_vector_bfgs2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_vector_bfgs2"
		}"
		end

	address_of_gsl_multimin_fdfminimizer_vector_bfgs2: POINTER is
 		-- Address of gsl_multimin_fdfminimizer_vector_bfgs2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fdfminimizer_vector_bfgs2"
		}"
		end

	set_gsl_multimin_fdfminimizer_vector_bfgs2 (a_value: POINTER) is
		-- Set variable gsl_multimin_fdfminimizer_vector_bfgs2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fdfminimizer_vector_bfgs2"
		}"
		end

	gsl_multimin_fdfminimizer_x (a_s: POINTER): POINTER is
 		-- gsl_multimin_fdfminimizer_x
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fdfminimizer_x"
		}"
		end

	gsl_multimin_fminimizer_alloc (a_t: POINTER; a_n: like size_t): POINTER is
 		-- gsl_multimin_fminimizer_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_alloc"
		}"
		end

	gsl_multimin_fminimizer_free (a_s: POINTER) is
 		-- gsl_multimin_fminimizer_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_free"
		}"
		end

	gsl_multimin_fminimizer_iterate (a_s: POINTER): INTEGER is
 		-- gsl_multimin_fminimizer_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_iterate"
		}"
		end

	gsl_multimin_fminimizer_minimum (a_s: POINTER): REAL is
 		-- gsl_multimin_fminimizer_minimum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_minimum"
		}"
		end

	gsl_multimin_fminimizer_name (a_s: POINTER): POINTER is
 		-- gsl_multimin_fminimizer_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_name"
		}"
		end

	gsl_multimin_fminimizer_nmsimplex: POINTER is
 		-- gsl_multimin_fminimizer_nmsimplex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_nmsimplex"
		}"
		end

	address_of_gsl_multimin_fminimizer_nmsimplex: POINTER is
 		-- Address of gsl_multimin_fminimizer_nmsimplex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fminimizer_nmsimplex"
		}"
		end

	set_gsl_multimin_fminimizer_nmsimplex (a_value: POINTER) is
		-- Set variable gsl_multimin_fminimizer_nmsimplex value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fminimizer_nmsimplex"
		}"
		end

	gsl_multimin_fminimizer_nmsimplex2: POINTER is
 		-- gsl_multimin_fminimizer_nmsimplex2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_nmsimplex2"
		}"
		end

	address_of_gsl_multimin_fminimizer_nmsimplex2: POINTER is
 		-- Address of gsl_multimin_fminimizer_nmsimplex2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fminimizer_nmsimplex2"
		}"
		end

	set_gsl_multimin_fminimizer_nmsimplex2 (a_value: POINTER) is
		-- Set variable gsl_multimin_fminimizer_nmsimplex2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fminimizer_nmsimplex2"
		}"
		end

	gsl_multimin_fminimizer_nmsimplex2rand: POINTER is
 		-- gsl_multimin_fminimizer_nmsimplex2rand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_nmsimplex2rand"
		}"
		end

	address_of_gsl_multimin_fminimizer_nmsimplex2rand: POINTER is
 		-- Address of gsl_multimin_fminimizer_nmsimplex2rand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multimin_fminimizer_nmsimplex2rand"
		}"
		end

	set_gsl_multimin_fminimizer_nmsimplex2rand (a_value: POINTER) is
		-- Set variable gsl_multimin_fminimizer_nmsimplex2rand value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multimin_fminimizer_nmsimplex2rand"
		}"
		end

	gsl_multimin_fminimizer_set (a_s: POINTER; a_f: POINTER; a_x: POINTER; a_step_size: POINTER): INTEGER is
 		-- gsl_multimin_fminimizer_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_set"
		}"
		end

	gsl_multimin_fminimizer_size (a_s: POINTER): REAL is
 		-- gsl_multimin_fminimizer_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_size"
		}"
		end

	gsl_multimin_fminimizer_x (a_s: POINTER): POINTER is
 		-- gsl_multimin_fminimizer_x
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_x"
		}"
		end

	gsl_multimin_test_gradient (a_g: POINTER; an_epsabs: REAL): INTEGER is
 		-- gsl_multimin_test_gradient
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_test_gradient"
		}"
		end

	gsl_multimin_test_size (a_size: REAL; an_epsabs: REAL): INTEGER is
 		-- gsl_multimin_test_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_test_size"
		}"
		end


end -- class GSL_MULTIMIN_EXTERNALS
