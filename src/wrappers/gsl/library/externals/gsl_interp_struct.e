-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTERP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_interp_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GSL_INTERP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_set_type"
		}"
		end

	gsl_interp_struct_set_xmin (a_structure: POINTER; a_value: REAL) is
			-- Setter for xmin field of GSL_INTERP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_set_xmin"
		}"
		end

	gsl_interp_struct_set_xmax (a_structure: POINTER; a_value: REAL) is
			-- Setter for xmax field of GSL_INTERP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_set_xmax"
		}"
		end

	gsl_interp_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_INTERP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_set_size"
		}"
		end

	gsl_interp_struct_set_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state field of GSL_INTERP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_set_state"
		}"
		end

feature {} -- Low-level queries

	gsl_interp_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GSL_INTERP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_get_type"
		}"
		end

	gsl_interp_struct_get_xmin (a_structure: POINTER): REAL is
			-- Query for xmin field of GSL_INTERP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_get_xmin"
		}"
		end

	gsl_interp_struct_get_xmax (a_structure: POINTER): REAL is
			-- Query for xmax field of GSL_INTERP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_get_xmax"
		}"
		end

	gsl_interp_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_INTERP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_get_size"
		}"
		end

	gsl_interp_struct_get_state (a_structure: POINTER): POINTER is
			-- Query for state field of GSL_INTERP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_struct_get_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_interp"
		}"
		end

end -- class GSL_INTERP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

