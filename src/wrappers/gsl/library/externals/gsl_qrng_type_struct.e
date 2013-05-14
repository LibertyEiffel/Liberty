-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_QRNG_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_qrng_type_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_set_name"
		}"
		end

	gsl_qrng_type_struct_set_max_dimension (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for max_dimension field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_set_max_dimension"
		}"
		end

	gsl_qrng_type_struct_set_state_size (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state_size field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_set_state_size"
		}"
		end

	gsl_qrng_type_struct_set_init_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for init_state field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_set_init_state"
		}"
		end

	gsl_qrng_type_struct_set_get (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_set_get"
		}"
		end

feature {} -- Low-level queries

	gsl_qrng_type_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_get_name"
		}"
		end

	gsl_qrng_type_struct_get_max_dimension (a_structure: POINTER): NATURAL is
			-- Query for max_dimension field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_get_max_dimension"
		}"
		end

	gsl_qrng_type_struct_get_state_size (a_structure: POINTER): POINTER is
			-- Query for state_size field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_get_state_size"
		}"
		end

	gsl_qrng_type_struct_get_init_state (a_structure: POINTER): POINTER is
			-- Query for init_state field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_get_init_state"
		}"
		end

	gsl_qrng_type_struct_get_get (a_structure: POINTER): POINTER is
			-- Query for get field of GSL_QRNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_type_struct_get_get"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_qrng_type"
		}"
		end

end -- class GSL_QRNG_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

