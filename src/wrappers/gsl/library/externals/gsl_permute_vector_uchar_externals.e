-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTE_VECTOR_UCHAR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_permute_vector_uchar (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_uchar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_uchar"
		}"
		end

	gsl_permute_vector_uchar_inverse (a_p: POINTER; a_v: POINTER): INTEGER is
 		-- gsl_permute_vector_uchar_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_vector_uchar_inverse"
		}"
		end


end -- class GSL_PERMUTE_VECTOR_UCHAR_EXTERNALS
