-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_RNG_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_rng_type_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_name"
		}"
		end

	gsl_rng_type_struct_set_max (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for max field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_max"
		}"
		end

	gsl_rng_type_struct_set_min (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for min field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_min"
		}"
		end

	gsl_rng_type_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_size"
		}"
		end

	gsl_rng_type_struct_set_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_set"
		}"
		end

	gsl_rng_type_struct_set_get (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_get"
		}"
		end

	gsl_rng_type_struct_set_get_double (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_double field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_set_get_double"
		}"
		end

feature {} -- Low-level queries

	gsl_rng_type_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_name"
		}"
		end

	gsl_rng_type_struct_get_max (a_structure: POINTER): like long_unsigned is
			-- Query for max field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_max"
		}"
		end

	gsl_rng_type_struct_get_min (a_structure: POINTER): like long_unsigned is
			-- Query for min field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_min"
		}"
		end

	gsl_rng_type_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_size"
		}"
		end

	gsl_rng_type_struct_get_set (a_structure: POINTER): POINTER is
			-- Query for set field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_set"
		}"
		end

	gsl_rng_type_struct_get_get (a_structure: POINTER): POINTER is
			-- Query for get field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_get"
		}"
		end

	gsl_rng_type_struct_get_get_double (a_structure: POINTER): POINTER is
			-- Query for get_double field of GSL_RNG_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_type_struct_get_get_double"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_rng_type"
		}"
		end

end -- class GSL_RNG_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

