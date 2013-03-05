-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_DFT_COMPLEX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_dft_complex_backward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_dft_complex_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_backward"
		}"
		end

	gsl_dft_complex_forward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_dft_complex_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_forward"
		}"
		end

	gsl_dft_complex_inverse (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_result: POINTER): INTEGER_32 is
 		-- gsl_dft_complex_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_inverse"
		}"
		end

	gsl_dft_complex_transform (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_result: POINTER; a_sign: INTEGER): INTEGER_32 is
 		-- gsl_dft_complex_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dft_complex_transform"
		}"
		end


end -- class GSL_DFT_COMPLEX_EXTERNALS
