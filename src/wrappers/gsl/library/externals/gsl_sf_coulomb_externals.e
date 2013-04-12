-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_COULOMB_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_coulomb_cl_array (a_lmin: REAL_64; a_kmax: INTEGER_32; an_eta: REAL_64; a_cl: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_CL_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_CL_array"
		}"
		end

	gsl_sf_coulomb_cl_e (a_l: REAL_64; an_eta: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_CL_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_CL_e"
		}"
		end

	gsl_sf_coulomb_wave_f_array (a_lam_min: REAL_64; a_kmax: INTEGER_32; an_eta: REAL_64; a_x: REAL_64; a_fc_array: POINTER; a_f_exponent: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_wave_F_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_wave_F_array"
		}"
		end

	gsl_sf_coulomb_wave_fg_array (a_lam_min: REAL_64; a_kmax: INTEGER_32; an_eta: REAL_64; a_x: REAL_64; a_fc_array: POINTER; a_gc_array: POINTER; a_f_exponent: POINTER; a_g_exponent: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_wave_FG_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_wave_FG_array"
		}"
		end

	gsl_sf_coulomb_wave_fg_e (an_eta: REAL_64; a_x: REAL_64; a_lam_f: REAL_64; a_k_lam_g: INTEGER_32; a_f: POINTER; a_fp: POINTER; a_g: POINTER; a_gp: POINTER; an_exp_f: POINTER; an_exp_g: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_wave_FG_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_wave_FG_e"
		}"
		end

	gsl_sf_coulomb_wave_fgp_array (a_lam_min: REAL_64; a_kmax: INTEGER_32; an_eta: REAL_64; a_x: REAL_64; a_fc_array: POINTER; a_fcp_array: POINTER; a_gc_array: POINTER; a_gcp_array: POINTER; a_f_exponent: POINTER; a_g_exponent: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_wave_FGp_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_wave_FGp_array"
		}"
		end

	gsl_sf_coulomb_wave_sph_f_array (a_lam_min: REAL_64; a_kmax: INTEGER_32; an_eta: REAL_64; a_x: REAL_64; a_fc_array: POINTER; a_f_exponent: POINTER): INTEGER_32 is
 		-- gsl_sf_coulomb_wave_sphF_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coulomb_wave_sphF_array"
		}"
		end

	gsl_sf_hydrogenic_r (a_n: INTEGER_32; a_l: INTEGER_32; a_z: REAL_64; a_r: REAL_64): REAL_64 is
 		-- gsl_sf_hydrogenicR
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hydrogenicR"
		}"
		end

	gsl_sf_hydrogenic_r_1 (a_z: REAL_64; a_r: REAL_64): REAL_64 is
 		-- gsl_sf_hydrogenicR_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hydrogenicR_1"
		}"
		end

	gsl_sf_hydrogenic_r_1_e (a_z: REAL_64; a_r: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_hydrogenicR_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hydrogenicR_1_e"
		}"
		end

	gsl_sf_hydrogenic_r_e (a_n: INTEGER_32; a_l: INTEGER_32; a_z: REAL_64; a_r: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_hydrogenicR_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_hydrogenicR_e"
		}"
		end


end -- class GSL_SF_COULOMB_EXTERNALS
