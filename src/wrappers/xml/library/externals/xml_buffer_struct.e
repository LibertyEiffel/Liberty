-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XML_BUFFER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xml_buffer_struct_set_content (a_structure: POINTER; a_value: POINTER) is
			-- Setter for content field of XML_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_set_content"
		}"
		end

	xml_buffer_struct_set_use (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for use field of XML_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_set_use"
		}"
		end

	xml_buffer_struct_set_size (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for size field of XML_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_set_size"
		}"
		end

	xml_buffer_struct_set_alloc (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for alloc field of XML_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_set_alloc"
		}"
		end

	xml_buffer_struct_set_contentio (a_structure: POINTER; a_value: POINTER) is
			-- Setter for contentIO field of XML_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_set_contentio"
		}"
		end

feature {} -- Low-level queries

	xml_buffer_struct_get_content (a_structure: POINTER): POINTER is
			-- Query for content field of XML_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_get_content"
		}"
		end

	xml_buffer_struct_get_use (a_structure: POINTER): NATURAL is
			-- Query for use field of XML_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_get_use"
		}"
		end

	xml_buffer_struct_get_size (a_structure: POINTER): NATURAL is
			-- Query for size field of XML_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_get_size"
		}"
		end

	xml_buffer_struct_get_alloc (a_structure: POINTER): INTEGER is
			-- Query for alloc field of XML_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_get_alloc"
		}"
		end

	xml_buffer_struct_get_contentio (a_structure: POINTER): POINTER is
			-- Query for contentIO field of XML_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_buffer_struct_get_contentio"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlBuffer"
		}"
		end

end -- class XML_BUFFER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

