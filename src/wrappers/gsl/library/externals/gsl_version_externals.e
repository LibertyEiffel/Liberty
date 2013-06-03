-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VERSION_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_version: POINTER is
 		-- gsl_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_version"
		}"
		end

	address_of_gsl_version: POINTER is
 		-- Address of gsl_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_version"
		}"
		end

	set_gsl_version (a_value: POINTER) is
		-- Set variable gsl_version value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_version"
		}"
		end


end -- class GSL_VERSION_EXTERNALS
