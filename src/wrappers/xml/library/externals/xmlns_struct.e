-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLNS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlns_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of XMLNS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_set_next"
		}"
		end

	xmlns_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of XMLNS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_set_type"
		}"
		end

	xmlns_struct_set_href (a_structure: POINTER; a_value: POINTER) is
			-- Setter for href field of XMLNS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_set_href"
		}"
		end

	xmlns_struct_set_prefix (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prefix field of XMLNS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_set_prefix"
		}"
		end

	xmlns_struct_set_context (a_structure: POINTER; a_value: POINTER) is
			-- Setter for context field of XMLNS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_set_context"
		}"
		end

feature {} -- Low-level queries

	xmlns_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of XMLNS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_get_next"
		}"
		end

	xmlns_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of XMLNS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_get_type"
		}"
		end

	xmlns_struct_get_href (a_structure: POINTER): POINTER is
			-- Query for href field of XMLNS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_get_href"
		}"
		end

	xmlns_struct_get_prefix (a_structure: POINTER): POINTER is
			-- Query for prefix field of XMLNS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_get_prefix"
		}"
		end

	-- Unwrappable field _private.
	xmlns_struct_get_context (a_structure: POINTER): POINTER is
			-- Query for context field of XMLNS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlns_struct_get_context"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlNs"
		}"
		end

end -- class XMLNS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

