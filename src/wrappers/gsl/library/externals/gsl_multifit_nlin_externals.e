-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTIFIT_NLIN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_multifit_covar (a_j: POINTER; an_epsrel: REAL; a_covar: POINTER): INTEGER is
 		-- gsl_multifit_covar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_covar"
		}"
		end

	gsl_multifit_fdfsolver_alloc (a_t: POINTER; a_n: like size_t; a_p: like size_t): POINTER is
 		-- gsl_multifit_fdfsolver_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_alloc"
		}"
		end

	gsl_multifit_fdfsolver_free (a_s: POINTER) is
 		-- gsl_multifit_fdfsolver_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_free"
		}"
		end

	gsl_multifit_fdfsolver_iterate (a_s: POINTER): INTEGER is
 		-- gsl_multifit_fdfsolver_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_iterate"
		}"
		end

	gsl_multifit_fdfsolver_lmder: POINTER is
 		-- gsl_multifit_fdfsolver_lmder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_lmder"
		}"
		end

	address_of_gsl_multifit_fdfsolver_lmder: POINTER is
 		-- Address of gsl_multifit_fdfsolver_lmder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multifit_fdfsolver_lmder"
		}"
		end

	set_gsl_multifit_fdfsolver_lmder (a_value: POINTER) is
		-- Set variable gsl_multifit_fdfsolver_lmder value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multifit_fdfsolver_lmder"
		}"
		end

	gsl_multifit_fdfsolver_lmsder: POINTER is
 		-- gsl_multifit_fdfsolver_lmsder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_lmsder"
		}"
		end

	address_of_gsl_multifit_fdfsolver_lmsder: POINTER is
 		-- Address of gsl_multifit_fdfsolver_lmsder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_multifit_fdfsolver_lmsder"
		}"
		end

	set_gsl_multifit_fdfsolver_lmsder (a_value: POINTER) is
		-- Set variable gsl_multifit_fdfsolver_lmsder value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_multifit_fdfsolver_lmsder"
		}"
		end

	gsl_multifit_fdfsolver_name (a_s: POINTER): POINTER is
 		-- gsl_multifit_fdfsolver_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_name"
		}"
		end

	gsl_multifit_fdfsolver_position (a_s: POINTER): POINTER is
 		-- gsl_multifit_fdfsolver_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_position"
		}"
		end

	gsl_multifit_fdfsolver_set (a_s: POINTER; a_fdf: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_multifit_fdfsolver_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fdfsolver_set"
		}"
		end

	gsl_multifit_fsolver_alloc (a_t: POINTER; a_n: like size_t; a_p: like size_t): POINTER is
 		-- gsl_multifit_fsolver_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fsolver_alloc"
		}"
		end

	gsl_multifit_fsolver_free (a_s: POINTER) is
 		-- gsl_multifit_fsolver_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fsolver_free"
		}"
		end

	gsl_multifit_fsolver_iterate (a_s: POINTER): INTEGER is
 		-- gsl_multifit_fsolver_iterate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fsolver_iterate"
		}"
		end

	gsl_multifit_fsolver_name (a_s: POINTER): POINTER is
 		-- gsl_multifit_fsolver_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fsolver_name"
		}"
		end

	gsl_multifit_fsolver_position (a_s: POINTER): POINTER is
 		-- gsl_multifit_fsolver_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fsolver_position"
		}"
		end

	gsl_multifit_fsolver_set (a_s: POINTER; a_f: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_multifit_fsolver_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_fsolver_set"
		}"
		end

	gsl_multifit_gradient (a_j: POINTER; a_f: POINTER; a_g: POINTER): INTEGER is
 		-- gsl_multifit_gradient
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_gradient"
		}"
		end

	gsl_multifit_test_delta (a_dx: POINTER; a_x: POINTER; an_epsabs: REAL; an_epsrel: REAL): INTEGER is
 		-- gsl_multifit_test_delta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_test_delta"
		}"
		end

	gsl_multifit_test_gradient (a_g: POINTER; an_epsabs: REAL): INTEGER is
 		-- gsl_multifit_test_gradient
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multifit_test_gradient"
		}"
		end


end -- class GSL_MULTIFIT_NLIN_EXTERNALS
