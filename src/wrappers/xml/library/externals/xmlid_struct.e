-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLID_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlid_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of XMLID_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_set_next"
		}"
		end

	xmlid_struct_set_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value field of XMLID_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_set_value"
		}"
		end

	xmlid_struct_set_attr (a_structure: POINTER; a_value: POINTER) is
			-- Setter for attr field of XMLID_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_set_attr"
		}"
		end

	xmlid_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of XMLID_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_set_name"
		}"
		end

	xmlid_struct_set_lineno (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for lineno field of XMLID_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_set_lineno"
		}"
		end

	xmlid_struct_set_doc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for doc field of XMLID_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_set_doc"
		}"
		end

feature {} -- Low-level queries

	xmlid_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of XMLID_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_get_next"
		}"
		end

	xmlid_struct_get_value (a_structure: POINTER): POINTER is
			-- Query for value field of XMLID_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_get_value"
		}"
		end

	xmlid_struct_get_attr (a_structure: POINTER): POINTER is
			-- Query for attr field of XMLID_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_get_attr"
		}"
		end

	xmlid_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of XMLID_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_get_name"
		}"
		end

	xmlid_struct_get_lineno (a_structure: POINTER): INTEGER_32 is
			-- Query for lineno field of XMLID_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_get_lineno"
		}"
		end

	xmlid_struct_get_doc (a_structure: POINTER): POINTER is
			-- Query for doc field of XMLID_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlid_struct_get_doc"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlID"
		}"
		end

end -- class XMLID_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

