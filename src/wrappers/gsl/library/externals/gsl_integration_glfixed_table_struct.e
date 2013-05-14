-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTEGRATION_GLFIXED_TABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_integration_glfixed_table_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_set_n"
		}"
		end

	gsl_integration_glfixed_table_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_set_x"
		}"
		end

	gsl_integration_glfixed_table_struct_set_w (a_structure: POINTER; a_value: POINTER) is
			-- Setter for w field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_set_w"
		}"
		end

	gsl_integration_glfixed_table_struct_set_precomputed (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for precomputed field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_set_precomputed"
		}"
		end

feature {} -- Low-level queries

	gsl_integration_glfixed_table_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_get_n"
		}"
		end

	gsl_integration_glfixed_table_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_get_x"
		}"
		end

	gsl_integration_glfixed_table_struct_get_w (a_structure: POINTER): POINTER is
			-- Query for w field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_get_w"
		}"
		end

	gsl_integration_glfixed_table_struct_get_precomputed (a_structure: POINTER): INTEGER is
			-- Query for precomputed field of GSL_INTEGRATION_GLFIXED_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_glfixed_table_struct_get_precomputed"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_integration_glfixed_table"
		}"
		end

end -- class GSL_INTEGRATION_GLFIXED_TABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

