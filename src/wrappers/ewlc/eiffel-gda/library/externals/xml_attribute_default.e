-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ATTRIBUTE_DEFAULT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_attribute_none) or else 
				(a_value = xml_attribute_required) or else 
				(a_value = xml_attribute_implied) or else 
				(a_value = xml_attribute_fixed))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := xml_attribute_none
		end

	set_required
		do
			value := xml_attribute_required
		end

	set_implied
		do
			value := xml_attribute_implied
		end

	set_fixed
		do
			value := xml_attribute_fixed
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=xml_attribute_none)
		end

	is_required: BOOLEAN
		do
			Result := (value=xml_attribute_required)
		end

	is_implied: BOOLEAN
		do
			Result := (value=xml_attribute_implied)
		end

	is_fixed: BOOLEAN
		do
			Result := (value=xml_attribute_fixed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_NONE"
		end

	xml_attribute_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_REQUIRED"
		end

	xml_attribute_implied: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_IMPLIED"
		end

	xml_attribute_fixed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ATTRIBUTE_FIXED"
		end


end

