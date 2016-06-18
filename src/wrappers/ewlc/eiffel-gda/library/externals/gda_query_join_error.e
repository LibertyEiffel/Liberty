-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_JOIN_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_query_join_xml_load_error) or else 
				(a_value = gda_query_join_meta_data_update) or else 
				(a_value = gda_query_join_fields_error) or else 
				(a_value = gda_query_join_sql_analyse_error) or else 
				(a_value = gda_query_join_parse_error))
		end


feature {ANY} -- Setters
	default_create, set_xml_load_error
		do
			value := gda_query_join_xml_load_error
		end

	set_meta_data_update
		do
			value := gda_query_join_meta_data_update
		end

	set_fields_error
		do
			value := gda_query_join_fields_error
		end

	set_sql_analyse_error
		do
			value := gda_query_join_sql_analyse_error
		end

	set_parse_error
		do
			value := gda_query_join_parse_error
		end


feature {ANY} -- Queries
	is_xml_load_error: BOOLEAN
		do
			Result := (value=gda_query_join_xml_load_error)
		end

	is_meta_data_update: BOOLEAN
		do
			Result := (value=gda_query_join_meta_data_update)
		end

	is_fields_error: BOOLEAN
		do
			Result := (value=gda_query_join_fields_error)
		end

	is_sql_analyse_error: BOOLEAN
		do
			Result := (value=gda_query_join_sql_analyse_error)
		end

	is_parse_error: BOOLEAN
		do
			Result := (value=gda_query_join_parse_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_join_xml_load_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_XML_LOAD_ERROR"
		end

	gda_query_join_meta_data_update: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_META_DATA_UPDATE"
		end

	gda_query_join_fields_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_FIELDS_ERROR"
		end

	gda_query_join_sql_analyse_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_SQL_ANALYSE_ERROR"
		end

	gda_query_join_parse_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_PARSE_ERROR"
		end


end

