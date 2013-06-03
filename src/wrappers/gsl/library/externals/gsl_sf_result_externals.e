-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_RESULT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_result_smash_e (a_re: POINTER; a_r: POINTER): INTEGER is
 		-- gsl_sf_result_smash_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_smash_e"
		}"
		end


end -- class GSL_SF_RESULT_EXTERNALS
