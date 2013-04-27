-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_MATRIX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_matrix_struct_set_xx (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for xx field of PANGO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_set_xx"
		}"
		end

	pango_matrix_struct_set_xy (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for xy field of PANGO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_set_xy"
		}"
		end

	pango_matrix_struct_set_yx (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for yx field of PANGO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_set_yx"
		}"
		end

	pango_matrix_struct_set_yy (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for yy field of PANGO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_set_yy"
		}"
		end

	pango_matrix_struct_set_x0 (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for x0 field of PANGO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_set_x0"
		}"
		end

	pango_matrix_struct_set_y0 (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for y0 field of PANGO_MATRIX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_set_y0"
		}"
		end

feature {} -- Low-level queries

	pango_matrix_struct_get_xx (a_structure: POINTER): REAL_64 is
			-- Query for xx field of PANGO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_get_xx"
		}"
		end

	pango_matrix_struct_get_xy (a_structure: POINTER): REAL_64 is
			-- Query for xy field of PANGO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_get_xy"
		}"
		end

	pango_matrix_struct_get_yx (a_structure: POINTER): REAL_64 is
			-- Query for yx field of PANGO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_get_yx"
		}"
		end

	pango_matrix_struct_get_yy (a_structure: POINTER): REAL_64 is
			-- Query for yy field of PANGO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_get_yy"
		}"
		end

	pango_matrix_struct_get_x0 (a_structure: POINTER): REAL_64 is
			-- Query for x0 field of PANGO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_get_x0"
		}"
		end

	pango_matrix_struct_get_y0 (a_structure: POINTER): REAL_64 is
			-- Query for y0 field of PANGO_MATRIX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_struct_get_y0"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoMatrix"
		}"
		end

end -- class PANGO_MATRIX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

