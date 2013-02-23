-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XML_ENUMERATION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xml_enumeration_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of XML_ENUMERATION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_enumeration_struct_set_next"
		}"
		end

	xml_enumeration_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of XML_ENUMERATION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_enumeration_struct_set_name"
		}"
		end

feature {} -- Low-level queries

	xml_enumeration_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of XML_ENUMERATION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_enumeration_struct_get_next"
		}"
		end

	xml_enumeration_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of XML_ENUMERATION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_enumeration_struct_get_name"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlEnumeration"
		}"
		end

end -- class XML_ENUMERATION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

