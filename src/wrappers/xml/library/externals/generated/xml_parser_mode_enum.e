-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_MODE_ENUM

-- Wrapper of enum xmlParserMode defined in file /usr/include/libxml2/libxml/parser.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = dom_low_level)  or else
				(a_value = push_dom_low_level)  or else
				(a_value = push_sax_low_level)  or else
				(a_value = reader_low_level)  or else
				(a_value = sax_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_dom
               do
                       value := dom_low_level
               end

	set_push_dom
               do
                       value := push_dom_low_level
               end

	set_push_sax
               do
                       value := push_sax_low_level
               end

	set_reader
               do
                       value := reader_low_level
               end

	set_sax
               do
                       value := sax_low_level
               end

	set_unknown
               do
                       value := unknown_low_level
               end

feature {ANY} -- Queries
       is_dom: BOOLEAN
               do
                       Result := (value=dom_low_level)
               end

       is_push_dom: BOOLEAN
               do
                       Result := (value=push_dom_low_level)
               end

       is_push_sax: BOOLEAN
               do
                       Result := (value=push_sax_low_level)
               end

       is_reader: BOOLEAN
               do
                       Result := (value=reader_low_level)
               end

       is_sax: BOOLEAN
               do
                       Result := (value=sax_low_level)
               end

       is_unknown: BOOLEAN
               do
                       Result := (value=unknown_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     dom_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_DOM"
                       }"
               end

     push_dom_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_PUSH_DOM"
                       }"
               end

     push_sax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_PUSH_SAX"
                       }"
               end

     reader_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_READER"
                       }"
               end

     sax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_SAX"
                       }"
               end

     unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_UNKNOWN"
                       }"
               end


end -- class XML_PARSER_MODE_ENUM
