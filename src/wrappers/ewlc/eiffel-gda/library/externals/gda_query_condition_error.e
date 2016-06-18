-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_CONDITION_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_query_condition_xml_load_error) or else 
				(a_value = gda_query_condition_renderer_error) or else 
				(a_value = gda_query_condition_parent_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_query_condition_xml_load_error
		do
			value := gda_query_condition_xml_load_error
		end

	set_gda_query_condition_renderer_error
		do
			value := gda_query_condition_renderer_error
		end

	set_gda_query_condition_parent_error
		do
			value := gda_query_condition_parent_error
		end


feature {ANY} -- Queries
	is_gda_query_condition_xml_load_error: BOOLEAN
		do
			Result := (value=gda_query_condition_xml_load_error)
		end

	is_gda_query_condition_renderer_error: BOOLEAN
		do
			Result := (value=gda_query_condition_renderer_error)
		end

	is_gda_query_condition_parent_error: BOOLEAN
		do
			Result := (value=gda_query_condition_parent_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_condition_xml_load_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_XML_LOAD_ERROR"
		end

	gda_query_condition_renderer_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_RENDERER_ERROR"
		end

	gda_query_condition_parent_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_PARENT_ERROR"
		end


end

