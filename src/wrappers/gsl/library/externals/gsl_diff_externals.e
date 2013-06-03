-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_DIFF_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_diff_backward (a_f: POINTER; a_x: REAL; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_diff_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_diff_backward"
		}"
		end

	gsl_diff_central (a_f: POINTER; a_x: REAL; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_diff_central
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_diff_central"
		}"
		end

	gsl_diff_forward (a_f: POINTER; a_x: REAL; a_result: POINTER; an_abserr: POINTER): INTEGER is
 		-- gsl_diff_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_diff_forward"
		}"
		end


end -- class GSL_DIFF_EXTERNALS
