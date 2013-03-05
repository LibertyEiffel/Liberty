-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_SYNCHROTRON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_sf_synchrotron_1 (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_synchrotron_1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_synchrotron_1"
		}"
		end

	gsl_sf_synchrotron_1_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_synchrotron_1_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_synchrotron_1_e"
		}"
		end

	gsl_sf_synchrotron_2 (a_x: REAL_64): REAL_64 is
 		-- gsl_sf_synchrotron_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_synchrotron_2"
		}"
		end

	gsl_sf_synchrotron_2_e (a_x: REAL_64; a_result: POINTER): INTEGER_32 is
 		-- gsl_sf_synchrotron_2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_synchrotron_2_e"
		}"
		end


end -- class GSL_SF_SYNCHROTRON_EXTERNALS
