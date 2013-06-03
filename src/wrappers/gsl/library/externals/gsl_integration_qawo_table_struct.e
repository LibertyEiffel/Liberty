-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTEGRATION_QAWO_TABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_integration_qawo_table_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_set_n"
		}"
		end

	gsl_integration_qawo_table_struct_set_omega (a_structure: POINTER; a_value: REAL) is
			-- Setter for omega field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_set_omega"
		}"
		end

	gsl_integration_qawo_table_struct_set_l (a_structure: POINTER; a_value: REAL) is
			-- Setter for L field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_set_l"
		}"
		end

	gsl_integration_qawo_table_struct_set_par (a_structure: POINTER; a_value: REAL) is
			-- Setter for par field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_set_par"
		}"
		end

	gsl_integration_qawo_table_struct_set_sine (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for sine field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_set_sine"
		}"
		end

	gsl_integration_qawo_table_struct_set_chebmo (a_structure: POINTER; a_value: POINTER) is
			-- Setter for chebmo field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_set_chebmo"
		}"
		end

feature {} -- Low-level queries

	gsl_integration_qawo_table_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_get_n"
		}"
		end

	gsl_integration_qawo_table_struct_get_omega (a_structure: POINTER): REAL is
			-- Query for omega field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_get_omega"
		}"
		end

	gsl_integration_qawo_table_struct_get_l (a_structure: POINTER): REAL is
			-- Query for L field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_get_l"
		}"
		end

	gsl_integration_qawo_table_struct_get_par (a_structure: POINTER): REAL is
			-- Query for par field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_get_par"
		}"
		end

	gsl_integration_qawo_table_struct_get_sine (a_structure: POINTER): INTEGER is
			-- Query for sine field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_get_sine"
		}"
		end

	gsl_integration_qawo_table_struct_get_chebmo (a_structure: POINTER): POINTER is
			-- Query for chebmo field of GSL_INTEGRATION_QAWO_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qawo_table_struct_get_chebmo"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_integration_qawo_table"
		}"
		end

end -- class GSL_INTEGRATION_QAWO_TABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

