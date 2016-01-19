-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_MISER_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_monte_miser_alloc (a_dim: like size_t): POINTER is
 		-- gsl_monte_miser_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_alloc"
		}"
		end

	gsl_monte_miser_free (a_state: POINTER) is
 		-- gsl_monte_miser_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_free"
		}"
		end

	gsl_monte_miser_init (a_state: POINTER): INTEGER is
 		-- gsl_monte_miser_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_init"
		}"
		end

	gsl_monte_miser_integrate (a_f: POINTER; a_xl: POINTER; a_xh: POINTER; a_dim: like size_t; a_calls: like size_t; a_r: POINTER; a_state: POINTER; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_monte_miser_integrate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_integrate"
		}"
		end

	gsl_monte_miser_params_get (a_state: POINTER; a_params: POINTER) is
 		-- gsl_monte_miser_params_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_get"
		}"
		end

	gsl_monte_miser_params_set (a_state: POINTER; a_params: POINTER) is
 		-- gsl_monte_miser_params_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_set"
		}"
		end


end -- class GSL_MONTE_MISER_EXTERNALS
