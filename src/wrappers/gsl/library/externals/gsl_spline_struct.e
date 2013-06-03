-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SPLINE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_spline_struct_set_interp (a_structure: POINTER; a_value: POINTER) is
			-- Setter for interp field of GSL_SPLINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_set_interp"
		}"
		end

	gsl_spline_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GSL_SPLINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_set_x"
		}"
		end

	gsl_spline_struct_set_y (a_structure: POINTER; a_value: POINTER) is
			-- Setter for y field of GSL_SPLINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_set_y"
		}"
		end

	gsl_spline_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_SPLINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_set_size"
		}"
		end

feature {} -- Low-level queries

	gsl_spline_struct_get_interp (a_structure: POINTER): POINTER is
			-- Query for interp field of GSL_SPLINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_get_interp"
		}"
		end

	gsl_spline_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GSL_SPLINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_get_x"
		}"
		end

	gsl_spline_struct_get_y (a_structure: POINTER): POINTER is
			-- Query for y field of GSL_SPLINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_get_y"
		}"
		end

	gsl_spline_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_SPLINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_spline_struct_get_size"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_spline"
		}"
		end

end -- class GSL_SPLINE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

