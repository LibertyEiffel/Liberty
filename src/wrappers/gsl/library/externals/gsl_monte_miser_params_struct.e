-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_MISER_PARAMS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_monte_miser_params_struct_set_estimate_frac (a_structure: POINTER; a_value: REAL) is
			-- Setter for estimate_frac field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_set_estimate_frac"
		}"
		end

	gsl_monte_miser_params_struct_set_min_calls (a_structure: POINTER; a_value: like size_t) is
			-- Setter for min_calls field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_set_min_calls"
		}"
		end

	gsl_monte_miser_params_struct_set_min_calls_per_bisection (a_structure: POINTER; a_value: like size_t) is
			-- Setter for min_calls_per_bisection field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_set_min_calls_per_bisection"
		}"
		end

	gsl_monte_miser_params_struct_set_alpha (a_structure: POINTER; a_value: REAL) is
			-- Setter for alpha field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_set_alpha"
		}"
		end

	gsl_monte_miser_params_struct_set_dither (a_structure: POINTER; a_value: REAL) is
			-- Setter for dither field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_set_dither"
		}"
		end

feature {} -- Low-level queries

	gsl_monte_miser_params_struct_get_estimate_frac (a_structure: POINTER): REAL is
			-- Query for estimate_frac field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_get_estimate_frac"
		}"
		end

	gsl_monte_miser_params_struct_get_min_calls (a_structure: POINTER): like size_t is
			-- Query for min_calls field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_get_min_calls"
		}"
		end

	gsl_monte_miser_params_struct_get_min_calls_per_bisection (a_structure: POINTER): like size_t is
			-- Query for min_calls_per_bisection field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_get_min_calls_per_bisection"
		}"
		end

	gsl_monte_miser_params_struct_get_alpha (a_structure: POINTER): REAL is
			-- Query for alpha field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_get_alpha"
		}"
		end

	gsl_monte_miser_params_struct_get_dither (a_structure: POINTER): REAL is
			-- Query for dither field of GSL_MONTE_MISER_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_params_struct_get_dither"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_monte_miser_params"
		}"
		end

end -- class GSL_MONTE_MISER_PARAMS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

