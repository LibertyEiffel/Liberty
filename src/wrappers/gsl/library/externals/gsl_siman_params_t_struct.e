-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SIMAN_PARAMS_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_siman_params_t_struct_set_n_tries (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for n_tries field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_n_tries"
		}"
		end

	gsl_siman_params_t_struct_set_iters_fixed_t (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for iters_fixed_T field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_iters_fixed_t"
		}"
		end

	gsl_siman_params_t_struct_set_step_size (a_structure: POINTER; a_value: REAL) is
			-- Setter for step_size field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_step_size"
		}"
		end

	gsl_siman_params_t_struct_set_k (a_structure: POINTER; a_value: REAL) is
			-- Setter for k field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_k"
		}"
		end

	gsl_siman_params_t_struct_set_t_initial (a_structure: POINTER; a_value: REAL) is
			-- Setter for t_initial field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_t_initial"
		}"
		end

	gsl_siman_params_t_struct_set_mu_t (a_structure: POINTER; a_value: REAL) is
			-- Setter for mu_t field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_mu_t"
		}"
		end

	gsl_siman_params_t_struct_set_t_min (a_structure: POINTER; a_value: REAL) is
			-- Setter for t_min field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_set_t_min"
		}"
		end

feature {} -- Low-level queries

	gsl_siman_params_t_struct_get_n_tries (a_structure: POINTER): INTEGER is
			-- Query for n_tries field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_n_tries"
		}"
		end

	gsl_siman_params_t_struct_get_iters_fixed_t (a_structure: POINTER): INTEGER is
			-- Query for iters_fixed_T field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_iters_fixed_t"
		}"
		end

	gsl_siman_params_t_struct_get_step_size (a_structure: POINTER): REAL is
			-- Query for step_size field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_step_size"
		}"
		end

	gsl_siman_params_t_struct_get_k (a_structure: POINTER): REAL is
			-- Query for k field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_k"
		}"
		end

	gsl_siman_params_t_struct_get_t_initial (a_structure: POINTER): REAL is
			-- Query for t_initial field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_t_initial"
		}"
		end

	gsl_siman_params_t_struct_get_mu_t (a_structure: POINTER): REAL is
			-- Query for mu_t field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_mu_t"
		}"
		end

	gsl_siman_params_t_struct_get_t_min (a_structure: POINTER): REAL is
			-- Query for t_min field of GSL_SIMAN_PARAMS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_siman_params_t_struct_get_t_min"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_siman_params_t"
		}"
		end

end -- class GSL_SIMAN_PARAMS_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

