-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_LOG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_complex_log_e (a_zr: REAL; a_zi: REAL; a_lnr: POINTER; a_theta: POINTER): INTEGER is
 		-- gsl_sf_complex_log_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_log_e"
		}"
		end

	gsl_sf_log (a_x: REAL): REAL is
 		-- gsl_sf_log
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log"
		}"
		end

	gsl_sf_log_1plusx (a_x: REAL): REAL is
 		-- gsl_sf_log_1plusx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_1plusx"
		}"
		end

	gsl_sf_log_1plusx_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_log_1plusx_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_1plusx_e"
		}"
		end

	gsl_sf_log_1plusx_mx (a_x: REAL): REAL is
 		-- gsl_sf_log_1plusx_mx
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_1plusx_mx"
		}"
		end

	gsl_sf_log_1plusx_mx_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_log_1plusx_mx_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_1plusx_mx_e"
		}"
		end

	gsl_sf_log_abs (a_x: REAL): REAL is
 		-- gsl_sf_log_abs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_abs"
		}"
		end

	gsl_sf_log_abs_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_log_abs_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_abs_e"
		}"
		end

	gsl_sf_log_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_log_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_log_e"
		}"
		end


end -- class GSL_SF_LOG_EXTERNALS
