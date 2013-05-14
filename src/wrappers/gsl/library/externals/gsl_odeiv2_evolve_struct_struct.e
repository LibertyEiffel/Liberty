-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_ODEIV2_EVOLVE_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_odeiv2_evolve_struct_struct_set_dimension (a_structure: POINTER; a_value: like size_t) is
			-- Setter for dimension field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_dimension"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_y0 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for y0 field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_y0"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_yerr (a_structure: POINTER; a_value: POINTER) is
			-- Setter for yerr field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_yerr"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_dydt_in (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dydt_in field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_dydt_in"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_dydt_out (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dydt_out field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_dydt_out"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_last_step (a_structure: POINTER; a_value: REAL) is
			-- Setter for last_step field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_last_step"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_count (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for count field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_count"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_failed_steps (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for failed_steps field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_failed_steps"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_set_driver (a_structure: POINTER; a_value: POINTER) is
			-- Setter for driver field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_set_driver"
		}"
		end

feature {} -- Low-level queries

	gsl_odeiv2_evolve_struct_struct_get_dimension (a_structure: POINTER): like size_t is
			-- Query for dimension field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_dimension"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_y0 (a_structure: POINTER): POINTER is
			-- Query for y0 field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_y0"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_yerr (a_structure: POINTER): POINTER is
			-- Query for yerr field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_yerr"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_dydt_in (a_structure: POINTER): POINTER is
			-- Query for dydt_in field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_dydt_in"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_dydt_out (a_structure: POINTER): POINTER is
			-- Query for dydt_out field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_dydt_out"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_last_step (a_structure: POINTER): REAL is
			-- Query for last_step field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_last_step"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_count (a_structure: POINTER): like long_unsigned is
			-- Query for count field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_count"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_failed_steps (a_structure: POINTER): like long_unsigned is
			-- Query for failed_steps field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_failed_steps"
		}"
		end

	gsl_odeiv2_evolve_struct_struct_get_driver (a_structure: POINTER): POINTER is
			-- Query for driver field of GSL_ODEIV2_EVOLVE_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_odeiv2_evolve_struct_struct_get_driver"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_odeiv2_evolve_struct"
		}"
		end

end -- class GSL_ODEIV2_EVOLVE_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

