-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTEGRATION_QAWS_TABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_integration_qaws_table_struct_set_alpha (a_structure: POINTER; a_value: REAL) is
			-- Setter for alpha field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_alpha"
		}"
		end

	gsl_integration_qaws_table_struct_set_beta (a_structure: POINTER; a_value: REAL) is
			-- Setter for beta field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_beta"
		}"
		end

	gsl_integration_qaws_table_struct_set_mu (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for mu field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_mu"
		}"
		end

	gsl_integration_qaws_table_struct_set_nu (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for nu field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_nu"
		}"
		end

	gsl_integration_qaws_table_struct_set_ri (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ri field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_ri"
		}"
		end

	gsl_integration_qaws_table_struct_set_rj (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rj field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_rj"
		}"
		end

	gsl_integration_qaws_table_struct_set_rg (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rg field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_rg"
		}"
		end

	gsl_integration_qaws_table_struct_set_rh (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rh field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_set_rh"
		}"
		end

feature {} -- Low-level queries

	gsl_integration_qaws_table_struct_get_alpha (a_structure: POINTER): REAL is
			-- Query for alpha field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_alpha"
		}"
		end

	gsl_integration_qaws_table_struct_get_beta (a_structure: POINTER): REAL is
			-- Query for beta field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_beta"
		}"
		end

	gsl_integration_qaws_table_struct_get_mu (a_structure: POINTER): INTEGER is
			-- Query for mu field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_mu"
		}"
		end

	gsl_integration_qaws_table_struct_get_nu (a_structure: POINTER): INTEGER is
			-- Query for nu field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_nu"
		}"
		end

	gsl_integration_qaws_table_struct_get_ri (a_structure: POINTER): POINTER is
			-- Query for ri field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_ri"
		}"
		end

	gsl_integration_qaws_table_struct_get_rj (a_structure: POINTER): POINTER is
			-- Query for rj field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_rj"
		}"
		end

	gsl_integration_qaws_table_struct_get_rg (a_structure: POINTER): POINTER is
			-- Query for rg field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_rg"
		}"
		end

	gsl_integration_qaws_table_struct_get_rh (a_structure: POINTER): POINTER is
			-- Query for rh field of GSL_INTEGRATION_QAWS_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_integration_qaws_table_struct_get_rh"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_integration_qaws_table"
		}"
		end

end -- class GSL_INTEGRATION_QAWS_TABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

