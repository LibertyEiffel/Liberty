-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_TRANSPORT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_sf_transport_2 (a_x: REAL): REAL is
 		-- gsl_sf_transport_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_2"
		}"
		end

	gsl_sf_transport_2_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_transport_2_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_2_e"
		}"
		end

	gsl_sf_transport_3 (a_x: REAL): REAL is
 		-- gsl_sf_transport_3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_3"
		}"
		end

	gsl_sf_transport_3_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_transport_3_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_3_e"
		}"
		end

	gsl_sf_transport_4 (a_x: REAL): REAL is
 		-- gsl_sf_transport_4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_4"
		}"
		end

	gsl_sf_transport_4_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_transport_4_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_4_e"
		}"
		end

	gsl_sf_transport_5 (a_x: REAL): REAL is
 		-- gsl_sf_transport_5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_5"
		}"
		end

	gsl_sf_transport_5_e (a_x: REAL; a_result: POINTER): INTEGER is
 		-- gsl_sf_transport_5_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_transport_5_e"
		}"
		end


end -- class GSL_SF_TRANSPORT_EXTERNALS
