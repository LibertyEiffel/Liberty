-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_EXPINT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_atanint (a_x: REAL): REAL is
 		-- gsl_sf_atanint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_atanint"
		}"
		end

	gsl_sf_atanint_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_atanint_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_atanint_e"
		}"
		end

	gsl_sf_chi (a_x: REAL): REAL is
 		-- gsl_sf_Chi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Chi"
		}"
		end

	gsl_sf_chi_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_Chi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Chi_e"
		}"
		end

	gsl_sf_ci (a_x: REAL): REAL is
 		-- gsl_sf_Ci
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Ci"
		}"
		end

	gsl_sf_ci_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_Ci_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Ci_e"
		}"
		end

	gsl_sf_expint_3 (a_x: REAL): REAL is
 		-- gsl_sf_expint_3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_3"
		}"
		end

	gsl_sf_expint_3_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_3_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_3_e"
		}"
		end

	gsl_sf_expint_e1 (a_x: REAL): REAL is
 		-- gsl_sf_expint_E1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E1"
		}"
		end

	gsl_sf_expint_e1_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_E1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E1_e"
		}"
		end

	gsl_sf_expint_e1_scaled (a_x: REAL): REAL is
 		-- gsl_sf_expint_E1_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E1_scaled"
		}"
		end

	gsl_sf_expint_e1_scaled_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_E1_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E1_scaled_e"
		}"
		end

	gsl_sf_expint_e2 (a_x: REAL): REAL is
 		-- gsl_sf_expint_E2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E2"
		}"
		end

	gsl_sf_expint_e2_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_E2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E2_e"
		}"
		end

	gsl_sf_expint_e2_scaled (a_x: REAL): REAL is
 		-- gsl_sf_expint_E2_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E2_scaled"
		}"
		end

	gsl_sf_expint_e2_scaled_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_E2_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_E2_scaled_e"
		}"
		end

	gsl_sf_expint_ei (a_x: REAL): REAL is
 		-- gsl_sf_expint_Ei
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_Ei"
		}"
		end

	gsl_sf_expint_ei_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_Ei_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_Ei_e"
		}"
		end

	gsl_sf_expint_ei_scaled (a_x: REAL): REAL is
 		-- gsl_sf_expint_Ei_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_Ei_scaled"
		}"
		end

	gsl_sf_expint_ei_scaled_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_Ei_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_Ei_scaled_e"
		}"
		end

	gsl_sf_expint_en (a_n: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_expint_En
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_En"
		}"
		end

	gsl_sf_expint_en_e (a_n: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_En_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_En_e"
		}"
		end

	gsl_sf_expint_en_scaled (a_n: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_expint_En_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_En_scaled"
		}"
		end

	gsl_sf_expint_en_scaled_e (a_n: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_expint_En_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expint_En_scaled_e"
		}"
		end

	gsl_sf_shi (a_x: REAL): REAL is
 		-- gsl_sf_Shi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Shi"
		}"
		end

	gsl_sf_shi_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_Shi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Shi_e"
		}"
		end

	gsl_sf_si (a_x: REAL): REAL is
 		-- gsl_sf_Si
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Si"
		}"
		end

	gsl_sf_si_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_Si_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_Si_e"
		}"
		end


end -- class GSL_SF_EXPINT_EXTERNALS
