-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MATRIX_COMPLEX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_matrix_complex_struct_set_size1 (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size1 field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_set_size1"
		}"
		end

	gsl_matrix_complex_struct_set_size2 (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size2 field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_set_size2"
		}"
		end

	gsl_matrix_complex_struct_set_tda (a_structure: POINTER; a_value: like size_t) is
			-- Setter for tda field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_set_tda"
		}"
		end

	gsl_matrix_complex_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_set_data"
		}"
		end

	gsl_matrix_complex_struct_set_block (a_structure: POINTER; a_value: POINTER) is
			-- Setter for block field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_set_block"
		}"
		end

	gsl_matrix_complex_struct_set_owner (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for owner field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_set_owner"
		}"
		end

feature {} -- Low-level queries

	gsl_matrix_complex_struct_get_size1 (a_structure: POINTER): like size_t is
			-- Query for size1 field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_get_size1"
		}"
		end

	gsl_matrix_complex_struct_get_size2 (a_structure: POINTER): like size_t is
			-- Query for size2 field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_get_size2"
		}"
		end

	gsl_matrix_complex_struct_get_tda (a_structure: POINTER): like size_t is
			-- Query for tda field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_get_tda"
		}"
		end

	gsl_matrix_complex_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_get_data"
		}"
		end

	gsl_matrix_complex_struct_get_block (a_structure: POINTER): POINTER is
			-- Query for block field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_get_block"
		}"
		end

	gsl_matrix_complex_struct_get_owner (a_structure: POINTER): INTEGER is
			-- Query for owner field of GSL_MATRIX_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_matrix_complex_struct_get_owner"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_matrix_complex"
		}"
		end

end -- class GSL_MATRIX_COMPLEX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

