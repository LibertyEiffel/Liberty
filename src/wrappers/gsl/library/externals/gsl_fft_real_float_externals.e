-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_REAL_FLOAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_fft_real_float_radix2_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_real_float_radix2_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_float_radix2_transform"
		}"
		end

	gsl_fft_real_float_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wavetable: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_fft_real_float_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_float_transform"
		}"
		end

	gsl_fft_real_float_unpack (a_real_float_coefficient: POINTER; a_complex_coefficient: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_real_float_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_float_unpack"
		}"
		end

	gsl_fft_real_wavetable_float_alloc (a_n: like size_t): POINTER is
 		-- gsl_fft_real_wavetable_float_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_wavetable_float_alloc"
		}"
		end

	gsl_fft_real_wavetable_float_free (a_wavetable: POINTER) is
 		-- gsl_fft_real_wavetable_float_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_wavetable_float_free"
		}"
		end

	gsl_fft_real_workspace_float_alloc (a_n: like size_t): POINTER is
 		-- gsl_fft_real_workspace_float_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_workspace_float_alloc"
		}"
		end

	gsl_fft_real_workspace_float_free (a_workspace: POINTER) is
 		-- gsl_fft_real_workspace_float_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_workspace_float_free"
		}"
		end


end -- class GSL_FFT_REAL_FLOAT_EXTERNALS
