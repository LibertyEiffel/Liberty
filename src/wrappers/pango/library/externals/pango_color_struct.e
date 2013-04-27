-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_COLOR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_color_struct_set_red (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for red field of PANGO_COLOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_struct_set_red"
		}"
		end

	pango_color_struct_set_green (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for green field of PANGO_COLOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_struct_set_green"
		}"
		end

	pango_color_struct_set_blue (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for blue field of PANGO_COLOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_struct_set_blue"
		}"
		end

feature {} -- Low-level queries

	pango_color_struct_get_red (a_structure: POINTER): NATURAL_16 is
			-- Query for red field of PANGO_COLOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_struct_get_red"
		}"
		end

	pango_color_struct_get_green (a_structure: POINTER): NATURAL_16 is
			-- Query for green field of PANGO_COLOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_struct_get_green"
		}"
		end

	pango_color_struct_get_blue (a_structure: POINTER): NATURAL_16 is
			-- Query for blue field of PANGO_COLOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_struct_get_blue"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoColor"
		}"
		end

end -- class PANGO_COLOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

