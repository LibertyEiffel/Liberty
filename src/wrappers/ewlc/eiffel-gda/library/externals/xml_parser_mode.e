-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_MODE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_parse_unknown) or else 
				(a_value = xml_parse_dom) or else 
				(a_value = xml_parse_sax) or else 
				(a_value = xml_parse_push_dom) or else 
				(a_value = xml_parse_push_sax) or else 
				(a_value = xml_parse_reader))
		end


feature {ANY} -- Setters
	default_create, set_unknown
		do
			value := xml_parse_unknown
		end

	set_dom
		do
			value := xml_parse_dom
		end

	set_sax
		do
			value := xml_parse_sax
		end

	set_push_dom
		do
			value := xml_parse_push_dom
		end

	set_push_sax
		do
			value := xml_parse_push_sax
		end

	set_reader
		do
			value := xml_parse_reader
		end


feature {ANY} -- Queries
	is_unknown: BOOLEAN
		do
			Result := (value=xml_parse_unknown)
		end

	is_dom: BOOLEAN
		do
			Result := (value=xml_parse_dom)
		end

	is_sax: BOOLEAN
		do
			Result := (value=xml_parse_sax)
		end

	is_push_dom: BOOLEAN
		do
			Result := (value=xml_parse_push_dom)
		end

	is_push_sax: BOOLEAN
		do
			Result := (value=xml_parse_push_sax)
		end

	is_reader: BOOLEAN
		do
			Result := (value=xml_parse_reader)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parse_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_UNKNOWN"
		end

	xml_parse_dom: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_DOM"
		end

	xml_parse_sax: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_SAX"
		end

	xml_parse_push_dom: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_PUSH_DOM"
		end

	xml_parse_push_sax: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_PUSH_SAX"
		end

	xml_parse_reader: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_READER"
		end


end

