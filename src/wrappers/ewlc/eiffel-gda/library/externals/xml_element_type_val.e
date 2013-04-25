-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_TYPE_VAL
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_element_type_undefined) or else 
				(a_value = xml_element_type_empty) or else 
				(a_value = xml_element_type_any) or else 
				(a_value = xml_element_type_mixed) or else 
				(a_value = xml_element_type_element))
		end


feature {ANY} -- Setters
	default_create, set_undefined is
		do
			value := xml_element_type_undefined
		end

	set_empty is
		do
			value := xml_element_type_empty
		end

	set_any is
		do
			value := xml_element_type_any
		end

	set_mixed is
		do
			value := xml_element_type_mixed
		end

	set_element is
		do
			value := xml_element_type_element
		end


feature {ANY} -- Queries
	is_undefined: BOOLEAN is
		do
			Result := (value=xml_element_type_undefined)
		end

	is_empty: BOOLEAN is
		do
			Result := (value=xml_element_type_empty)
		end

	is_any: BOOLEAN is
		do
			Result := (value=xml_element_type_any)
		end

	is_mixed: BOOLEAN is
		do
			Result := (value=xml_element_type_mixed)
		end

	is_element: BOOLEAN is
		do
			Result := (value=xml_element_type_element)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_type_undefined: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_UNDEFINED"
		end

	xml_element_type_empty: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_EMPTY"
		end

	xml_element_type_any: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_ANY"
		end

	xml_element_type_mixed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_MIXED"
		end

	xml_element_type_element: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_ELEMENT"
		end


end

