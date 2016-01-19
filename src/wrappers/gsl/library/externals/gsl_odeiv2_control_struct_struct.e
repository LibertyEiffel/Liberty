-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ODEIV2_CONTROL_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_odeiv2_control_struct_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GSL_ODEIV2_CONTROL_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_control_struct_struct_set_type"
		}"
		end

	gsl_odeiv2_control_struct_struct_set_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state field of GSL_ODEIV2_CONTROL_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_control_struct_struct_set_state"
		}"
		end

feature {} -- Low-level queries

	gsl_odeiv2_control_struct_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GSL_ODEIV2_CONTROL_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_control_struct_struct_get_type"
		}"
		end

	gsl_odeiv2_control_struct_struct_get_state (a_structure: POINTER): POINTER is
			-- Query for state field of GSL_ODEIV2_CONTROL_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_control_struct_struct_get_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_odeiv2_control_struct"
		}"
		end

end -- class GSL_ODEIV2_CONTROL_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

