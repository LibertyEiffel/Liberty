-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_DFT_COMPLEX_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_dft_complex_float_backward (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_result: POINTER): INTEGER is
 		-- gsl_dft_complex_float_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_float_backward"
		}"
		end

	gsl_dft_complex_float_forward (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_result: POINTER): INTEGER is
 		-- gsl_dft_complex_float_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_float_forward"
		}"
		end

	gsl_dft_complex_float_inverse (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_result: POINTER): INTEGER is
 		-- gsl_dft_complex_float_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_float_inverse"
		}"
		end

	gsl_dft_complex_float_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_result: POINTER; a_sign: INTEGER): INTEGER is
 		-- gsl_dft_complex_float_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_float_transform"
		}"
		end


end -- class GSL_DFT_COMPLEX_FLOAT_EXTERNALS
