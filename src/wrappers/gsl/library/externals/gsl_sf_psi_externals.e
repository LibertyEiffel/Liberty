-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_PSI_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_complex_psi_e (a_x: REAL; a_y: REAL; a_result_re: POINTER; a_result_im: POINTER): INTEGER is
 		-- gsl_sf_complex_psi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_complex_psi_e"
		}"
		end

	gsl_sf_psi (a_x: REAL): REAL is
 		-- gsl_sf_psi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi"
		}"
		end

	gsl_sf_psi_1 (a_x: REAL): REAL is
 		-- gsl_sf_psi_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1"
		}"
		end

	gsl_sf_psi_1_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_psi_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1_e"
		}"
		end

	gsl_sf_psi_1_int (a_n: INTEGER): REAL is
 		-- gsl_sf_psi_1_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1_int"
		}"
		end

	gsl_sf_psi_1_int_e (a_n: INTEGER; a_result: POINTER): INTEGER is
 		-- gsl_sf_psi_1_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1_int_e"
		}"
		end

	gsl_sf_psi_1piy (a_y: REAL): REAL is
 		-- gsl_sf_psi_1piy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1piy"
		}"
		end

	gsl_sf_psi_1piy_e (a_y: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_psi_1piy_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_1piy_e"
		}"
		end

	gsl_sf_psi_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_psi_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_e"
		}"
		end

	gsl_sf_psi_int (a_n: INTEGER): REAL is
 		-- gsl_sf_psi_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_int"
		}"
		end

	gsl_sf_psi_int_e (a_n: INTEGER; a_result: POINTER): INTEGER is
 		-- gsl_sf_psi_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_int_e"
		}"
		end

	gsl_sf_psi_n (a_n: INTEGER; a_x: REAL): REAL is
 		-- gsl_sf_psi_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_n"
		}"
		end

	gsl_sf_psi_n_e (a_n: INTEGER; a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_psi_n_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_psi_n_e"
		}"
		end


end -- class GSL_SF_PSI_EXTERNALS
