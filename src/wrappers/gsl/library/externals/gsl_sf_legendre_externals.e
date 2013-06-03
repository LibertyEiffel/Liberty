-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_LEGENDRE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_conical_p_0 (a_lambda: REAL; a_x: REAL): REAL is
 		-- gsl_sf_conicalP_0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_0"
		}"
		end

	gsl_sf_conical_p_0_e (a_lambda: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_conicalP_0_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_0_e"
		}"
		end

	gsl_sf_conical_p_1 (a_lambda: REAL; a_x: REAL): REAL is
 		-- gsl_sf_conicalP_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_1"
		}"
		end

	gsl_sf_conical_p_1_e (a_lambda: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_conicalP_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_1_e"
		}"
		end

	gsl_sf_conical_p_cyl_reg (a_m: INTEGER; a_lambda: REAL; a_x: REAL): REAL is
 		-- gsl_sf_conicalP_cyl_reg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_cyl_reg"
		}"
		end

	gsl_sf_conical_p_cyl_reg_e (a_m: INTEGER; a_lambda: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_conicalP_cyl_reg_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_cyl_reg_e"
		}"
		end

	gsl_sf_conical_p_half (a_lambda: REAL; a_x: REAL): REAL is
 		-- gsl_sf_conicalP_half
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_half"
		}"
		end

	gsl_sf_conical_p_half_e (a_lambda: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_conicalP_half_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_half_e"
		}"
		end

	gsl_sf_conical_p_mhalf (a_lambda: REAL; a_x: REAL): REAL is
 		-- gsl_sf_conicalP_mhalf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_mhalf"
		}"
		end

	gsl_sf_conical_p_mhalf_e (a_lambda: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_conicalP_mhalf_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_mhalf_e"
		}"
		end

	gsl_sf_conical_p_sph_reg (a_l: INTEGER; a_lambda: REAL; a_x: REAL): REAL is
 		-- gsl_sf_conicalP_sph_reg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_sph_reg"
		}"
		end

	gsl_sf_conical_p_sph_reg_e (a_l: INTEGER; a_lambda: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_conicalP_sph_reg_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_conicalP_sph_reg_e"
		}"
		end

	gsl_sf_legendre_array_size (a_lmax: INTEGER; a_m: INTEGER): INTEGER is
 		-- gsl_sf_legendre_array_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_array_size"
		}"
		end

	gsl_sf_legendre_h3d (a_l: INTEGER; a_lambda: REAL; an_eta: REAL): REAL is
 		-- gsl_sf_legendre_H3d
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d"
		}"
		end

	gsl_sf_legendre_h3d_0 (a_lambda: REAL; an_eta: REAL): REAL is
 		-- gsl_sf_legendre_H3d_0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d_0"
		}"
		end

	gsl_sf_legendre_h3d_0_e (a_lambda: REAL; an_eta: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_H3d_0_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d_0_e"
		}"
		end

	gsl_sf_legendre_h3d_1 (a_lambda: REAL; an_eta: REAL): REAL is
 		-- gsl_sf_legendre_H3d_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d_1"
		}"
		end

	gsl_sf_legendre_h3d_1_e (a_lambda: REAL; an_eta: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_H3d_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d_1_e"
		}"
		end

	gsl_sf_legendre_h3d_array (a_lmax: INTEGER; a_lambda: REAL; an_eta: REAL; a_result_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_H3d_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d_array"
		}"
		end

	gsl_sf_legendre_h3d_e (a_l: INTEGER; a_lambda: REAL; an_eta: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_H3d_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_H3d_e"
		}"
		end

	gsl_sf_legendre_p1 (a_x: REAL): REAL is
 		-- gsl_sf_legendre_P1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_P1"
		}"
		end

	gsl_sf_legendre_p1_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_P1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_P1_e"
		}"
		end

	gsl_sf_legendre_p2 (a_x: REAL): REAL is
 		-- gsl_sf_legendre_P2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_P2"
		}"
		end

	gsl_sf_legendre_p2_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_P2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_P2_e"
		}"
		end

	gsl_sf_legendre_p3 (a_x: REAL): REAL is
 		-- gsl_sf_legendre_P3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_P3"
		}"
		end

	gsl_sf_legendre_p3_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_P3_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_P3_e"
		}"
		end

	gsl_sf_legendre_pl (a_l: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_legendre_Pl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Pl"
		}"
		end

	gsl_sf_legendre_pl_array (a_lmax: INTEGER; a_x: REAL; a_result_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_Pl_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Pl_array"
		}"
		end

	gsl_sf_legendre_pl_deriv_array (a_lmax: INTEGER; a_x: REAL; a_result_array: POINTER; a_result_deriv_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_Pl_deriv_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Pl_deriv_array"
		}"
		end

	gsl_sf_legendre_pl_e (a_l: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_Pl_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Pl_e"
		}"
		end

	gsl_sf_legendre_plm (a_l: INTEGER; a_m: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_legendre_Plm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Plm"
		}"
		end

	gsl_sf_legendre_plm_array (a_lmax: INTEGER; a_m: INTEGER; a_x: REAL; a_result_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_Plm_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Plm_array"
		}"
		end

	gsl_sf_legendre_plm_deriv_array (a_lmax: INTEGER; a_m: INTEGER; a_x: REAL; a_result_array: POINTER; a_result_deriv_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_Plm_deriv_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Plm_deriv_array"
		}"
		end

	gsl_sf_legendre_plm_e (a_l: INTEGER; a_m: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_Plm_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Plm_e"
		}"
		end

	gsl_sf_legendre_q0 (a_x: REAL): REAL is
 		-- gsl_sf_legendre_Q0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Q0"
		}"
		end

	gsl_sf_legendre_q0_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_Q0_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Q0_e"
		}"
		end

	gsl_sf_legendre_q1 (a_x: REAL): REAL is
 		-- gsl_sf_legendre_Q1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Q1"
		}"
		end

	gsl_sf_legendre_q1_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_Q1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Q1_e"
		}"
		end

	gsl_sf_legendre_ql (a_l: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_legendre_Ql
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Ql"
		}"
		end

	gsl_sf_legendre_ql_e (a_l: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_Ql_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_Ql_e"
		}"
		end

	gsl_sf_legendre_sph_plm (a_l: INTEGER; a_m: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_legendre_sphPlm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_sphPlm"
		}"
		end

	gsl_sf_legendre_sph_plm_array (a_lmax: INTEGER; a_m: INTEGER; a_x: REAL; a_result_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_sphPlm_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_sphPlm_array"
		}"
		end

	gsl_sf_legendre_sph_plm_deriv_array (a_lmax: INTEGER; a_m: INTEGER; a_x: REAL; a_result_array: POINTER; a_result_deriv_array: POINTER): INTEGER is
 		-- gsl_sf_legendre_sphPlm_deriv_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_sphPlm_deriv_array"
		}"
		end

	gsl_sf_legendre_sph_plm_e (a_l: INTEGER; a_m: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_legendre_sphPlm_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_legendre_sphPlm_e"
		}"
		end


end -- class GSL_SF_LEGENDRE_EXTERNALS
