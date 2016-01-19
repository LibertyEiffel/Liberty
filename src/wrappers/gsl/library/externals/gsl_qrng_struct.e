-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_QRNG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_qrng_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GSL_QRNG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_set_type"
		}"
		end

	gsl_qrng_struct_set_dimension (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for dimension field of GSL_QRNG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_set_dimension"
		}"
		end

	gsl_qrng_struct_set_state_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for state_size field of GSL_QRNG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_set_state_size"
		}"
		end

	gsl_qrng_struct_set_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state field of GSL_QRNG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_set_state"
		}"
		end

feature {} -- Low-level queries

	gsl_qrng_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GSL_QRNG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_get_type"
		}"
		end

	gsl_qrng_struct_get_dimension (a_structure: POINTER): NATURAL is
			-- Query for dimension field of GSL_QRNG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_get_dimension"
		}"
		end

	gsl_qrng_struct_get_state_size (a_structure: POINTER): like size_t is
			-- Query for state_size field of GSL_QRNG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_get_state_size"
		}"
		end

	gsl_qrng_struct_get_state (a_structure: POINTER): POINTER is
			-- Query for state field of GSL_QRNG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_struct_get_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_qrng"
		}"
		end

end -- class GSL_QRNG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

