-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_GAMMA_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_beta (an_a: REAL; a_b: REAL): REAL is
 		-- gsl_sf_beta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_beta"
		}"
		end

	gsl_sf_beta_e (an_a: REAL; a_b: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_beta_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_beta_e"
		}"
		end

	gsl_sf_beta_inc (an_a: REAL; a_b: REAL; a_x: REAL): REAL is
 		-- gsl_sf_beta_inc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_beta_inc"
		}"
		end

	gsl_sf_beta_inc_e (an_a: REAL; a_b: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_beta_inc_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_beta_inc_e"
		}"
		end

	gsl_sf_choose (a_n: NATURAL; a_m: NATURAL): REAL is
 		-- gsl_sf_choose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_choose"
		}"
		end

	gsl_sf_choose_e (a_n: NATURAL; a_m: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_choose_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_choose_e"
		}"
		end

	gsl_sf_doublefact (a_n: NATURAL): REAL is
 		-- gsl_sf_doublefact
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_doublefact"
		}"
		end

	gsl_sf_doublefact_e (a_n: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_doublefact_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_doublefact_e"
		}"
		end

	gsl_sf_fact (a_n: NATURAL): REAL is
 		-- gsl_sf_fact
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_fact"
		}"
		end

	gsl_sf_fact_e (a_n: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_fact_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_fact_e"
		}"
		end

	gsl_sf_gamma (a_x: REAL): REAL is
 		-- gsl_sf_gamma
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma"
		}"
		end

	gsl_sf_gamma_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_gamma_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_e"
		}"
		end

	gsl_sf_gamma_inc (an_a: REAL; a_x: REAL): REAL is
 		-- gsl_sf_gamma_inc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_inc"
		}"
		end

	gsl_sf_gamma_inc_e (an_a: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_gamma_inc_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_inc_e"
		}"
		end

	gsl_sf_gamma_inc_p (an_a: REAL; a_x: REAL): REAL is
 		-- gsl_sf_gamma_inc_P
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_inc_P"
		}"
		end

	gsl_sf_gamma_inc_p_e (an_a: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_gamma_inc_P_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_inc_P_e"
		}"
		end

	gsl_sf_gamma_inc_q (an_a: REAL; a_x: REAL): REAL is
 		-- gsl_sf_gamma_inc_Q
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_inc_Q"
		}"
		end

	gsl_sf_gamma_inc_q_e (an_a: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_gamma_inc_Q_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gamma_inc_Q_e"
		}"
		end

	gsl_sf_gammainv (a_x: REAL): REAL is
 		-- gsl_sf_gammainv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gammainv"
		}"
		end

	gsl_sf_gammainv_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_gammainv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gammainv_e"
		}"
		end

	gsl_sf_gammastar (a_x: REAL): REAL is
 		-- gsl_sf_gammastar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gammastar"
		}"
		end

	gsl_sf_gammastar_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_gammastar_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_gammastar_e"
		}"
		end

	gsl_sf_lnbeta (an_a: REAL; a_b: REAL): REAL is
 		-- gsl_sf_lnbeta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnbeta"
		}"
		end

	gsl_sf_lnbeta_e (an_a: REAL; a_b: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lnbeta_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnbeta_e"
		}"
		end

	gsl_sf_lnbeta_sgn_e (a_x: REAL; a_y: REAL; a_result: POINTER; a_sgn: POINTER): INTEGER is
 		-- gsl_sf_lnbeta_sgn_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnbeta_sgn_e"
		}"
		end

	gsl_sf_lnchoose (a_n: NATURAL; a_m: NATURAL): REAL is
 		-- gsl_sf_lnchoose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnchoose"
		}"
		end

	gsl_sf_lnchoose_e (a_n: NATURAL; a_m: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lnchoose_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnchoose_e"
		}"
		end

	gsl_sf_lndoublefact (a_n: NATURAL): REAL is
 		-- gsl_sf_lndoublefact
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lndoublefact"
		}"
		end

	gsl_sf_lndoublefact_e (a_n: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lndoublefact_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lndoublefact_e"
		}"
		end

	gsl_sf_lnfact (a_n: NATURAL): REAL is
 		-- gsl_sf_lnfact
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnfact"
		}"
		end

	gsl_sf_lnfact_e (a_n: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lnfact_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnfact_e"
		}"
		end

	gsl_sf_lngamma (a_x: REAL): REAL is
 		-- gsl_sf_lngamma
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lngamma"
		}"
		end

	gsl_sf_lngamma_complex_e (a_zr: REAL; a_zi: REAL; a_lnr: POINTER; an_arg: POINTER): INTEGER is
 		-- gsl_sf_lngamma_complex_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lngamma_complex_e"
		}"
		end

	gsl_sf_lngamma_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lngamma_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lngamma_e"
		}"
		end

	gsl_sf_lngamma_sgn_e (a_x: REAL; a_result_lg: POINTER; a_sgn: POINTER): INTEGER is
 		-- gsl_sf_lngamma_sgn_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lngamma_sgn_e"
		}"
		end

	gsl_sf_lnpoch (an_a: REAL; a_x: REAL): REAL is
 		-- gsl_sf_lnpoch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnpoch"
		}"
		end

	gsl_sf_lnpoch_e (an_a: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_lnpoch_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnpoch_e"
		}"
		end

	gsl_sf_lnpoch_sgn_e (an_a: REAL; a_x: REAL; a_result: POINTER; a_sgn: POINTER): INTEGER is
 		-- gsl_sf_lnpoch_sgn_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_lnpoch_sgn_e"
		}"
		end

	gsl_sf_poch (an_a: REAL; a_x: REAL): REAL is
 		-- gsl_sf_poch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_poch"
		}"
		end

	gsl_sf_poch_e (an_a: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_poch_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_poch_e"
		}"
		end

	gsl_sf_pochrel (an_a: REAL; a_x: REAL): REAL is
 		-- gsl_sf_pochrel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_pochrel"
		}"
		end

	gsl_sf_pochrel_e (an_a: REAL; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_pochrel_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_pochrel_e"
		}"
		end

	gsl_sf_taylorcoeff (a_n: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_taylorcoeff
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_taylorcoeff"
		}"
		end

	gsl_sf_taylorcoeff_e (a_n: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_taylorcoeff_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_taylorcoeff_e"
		}"
		end


end -- class GSL_SF_GAMMA_EXTERNALS
