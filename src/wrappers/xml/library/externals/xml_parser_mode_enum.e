-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_MODE_ENUM

insert ENUM

<<<<<<< HEAD
creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_parse_dom_low_level)  or else
				(a_value = xml_parse_push_dom_low_level)  or else
				(a_value = xml_parse_push_sax_low_level)  or else
				(a_value = xml_parse_reader_low_level)  or else
				(a_value = xml_parse_sax_low_level)  or else
				(a_value = xml_parse_unknown_low_level) )
=======
create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown_low_level)  or else
				(a_value = dom_low_level)  or else
				(a_value = sax_low_level)  or else
				(a_value = push_dom_low_level)  or else
				(a_value = push_sax_low_level)  or else
				(a_value = reader_low_level) )
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		end

feature {ANY} -- Setters
	default_create,
	set_xml_parse_dom is
		do
			value := xml_parse_dom_low_level
		end

	set_xml_parse_push_dom is
		do
			value := xml_parse_push_dom_low_level
		end

	set_xml_parse_push_sax is
		do
			value := xml_parse_push_sax_low_level
		end

	set_xml_parse_reader is
		do
			value := xml_parse_reader_low_level
		end

	set_xml_parse_sax is
		do
			value := xml_parse_sax_low_level
		end

	set_xml_parse_unknown is
		do
			value := xml_parse_unknown_low_level
		end

<<<<<<< HEAD
feature -- Queries
	is_xml_parse_dom: BOOLEAN is
=======
feature {ANY} -- Queries
	unknown: BOOLEAN is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		do
			Result := (value=xml_parse_dom_low_level)
		end

	is_xml_parse_push_dom: BOOLEAN is
		do
			Result := (value=xml_parse_push_dom_low_level)
		end

	is_xml_parse_push_sax: BOOLEAN is
		do
			Result := (value=xml_parse_push_sax_low_level)
		end

	is_xml_parse_reader: BOOLEAN is
		do
			Result := (value=xml_parse_reader_low_level)
		end

	is_xml_parse_sax: BOOLEAN is
		do
			Result := (value=xml_parse_sax_low_level)
		end

	is_xml_parse_unknown: BOOLEAN is
		do
			Result := (value=xml_parse_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parse_dom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_DOM"
 			}"
 		end

	xml_parse_push_dom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_PUSH_DOM"
 			}"
 		end

	xml_parse_push_sax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_PUSH_SAX"
 			}"
 		end

	xml_parse_reader_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_READER"
 			}"
 		end

	xml_parse_sax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_SAX"
 			}"
 		end

	xml_parse_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_UNKNOWN"
 			}"
 		end


end -- class XML_PARSER_MODE_ENUM
