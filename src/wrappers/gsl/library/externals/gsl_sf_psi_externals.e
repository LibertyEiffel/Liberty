-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_PSI_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_complex_psi_e (a_x: REAL_64; a_y: REAL_64; a_result_re: POINTER; a_result_im: POINTER): INTEGER_32 is
 		-- gsl_sf_complex_psi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_psi_e"
		}"
		end

	gsl_sf_psi (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_psi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi"
		}"
		end

	gsl_sf_psi_1 (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_psi_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1"
		}"
		end

	gsl_sf_psi_1_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_psi_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1_e"
		}"
		end

	gsl_sf_psi_1_int (a_n: INTEGER_32): REAL_64 is
 		-- gsl_sf_psi_1_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1_int"
		}"
		end

	gsl_sf_psi_1_int_e (a_n: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_psi_1_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1_int_e"
		}"
		end

	gsl_sf_psi_1piy (a_y: REAL_64): REAL_64 is
 		-- gsl_sf_psi_1piy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1piy"
		}"
		end

	gsl_sf_psi_1piy_e (a_y: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_psi_1piy_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1piy_e"
		}"
		end

	gsl_sf_psi_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_psi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_e"
		}"
		end

	gsl_sf_psi_int (a_n: INTEGER_32): REAL_64 is
 		-- gsl_sf_psi_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_int"
		}"
		end

	gsl_sf_psi_int_e (a_n: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_psi_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_int_e"
		}"
		end

	gsl_sf_psi_n (a_n: INTEGER_32; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_psi_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_n"
		}"
		end

	gsl_sf_psi_n_e (a_n: INTEGER_32; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_psi_n_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_n_e"
		}"
		end


end -- class GSL_SF_PSI_EXTERNALS
