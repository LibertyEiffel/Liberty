-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_eigen_francis_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_size"
		}"
		end

	gsl_eigen_francis_workspace_struct_set_max_iterations (a_structure: POINTER; a_value: like size_t) is
			-- Setter for max_iterations field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_max_iterations"
		}"
		end

	gsl_eigen_francis_workspace_struct_set_n_iter (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n_iter field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_n_iter"
		}"
		end

	gsl_eigen_francis_workspace_struct_set_n_evals (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n_evals field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_n_evals"
		}"
		end

	gsl_eigen_francis_workspace_struct_set_compute_t (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for compute_t field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_compute_t"
		}"
		end

	gsl_eigen_francis_workspace_struct_set_h (a_structure: POINTER; a_value: POINTER) is
			-- Setter for H field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_h"
		}"
		end

	gsl_eigen_francis_workspace_struct_set_z (a_structure: POINTER; a_value: POINTER) is
			-- Setter for Z field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_set_z"
		}"
		end

feature {} -- Low-level queries

	gsl_eigen_francis_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_size"
		}"
		end

	gsl_eigen_francis_workspace_struct_get_max_iterations (a_structure: POINTER): like size_t is
			-- Query for max_iterations field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_max_iterations"
		}"
		end

	gsl_eigen_francis_workspace_struct_get_n_iter (a_structure: POINTER): like size_t is
			-- Query for n_iter field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_n_iter"
		}"
		end

	gsl_eigen_francis_workspace_struct_get_n_evals (a_structure: POINTER): like size_t is
			-- Query for n_evals field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_n_evals"
		}"
		end

	gsl_eigen_francis_workspace_struct_get_compute_t (a_structure: POINTER): INTEGER is
			-- Query for compute_t field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_compute_t"
		}"
		end

	gsl_eigen_francis_workspace_struct_get_h (a_structure: POINTER): POINTER is
			-- Query for H field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_h"
		}"
		end

	gsl_eigen_francis_workspace_struct_get_z (a_structure: POINTER): POINTER is
			-- Query for Z field of GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_francis_workspace_struct_get_z"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_eigen_francis_workspace"
		}"
		end

end -- class GSL_EIGEN_FRANCIS_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

