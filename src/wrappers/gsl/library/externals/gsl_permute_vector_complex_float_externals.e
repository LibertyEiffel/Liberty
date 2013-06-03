-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTE_VECTOR_COMPLEX_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_permute_vector_complex_float (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_complex_float
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_complex_float"
		}"
		end

	gsl_permute_vector_complex_float_inverse (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_complex_float_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_complex_float_inverse"
		}"
		end


end -- class GSL_PERMUTE_VECTOR_COMPLEX_FLOAT_EXTERNALS
