-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLSAXLOCATOR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlsaxlocator_struct_set_getpublicid (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getPublicId field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_set_getpublicid"
		}"
		end

	xmlsaxlocator_struct_set_getsystemid (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getSystemId field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_set_getsystemid"
		}"
		end

	xmlsaxlocator_struct_set_getlinenumber (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getLineNumber field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_set_getlinenumber"
		}"
		end

	xmlsaxlocator_struct_set_getcolumnnumber (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getColumnNumber field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_set_getcolumnnumber"
		}"
		end

feature {} -- Low-level queries

	xmlsaxlocator_struct_get_getpublicid (a_structure: POINTER): POINTER is
			-- Query for getPublicId field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_get_getpublicid"
		}"
		end

	xmlsaxlocator_struct_get_getsystemid (a_structure: POINTER): POINTER is
			-- Query for getSystemId field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_get_getsystemid"
		}"
		end

	xmlsaxlocator_struct_get_getlinenumber (a_structure: POINTER): POINTER is
			-- Query for getLineNumber field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_get_getlinenumber"
		}"
		end

	xmlsaxlocator_struct_get_getcolumnnumber (a_structure: POINTER): POINTER is
			-- Query for getColumnNumber field of XMLSAXLOCATOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlsaxlocator_struct_get_getcolumnnumber"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlSAXLocator"
		}"
		end

end -- class XMLSAXLOCATOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

