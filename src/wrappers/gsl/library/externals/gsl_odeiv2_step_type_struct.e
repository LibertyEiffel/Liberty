-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ODEIV2_STEP_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_odeiv2_step_type_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_name"
		}"
		end

	gsl_odeiv2_step_type_struct_set_can_use_dydt_in (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for can_use_dydt_in field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_can_use_dydt_in"
		}"
		end

	gsl_odeiv2_step_type_struct_set_gives_exact_dydt_out (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for gives_exact_dydt_out field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_gives_exact_dydt_out"
		}"
		end

	gsl_odeiv2_step_type_struct_set_alloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for alloc field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_alloc"
		}"
		end

	gsl_odeiv2_step_type_struct_set_apply (a_structure: POINTER; a_value: POINTER) is
			-- Setter for apply field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_apply"
		}"
		end

	gsl_odeiv2_step_type_struct_set_set_driver (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_driver field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_set_driver"
		}"
		end

	gsl_odeiv2_step_type_struct_set_reset (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reset field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_reset"
		}"
		end

	gsl_odeiv2_step_type_struct_set_order (a_structure: POINTER; a_value: POINTER) is
			-- Setter for order field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_order"
		}"
		end

	gsl_odeiv2_step_type_struct_set_free (a_structure: POINTER; a_value: POINTER) is
			-- Setter for free field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_set_free"
		}"
		end

feature {} -- Low-level queries

	gsl_odeiv2_step_type_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_name"
		}"
		end

	gsl_odeiv2_step_type_struct_get_can_use_dydt_in (a_structure: POINTER): INTEGER is
			-- Query for can_use_dydt_in field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_can_use_dydt_in"
		}"
		end

	gsl_odeiv2_step_type_struct_get_gives_exact_dydt_out (a_structure: POINTER): INTEGER is
			-- Query for gives_exact_dydt_out field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_gives_exact_dydt_out"
		}"
		end

	gsl_odeiv2_step_type_struct_get_alloc (a_structure: POINTER): POINTER is
			-- Query for alloc field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_alloc"
		}"
		end

	gsl_odeiv2_step_type_struct_get_apply (a_structure: POINTER): POINTER is
			-- Query for apply field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_apply"
		}"
		end

	gsl_odeiv2_step_type_struct_get_set_driver (a_structure: POINTER): POINTER is
			-- Query for set_driver field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_set_driver"
		}"
		end

	gsl_odeiv2_step_type_struct_get_reset (a_structure: POINTER): POINTER is
			-- Query for reset field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_reset"
		}"
		end

	gsl_odeiv2_step_type_struct_get_order (a_structure: POINTER): POINTER is
			-- Query for order field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_order"
		}"
		end

	gsl_odeiv2_step_type_struct_get_free (a_structure: POINTER): POINTER is
			-- Query for free field of GSL_ODEIV2_STEP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_step_type_struct_get_free"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_odeiv2_step_type"
		}"
		end

end -- class GSL_ODEIV2_STEP_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

