-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_MODE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_parse_unknown) or else 
				(a_value = xml_parse_dom) or else 
				(a_value = xml_parse_sax) or else 
				(a_value = xml_parse_push_dom) or else 
				(a_value = xml_parse_push_sax) or else 
				(a_value = xml_parse_reader))
		end


feature {ANY} -- Setters
	default_create, set_unknown is
		do
			value := xml_parse_unknown
		end

	set_dom is
		do
			value := xml_parse_dom
		end

	set_sax is
		do
			value := xml_parse_sax
		end

	set_push_dom is
		do
			value := xml_parse_push_dom
		end

	set_push_sax is
		do
			value := xml_parse_push_sax
		end

	set_reader is
		do
			value := xml_parse_reader
		end


feature {ANY} -- Queries
	is_unknown: BOOLEAN is
		do
			Result := (value=xml_parse_unknown)
		end

	is_dom: BOOLEAN is
		do
			Result := (value=xml_parse_dom)
		end

	is_sax: BOOLEAN is
		do
			Result := (value=xml_parse_sax)
		end

	is_push_dom: BOOLEAN is
		do
			Result := (value=xml_parse_push_dom)
		end

	is_push_sax: BOOLEAN is
		do
			Result := (value=xml_parse_push_sax)
		end

	is_reader: BOOLEAN is
		do
			Result := (value=xml_parse_reader)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parse_unknown: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_UNKNOWN"
		end

	xml_parse_dom: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_DOM"
		end

	xml_parse_sax: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_SAX"
		end

	xml_parse_push_dom: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_PUSH_DOM"
		end

	xml_parse_push_sax: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_PUSH_SAX"
		end

	xml_parse_reader: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_READER"
		end


end

