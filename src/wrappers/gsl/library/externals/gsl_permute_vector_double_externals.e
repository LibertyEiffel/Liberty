-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTE_VECTOR_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_permute_vector (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector"
		}"
		end

	gsl_permute_vector_inverse (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_inverse"
		}"
		end


end -- class GSL_PERMUTE_VECTOR_DOUBLE_EXTERNALS
