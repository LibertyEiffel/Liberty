-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_DILOG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_complex_dilog_e (a_r: REAL; a_theta: REAL; a_result_re: POINTER; a_result_im: POINTER): INTEGER is
 		-- gsl_sf_complex_dilog_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_dilog_e"
		}"
		end

	gsl_sf_complex_dilog_xy_e (a_x: REAL; a_y: REAL; a_result_re: POINTER; a_result_im: POINTER): INTEGER is
 		-- gsl_sf_complex_dilog_xy_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_dilog_xy_e"
		}"
		end

	gsl_sf_complex_spence_xy_e (a_x: REAL; a_y: REAL; a_real_sp: POINTER; an_imag_sp: POINTER): INTEGER is
 		-- gsl_sf_complex_spence_xy_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_spence_xy_e"
		}"
		end

	gsl_sf_dilog (a_x: REAL): REAL is
 		-- gsl_sf_dilog
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_dilog"
		}"
		end

	gsl_sf_dilog_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_dilog_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_dilog_e"
		}"
		end


end -- class GSL_SF_DILOG_EXTERNALS
