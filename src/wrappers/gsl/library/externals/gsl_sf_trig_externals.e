-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_TRIG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_angle_restrict_pos (a_theta: REAL): REAL is
 		-- gsl_sf_angle_restrict_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_angle_restrict_pos"
		}"
		end

	gsl_sf_angle_restrict_pos_e (a_theta: POINTER): INTEGER is
 		-- gsl_sf_angle_restrict_pos_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_angle_restrict_pos_e"
		}"
		end

	gsl_sf_angle_restrict_pos_err_e (a_theta: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_angle_restrict_pos_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_angle_restrict_pos_err_e"
		}"
		end

	gsl_sf_angle_restrict_symm (a_theta: REAL): REAL is
 		-- gsl_sf_angle_restrict_symm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_angle_restrict_symm"
		}"
		end

	gsl_sf_angle_restrict_symm_e (a_theta: POINTER): INTEGER is
 		-- gsl_sf_angle_restrict_symm_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_angle_restrict_symm_e"
		}"
		end

	gsl_sf_angle_restrict_symm_err_e (a_theta: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_angle_restrict_symm_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_angle_restrict_symm_err_e"
		}"
		end

	gsl_sf_complex_cos_e (a_zr: REAL; a_zi: REAL; a_czr: POINTER; a_czi: POINTER): INTEGER is
 		-- gsl_sf_complex_cos_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_cos_e"
		}"
		end

	gsl_sf_complex_logsin_e (a_zr: REAL; a_zi: REAL; a_lszr: POINTER; a_lszi: POINTER): INTEGER is
 		-- gsl_sf_complex_logsin_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_logsin_e"
		}"
		end

	gsl_sf_complex_sin_e (a_zr: REAL; a_zi: REAL; a_szr: POINTER; a_szi: POINTER): INTEGER is
 		-- gsl_sf_complex_sin_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_sin_e"
		}"
		end

	gsl_sf_cos (a_x: REAL): REAL is
 		-- gsl_sf_cos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_cos"
		}"
		end

	gsl_sf_cos_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_cos_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_cos_e"
		}"
		end

	gsl_sf_cos_err_e (a_x: REAL; a_dx: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_cos_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_cos_err_e"
		}"
		end

	gsl_sf_hypot (a_x: REAL; a_y: REAL): REAL is
 		-- gsl_sf_hypot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hypot"
		}"
		end

	gsl_sf_hypot_e (a_x: REAL; a_y: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_hypot_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hypot_e"
		}"
		end

	gsl_sf_lncosh (a_x: REAL): REAL is
 		-- gsl_sf_lncosh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lncosh"
		}"
		end

	gsl_sf_lncosh_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lncosh_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lncosh_e"
		}"
		end

	gsl_sf_lnsinh (a_x: REAL): REAL is
 		-- gsl_sf_lnsinh
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnsinh"
		}"
		end

	gsl_sf_lnsinh_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lnsinh_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnsinh_e"
		}"
		end

	gsl_sf_polar_to_rect (a_r: REAL; a_theta: REAL; a_x: POINTER; a_y: POINTER): INTEGER is
 		-- gsl_sf_polar_to_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_polar_to_rect"
		}"
		end

	gsl_sf_rect_to_polar (a_x: REAL; a_y: REAL; a_r: POINTER; a_theta: POINTER): INTEGER is
 		-- gsl_sf_rect_to_polar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_rect_to_polar"
		}"
		end

	gsl_sf_sin (a_x: REAL): REAL is
 		-- gsl_sf_sin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_sin"
		}"
		end

	gsl_sf_sin_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_sin_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_sin_e"
		}"
		end

	gsl_sf_sin_err_e (a_x: REAL; a_dx: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_sin_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_sin_err_e"
		}"
		end

	gsl_sf_sinc (a_x: REAL): REAL is
 		-- gsl_sf_sinc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_sinc"
		}"
		end

	gsl_sf_sinc_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_sinc_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_sinc_e"
		}"
		end


end -- class GSL_SF_TRIG_EXTERNALS
