-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_ELLINT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_ellint_d (a_phi: REAL; a_k: REAL; a_n: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_D
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_D"
		}"
		end

	gsl_sf_ellint_d_e (a_phi: REAL; a_k: REAL; a_n: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_D_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_D_e"
		}"
		end

	gsl_sf_ellint_dcomp (a_k: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_Dcomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Dcomp"
		}"
		end

	gsl_sf_ellint_dcomp_e (a_k: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_Dcomp_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Dcomp_e"
		}"
		end

	gsl_sf_ellint_e (a_phi: REAL; a_k: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_E
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_E"
		}"
		end

	gsl_sf_ellint_e_e (a_phi: REAL; a_k: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_E_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_E_e"
		}"
		end

	gsl_sf_ellint_ecomp (a_k: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_Ecomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Ecomp"
		}"
		end

	gsl_sf_ellint_ecomp_e (a_k: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_Ecomp_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Ecomp_e"
		}"
		end

	gsl_sf_ellint_f (a_phi: REAL; a_k: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_F
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_F"
		}"
		end

	gsl_sf_ellint_f_e (a_phi: REAL; a_k: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_F_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_F_e"
		}"
		end

	gsl_sf_ellint_kcomp (a_k: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_Kcomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Kcomp"
		}"
		end

	gsl_sf_ellint_kcomp_e (a_k: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_Kcomp_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Kcomp_e"
		}"
		end

	gsl_sf_ellint_p (a_phi: REAL; a_k: REAL; a_n: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_P"
		}"
		end

	gsl_sf_ellint_p_e (a_phi: REAL; a_k: REAL; a_n: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_P_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_P_e"
		}"
		end

	gsl_sf_ellint_pcomp (a_k: REAL; a_n: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_Pcomp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Pcomp"
		}"
		end

	gsl_sf_ellint_pcomp_e (a_k: REAL; a_n: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_Pcomp_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_Pcomp_e"
		}"
		end

	gsl_sf_ellint_rc (a_x: REAL; a_y: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_RC
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RC"
		}"
		end

	gsl_sf_ellint_rc_e (a_x: REAL; a_y: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_RC_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RC_e"
		}"
		end

	gsl_sf_ellint_rd (a_x: REAL; a_y: REAL; a_z: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_RD
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RD"
		}"
		end

	gsl_sf_ellint_rd_e (a_x: REAL; a_y: REAL; a_z: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_RD_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RD_e"
		}"
		end

	gsl_sf_ellint_rf (a_x: REAL; a_y: REAL; a_z: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_RF
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RF"
		}"
		end

	gsl_sf_ellint_rf_e (a_x: REAL; a_y: REAL; a_z: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_RF_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RF_e"
		}"
		end

	gsl_sf_ellint_rj (a_x: REAL; a_y: REAL; a_z: REAL; a_p: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_ellint_RJ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RJ"
		}"
		end

	gsl_sf_ellint_rj_e (a_x: REAL; a_y: REAL; a_z: REAL; a_p: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_ellint_RJ_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_ellint_RJ_e"
		}"
		end


end -- class GSL_SF_ELLINT_EXTERNALS
