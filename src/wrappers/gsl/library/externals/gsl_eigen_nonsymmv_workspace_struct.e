-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_eigen_nonsymmv_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_set_size"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_set_work (a_structure: POINTER; a_value: POINTER) is
			-- Setter for work field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_set_work"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_set_work2 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for work2 field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_set_work2"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_set_work3 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for work3 field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_set_work3"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_set_z (a_structure: POINTER; a_value: POINTER) is
			-- Setter for Z field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_set_z"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_set_nonsymm_workspace_p (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nonsymm_workspace_p field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_set_nonsymm_workspace_p"
		}"
		end

feature {} -- Low-level queries

	gsl_eigen_nonsymmv_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_get_size"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_get_work (a_structure: POINTER): POINTER is
			-- Query for work field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_get_work"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_get_work2 (a_structure: POINTER): POINTER is
			-- Query for work2 field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_get_work2"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_get_work3 (a_structure: POINTER): POINTER is
			-- Query for work3 field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_get_work3"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_get_z (a_structure: POINTER): POINTER is
			-- Query for Z field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_get_z"
		}"
		end

	gsl_eigen_nonsymmv_workspace_struct_get_nonsymm_workspace_p (a_structure: POINTER): POINTER is
			-- Query for nonsymm_workspace_p field of GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_eigen_nonsymmv_workspace_struct_get_nonsymm_workspace_p"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_eigen_nonsymmv_workspace"
		}"
		end

end -- class GSL_EIGEN_NONSYMMV_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

