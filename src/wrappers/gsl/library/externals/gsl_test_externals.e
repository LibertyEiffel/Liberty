-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_TEST_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_test (a_status: INTEGER_32; a_test_description: POINTER) is
 		-- gsl_test (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test"
		}"
		end

	gsl_test_abs (a_result: REAL_64; an_expected: REAL_64; an_absolute_error: REAL_64; a_test_description: POINTER) is
 		-- gsl_test_abs (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_abs"
		}"
		end

	gsl_test_factor (a_result: REAL_64; an_expected: REAL_64; a_factor: REAL_64; a_test_description: POINTER) is
 		-- gsl_test_factor (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_factor"
		}"
		end

	gsl_test_int (a_result: INTEGER_32; an_expected: INTEGER_32; a_test_description: POINTER) is
 		-- gsl_test_int (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_int"
		}"
		end

	gsl_test_rel (a_result: REAL_64; an_expected: REAL_64; a_relative_error: REAL_64; a_test_description: POINTER) is
 		-- gsl_test_rel (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_rel"
		}"
		end

	gsl_test_str (a_result: POINTER; an_expected: POINTER; a_test_description: POINTER) is
 		-- gsl_test_str (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_str"
		}"
		end

	gsl_test_summary: INTEGER_32 is
 		-- gsl_test_summary
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_summary()"
		}"
		end

	gsl_test_verbose (a_verbose: INTEGER_32) is
 		-- gsl_test_verbose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_test_verbose"
		}"
		end


end -- class GSL_TEST_EXTERNALS
