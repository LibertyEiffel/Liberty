-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_MATRIX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

	cairo_matrix_struct_set_xx (a_structure: POINTER; a_value: REAL) is
			-- Setter for xx field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_set_xx"
		}"
		end

	cairo_matrix_struct_set_yx (a_structure: POINTER; a_value: REAL) is
			-- Setter for yx field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_set_yx"
		}"
		end

	cairo_matrix_struct_set_xy (a_structure: POINTER; a_value: REAL) is
			-- Setter for xy field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_set_xy"
		}"
		end

	cairo_matrix_struct_set_yy (a_structure: POINTER; a_value: REAL) is
			-- Setter for yy field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_set_yy"
		}"
		end

	cairo_matrix_struct_set_x0 (a_structure: POINTER; a_value: REAL) is
			-- Setter for x0 field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_set_x0"
		}"
		end

	cairo_matrix_struct_set_y0 (a_structure: POINTER; a_value: REAL) is
			-- Setter for y0 field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_set_y0"
		}"
		end

feature {} -- Low-level queries

	cairo_matrix_struct_get_xx (a_structure: POINTER): REAL is
			-- Query for xx field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_get_xx"
		}"
		end

	cairo_matrix_struct_get_yx (a_structure: POINTER): REAL is
			-- Query for yx field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_get_yx"
		}"
		end

	cairo_matrix_struct_get_xy (a_structure: POINTER): REAL is
			-- Query for xy field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_get_xy"
		}"
		end

	cairo_matrix_struct_get_yy (a_structure: POINTER): REAL is
			-- Query for yy field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_get_yy"
		}"
		end

	cairo_matrix_struct_get_x0 (a_structure: POINTER): REAL is
			-- Query for x0 field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_get_x0"
		}"
		end

	cairo_matrix_struct_get_y0 (a_structure: POINTER): REAL is
			-- Query for y0 field of CAIRO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_struct_get_y0"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__cairo_matrix"
		}"
		end

end -- class CAIRO_MATRIX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

