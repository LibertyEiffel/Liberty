-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_REAL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_fft_real_radix2_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_real_radix2_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_radix2_transform"
		}"
		end

	gsl_fft_real_transform (a_data: POINTER; a_stride: like size_t; a_n: like size_t; a_wavetable: POINTER; a_work: POINTER): INTEGER is
 		-- gsl_fft_real_transform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_transform"
		}"
		end

	gsl_fft_real_unpack (a_real_coefficient: POINTER; a_complex_coefficient: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_fft_real_unpack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_unpack"
		}"
		end

	gsl_fft_real_wavetable_alloc (a_n: like size_t): POINTER is
 		-- gsl_fft_real_wavetable_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_wavetable_alloc"
		}"
		end

	gsl_fft_real_wavetable_free (a_wavetable: POINTER) is
 		-- gsl_fft_real_wavetable_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_wavetable_free"
		}"
		end

	gsl_fft_real_workspace_alloc (a_n: like size_t): POINTER is
 		-- gsl_fft_real_workspace_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_workspace_alloc"
		}"
		end

	gsl_fft_real_workspace_free (a_workspace: POINTER) is
 		-- gsl_fft_real_workspace_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_real_workspace_free"
		}"
		end


end -- class GSL_FFT_REAL_EXTERNALS
