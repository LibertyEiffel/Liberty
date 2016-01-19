-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_vector_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_VECTOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_set_size"
		}"
		end

	gsl_vector_struct_set_stride (a_structure: POINTER; a_value: like size_t) is
			-- Setter for stride field of GSL_VECTOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_set_stride"
		}"
		end

	gsl_vector_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GSL_VECTOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_set_data"
		}"
		end

	gsl_vector_struct_set_block (a_structure: POINTER; a_value: POINTER) is
			-- Setter for block field of GSL_VECTOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_set_block"
		}"
		end

	gsl_vector_struct_set_owner (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for owner field of GSL_VECTOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_set_owner"
		}"
		end

feature {} -- Low-level queries

	gsl_vector_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_VECTOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_get_size"
		}"
		end

	gsl_vector_struct_get_stride (a_structure: POINTER): like size_t is
			-- Query for stride field of GSL_VECTOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_get_stride"
		}"
		end

	gsl_vector_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GSL_VECTOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_get_data"
		}"
		end

	gsl_vector_struct_get_block (a_structure: POINTER): POINTER is
			-- Query for block field of GSL_VECTOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_get_block"
		}"
		end

	gsl_vector_struct_get_owner (a_structure: POINTER): INTEGER is
			-- Query for owner field of GSL_VECTOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_vector_struct_get_owner"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_vector"
		}"
		end

end -- class GSL_VECTOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

