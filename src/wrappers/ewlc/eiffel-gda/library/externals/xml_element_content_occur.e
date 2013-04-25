-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_CONTENT_OCCUR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_element_content_once) or else 
				(a_value = xml_element_content_opt) or else 
				(a_value = xml_element_content_mult) or else 
				(a_value = xml_element_content_plus))
		end


feature {ANY} -- Setters
	default_create, set_once_external is
		do
			value := xml_element_content_once
		end

	set_opt is
		do
			value := xml_element_content_opt
		end

	set_mult is
		do
			value := xml_element_content_mult
		end

	set_plus is
		do
			value := xml_element_content_plus
		end


feature {ANY} -- Queries
	is_once_external: BOOLEAN is
		do
			Result := (value=xml_element_content_once)
		end

	is_opt: BOOLEAN is
		do
			Result := (value=xml_element_content_opt)
		end

	is_mult: BOOLEAN is
		do
			Result := (value=xml_element_content_mult)
		end

	is_plus: BOOLEAN is
		do
			Result := (value=xml_element_content_plus)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_content_once: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_ONCE"
		end

	xml_element_content_opt: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_OPT"
		end

	xml_element_content_mult: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_MULT"
		end

	xml_element_content_plus: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ELEMENT_CONTENT_PLUS"
		end


end

