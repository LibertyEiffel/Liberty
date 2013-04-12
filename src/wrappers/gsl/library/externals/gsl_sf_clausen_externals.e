-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_CLAUSEN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_clausen (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_clausen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_clausen"
		}"
		end

	gsl_sf_clausen_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_clausen_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_clausen_e"
		}"
		end


end -- class GSL_SF_CLAUSEN_EXTERNALS
