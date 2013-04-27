-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMARKUPPARSER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gmarkupparser_struct_set_start_element (a_structure: POINTER; a_value: POINTER) is
			-- Setter for start_element field of GMARKUPPARSER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_set_start_element"
		}"
		end

	gmarkupparser_struct_set_end_element (a_structure: POINTER; a_value: POINTER) is
			-- Setter for end_element field of GMARKUPPARSER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_set_end_element"
		}"
		end

	gmarkupparser_struct_set_text (a_structure: POINTER; a_value: POINTER) is
			-- Setter for text field of GMARKUPPARSER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_set_text"
		}"
		end

	gmarkupparser_struct_set_passthrough (a_structure: POINTER; a_value: POINTER) is
			-- Setter for passthrough field of GMARKUPPARSER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_set_passthrough"
		}"
		end

	gmarkupparser_struct_set_error (a_structure: POINTER; a_value: POINTER) is
			-- Setter for error field of GMARKUPPARSER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_set_error"
		}"
		end

feature {} -- Low-level queries

	gmarkupparser_struct_get_start_element (a_structure: POINTER): POINTER is
			-- Query for start_element field of GMARKUPPARSER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_get_start_element"
		}"
		end

	gmarkupparser_struct_get_end_element (a_structure: POINTER): POINTER is
			-- Query for end_element field of GMARKUPPARSER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_get_end_element"
		}"
		end

	gmarkupparser_struct_get_text (a_structure: POINTER): POINTER is
			-- Query for text field of GMARKUPPARSER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_get_text"
		}"
		end

	gmarkupparser_struct_get_passthrough (a_structure: POINTER): POINTER is
			-- Query for passthrough field of GMARKUPPARSER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_get_passthrough"
		}"
		end

	gmarkupparser_struct_get_error (a_structure: POINTER): POINTER is
			-- Query for error field of GMARKUPPARSER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmarkupparser_struct_get_error"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GMarkupParser"
		}"
		end

end -- class GMARKUPPARSER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

