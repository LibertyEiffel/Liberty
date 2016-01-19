-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_eigen_nonsymm_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_size"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_set_diag (a_structure: POINTER; a_value: POINTER) is
			-- Setter for diag field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_diag"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_set_tau (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tau field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_tau"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_set_z (a_structure: POINTER; a_value: POINTER) is
			-- Setter for Z field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_z"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_set_do_balance (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for do_balance field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_do_balance"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_set_n_evals (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n_evals field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_n_evals"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_set_francis_workspace_p (a_structure: POINTER; a_value: POINTER) is
			-- Setter for francis_workspace_p field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_set_francis_workspace_p"
		}"
		end

feature {} -- Low-level queries

	gsl_eigen_nonsymm_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_size"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_get_diag (a_structure: POINTER): POINTER is
			-- Query for diag field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_diag"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_get_tau (a_structure: POINTER): POINTER is
			-- Query for tau field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_tau"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_get_z (a_structure: POINTER): POINTER is
			-- Query for Z field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_z"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_get_do_balance (a_structure: POINTER): INTEGER is
			-- Query for do_balance field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_do_balance"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_get_n_evals (a_structure: POINTER): like size_t is
			-- Query for n_evals field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_n_evals"
		}"
		end

	gsl_eigen_nonsymm_workspace_struct_get_francis_workspace_p (a_structure: POINTER): POINTER is
			-- Query for francis_workspace_p field of GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymm_workspace_struct_get_francis_workspace_p"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_eigen_nonsymm_workspace"
		}"
		end

end -- class GSL_EIGEN_NONSYMM_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

