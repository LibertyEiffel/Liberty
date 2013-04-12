-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLREF_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlref_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of XMLREF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_set_next"
		}"
		end

	xmlref_struct_set_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value field of XMLREF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_set_value"
		}"
		end

	xmlref_struct_set_attr (a_structure: POINTER; a_value: POINTER) is
			-- Setter for attr field of XMLREF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_set_attr"
		}"
		end

	xmlref_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of XMLREF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_set_name"
		}"
		end

	xmlref_struct_set_lineno (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for lineno field of XMLREF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_set_lineno"
		}"
		end

feature {} -- Low-level queries

	xmlref_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of XMLREF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_get_next"
		}"
		end

	xmlref_struct_get_value (a_structure: POINTER): POINTER is
			-- Query for value field of XMLREF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_get_value"
		}"
		end

	xmlref_struct_get_attr (a_structure: POINTER): POINTER is
			-- Query for attr field of XMLREF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_get_attr"
		}"
		end

	xmlref_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of XMLREF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_get_name"
		}"
		end

	xmlref_struct_get_lineno (a_structure: POINTER): INTEGER_32 is
			-- Query for lineno field of XMLREF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlref_struct_get_lineno"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlRef"
		}"
		end

end -- class XMLREF_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

