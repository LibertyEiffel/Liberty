-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_COMPLEX_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_fft_complex_float_backward (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wavetable: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_fft_complex_float_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_backward"
		}"
		end

	gsl_fft_complex_float_forward (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wavetable: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_fft_complex_float_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_forward"
		}"
		end

	gsl_fft_complex_float_inverse (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wavetable: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_fft_complex_float_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_inverse"
		}"
		end

	gsl_fft_complex_float_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_fft_complex_float_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_memcpy"
		}"
		end

	gsl_fft_complex_float_radix2_backward (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_complex_float_radix2_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_backward"
		}"
		end

	gsl_fft_complex_float_radix2_dif_backward (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_complex_float_radix2_dif_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_dif_backward"
		}"
		end

	gsl_fft_complex_float_radix2_dif_forward (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_complex_float_radix2_dif_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_dif_forward"
		}"
		end

	gsl_fft_complex_float_radix2_dif_inverse (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_complex_float_radix2_dif_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_dif_inverse"
		}"
		end

	gsl_fft_complex_float_radix2_dif_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_sign: INTEGER): INTEGER is
 		-- gsl_fft_complex_float_radix2_dif_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_dif_transform"
		}"
		end

	gsl_fft_complex_float_radix2_forward (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_complex_float_radix2_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_forward"
		}"
		end

	gsl_fft_complex_float_radix2_inverse (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_complex_float_radix2_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_inverse"
		}"
		end

	gsl_fft_complex_float_radix2_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_sign: INTEGER): INTEGER is
 		-- gsl_fft_complex_float_radix2_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_radix2_transform"
		}"
		end

	gsl_fft_complex_float_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wavetable: POINTER; a_work: POINTER; a_sign: INTEGER): INTEGER is
 		-- gsl_fft_complex_float_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_float_transform"
		}"
		end

	gsl_fft_complex_wavetable_float_alloc (a_n: like size_t): POINTER is
 		-- gsl_fft_complex_wavetable_float_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_wavetable_float_alloc"
		}"
		end

	gsl_fft_complex_wavetable_float_free (a_wavetable: POINTER) is
 		-- gsl_fft_complex_wavetable_float_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_wavetable_float_free"
		}"
		end

	gsl_fft_complex_workspace_float_alloc (a_n: like size_t): POINTER is
 		-- gsl_fft_complex_workspace_float_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_float_alloc"
		}"
		end

	gsl_fft_complex_workspace_float_free (a_workspace: POINTER) is
 		-- gsl_fft_complex_workspace_float_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_float_free"
		}"
		end


end -- class GSL_FFT_COMPLEX_FLOAT_EXTERNALS
