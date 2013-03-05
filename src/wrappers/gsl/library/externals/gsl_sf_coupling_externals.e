-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_COUPLING_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_coupling_3j (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_ma: INTEGER_32; a_two_mb: INTEGER_32; a_two_mc: INTEGER_32): REAL_64 is
 		-- gsl_sf_coupling_3j
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_3j"
		}"
		end

	gsl_sf_coupling_3j_e (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_ma: INTEGER_32; a_two_mb: INTEGER_32; a_two_mc: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_coupling_3j_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_3j_e"
		}"
		end

	gsl_sf_coupling_6j (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32): REAL_64 is
 		-- gsl_sf_coupling_6j
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_6j"
		}"
		end

	gsl_sf_coupling_6j_e (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_coupling_6j_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_6j_e"
		}"
		end

	gsl_sf_coupling_6j_incorrect (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32): REAL_64 is
 		-- gsl_sf_coupling_6j_INCORRECT
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_6j_INCORRECT"
		}"
		end

	gsl_sf_coupling_6j_incorrect_e (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_coupling_6j_INCORRECT_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_6j_INCORRECT_e"
		}"
		end

	gsl_sf_coupling_9j (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32; a_two_jg: INTEGER_32; a_two_jh: INTEGER_32; a_two_ji: INTEGER_32): REAL_64 is
 		-- gsl_sf_coupling_9j
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_9j"
		}"
		end

	gsl_sf_coupling_9j_e (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32; a_two_jg: INTEGER_32; a_two_jh: INTEGER_32; a_two_ji: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_coupling_9j_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_9j_e"
		}"
		end

	gsl_sf_coupling_racah_w (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32): REAL_64 is
 		-- gsl_sf_coupling_RacahW
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_RacahW"
		}"
		end

	gsl_sf_coupling_racah_w_e (a_two_ja: INTEGER_32; a_two_jb: INTEGER_32; a_two_jc: INTEGER_32; a_two_jd: INTEGER_32; a_two_je: INTEGER_32; a_two_jf: INTEGER_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_coupling_RacahW_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_coupling_RacahW_e"
		}"
		end


end -- class GSL_SF_COUPLING_EXTERNALS
