-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_FIELD_VALUE_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_query_field_value_xml_load_error) or else 
				(a_value = gda_query_field_value_render_error) or else 
				(a_value = gda_query_field_value_param_error) or else 
				(a_value = gda_query_field_value_default_param_error))
		end


feature {ANY} -- Setters
	default_create, set_xml_load_error
		do
			value := gda_query_field_value_xml_load_error
		end

	set_render_error
		do
			value := gda_query_field_value_render_error
		end

	set_param_error
		do
			value := gda_query_field_value_param_error
		end

	set_default_param_error
		do
			value := gda_query_field_value_default_param_error
		end


feature {ANY} -- Queries
	is_xml_load_error: BOOLEAN
		do
			Result := (value=gda_query_field_value_xml_load_error)
		end

	is_render_error: BOOLEAN
		do
			Result := (value=gda_query_field_value_render_error)
		end

	is_param_error: BOOLEAN
		do
			Result := (value=gda_query_field_value_param_error)
		end

	is_default_param_error: BOOLEAN
		do
			Result := (value=gda_query_field_value_default_param_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_field_value_xml_load_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_FIELD_VALUE_XML_LOAD_ERROR"
		end

	gda_query_field_value_render_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_FIELD_VALUE_RENDER_ERROR"
		end

	gda_query_field_value_param_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_FIELD_VALUE_PARAM_ERROR"
		end

	gda_query_field_value_default_param_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_FIELD_VALUE_DEFAULT_PARAM_ERROR"
		end


end

