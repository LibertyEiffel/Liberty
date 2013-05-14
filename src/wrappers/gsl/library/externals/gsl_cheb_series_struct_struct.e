-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_CHEB_SERIES_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_cheb_series_struct_struct_set_c (a_structure: POINTER; a_value: POINTER) is
			-- Setter for c field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_set_c"
		}"
		end

	gsl_cheb_series_struct_struct_set_order (a_structure: POINTER; a_value: like size_t) is
			-- Setter for order field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_set_order"
		}"
		end

	gsl_cheb_series_struct_struct_set_a (a_structure: POINTER; a_value: REAL) is
			-- Setter for a field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_set_a"
		}"
		end

	gsl_cheb_series_struct_struct_set_b (a_structure: POINTER; a_value: REAL) is
			-- Setter for b field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_set_b"
		}"
		end

	gsl_cheb_series_struct_struct_set_order_sp (a_structure: POINTER; a_value: like size_t) is
			-- Setter for order_sp field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_set_order_sp"
		}"
		end

	gsl_cheb_series_struct_struct_set_f (a_structure: POINTER; a_value: POINTER) is
			-- Setter for f field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_set_f"
		}"
		end

feature {} -- Low-level queries

	gsl_cheb_series_struct_struct_get_c (a_structure: POINTER): POINTER is
			-- Query for c field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_get_c"
		}"
		end

	gsl_cheb_series_struct_struct_get_order (a_structure: POINTER): like size_t is
			-- Query for order field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_get_order"
		}"
		end

	gsl_cheb_series_struct_struct_get_a (a_structure: POINTER): REAL is
			-- Query for a field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_get_a"
		}"
		end

	gsl_cheb_series_struct_struct_get_b (a_structure: POINTER): REAL is
			-- Query for b field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_get_b"
		}"
		end

	gsl_cheb_series_struct_struct_get_order_sp (a_structure: POINTER): like size_t is
			-- Query for order_sp field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_get_order_sp"
		}"
		end

	gsl_cheb_series_struct_struct_get_f (a_structure: POINTER): POINTER is
			-- Query for f field of GSL_CHEB_SERIES_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_cheb_series_struct_struct_get_f"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_cheb_series_struct"
		}"
		end

end -- class GSL_CHEB_SERIES_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

