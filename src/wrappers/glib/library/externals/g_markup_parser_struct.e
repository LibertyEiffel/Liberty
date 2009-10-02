-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_MARKUP_PARSER_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gmarkupparser_struct_set_start_element (a_structure: POINTER; a_value: POINTER) is
			-- Setter for start_element field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_set_start_element"
		}"
		end

	gmarkupparser_struct_set_end_element (a_structure: POINTER; a_value: POINTER) is
			-- Setter for end_element field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_set_end_element"
		}"
		end

	gmarkupparser_struct_set_text (a_structure: POINTER; a_value: POINTER) is
			-- Setter for text field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_set_text"
		}"
		end

	gmarkupparser_struct_set_passthrough (a_structure: POINTER; a_value: POINTER) is
			-- Setter for passthrough field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_set_passthrough"
		}"
		end

	gmarkupparser_struct_set_error (a_structure: POINTER; a_value: POINTER) is
			-- Setter for error field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_set_error"
		}"
		end

feature {} -- Low-level queries

	gmarkupparser_struct_get_start_element (a_structure: POINTER): POINTER is
			-- Query for start_element field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_get_start_element"
		}"
		end

	gmarkupparser_struct_get_end_element (a_structure: POINTER): POINTER is
			-- Query for end_element field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_get_end_element"
		}"
		end

	gmarkupparser_struct_get_text (a_structure: POINTER): POINTER is
			-- Query for text field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_get_text"
		}"
		end

	gmarkupparser_struct_get_passthrough (a_structure: POINTER): POINTER is
			-- Query for passthrough field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_get_passthrough"
		}"
		end

	gmarkupparser_struct_get_error (a_structure: POINTER): POINTER is
			-- Query for error field of GMarkupParser structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmarkupparser_struct_get_error"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GMarkupParser"
		}"
		end

end
