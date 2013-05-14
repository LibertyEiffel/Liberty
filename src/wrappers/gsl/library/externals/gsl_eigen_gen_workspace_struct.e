-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_EIGEN_GEN_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_eigen_gen_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_size"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_work (a_structure: POINTER; a_value: POINTER) is
			-- Setter for work field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_work"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_n_evals (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n_evals field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_n_evals"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_max_iterations (a_structure: POINTER; a_value: like size_t) is
			-- Setter for max_iterations field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_max_iterations"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_n_iter (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n_iter field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_n_iter"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_eshift (a_structure: POINTER; a_value: REAL) is
			-- Setter for eshift field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_eshift"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_needtop (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for needtop field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_needtop"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_atol (a_structure: POINTER; a_value: REAL) is
			-- Setter for atol field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_atol"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_btol (a_structure: POINTER; a_value: REAL) is
			-- Setter for btol field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_btol"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_ascale (a_structure: POINTER; a_value: REAL) is
			-- Setter for ascale field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_ascale"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_bscale (a_structure: POINTER; a_value: REAL) is
			-- Setter for bscale field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_bscale"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_h (a_structure: POINTER; a_value: POINTER) is
			-- Setter for H field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_h"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_r (a_structure: POINTER; a_value: POINTER) is
			-- Setter for R field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_r"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_compute_s (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for compute_s field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_compute_s"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_compute_t (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for compute_t field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_compute_t"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_q (a_structure: POINTER; a_value: POINTER) is
			-- Setter for Q field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_q"
		}"
		end

	gsl_eigen_gen_workspace_struct_set_z (a_structure: POINTER; a_value: POINTER) is
			-- Setter for Z field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_set_z"
		}"
		end

feature {} -- Low-level queries

	gsl_eigen_gen_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_size"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_work (a_structure: POINTER): POINTER is
			-- Query for work field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_work"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_n_evals (a_structure: POINTER): like size_t is
			-- Query for n_evals field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_n_evals"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_max_iterations (a_structure: POINTER): like size_t is
			-- Query for max_iterations field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_max_iterations"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_n_iter (a_structure: POINTER): like size_t is
			-- Query for n_iter field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_n_iter"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_eshift (a_structure: POINTER): REAL is
			-- Query for eshift field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_eshift"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_needtop (a_structure: POINTER): INTEGER is
			-- Query for needtop field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_needtop"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_atol (a_structure: POINTER): REAL is
			-- Query for atol field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_atol"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_btol (a_structure: POINTER): REAL is
			-- Query for btol field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_btol"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_ascale (a_structure: POINTER): REAL is
			-- Query for ascale field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_ascale"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_bscale (a_structure: POINTER): REAL is
			-- Query for bscale field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_bscale"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_h (a_structure: POINTER): POINTER is
			-- Query for H field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_h"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_r (a_structure: POINTER): POINTER is
			-- Query for R field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_r"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_compute_s (a_structure: POINTER): INTEGER is
			-- Query for compute_s field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_compute_s"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_compute_t (a_structure: POINTER): INTEGER is
			-- Query for compute_t field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_compute_t"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_q (a_structure: POINTER): POINTER is
			-- Query for Q field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_q"
		}"
		end

	gsl_eigen_gen_workspace_struct_get_z (a_structure: POINTER): POINTER is
			-- Query for Z field of GSL_EIGEN_GEN_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_gen_workspace_struct_get_z"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_eigen_gen_workspace"
		}"
		end

end -- class GSL_EIGEN_GEN_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

