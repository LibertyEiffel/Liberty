-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTIMIN_FMINIMIZER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_multimin_fminimizer_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_set_type"
		}"
		end

	gsl_multimin_fminimizer_struct_set_f (a_structure: POINTER; a_value: POINTER) is
			-- Setter for f field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_set_f"
		}"
		end

	gsl_multimin_fminimizer_struct_set_fval (a_structure: POINTER; a_value: REAL) is
			-- Setter for fval field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_set_fval"
		}"
		end

	gsl_multimin_fminimizer_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_set_x"
		}"
		end

	gsl_multimin_fminimizer_struct_set_size (a_structure: POINTER; a_value: REAL) is
			-- Setter for size field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_set_size"
		}"
		end

	gsl_multimin_fminimizer_struct_set_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_set_state"
		}"
		end

feature {} -- Low-level queries

	gsl_multimin_fminimizer_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_get_type"
		}"
		end

	gsl_multimin_fminimizer_struct_get_f (a_structure: POINTER): POINTER is
			-- Query for f field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_get_f"
		}"
		end

	gsl_multimin_fminimizer_struct_get_fval (a_structure: POINTER): REAL is
			-- Query for fval field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_get_fval"
		}"
		end

	gsl_multimin_fminimizer_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_get_x"
		}"
		end

	gsl_multimin_fminimizer_struct_get_size (a_structure: POINTER): REAL is
			-- Query for size field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_get_size"
		}"
		end

	gsl_multimin_fminimizer_struct_get_state (a_structure: POINTER): POINTER is
			-- Query for state field of GSL_MULTIMIN_FMINIMIZER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multimin_fminimizer_struct_get_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_multimin_fminimizer"
		}"
		end

end -- class GSL_MULTIMIN_FMINIMIZER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

