-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MONTE_PLAIN_STATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_monte_plain_state_struct_set_dim (a_structure: POINTER; a_value: like size_t) is
			-- Setter for dim field of GSL_MONTE_PLAIN_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_state_struct_set_dim"
		}"
		end

	gsl_monte_plain_state_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GSL_MONTE_PLAIN_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_state_struct_set_x"
		}"
		end

feature {} -- Low-level queries

	gsl_monte_plain_state_struct_get_dim (a_structure: POINTER): like size_t is
			-- Query for dim field of GSL_MONTE_PLAIN_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_state_struct_get_dim"
		}"
		end

	gsl_monte_plain_state_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GSL_MONTE_PLAIN_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_monte_plain_state_struct_get_x"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_monte_plain_state"
		}"
		end

end -- class GSL_MONTE_PLAIN_STATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

