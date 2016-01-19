-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_EIGEN_HERMV_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_eigen_hermv_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_set_size"
		}"
		end

	gsl_eigen_hermv_workspace_struct_set_d (a_structure: POINTER; a_value: POINTER) is
			-- Setter for d field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_set_d"
		}"
		end

	gsl_eigen_hermv_workspace_struct_set_sd (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sd field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_set_sd"
		}"
		end

	gsl_eigen_hermv_workspace_struct_set_tau (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tau field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_set_tau"
		}"
		end

	gsl_eigen_hermv_workspace_struct_set_gc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for gc field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_set_gc"
		}"
		end

	gsl_eigen_hermv_workspace_struct_set_gs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for gs field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_set_gs"
		}"
		end

feature {} -- Low-level queries

	gsl_eigen_hermv_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_get_size"
		}"
		end

	gsl_eigen_hermv_workspace_struct_get_d (a_structure: POINTER): POINTER is
			-- Query for d field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_get_d"
		}"
		end

	gsl_eigen_hermv_workspace_struct_get_sd (a_structure: POINTER): POINTER is
			-- Query for sd field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_get_sd"
		}"
		end

	gsl_eigen_hermv_workspace_struct_get_tau (a_structure: POINTER): POINTER is
			-- Query for tau field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_get_tau"
		}"
		end

	gsl_eigen_hermv_workspace_struct_get_gc (a_structure: POINTER): POINTER is
			-- Query for gc field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_get_gc"
		}"
		end

	gsl_eigen_hermv_workspace_struct_get_gs (a_structure: POINTER): POINTER is
			-- Query for gs field of GSL_EIGEN_HERMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_hermv_workspace_struct_get_gs"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_eigen_hermv_workspace"
		}"
		end

end -- class GSL_EIGEN_HERMV_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

