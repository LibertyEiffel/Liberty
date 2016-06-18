-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_TYPE_VAL
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_element_type_undefined) or else 
				(a_value = xml_element_type_empty) or else 
				(a_value = xml_element_type_any) or else 
				(a_value = xml_element_type_mixed) or else 
				(a_value = xml_element_type_element))
		end


feature {ANY} -- Setters
	default_create, set_undefined
		do
			value := xml_element_type_undefined
		end

	set_empty
		do
			value := xml_element_type_empty
		end

	set_any
		do
			value := xml_element_type_any
		end

	set_mixed
		do
			value := xml_element_type_mixed
		end

	set_element
		do
			value := xml_element_type_element
		end


feature {ANY} -- Queries
	is_undefined: BOOLEAN
		do
			Result := (value=xml_element_type_undefined)
		end

	is_empty: BOOLEAN
		do
			Result := (value=xml_element_type_empty)
		end

	is_any: BOOLEAN
		do
			Result := (value=xml_element_type_any)
		end

	is_mixed: BOOLEAN
		do
			Result := (value=xml_element_type_mixed)
		end

	is_element: BOOLEAN
		do
			Result := (value=xml_element_type_element)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_type_undefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_UNDEFINED"
		end

	xml_element_type_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_EMPTY"
		end

	xml_element_type_any: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_ANY"
		end

	xml_element_type_mixed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_MIXED"
		end

	xml_element_type_element: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_TYPE_ELEMENT"
		end


end

