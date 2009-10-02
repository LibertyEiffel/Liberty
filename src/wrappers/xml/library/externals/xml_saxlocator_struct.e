-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class XML_SAXLOCATOR_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	xmlsaxlocator_struct_set_getpublicid (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getPublicId field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_set_getpublicid"
		}"
		end

	xmlsaxlocator_struct_set_getsystemid (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getSystemId field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_set_getsystemid"
		}"
		end

	xmlsaxlocator_struct_set_getlinenumber (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getLineNumber field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_set_getlinenumber"
		}"
		end

	xmlsaxlocator_struct_set_getcolumnnumber (a_structure: POINTER; a_value: POINTER) is
			-- Setter for getColumnNumber field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_set_getcolumnnumber"
		}"
		end

feature {} -- Low-level queries

	xmlsaxlocator_struct_get_getpublicid (a_structure: POINTER): POINTER is
			-- Query for getPublicId field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_get_getpublicid"
		}"
		end

	xmlsaxlocator_struct_get_getsystemid (a_structure: POINTER): POINTER is
			-- Query for getSystemId field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_get_getsystemid"
		}"
		end

	xmlsaxlocator_struct_get_getlinenumber (a_structure: POINTER): POINTER is
			-- Query for getLineNumber field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_get_getlinenumber"
		}"
		end

	xmlsaxlocator_struct_get_getcolumnnumber (a_structure: POINTER): POINTER is
			-- Query for getColumnNumber field of xmlSAXLocator structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "xmlsaxlocator_struct_get_getcolumnnumber"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_xmlSAXLocator"
		}"
		end

end
