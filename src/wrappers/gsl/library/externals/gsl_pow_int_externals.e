-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_POW_INT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_pow_2 (a_x: REAL): REAL is
 		-- gsl_pow_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_2"
		}"
		end

	gsl_pow_3 (a_x: REAL): REAL is
 		-- gsl_pow_3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_3"
		}"
		end

	gsl_pow_4 (a_x: REAL): REAL is
 		-- gsl_pow_4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_4"
		}"
		end

	gsl_pow_5 (a_x: REAL): REAL is
 		-- gsl_pow_5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_5"
		}"
		end

	gsl_pow_6 (a_x: REAL): REAL is
 		-- gsl_pow_6
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_6"
		}"
		end

	gsl_pow_7 (a_x: REAL): REAL is
 		-- gsl_pow_7
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_7"
		}"
		end

	gsl_pow_8 (a_x: REAL): REAL is
 		-- gsl_pow_8
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_8"
		}"
		end

	gsl_pow_9 (a_x: REAL): REAL is
 		-- gsl_pow_9
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_9"
		}"
		end

	gsl_pow_int (a_x: REAL; a_n: INTEGER): REAL is
 		-- gsl_pow_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_int"
		}"
		end

	gsl_pow_uint (a_x: REAL; a_n: NATURAL): REAL is
 		-- gsl_pow_uint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_pow_uint"
		}"
		end


end -- class GSL_POW_INT_EXTERNALS
