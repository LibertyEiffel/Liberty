-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_query_xml_load_error) or else 
				(a_value = gda_query_meta_data_update) or else 
				(a_value = gda_query_fields_error) or else 
				(a_value = gda_query_targets_error) or else 
				(a_value = gda_query_render_error) or else 
				(a_value = gda_query_parse_error) or else 
				(a_value = gda_query_syntax_error) or else 
				(a_value = gda_query_structure_error) or else 
				(a_value = gda_query_sql_analyse_error) or else 
				(a_value = gda_query_no_cnc_error) or else 
				(a_value = gda_query_cnc_closed_error) or else 
				(a_value = gda_query_exec_error) or else 
				(a_value = gda_query_param_type_error))
		end


feature {ANY} -- Setters
	default_create, set_xml_load_error
		do
			value := gda_query_xml_load_error
		end

	set_meta_data_update
		do
			value := gda_query_meta_data_update
		end

	set_fields_error
		do
			value := gda_query_fields_error
		end

	set_targets_error
		do
			value := gda_query_targets_error
		end

	set_render_error
		do
			value := gda_query_render_error
		end

	set_parse_error
		do
			value := gda_query_parse_error
		end

	set_syntax_error
		do
			value := gda_query_syntax_error
		end

	set_structure_error
		do
			value := gda_query_structure_error
		end

	set_sql_analyse_error
		do
			value := gda_query_sql_analyse_error
		end

	set_no_cnc_error
		do
			value := gda_query_no_cnc_error
		end

	set_cnc_closed_error
		do
			value := gda_query_cnc_closed_error
		end

	set_exec_error
		do
			value := gda_query_exec_error
		end

	set_param_type_error
		do
			value := gda_query_param_type_error
		end


feature {ANY} -- Queries
	is_xml_load_error: BOOLEAN
		do
			Result := (value=gda_query_xml_load_error)
		end

	is_meta_data_update: BOOLEAN
		do
			Result := (value=gda_query_meta_data_update)
		end

	is_fields_error: BOOLEAN
		do
			Result := (value=gda_query_fields_error)
		end

	is_targets_error: BOOLEAN
		do
			Result := (value=gda_query_targets_error)
		end

	is_render_error: BOOLEAN
		do
			Result := (value=gda_query_render_error)
		end

	is_parse_error: BOOLEAN
		do
			Result := (value=gda_query_parse_error)
		end

	is_syntax_error: BOOLEAN
		do
			Result := (value=gda_query_syntax_error)
		end

	is_structure_error: BOOLEAN
		do
			Result := (value=gda_query_structure_error)
		end

	is_sql_analyse_error: BOOLEAN
		do
			Result := (value=gda_query_sql_analyse_error)
		end

	is_no_cnc_error: BOOLEAN
		do
			Result := (value=gda_query_no_cnc_error)
		end

	is_cnc_closed_error: BOOLEAN
		do
			Result := (value=gda_query_cnc_closed_error)
		end

	is_exec_error: BOOLEAN
		do
			Result := (value=gda_query_exec_error)
		end

	is_param_type_error: BOOLEAN
		do
			Result := (value=gda_query_param_type_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_xml_load_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_XML_LOAD_ERROR"
		end

	gda_query_meta_data_update: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_META_DATA_UPDATE"
		end

	gda_query_fields_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_FIELDS_ERROR"
		end

	gda_query_targets_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TARGETS_ERROR"
		end

	gda_query_render_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_RENDER_ERROR"
		end

	gda_query_parse_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_PARSE_ERROR"
		end

	gda_query_syntax_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_SYNTAX_ERROR"
		end

	gda_query_structure_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_STRUCTURE_ERROR"
		end

	gda_query_sql_analyse_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_SQL_ANALYSE_ERROR"
		end

	gda_query_no_cnc_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_NO_CNC_ERROR"
		end

	gda_query_cnc_closed_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CNC_CLOSED_ERROR"
		end

	gda_query_exec_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_EXEC_ERROR"
		end

	gda_query_param_type_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_PARAM_TYPE_ERROR"
		end


end

