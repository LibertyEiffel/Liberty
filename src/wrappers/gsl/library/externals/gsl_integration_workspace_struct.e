-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTEGRATION_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_integration_workspace_struct_set_limit (a_structure: POINTER; a_value: like size_t) is
			-- Setter for limit field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_limit"
		}"
		end

	gsl_integration_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_size"
		}"
		end

	gsl_integration_workspace_struct_set_nrmax (a_structure: POINTER; a_value: like size_t) is
			-- Setter for nrmax field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_nrmax"
		}"
		end

	gsl_integration_workspace_struct_set_i (a_structure: POINTER; a_value: like size_t) is
			-- Setter for i field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_i"
		}"
		end

	gsl_integration_workspace_struct_set_maximum_level (a_structure: POINTER; a_value: like size_t) is
			-- Setter for maximum_level field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_maximum_level"
		}"
		end

	gsl_integration_workspace_struct_set_alist (a_structure: POINTER; a_value: POINTER) is
			-- Setter for alist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_alist"
		}"
		end

	gsl_integration_workspace_struct_set_blist (a_structure: POINTER; a_value: POINTER) is
			-- Setter for blist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_blist"
		}"
		end

	gsl_integration_workspace_struct_set_rlist (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rlist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_rlist"
		}"
		end

	gsl_integration_workspace_struct_set_elist (a_structure: POINTER; a_value: POINTER) is
			-- Setter for elist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_elist"
		}"
		end

	gsl_integration_workspace_struct_set_order (a_structure: POINTER; a_value: POINTER) is
			-- Setter for order field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_order"
		}"
		end

	gsl_integration_workspace_struct_set_level (a_structure: POINTER; a_value: POINTER) is
			-- Setter for level field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_set_level"
		}"
		end

feature {} -- Low-level queries

	gsl_integration_workspace_struct_get_limit (a_structure: POINTER): like size_t is
			-- Query for limit field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_limit"
		}"
		end

	gsl_integration_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_size"
		}"
		end

	gsl_integration_workspace_struct_get_nrmax (a_structure: POINTER): like size_t is
			-- Query for nrmax field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_nrmax"
		}"
		end

	gsl_integration_workspace_struct_get_i (a_structure: POINTER): like size_t is
			-- Query for i field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_i"
		}"
		end

	gsl_integration_workspace_struct_get_maximum_level (a_structure: POINTER): like size_t is
			-- Query for maximum_level field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_maximum_level"
		}"
		end

	gsl_integration_workspace_struct_get_alist (a_structure: POINTER): POINTER is
			-- Query for alist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_alist"
		}"
		end

	gsl_integration_workspace_struct_get_blist (a_structure: POINTER): POINTER is
			-- Query for blist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_blist"
		}"
		end

	gsl_integration_workspace_struct_get_rlist (a_structure: POINTER): POINTER is
			-- Query for rlist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_rlist"
		}"
		end

	gsl_integration_workspace_struct_get_elist (a_structure: POINTER): POINTER is
			-- Query for elist field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_elist"
		}"
		end

	gsl_integration_workspace_struct_get_order (a_structure: POINTER): POINTER is
			-- Query for order field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_order"
		}"
		end

	gsl_integration_workspace_struct_get_level (a_structure: POINTER): POINTER is
			-- Query for level field of GSL_INTEGRATION_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_workspace_struct_get_level"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_integration_workspace"
		}"
		end

end -- class GSL_INTEGRATION_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

