-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_BSPLINE_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_bspline_workspace_struct_set_k (a_structure: POINTER; a_value: like size_t) is
			-- Setter for k field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_k"
		}"
		end

	gsl_bspline_workspace_struct_set_km1 (a_structure: POINTER; a_value: like size_t) is
			-- Setter for km1 field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_km1"
		}"
		end

	gsl_bspline_workspace_struct_set_l (a_structure: POINTER; a_value: like size_t) is
			-- Setter for l field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_l"
		}"
		end

	gsl_bspline_workspace_struct_set_nbreak (a_structure: POINTER; a_value: like size_t) is
			-- Setter for nbreak field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_nbreak"
		}"
		end

	gsl_bspline_workspace_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_n"
		}"
		end

	gsl_bspline_workspace_struct_set_knots (a_structure: POINTER; a_value: POINTER) is
			-- Setter for knots field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_knots"
		}"
		end

	gsl_bspline_workspace_struct_set_deltal (a_structure: POINTER; a_value: POINTER) is
			-- Setter for deltal field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_deltal"
		}"
		end

	gsl_bspline_workspace_struct_set_deltar (a_structure: POINTER; a_value: POINTER) is
			-- Setter for deltar field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_deltar"
		}"
		end

	gsl_bspline_workspace_struct_set_b (a_structure: POINTER; a_value: POINTER) is
			-- Setter for B field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_set_b"
		}"
		end

feature {} -- Low-level queries

	gsl_bspline_workspace_struct_get_k (a_structure: POINTER): like size_t is
			-- Query for k field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_k"
		}"
		end

	gsl_bspline_workspace_struct_get_km1 (a_structure: POINTER): like size_t is
			-- Query for km1 field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_km1"
		}"
		end

	gsl_bspline_workspace_struct_get_l (a_structure: POINTER): like size_t is
			-- Query for l field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_l"
		}"
		end

	gsl_bspline_workspace_struct_get_nbreak (a_structure: POINTER): like size_t is
			-- Query for nbreak field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_nbreak"
		}"
		end

	gsl_bspline_workspace_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_n"
		}"
		end

	gsl_bspline_workspace_struct_get_knots (a_structure: POINTER): POINTER is
			-- Query for knots field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_knots"
		}"
		end

	gsl_bspline_workspace_struct_get_deltal (a_structure: POINTER): POINTER is
			-- Query for deltal field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_deltal"
		}"
		end

	gsl_bspline_workspace_struct_get_deltar (a_structure: POINTER): POINTER is
			-- Query for deltar field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_deltar"
		}"
		end

	gsl_bspline_workspace_struct_get_b (a_structure: POINTER): POINTER is
			-- Query for B field of GSL_BSPLINE_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_bspline_workspace_struct_get_b"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_bspline_workspace"
		}"
		end

end -- class GSL_BSPLINE_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

