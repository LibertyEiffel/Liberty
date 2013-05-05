-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_RECTANGLE_LIST_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

	cairo_rectangle_list_struct_set_status (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for status field of CAIRO_RECTANGLE_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_struct_set_status"
		}"
		end

	cairo_rectangle_list_struct_set_rectangles (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rectangles field of CAIRO_RECTANGLE_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_struct_set_rectangles"
		}"
		end

	cairo_rectangle_list_struct_set_num_rectangles (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for num_rectangles field of CAIRO_RECTANGLE_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_struct_set_num_rectangles"
		}"
		end

feature {} -- Low-level queries

	cairo_rectangle_list_struct_get_status (a_structure: POINTER): INTEGER is
			-- Query for status field of CAIRO_RECTANGLE_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_struct_get_status"
		}"
		end

	cairo_rectangle_list_struct_get_rectangles (a_structure: POINTER): POINTER is
			-- Query for rectangles field of CAIRO_RECTANGLE_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_struct_get_rectangles"
		}"
		end

	cairo_rectangle_list_struct_get_num_rectangles (a_structure: POINTER): INTEGER is
			-- Query for num_rectangles field of CAIRO_RECTANGLE_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_struct_get_num_rectangles"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__cairo_rectangle_list"
		}"
		end

end -- class CAIRO_RECTANGLE_LIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

