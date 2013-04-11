-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_RECTANGLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_rectangle_struct_set_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for x field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_set_x"
		}"
		end

	pango_rectangle_struct_set_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for y field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_set_y"
		}"
		end

	pango_rectangle_struct_set_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for width field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_set_width"
		}"
		end

	pango_rectangle_struct_set_height (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for height field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	pango_rectangle_struct_get_x (a_structure: POINTER): INTEGER_32 is
			-- Query for x field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_get_x"
		}"
		end

	pango_rectangle_struct_get_y (a_structure: POINTER): INTEGER_32 is
			-- Query for y field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_get_y"
		}"
		end

	pango_rectangle_struct_get_width (a_structure: POINTER): INTEGER_32 is
			-- Query for width field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_get_width"
		}"
		end

	pango_rectangle_struct_get_height (a_structure: POINTER): INTEGER_32 is
			-- Query for height field of PANGO_RECTANGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_rectangle_struct_get_height"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoRectangle"
		}"
		end

end -- class PANGO_RECTANGLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

