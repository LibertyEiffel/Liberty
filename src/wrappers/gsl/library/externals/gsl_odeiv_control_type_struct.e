-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ODEIV_CONTROL_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_odeiv_control_type_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_set_name"
		}"
		end

	gsl_odeiv_control_type_struct_set_alloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for alloc field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_set_alloc"
		}"
		end

	gsl_odeiv_control_type_struct_set_init (a_structure: POINTER; a_value: POINTER) is
			-- Setter for init field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_set_init"
		}"
		end

	gsl_odeiv_control_type_struct_set_hadjust (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hadjust field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_set_hadjust"
		}"
		end

	gsl_odeiv_control_type_struct_set_free (a_structure: POINTER; a_value: POINTER) is
			-- Setter for free field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_set_free"
		}"
		end

feature {} -- Low-level queries

	gsl_odeiv_control_type_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_get_name"
		}"
		end

	gsl_odeiv_control_type_struct_get_alloc (a_structure: POINTER): POINTER is
			-- Query for alloc field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_get_alloc"
		}"
		end

	gsl_odeiv_control_type_struct_get_init (a_structure: POINTER): POINTER is
			-- Query for init field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_get_init"
		}"
		end

	gsl_odeiv_control_type_struct_get_hadjust (a_structure: POINTER): POINTER is
			-- Query for hadjust field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_get_hadjust"
		}"
		end

	gsl_odeiv_control_type_struct_get_free (a_structure: POINTER): POINTER is
			-- Query for free field of GSL_ODEIV_CONTROL_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv_control_type_struct_get_free"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_odeiv_control_type"
		}"
		end

end -- class GSL_ODEIV_CONTROL_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

