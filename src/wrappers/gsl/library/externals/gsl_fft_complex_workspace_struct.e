-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FFT_COMPLEX_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_fft_complex_workspace_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_FFT_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_struct_set_n"
		}"
		end

	gsl_fft_complex_workspace_struct_set_scratch (a_structure: POINTER; a_value: POINTER) is
			-- Setter for scratch field of GSL_FFT_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_struct_set_scratch"
		}"
		end

feature {} -- Low-level queries

	gsl_fft_complex_workspace_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_FFT_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_struct_get_n"
		}"
		end

	gsl_fft_complex_workspace_struct_get_scratch (a_structure: POINTER): POINTER is
			-- Query for scratch field of GSL_FFT_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_fft_complex_workspace_struct_get_scratch"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_fft_complex_workspace"
		}"
		end

end -- class GSL_FFT_COMPLEX_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

