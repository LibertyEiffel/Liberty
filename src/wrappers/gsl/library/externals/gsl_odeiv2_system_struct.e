-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ODEIV2_SYSTEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_odeiv2_system_struct_set_function (a_structure: POINTER; a_value: POINTER) is
			-- Setter for function field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_set_function"
		}"
		end

	gsl_odeiv2_system_struct_set_jacobian (a_structure: POINTER; a_value: POINTER) is
			-- Setter for jacobian field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_set_jacobian"
		}"
		end

	gsl_odeiv2_system_struct_set_dimension (a_structure: POINTER; a_value: like size_t) is
			-- Setter for dimension field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_set_dimension"
		}"
		end

	gsl_odeiv2_system_struct_set_params (a_structure: POINTER; a_value: POINTER) is
			-- Setter for params field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_set_params"
		}"
		end

feature {} -- Low-level queries

	gsl_odeiv2_system_struct_get_function (a_structure: POINTER): POINTER is
			-- Query for function field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_get_function"
		}"
		end

	gsl_odeiv2_system_struct_get_jacobian (a_structure: POINTER): POINTER is
			-- Query for jacobian field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_get_jacobian"
		}"
		end

	gsl_odeiv2_system_struct_get_dimension (a_structure: POINTER): like size_t is
			-- Query for dimension field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_get_dimension"
		}"
		end

	gsl_odeiv2_system_struct_get_params (a_structure: POINTER): POINTER is
			-- Query for params field of GSL_ODEIV2_SYSTEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_system_struct_get_params"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_odeiv2_system"
		}"
		end

end -- class GSL_ODEIV2_SYSTEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

