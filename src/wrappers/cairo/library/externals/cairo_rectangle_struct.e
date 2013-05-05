-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_RECTANGLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

	cairo_rectangle_struct_set_x (a_structure: POINTER; a_value: REAL) is
			-- Setter for x field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_set_x"
		}"
		end

	cairo_rectangle_struct_set_y (a_structure: POINTER; a_value: REAL) is
			-- Setter for y field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_set_y"
		}"
		end

	cairo_rectangle_struct_set_width (a_structure: POINTER; a_value: REAL) is
			-- Setter for width field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_set_width"
		}"
		end

	cairo_rectangle_struct_set_height (a_structure: POINTER; a_value: REAL) is
			-- Setter for height field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	cairo_rectangle_struct_get_x (a_structure: POINTER): REAL is
			-- Query for x field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_get_x"
		}"
		end

	cairo_rectangle_struct_get_y (a_structure: POINTER): REAL is
			-- Query for y field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_get_y"
		}"
		end

	cairo_rectangle_struct_get_width (a_structure: POINTER): REAL is
			-- Query for width field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_get_width"
		}"
		end

	cairo_rectangle_struct_get_height (a_structure: POINTER): REAL is
			-- Query for height field of CAIRO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_struct_get_height"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__cairo_rectangle"
		}"
		end

end -- class CAIRO_RECTANGLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

