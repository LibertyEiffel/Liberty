-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_CONTENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_element_content_pcdata) or else 
				(a_value = xml_element_content_element) or else 
				(a_value = xml_element_content_seq) or else 
				(a_value = xml_element_content_or))
		end


feature {ANY} -- Setters
	default_create, set_pcdata
		do
			value := xml_element_content_pcdata
		end

	set_element
		do
			value := xml_element_content_element
		end

	set_seq
		do
			value := xml_element_content_seq
		end

	set_or
		do
			value := xml_element_content_or
		end


feature {ANY} -- Queries
	is_pcdata: BOOLEAN
		do
			Result := (value=xml_element_content_pcdata)
		end

	is_element: BOOLEAN
		do
			Result := (value=xml_element_content_element)
		end

	is_seq: BOOLEAN
		do
			Result := (value=xml_element_content_seq)
		end

	is_or: BOOLEAN
		do
			Result := (value=xml_element_content_or)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_content_pcdata: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_PCDATA"
		end

	xml_element_content_element: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_ELEMENT"
		end

	xml_element_content_seq: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_SEQ"
		end

	xml_element_content_or: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_OR"
		end


end

