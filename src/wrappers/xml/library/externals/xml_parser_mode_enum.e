-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

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
		end

feature {ANY} -- Setters
	default_create,
	set_unknown is
		do
			value := unknown_low_level
		end

	set_dom is
		do
			value := dom_low_level
		end

	set_sax is
		do
			value := sax_low_level
		end

	set_push_dom is
		do
			value := push_dom_low_level
		end

	set_push_sax is
		do
			value := push_sax_low_level
		end

	set_reader is
		do
			value := reader_low_level
		end

feature {ANY} -- Queries
	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	dom: BOOLEAN is
		do
			Result := (value=dom_low_level)
		end

	sax: BOOLEAN is
		do
			Result := (value=sax_low_level)
		end

	push_dom: BOOLEAN is
		do
			Result := (value=push_dom_low_level)
		end

	push_sax: BOOLEAN is
		do
			Result := (value=push_sax_low_level)
		end

	reader: BOOLEAN is
		do
			Result := (value=reader_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_UNKNOWN"
 			}"
 		end

	dom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_DOM"
 			}"
 		end

	sax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_SAX"
 			}"
 		end

	push_dom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_PUSH_DOM"
 			}"
 		end

	push_sax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_PUSH_SAX"
 			}"
 		end

	reader_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_PARSE_READER"
 			}"
 		end


end -- class XML_PARSER_MODE_ENUM
