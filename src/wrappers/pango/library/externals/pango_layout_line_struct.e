-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_LAYOUT_LINE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_layout_line_struct_set_layout (a_structure: POINTER; a_value: POINTER) is
			-- Setter for layout field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_set_layout"
		}"
		end

	pango_layout_line_struct_set_start_index (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for start_index field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_set_start_index"
		}"
		end

	pango_layout_line_struct_set_length (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for length field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_set_length"
		}"
		end

	pango_layout_line_struct_set_runs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for runs field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_set_runs"
		}"
		end

	pango_layout_line_struct_set_is_paragraph_start (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_paragraph_start field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_set_is_paragraph_start"
		}"
		end

	pango_layout_line_struct_set_resolved_dir (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for resolved_dir field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_set_resolved_dir"
		}"
		end

feature {} -- Low-level queries

	pango_layout_line_struct_get_layout (a_structure: POINTER): POINTER is
			-- Query for layout field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_get_layout"
		}"
		end

	pango_layout_line_struct_get_start_index (a_structure: POINTER): INTEGER_32 is
			-- Query for start_index field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_get_start_index"
		}"
		end

	pango_layout_line_struct_get_length (a_structure: POINTER): INTEGER_32 is
			-- Query for length field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_get_length"
		}"
		end

	pango_layout_line_struct_get_runs (a_structure: POINTER): POINTER is
			-- Query for runs field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_get_runs"
		}"
		end

	pango_layout_line_struct_get_is_paragraph_start (a_structure: POINTER): NATURAL_32 is
			-- Query for is_paragraph_start field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_get_is_paragraph_start"
		}"
		end

	pango_layout_line_struct_get_resolved_dir (a_structure: POINTER): NATURAL_32 is
			-- Query for resolved_dir field of PANGO_LAYOUT_LINE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_struct_get_resolved_dir"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoLayoutLine"
		}"
		end

end -- class PANGO_LAYOUT_LINE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

