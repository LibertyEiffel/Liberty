-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_IEEE_DOUBLE_REP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_ieee_double_rep_struct_set_sign (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for sign field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_set_sign"
		}"
		end

	gsl_ieee_double_rep_struct_set_mantissa (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mantissa field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_set_mantissa"
		}"
		end

	gsl_ieee_double_rep_struct_set_exponent (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for exponent field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_set_exponent"
		}"
		end

	gsl_ieee_double_rep_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_set_type"
		}"
		end

feature {} -- Low-level queries

	gsl_ieee_double_rep_struct_get_sign (a_structure: POINTER): INTEGER is
			-- Query for sign field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_get_sign"
		}"
		end

	gsl_ieee_double_rep_struct_get_mantissa (a_structure: POINTER): POINTER is
			-- Query for mantissa field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_get_mantissa"
		}"
		end

	gsl_ieee_double_rep_struct_get_exponent (a_structure: POINTER): INTEGER is
			-- Query for exponent field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_get_exponent"
		}"
		end

	gsl_ieee_double_rep_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GSL_IEEE_DOUBLE_REP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ieee_double_rep_struct_get_type"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_ieee_double_rep"
		}"
		end

end -- class GSL_IEEE_DOUBLE_REP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

