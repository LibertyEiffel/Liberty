-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_MISER_STATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_monte_miser_state_struct_set_min_calls (a_structure: POINTER; a_value: like size_t) is
			-- Setter for min_calls field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_min_calls"
		}"
		end

	gsl_monte_miser_state_struct_set_min_calls_per_bisection (a_structure: POINTER; a_value: like size_t) is
			-- Setter for min_calls_per_bisection field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_min_calls_per_bisection"
		}"
		end

	gsl_monte_miser_state_struct_set_dither (a_structure: POINTER; a_value: REAL) is
			-- Setter for dither field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_dither"
		}"
		end

	gsl_monte_miser_state_struct_set_estimate_frac (a_structure: POINTER; a_value: REAL) is
			-- Setter for estimate_frac field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_estimate_frac"
		}"
		end

	gsl_monte_miser_state_struct_set_alpha (a_structure: POINTER; a_value: REAL) is
			-- Setter for alpha field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_alpha"
		}"
		end

	gsl_monte_miser_state_struct_set_dim (a_structure: POINTER; a_value: like size_t) is
			-- Setter for dim field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_dim"
		}"
		end

	gsl_monte_miser_state_struct_set_estimate_style (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for estimate_style field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_estimate_style"
		}"
		end

	gsl_monte_miser_state_struct_set_depth (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for depth field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_depth"
		}"
		end

	gsl_monte_miser_state_struct_set_verbose (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for verbose field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_verbose"
		}"
		end

	gsl_monte_miser_state_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_x"
		}"
		end

	gsl_monte_miser_state_struct_set_xmid (a_structure: POINTER; a_value: POINTER) is
			-- Setter for xmid field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_xmid"
		}"
		end

	gsl_monte_miser_state_struct_set_sigma_l (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sigma_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_sigma_l"
		}"
		end

	gsl_monte_miser_state_struct_set_sigma_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sigma_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_sigma_r"
		}"
		end

	gsl_monte_miser_state_struct_set_fmax_l (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fmax_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fmax_l"
		}"
		end

	gsl_monte_miser_state_struct_set_fmax_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fmax_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fmax_r"
		}"
		end

	gsl_monte_miser_state_struct_set_fmin_l (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fmin_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fmin_l"
		}"
		end

	gsl_monte_miser_state_struct_set_fmin_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fmin_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fmin_r"
		}"
		end

	gsl_monte_miser_state_struct_set_fsum_l (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fsum_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fsum_l"
		}"
		end

	gsl_monte_miser_state_struct_set_fsum_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fsum_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fsum_r"
		}"
		end

	gsl_monte_miser_state_struct_set_fsum2_l (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fsum2_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fsum2_l"
		}"
		end

	gsl_monte_miser_state_struct_set_fsum2_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fsum2_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_fsum2_r"
		}"
		end

	gsl_monte_miser_state_struct_set_hits_l (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hits_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_hits_l"
		}"
		end

	gsl_monte_miser_state_struct_set_hits_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hits_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_set_hits_r"
		}"
		end

feature {} -- Low-level queries

	gsl_monte_miser_state_struct_get_min_calls (a_structure: POINTER): like size_t is
			-- Query for min_calls field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_min_calls"
		}"
		end

	gsl_monte_miser_state_struct_get_min_calls_per_bisection (a_structure: POINTER): like size_t is
			-- Query for min_calls_per_bisection field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_min_calls_per_bisection"
		}"
		end

	gsl_monte_miser_state_struct_get_dither (a_structure: POINTER): REAL is
			-- Query for dither field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_dither"
		}"
		end

	gsl_monte_miser_state_struct_get_estimate_frac (a_structure: POINTER): REAL is
			-- Query for estimate_frac field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_estimate_frac"
		}"
		end

	gsl_monte_miser_state_struct_get_alpha (a_structure: POINTER): REAL is
			-- Query for alpha field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_alpha"
		}"
		end

	gsl_monte_miser_state_struct_get_dim (a_structure: POINTER): like size_t is
			-- Query for dim field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_dim"
		}"
		end

	gsl_monte_miser_state_struct_get_estimate_style (a_structure: POINTER): INTEGER is
			-- Query for estimate_style field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_estimate_style"
		}"
		end

	gsl_monte_miser_state_struct_get_depth (a_structure: POINTER): INTEGER is
			-- Query for depth field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_depth"
		}"
		end

	gsl_monte_miser_state_struct_get_verbose (a_structure: POINTER): INTEGER is
			-- Query for verbose field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_verbose"
		}"
		end

	gsl_monte_miser_state_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_x"
		}"
		end

	gsl_monte_miser_state_struct_get_xmid (a_structure: POINTER): POINTER is
			-- Query for xmid field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_xmid"
		}"
		end

	gsl_monte_miser_state_struct_get_sigma_l (a_structure: POINTER): POINTER is
			-- Query for sigma_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_sigma_l"
		}"
		end

	gsl_monte_miser_state_struct_get_sigma_r (a_structure: POINTER): POINTER is
			-- Query for sigma_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_sigma_r"
		}"
		end

	gsl_monte_miser_state_struct_get_fmax_l (a_structure: POINTER): POINTER is
			-- Query for fmax_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fmax_l"
		}"
		end

	gsl_monte_miser_state_struct_get_fmax_r (a_structure: POINTER): POINTER is
			-- Query for fmax_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fmax_r"
		}"
		end

	gsl_monte_miser_state_struct_get_fmin_l (a_structure: POINTER): POINTER is
			-- Query for fmin_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fmin_l"
		}"
		end

	gsl_monte_miser_state_struct_get_fmin_r (a_structure: POINTER): POINTER is
			-- Query for fmin_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fmin_r"
		}"
		end

	gsl_monte_miser_state_struct_get_fsum_l (a_structure: POINTER): POINTER is
			-- Query for fsum_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fsum_l"
		}"
		end

	gsl_monte_miser_state_struct_get_fsum_r (a_structure: POINTER): POINTER is
			-- Query for fsum_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fsum_r"
		}"
		end

	gsl_monte_miser_state_struct_get_fsum2_l (a_structure: POINTER): POINTER is
			-- Query for fsum2_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fsum2_l"
		}"
		end

	gsl_monte_miser_state_struct_get_fsum2_r (a_structure: POINTER): POINTER is
			-- Query for fsum2_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_fsum2_r"
		}"
		end

	gsl_monte_miser_state_struct_get_hits_l (a_structure: POINTER): POINTER is
			-- Query for hits_l field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_hits_l"
		}"
		end

	gsl_monte_miser_state_struct_get_hits_r (a_structure: POINTER): POINTER is
			-- Query for hits_r field of GSL_MONTE_MISER_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_miser_state_struct_get_hits_r"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_monte_miser_state"
		}"
		end

end -- class GSL_MONTE_MISER_STATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

