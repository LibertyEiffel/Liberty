-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_CHECK_RANGE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_check_range: INTEGER is
 		-- gsl_check_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_check_range"
		}"
		end

	address_of_gsl_check_range: POINTER is
 		-- Address of gsl_check_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_check_range"
		}"
		end

	set_gsl_check_range (a_value: INTEGER) is
		-- Set variable gsl_check_range value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_check_range"
		}"
		end


end -- class GSL_CHECK_RANGE_EXTERNALS
