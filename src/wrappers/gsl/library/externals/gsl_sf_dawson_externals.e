-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_DAWSON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_dawson (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_dawson
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_dawson"
		}"
		end

	gsl_sf_dawson_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_dawson_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_dawson_e"
		}"
		end


end -- class GSL_SF_DAWSON_EXTERNALS
