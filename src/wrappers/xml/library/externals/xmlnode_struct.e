-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLNODE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlnode_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_type"
		}"
		end

	xmlnode_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_name"
		}"
		end

	xmlnode_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_children"
		}"
		end

	xmlnode_struct_set_last (a_structure: POINTER; a_value: POINTER) is
			-- Setter for last field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_last"
		}"
		end

	xmlnode_struct_set_parent (a_structure: POINTER; a_value: POINTER) is
			-- Setter for parent field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_parent"
		}"
		end

	xmlnode_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_next"
		}"
		end

	xmlnode_struct_set_prev (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prev field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_prev"
		}"
		end

	xmlnode_struct_set_doc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for doc field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_doc"
		}"
		end

	xmlnode_struct_set_ns (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ns field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_ns"
		}"
		end

	xmlnode_struct_set_content (a_structure: POINTER; a_value: POINTER) is
			-- Setter for content field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_content"
		}"
		end

	xmlnode_struct_set_properties (a_structure: POINTER; a_value: POINTER) is
			-- Setter for properties field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_properties"
		}"
		end

	xmlnode_struct_set_nsdef (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nsDef field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_nsdef"
		}"
		end

	xmlnode_struct_set_psvi (a_structure: POINTER; a_value: POINTER) is
			-- Setter for psvi field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_psvi"
		}"
		end

	xmlnode_struct_set_line (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for line field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_line"
		}"
		end

	xmlnode_struct_set_extra (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for extra field of XMLNODE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_set_extra"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field _private.
	xmlnode_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_type"
		}"
		end

	xmlnode_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_name"
		}"
		end

	xmlnode_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_children"
		}"
		end

	xmlnode_struct_get_last (a_structure: POINTER): POINTER is
			-- Query for last field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_last"
		}"
		end

	xmlnode_struct_get_parent (a_structure: POINTER): POINTER is
			-- Query for parent field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_parent"
		}"
		end

	xmlnode_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_next"
		}"
		end

	xmlnode_struct_get_prev (a_structure: POINTER): POINTER is
			-- Query for prev field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_prev"
		}"
		end

	xmlnode_struct_get_doc (a_structure: POINTER): POINTER is
			-- Query for doc field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_doc"
		}"
		end

	xmlnode_struct_get_ns (a_structure: POINTER): POINTER is
			-- Query for ns field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_ns"
		}"
		end

	xmlnode_struct_get_content (a_structure: POINTER): POINTER is
			-- Query for content field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_content"
		}"
		end

	xmlnode_struct_get_properties (a_structure: POINTER): POINTER is
			-- Query for properties field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_properties"
		}"
		end

	xmlnode_struct_get_nsdef (a_structure: POINTER): POINTER is
			-- Query for nsDef field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_nsdef"
		}"
		end

	xmlnode_struct_get_psvi (a_structure: POINTER): POINTER is
			-- Query for psvi field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_psvi"
		}"
		end

	xmlnode_struct_get_line (a_structure: POINTER): NATURAL_16 is
			-- Query for line field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_line"
		}"
		end

	xmlnode_struct_get_extra (a_structure: POINTER): NATURAL_16 is
			-- Query for extra field of XMLNODE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlnode_struct_get_extra"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlNode"
		}"
		end

end -- class XMLNODE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

