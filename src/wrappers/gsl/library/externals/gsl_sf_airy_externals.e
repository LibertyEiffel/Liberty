-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_AIRY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_airy_ai (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Ai
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai"
		}"
		end

	gsl_sf_airy_ai_deriv (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Ai_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_deriv"
		}"
		end

	gsl_sf_airy_ai_deriv_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Ai_deriv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_deriv_e"
		}"
		end

	gsl_sf_airy_ai_deriv_scaled (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Ai_deriv_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_deriv_scaled"
		}"
		end

	gsl_sf_airy_ai_deriv_scaled_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Ai_deriv_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_deriv_scaled_e"
		}"
		end

	gsl_sf_airy_ai_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Ai_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_e"
		}"
		end

	gsl_sf_airy_ai_scaled (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Ai_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_scaled"
		}"
		end

	gsl_sf_airy_ai_scaled_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Ai_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Ai_scaled_e"
		}"
		end

	gsl_sf_airy_bi (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Bi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi"
		}"
		end

	gsl_sf_airy_bi_deriv (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Bi_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_deriv"
		}"
		end

	gsl_sf_airy_bi_deriv_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Bi_deriv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_deriv_e"
		}"
		end

	gsl_sf_airy_bi_deriv_scaled (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Bi_deriv_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_deriv_scaled"
		}"
		end

	gsl_sf_airy_bi_deriv_scaled_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Bi_deriv_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_deriv_scaled_e"
		}"
		end

	gsl_sf_airy_bi_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Bi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_e"
		}"
		end

	gsl_sf_airy_bi_scaled (a_x: REAL; a_mode: NATURAL): REAL is
 		-- gsl_sf_airy_Bi_scaled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_scaled"
		}"
		end

	gsl_sf_airy_bi_scaled_e (a_x: REAL; a_mode: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_Bi_scaled_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_Bi_scaled_e"
		}"
		end

	gsl_sf_airy_zero_ai (a_s: NATURAL): REAL is
 		-- gsl_sf_airy_zero_Ai
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Ai"
		}"
		end

	gsl_sf_airy_zero_ai_deriv (a_s: NATURAL): REAL is
 		-- gsl_sf_airy_zero_Ai_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Ai_deriv"
		}"
		end

	gsl_sf_airy_zero_ai_deriv_e (a_s: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_zero_Ai_deriv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Ai_deriv_e"
		}"
		end

	gsl_sf_airy_zero_ai_e (a_s: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_zero_Ai_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Ai_e"
		}"
		end

	gsl_sf_airy_zero_bi (a_s: NATURAL): REAL is
 		-- gsl_sf_airy_zero_Bi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Bi"
		}"
		end

	gsl_sf_airy_zero_bi_deriv (a_s: NATURAL): REAL is
 		-- gsl_sf_airy_zero_Bi_deriv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Bi_deriv"
		}"
		end

	gsl_sf_airy_zero_bi_deriv_e (a_s: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_zero_Bi_deriv_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Bi_deriv_e"
		}"
		end

	gsl_sf_airy_zero_bi_e (a_s: NATURAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_airy_zero_Bi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_airy_zero_Bi_e"
		}"
		end


end -- class GSL_SF_AIRY_EXTERNALS
