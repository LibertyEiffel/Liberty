-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_BUFFER_ALLOCATION_SCHEME
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_buffer_alloc_doubleit) or else 
				(a_value = xml_buffer_alloc_exact) or else 
				(a_value = xml_buffer_alloc_immutable))
		end


feature {ANY} -- Setters
	default_create, set_xml_buffer_alloc_doubleit
		do
			value := xml_buffer_alloc_doubleit
		end

	set_xml_buffer_alloc_exact
		do
			value := xml_buffer_alloc_exact
		end

	set_xml_buffer_alloc_immutable
		do
			value := xml_buffer_alloc_immutable
		end


feature {ANY} -- Queries
	is_xml_buffer_alloc_doubleit: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_doubleit)
		end

	is_xml_buffer_alloc_exact: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_exact)
		end

	is_xml_buffer_alloc_immutable: BOOLEAN
		do
			Result := (value=xml_buffer_alloc_immutable)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_buffer_alloc_doubleit: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_BUFFER_ALLOC_DOUBLEIT"
		end

	xml_buffer_alloc_exact: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_BUFFER_ALLOC_EXACT"
		end

	xml_buffer_alloc_immutable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_BUFFER_ALLOC_IMMUTABLE"
		end


end

