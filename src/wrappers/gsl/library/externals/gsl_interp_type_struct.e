-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTERP_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_interp_type_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_name"
		}"
		end

	gsl_interp_type_struct_set_min_size (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for min_size field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_min_size"
		}"
		end

	gsl_interp_type_struct_set_alloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for alloc field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_alloc"
		}"
		end

	gsl_interp_type_struct_set_init (a_structure: POINTER; a_value: POINTER) is
			-- Setter for init field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_init"
		}"
		end

	gsl_interp_type_struct_set_eval (a_structure: POINTER; a_value: POINTER) is
			-- Setter for eval field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_eval"
		}"
		end

	gsl_interp_type_struct_set_eval_deriv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for eval_deriv field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_eval_deriv"
		}"
		end

	gsl_interp_type_struct_set_eval_deriv2 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for eval_deriv2 field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_eval_deriv2"
		}"
		end

	gsl_interp_type_struct_set_eval_integ (a_structure: POINTER; a_value: POINTER) is
			-- Setter for eval_integ field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_eval_integ"
		}"
		end

	gsl_interp_type_struct_set_free (a_structure: POINTER; a_value: POINTER) is
			-- Setter for free field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_set_free"
		}"
		end

feature {} -- Low-level queries

	gsl_interp_type_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_name"
		}"
		end

	gsl_interp_type_struct_get_min_size (a_structure: POINTER): NATURAL is
			-- Query for min_size field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_min_size"
		}"
		end

	gsl_interp_type_struct_get_alloc (a_structure: POINTER): POINTER is
			-- Query for alloc field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_alloc"
		}"
		end

	gsl_interp_type_struct_get_init (a_structure: POINTER): POINTER is
			-- Query for init field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_init"
		}"
		end

	gsl_interp_type_struct_get_eval (a_structure: POINTER): POINTER is
			-- Query for eval field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_eval"
		}"
		end

	gsl_interp_type_struct_get_eval_deriv (a_structure: POINTER): POINTER is
			-- Query for eval_deriv field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_eval_deriv"
		}"
		end

	gsl_interp_type_struct_get_eval_deriv2 (a_structure: POINTER): POINTER is
			-- Query for eval_deriv2 field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_eval_deriv2"
		}"
		end

	gsl_interp_type_struct_get_eval_integ (a_structure: POINTER): POINTER is
			-- Query for eval_integ field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_eval_integ"
		}"
		end

	gsl_interp_type_struct_get_free (a_structure: POINTER): POINTER is
			-- Query for free field of GSL_INTERP_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_type_struct_get_free"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_interp_type"
		}"
		end

end -- class GSL_INTERP_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

