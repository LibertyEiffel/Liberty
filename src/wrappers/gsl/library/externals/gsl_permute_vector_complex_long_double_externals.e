-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTE_VECTOR_COMPLEX_LONG_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_permute_vector_complex_long_double (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_complex_long_double
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_complex_long_double"
		}"
		end

	gsl_permute_vector_complex_long_double_inverse (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_complex_long_double_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_complex_long_double_inverse"
		}"
		end


end -- class GSL_PERMUTE_VECTOR_COMPLEX_LONG_DOUBLE_EXTERNALS
