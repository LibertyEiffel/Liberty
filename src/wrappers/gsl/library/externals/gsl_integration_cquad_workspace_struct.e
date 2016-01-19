-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_integration_cquad_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_struct_set_size"
		}"
		end

	gsl_integration_cquad_workspace_struct_set_ivals (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ivals field of GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_struct_set_ivals"
		}"
		end

	gsl_integration_cquad_workspace_struct_set_heap (a_structure: POINTER; a_value: POINTER) is
			-- Setter for heap field of GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_struct_set_heap"
		}"
		end

feature {} -- Low-level queries

	gsl_integration_cquad_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_struct_get_size"
		}"
		end

	gsl_integration_cquad_workspace_struct_get_ivals (a_structure: POINTER): POINTER is
			-- Query for ivals field of GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_struct_get_ivals"
		}"
		end

	gsl_integration_cquad_workspace_struct_get_heap (a_structure: POINTER): POINTER is
			-- Query for heap field of GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_cquad_workspace_struct_get_heap"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_integration_cquad_workspace"
		}"
		end

end -- class GSL_INTEGRATION_CQUAD_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

