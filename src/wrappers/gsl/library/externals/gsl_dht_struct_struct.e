-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_DHT_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_dht_struct_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_size"
		}"
		end

	gsl_dht_struct_struct_set_nu (a_structure: POINTER; a_value: REAL) is
			-- Setter for nu field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_nu"
		}"
		end

	gsl_dht_struct_struct_set_xmax (a_structure: POINTER; a_value: REAL) is
			-- Setter for xmax field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_xmax"
		}"
		end

	gsl_dht_struct_struct_set_kmax (a_structure: POINTER; a_value: REAL) is
			-- Setter for kmax field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_kmax"
		}"
		end

	gsl_dht_struct_struct_set_j (a_structure: POINTER; a_value: POINTER) is
			-- Setter for j field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_j"
		}"
		end

	gsl_dht_struct_struct_set_jjj (a_structure: POINTER; a_value: POINTER) is
			-- Setter for Jjj field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_jjj"
		}"
		end

	gsl_dht_struct_struct_set_j2 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for J2 field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_set_j2"
		}"
		end

feature {} -- Low-level queries

	gsl_dht_struct_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_size"
		}"
		end

	gsl_dht_struct_struct_get_nu (a_structure: POINTER): REAL is
			-- Query for nu field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_nu"
		}"
		end

	gsl_dht_struct_struct_get_xmax (a_structure: POINTER): REAL is
			-- Query for xmax field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_xmax"
		}"
		end

	gsl_dht_struct_struct_get_kmax (a_structure: POINTER): REAL is
			-- Query for kmax field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_kmax"
		}"
		end

	gsl_dht_struct_struct_get_j (a_structure: POINTER): POINTER is
			-- Query for j field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_j"
		}"
		end

	gsl_dht_struct_struct_get_jjj (a_structure: POINTER): POINTER is
			-- Query for Jjj field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_jjj"
		}"
		end

	gsl_dht_struct_struct_get_j2 (a_structure: POINTER): POINTER is
			-- Query for J2 field of GSL_DHT_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_struct_struct_get_j2"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_dht_struct"
		}"
		end

end -- class GSL_DHT_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

