-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_COMPLEX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_fft_complex_backward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER): INTEGER_32 is
 		-- gsl_fft_complex_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_backward"
		}"
		end

	gsl_fft_complex_forward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER): INTEGER_32 is
 		-- gsl_fft_complex_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_forward"
		}"
		end

	gsl_fft_complex_inverse (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER): INTEGER_32 is
 		-- gsl_fft_complex_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_inverse"
		}"
		end

	gsl_fft_complex_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER_32 is
 		-- gsl_fft_complex_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_memcpy"
		}"
		end

	gsl_fft_complex_radix2_backward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_complex_radix2_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_backward"
		}"
		end

	gsl_fft_complex_radix2_dif_backward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_complex_radix2_dif_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_dif_backward"
		}"
		end

	gsl_fft_complex_radix2_dif_forward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_complex_radix2_dif_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_dif_forward"
		}"
		end

	gsl_fft_complex_radix2_dif_inverse (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_complex_radix2_dif_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_dif_inverse"
		}"
		end

	gsl_fft_complex_radix2_dif_transform (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_sign: INTEGER): INTEGER_32 is
 		-- gsl_fft_complex_radix2_dif_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_dif_transform"
		}"
		end

	gsl_fft_complex_radix2_forward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_complex_radix2_forward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_forward"
		}"
		end

	gsl_fft_complex_radix2_inverse (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_complex_radix2_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_inverse"
		}"
		end

	gsl_fft_complex_radix2_transform (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_sign: INTEGER): INTEGER_32 is
 		-- gsl_fft_complex_radix2_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_radix2_transform"
		}"
		end

	gsl_fft_complex_transform (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER; a_sign: INTEGER): INTEGER_32 is
 		-- gsl_fft_complex_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_transform"
		}"
		end

	gsl_fft_complex_wavetable_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_fft_complex_wavetable_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_wavetable_alloc"
		}"
		end

	gsl_fft_complex_wavetable_free (a_wavetable: POINTER) is
 		-- gsl_fft_complex_wavetable_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_wavetable_free"
		}"
		end

	gsl_fft_complex_workspace_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_fft_complex_workspace_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_alloc"
		}"
		end

	gsl_fft_complex_workspace_free (a_workspace: POINTER) is
 		-- gsl_fft_complex_workspace_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_free"
		}"
		end


end -- class GSL_FFT_COMPLEX_EXTERNALS
