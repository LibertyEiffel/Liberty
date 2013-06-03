-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_ERF_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_erf (a_x: REAL): REAL is
 		-- gsl_sf_erf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erf"
		}"
		end

	gsl_sf_erf_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_erf_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erf_e"
		}"
		end

	gsl_sf_erf_q (a_x: REAL): REAL is
 		-- gsl_sf_erf_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erf_Q"
		}"
		end

	gsl_sf_erf_q_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_erf_Q_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erf_Q_e"
		}"
		end

	gsl_sf_erf_z (a_x: REAL): REAL is
 		-- gsl_sf_erf_Z
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erf_Z"
		}"
		end

	gsl_sf_erf_z_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_erf_Z_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erf_Z_e"
		}"
		end

	gsl_sf_erfc (a_x: REAL): REAL is
 		-- gsl_sf_erfc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erfc"
		}"
		end

	gsl_sf_erfc_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_erfc_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_erfc_e"
		}"
		end

	gsl_sf_hazard (a_x: REAL): REAL is
 		-- gsl_sf_hazard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hazard"
		}"
		end

	gsl_sf_hazard_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_hazard_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hazard_e"
		}"
		end

	gsl_sf_log_erfc (a_x: REAL): REAL is
 		-- gsl_sf_log_erfc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_erfc"
		}"
		end

	gsl_sf_log_erfc_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_log_erfc_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_erfc_e"
		}"
		end


end -- class GSL_SF_ERF_EXTERNALS
