-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SF_RESULT_E10_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_sf_result_e10_struct_struct_set_val (a_structure: POINTER; a_value: REAL) is
			-- Setter for val field of GSL_SF_RESULT_E10_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_e10_struct_struct_set_val"
		}"
		end

	gsl_sf_result_e10_struct_struct_set_err (a_structure: POINTER; a_value: REAL) is
			-- Setter for err field of GSL_SF_RESULT_E10_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_e10_struct_struct_set_err"
		}"
		end

	gsl_sf_result_e10_struct_struct_set_e10 (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for e10 field of GSL_SF_RESULT_E10_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_e10_struct_struct_set_e10"
		}"
		end

feature {} -- Low-level queries

	gsl_sf_result_e10_struct_struct_get_val (a_structure: POINTER): REAL is
			-- Query for val field of GSL_SF_RESULT_E10_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_e10_struct_struct_get_val"
		}"
		end

	gsl_sf_result_e10_struct_struct_get_err (a_structure: POINTER): REAL is
			-- Query for err field of GSL_SF_RESULT_E10_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_e10_struct_struct_get_err"
		}"
		end

	gsl_sf_result_e10_struct_struct_get_e10 (a_structure: POINTER): INTEGER is
			-- Query for e10 field of GSL_SF_RESULT_E10_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sf_result_e10_struct_struct_get_e10"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_sf_result_e10_struct"
		}"
		end

end -- class GSL_SF_RESULT_E10_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

