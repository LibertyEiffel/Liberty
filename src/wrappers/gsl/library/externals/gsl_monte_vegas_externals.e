-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_VEGAS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_monte_vegas_alloc (a_dim: like size_t): POINTER is
 		-- gsl_monte_vegas_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_alloc"
		}"
		end

	gsl_monte_vegas_chisq (a_state: POINTER): REAL is
 		-- gsl_monte_vegas_chisq
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_chisq"
		}"
		end

	gsl_monte_vegas_free (a_state: POINTER) is
 		-- gsl_monte_vegas_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_free"
		}"
		end

	gsl_monte_vegas_init (a_state: POINTER): INTEGER is
 		-- gsl_monte_vegas_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_init"
		}"
		end

	gsl_monte_vegas_integrate (a_f: POINTER; a_xl: POINTER; a_xu: POINTER; a_dim: like size_t; a_calls: like size_t; a_r: POINTER; a_state: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_monte_vegas_integrate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_integrate"
		}"
		end

	gsl_monte_vegas_params_get (a_state: POINTER; a_params: POINTER) is
 		-- gsl_monte_vegas_params_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_get"
		}"
		end

	gsl_monte_vegas_params_set (a_state: POINTER; a_params: POINTER) is
 		-- gsl_monte_vegas_params_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_set"
		}"
		end

	gsl_monte_vegas_runval (a_state: POINTER; a_result: POINTER; a_sigma: POINTER) is
 		-- gsl_monte_vegas_runval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_runval"
		}"
		end


end -- class GSL_MONTE_VEGAS_EXTERNALS
