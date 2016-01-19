-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_POLY_COMPLEX_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_poly_complex_workspace_struct_set_nc (a_structure: POINTER; a_value: like size_t) is
			-- Setter for nc field of GSL_POLY_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_workspace_struct_set_nc"
		}"
		end

	gsl_poly_complex_workspace_struct_set_matrix (a_structure: POINTER; a_value: POINTER) is
			-- Setter for matrix field of GSL_POLY_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_workspace_struct_set_matrix"
		}"
		end

feature {} -- Low-level queries

	gsl_poly_complex_workspace_struct_get_nc (a_structure: POINTER): like size_t is
			-- Query for nc field of GSL_POLY_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_workspace_struct_get_nc"
		}"
		end

	gsl_poly_complex_workspace_struct_get_matrix (a_structure: POINTER): POINTER is
			-- Query for matrix field of GSL_POLY_COMPLEX_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_poly_complex_workspace_struct_get_matrix"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_poly_complex_workspace"
		}"
		end

end -- class GSL_POLY_COMPLEX_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

