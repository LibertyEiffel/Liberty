-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_BUFFER_ALLOCATION_SCHEME
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_buffer_alloc_doubleit) or else 
				(a_value = xml_buffer_alloc_exact) or else 
				(a_value = xml_buffer_alloc_immutable))
		end


feature {ANY} -- Setters
	default_create, set_xml_buffer_alloc_doubleit is
		do
			value := xml_buffer_alloc_doubleit
		end

	set_xml_buffer_alloc_exact is
		do
			value := xml_buffer_alloc_exact
		end

	set_xml_buffer_alloc_immutable is
		do
			value := xml_buffer_alloc_immutable
		end


feature {ANY} -- Queries
	is_xml_buffer_alloc_doubleit: BOOLEAN is
		do
			Result := (value=xml_buffer_alloc_doubleit)
		end

	is_xml_buffer_alloc_exact: BOOLEAN is
		do
			Result := (value=xml_buffer_alloc_exact)
		end

	is_xml_buffer_alloc_immutable: BOOLEAN is
		do
			Result := (value=xml_buffer_alloc_immutable)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_buffer_alloc_doubleit: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_BUFFER_ALLOC_DOUBLEIT"
		end

	xml_buffer_alloc_exact: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_BUFFER_ALLOC_EXACT"
		end

	xml_buffer_alloc_immutable: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_BUFFER_ALLOC_IMMUTABLE"
		end


end

