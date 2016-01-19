-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_ELLJAC_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_elljac_e (an_u: REAL; a_m: REAL; a_sn: POINTER; a_cn: POINTER; a_dn: POINTER): INTEGER is
 		-- gsl_sf_elljac_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_elljac_e"
		}"
		end


end -- class GSL_SF_ELLJAC_EXTERNALS
