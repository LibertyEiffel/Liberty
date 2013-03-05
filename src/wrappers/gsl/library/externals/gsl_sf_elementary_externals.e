-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_ELEMENTARY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_multiply (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- gsl_sf_multiply
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_multiply"
		}"
		end

	gsl_sf_multiply_e (a_x: REAL_64; a_y: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_multiply_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_multiply_e"
		}"
		end

	gsl_sf_multiply_err_e (a_x: REAL_64; a_dx: REAL_64; a_y: REAL_64; a_dy: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_multiply_err_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_multiply_err_e"
		}"
		end


end -- class GSL_SF_ELEMENTARY_EXTERNALS
