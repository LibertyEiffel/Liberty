-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_VEGAS_PARAMS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_monte_vegas_params_struct_set_alpha (a_structure: POINTER; a_value: REAL) is
			-- Setter for alpha field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_set_alpha"
		}"
		end

	gsl_monte_vegas_params_struct_set_iterations (a_structure: POINTER; a_value: like size_t) is
			-- Setter for iterations field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_set_iterations"
		}"
		end

	gsl_monte_vegas_params_struct_set_stage (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for stage field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_set_stage"
		}"
		end

	gsl_monte_vegas_params_struct_set_mode (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for mode field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_set_mode"
		}"
		end

	gsl_monte_vegas_params_struct_set_verbose (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for verbose field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_set_verbose"
		}"
		end

	gsl_monte_vegas_params_struct_set_ostream (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ostream field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_set_ostream"
		}"
		end

feature {} -- Low-level queries

	gsl_monte_vegas_params_struct_get_alpha (a_structure: POINTER): REAL is
			-- Query for alpha field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_get_alpha"
		}"
		end

	gsl_monte_vegas_params_struct_get_iterations (a_structure: POINTER): like size_t is
			-- Query for iterations field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_get_iterations"
		}"
		end

	gsl_monte_vegas_params_struct_get_stage (a_structure: POINTER): INTEGER is
			-- Query for stage field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_get_stage"
		}"
		end

	gsl_monte_vegas_params_struct_get_mode (a_structure: POINTER): INTEGER is
			-- Query for mode field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_get_mode"
		}"
		end

	gsl_monte_vegas_params_struct_get_verbose (a_structure: POINTER): INTEGER is
			-- Query for verbose field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_get_verbose"
		}"
		end

	gsl_monte_vegas_params_struct_get_ostream (a_structure: POINTER): POINTER is
			-- Query for ostream field of GSL_MONTE_VEGAS_PARAMS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_vegas_params_struct_get_ostream"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_monte_vegas_params"
		}"
		end

end -- class GSL_MONTE_VEGAS_PARAMS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

