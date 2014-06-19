-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_BUFFER_ALLOCATION_SCHEME_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_buffer_alloc_doubleit_low_level)  or else
				(a_value = xml_buffer_alloc_exact_low_level)  or else
				(a_value = xml_buffer_alloc_immutable_low_level)  or else
				(a_value = xml_buffer_alloc_io_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_buffer_alloc_doubleit
		do
			value := xml_buffer_alloc_doubleit_low_level
		end

	set_xml_buffer_alloc_exact
		do
			value := xml_buffer_alloc_exact_low_level
		end

	set_xml_buffer_alloc_immutable
		do
			value := xml_buffer_alloc_immutable_low_level
		end

	set_xml_buffer_alloc_io
		do
			value := xml_buffer_alloc_io_low_level
		end

feature -- Queries
	is_xml_buffer_alloc_doubleit: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_doubleit_low_level)
		end

	is_xml_buffer_alloc_exact: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_exact_low_level)
		end

	is_xml_buffer_alloc_immutable: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_immutable_low_level)
		end

	is_xml_buffer_alloc_io: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_io_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_buffer_alloc_doubleit_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_DOUBLEIT"
 			}"
 		end

	xml_buffer_alloc_exact_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_EXACT"
 			}"
 		end

	xml_buffer_alloc_immutable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_IMMUTABLE"
 			}"
 		end

	xml_buffer_alloc_io_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_BUFFER_ALLOC_IO"
 			}"
 		end


end -- class XML_BUFFER_ALLOCATION_SCHEME_ENUM
