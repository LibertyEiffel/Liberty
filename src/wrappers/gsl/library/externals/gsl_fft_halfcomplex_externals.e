-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_HALFCOMPLEX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_fft_halfcomplex_backward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER): INTEGER_32 is
 		-- gsl_fft_halfcomplex_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_backward"
		}"
		end

	gsl_fft_halfcomplex_inverse (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER): INTEGER_32 is
 		-- gsl_fft_halfcomplex_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_inverse"
		}"
		end

	gsl_fft_halfcomplex_radix2_backward (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_halfcomplex_radix2_backward
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_radix2_backward"
		}"
		end

	gsl_fft_halfcomplex_radix2_inverse (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_halfcomplex_radix2_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_radix2_inverse"
		}"
		end

	gsl_fft_halfcomplex_radix2_transform (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_halfcomplex_radix2_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_radix2_transform"
		}"
		end

	gsl_fft_halfcomplex_radix2_unpack (a_halfcomplex_coefficient: POINTER; a_complex_coefficient: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_halfcomplex_radix2_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_radix2_unpack"
		}"
		end

	gsl_fft_halfcomplex_transform (a_data: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32; a_wavetable: POINTER; a_work: POINTER): INTEGER_32 is
 		-- gsl_fft_halfcomplex_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_transform"
		}"
		end

	gsl_fft_halfcomplex_unpack (a_halfcomplex_coefficient: POINTER; a_complex_coefficient: POINTER; a_stride: NATURAL_32; a_n: NATURAL_32): INTEGER_32 is
 		-- gsl_fft_halfcomplex_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_unpack"
		}"
		end

	gsl_fft_halfcomplex_wavetable_alloc (a_n: NATURAL_32): POINTER is
 		-- gsl_fft_halfcomplex_wavetable_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_alloc"
		}"
		end

	gsl_fft_halfcomplex_wavetable_free (a_wavetable: POINTER) is
 		-- gsl_fft_halfcomplex_wavetable_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_free"
		}"
		end


end -- class GSL_FFT_HALFCOMPLEX_EXTERNALS
