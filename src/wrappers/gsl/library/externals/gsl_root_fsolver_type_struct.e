-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ROOT_FSOLVER_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_root_fsolver_type_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_set_name"
		}"
		end

	gsl_root_fsolver_type_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_set_size"
		}"
		end

	gsl_root_fsolver_type_struct_set_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_set_set"
		}"
		end

	gsl_root_fsolver_type_struct_set_iterate (a_structure: POINTER; a_value: POINTER) is
			-- Setter for iterate field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_set_iterate"
		}"
		end

feature {} -- Low-level queries

	gsl_root_fsolver_type_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_get_name"
		}"
		end

	gsl_root_fsolver_type_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_get_size"
		}"
		end

	gsl_root_fsolver_type_struct_get_set (a_structure: POINTER): POINTER is
			-- Query for set field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_get_set"
		}"
		end

	gsl_root_fsolver_type_struct_get_iterate (a_structure: POINTER): POINTER is
			-- Query for iterate field of GSL_ROOT_FSOLVER_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_root_fsolver_type_struct_get_iterate"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_root_fsolver_type"
		}"
		end

end -- class GSL_ROOT_FSOLVER_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

