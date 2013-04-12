-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLENUMERATION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlenumeration_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of XMLENUMERATION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlenumeration_struct_set_next"
		}"
		end

	xmlenumeration_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of XMLENUMERATION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlenumeration_struct_set_name"
		}"
		end

feature {} -- Low-level queries

	xmlenumeration_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of XMLENUMERATION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlenumeration_struct_get_next"
		}"
		end

	xmlenumeration_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of XMLENUMERATION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlenumeration_struct_get_name"
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

end -- class XMLENUMERATION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

