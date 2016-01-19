-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_POW_INT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_pow_int (a_x: REAL; a_n: INTEGER): REAL is
 		-- gsl_sf_pow_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_pow_int"
		}"
		end

	gsl_sf_pow_int_e (a_x: REAL; a_n: INTEGER; a_result: POINTER): INTEGER is
 		-- gsl_sf_pow_int_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_pow_int_e"
		}"
		end


end -- class GSL_SF_POW_INT_EXTERNALS
