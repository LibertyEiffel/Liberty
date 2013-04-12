-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_DILOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_complex_dilog_e (a_r: REAL_64; a_theta: REAL_64; a_result_re: POINTER; a_result_im: POINTER): INTEGER_32 is
 		-- gsl_sf_complex_dilog_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_dilog_e"
		}"
		end

	gsl_sf_complex_dilog_xy_e (a_x: REAL_64; a_y: REAL_64; a_result_re: POINTER; a_result_im: POINTER): INTEGER_32 is
 		-- gsl_sf_complex_dilog_xy_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_dilog_xy_e"
		}"
		end

	gsl_sf_complex_spence_xy_e (a_x: REAL_64; a_y: REAL_64; a_real_sp: POINTER; an_imag_sp: POINTER): INTEGER_32 is
 		-- gsl_sf_complex_spence_xy_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_spence_xy_e"
		}"
		end

	gsl_sf_dilog (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_dilog
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_dilog"
		}"
		end

	gsl_sf_dilog_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_dilog_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_dilog_e"
		}"
		end


end -- class GSL_SF_DILOG_EXTERNALS
