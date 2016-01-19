-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_fft_halfcomplex_wavetable_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_set_n"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_set_nf (a_structure: POINTER; a_value: like size_t) is
			-- Setter for nf field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_set_nf"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_set_factor (a_structure: POINTER; a_value: POINTER) is
			-- Setter for factor field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_set_factor"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_set_twiddle (a_structure: POINTER; a_value: POINTER) is
			-- Setter for twiddle field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_set_twiddle"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_set_trig (a_structure: POINTER; a_value: POINTER) is
			-- Setter for trig field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_set_trig"
		}"
		end

feature {} -- Low-level queries

	gsl_fft_halfcomplex_wavetable_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_get_n"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_get_nf (a_structure: POINTER): like size_t is
			-- Query for nf field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_get_nf"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_get_factor (a_structure: POINTER): POINTER is
			-- Query for factor field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_get_factor"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_get_twiddle (a_structure: POINTER): POINTER is
			-- Query for twiddle field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_get_twiddle"
		}"
		end

	gsl_fft_halfcomplex_wavetable_struct_get_trig (a_structure: POINTER): POINTER is
			-- Query for trig field of GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_halfcomplex_wavetable_struct_get_trig"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_fft_halfcomplex_wavetable"
		}"
		end

end -- class GSL_FFT_HALFCOMPLEX_WAVETABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

