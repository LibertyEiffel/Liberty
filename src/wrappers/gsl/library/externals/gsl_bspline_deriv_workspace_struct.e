-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BSPLINE_DERIV_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_bspline_deriv_workspace_struct_set_k (a_structure: POINTER; a_value: like size_t) is
			-- Setter for k field of GSL_BSPLINE_DERIV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_workspace_struct_set_k"
		}"
		end

	gsl_bspline_deriv_workspace_struct_set_a (a_structure: POINTER; a_value: POINTER) is
			-- Setter for A field of GSL_BSPLINE_DERIV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_workspace_struct_set_a"
		}"
		end

	gsl_bspline_deriv_workspace_struct_set_db (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dB field of GSL_BSPLINE_DERIV_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_workspace_struct_set_db"
		}"
		end

feature {} -- Low-level queries

	gsl_bspline_deriv_workspace_struct_get_k (a_structure: POINTER): like size_t is
			-- Query for k field of GSL_BSPLINE_DERIV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_workspace_struct_get_k"
		}"
		end

	gsl_bspline_deriv_workspace_struct_get_a (a_structure: POINTER): POINTER is
			-- Query for A field of GSL_BSPLINE_DERIV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_workspace_struct_get_a"
		}"
		end

	gsl_bspline_deriv_workspace_struct_get_db (a_structure: POINTER): POINTER is
			-- Query for dB field of GSL_BSPLINE_DERIV_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_deriv_workspace_struct_get_db"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_bspline_deriv_workspace"
		}"
		end

end -- class GSL_BSPLINE_DERIV_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

