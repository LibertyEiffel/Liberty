-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_OBJECT_REF_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = reference_by_xml_id) or else 
				(a_value = reference_by_name))
		end


feature {ANY} -- Setters
	default_create, set_reference_by_xml_id is
		do
			value := reference_by_xml_id
		end

	set_reference_by_name is
		do
			value := reference_by_name
		end


feature {ANY} -- Queries
	is_reference_by_xml_id: BOOLEAN is
		do
			Result := (value=reference_by_xml_id)
		end

	is_reference_by_name: BOOLEAN is
		do
			Result := (value=reference_by_name)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	reference_by_xml_id: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "REFERENCE_BY_XML_ID"
		end

	reference_by_name: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "REFERENCE_BY_NAME"
		end


end

