-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_EXP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_exp (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_exp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp"
		}"
		end

	gsl_sf_exp_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_e"
		}"
		end

	gsl_sf_exp_e10_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_e10_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_e10_e"
		}"
		end

	gsl_sf_exp_err_e (a_x: REAL_64; a_dx: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_err_e"
		}"
		end

	gsl_sf_exp_err_e10_e (a_x: REAL_64; a_dx: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_err_e10_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_err_e10_e"
		}"
		end

	gsl_sf_exp_mult (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- gsl_sf_exp_mult
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_mult"
		}"
		end

	gsl_sf_exp_mult_e (a_x: REAL_64; a_y: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_mult_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_mult_e"
		}"
		end

	gsl_sf_exp_mult_e10_e (a_x: REAL_64; a_y: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_mult_e10_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_mult_e10_e"
		}"
		end

	gsl_sf_exp_mult_err_e (a_x: REAL_64; a_dx: REAL_64; a_y: REAL_64; a_dy: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_mult_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_mult_err_e"
		}"
		end

	gsl_sf_exp_mult_err_e10_e (a_x: REAL_64; a_dx: REAL_64; a_y: REAL_64; a_dy: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exp_mult_err_e10_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exp_mult_err_e10_e"
		}"
		end

	gsl_sf_expm1 (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_expm1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expm1"
		}"
		end

	gsl_sf_expm1_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_expm1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_expm1_e"
		}"
		end

	gsl_sf_exprel (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_exprel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel"
		}"
		end

	gsl_sf_exprel_2 (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_exprel_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel_2"
		}"
		end

	gsl_sf_exprel_2_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exprel_2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel_2_e"
		}"
		end

	gsl_sf_exprel_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exprel_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel_e"
		}"
		end

	gsl_sf_exprel_n (a_n: INTEGER_32; a_x: REAL_64): REAL_64 is
 		-- gsl_sf_exprel_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel_n"
		}"
		end

	gsl_sf_exprel_n_cf_e (a_n: REAL_64; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exprel_n_CF_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel_n_CF_e"
		}"
		end

	gsl_sf_exprel_n_e (a_n: INTEGER_32; a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_exprel_n_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_exprel_n_e"
		}"
		end


end -- class GSL_SF_EXP_EXTERNALS
