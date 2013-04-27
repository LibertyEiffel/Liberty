-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_MODEL_QUERY_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_data_model_query_xml_load_error) or else 
				(a_value = gda_data_model_query_compute_modif_statements_error) or else 
				(a_value = gda_data_model_query_modif_statement_error) or else 
				(a_value = gda_data_model_query_connection_error))
		end


feature {ANY} -- Setters
	default_create, set_l_load_error is
		do
			value := gda_data_model_query_xml_load_error
		end

	set_mpute_modif_statements_error is
		do
			value := gda_data_model_query_compute_modif_statements_error
		end

	set_dif_statement_error is
		do
			value := gda_data_model_query_modif_statement_error
		end

	set_nnection_error is
		do
			value := gda_data_model_query_connection_error
		end


feature {ANY} -- Queries
	is_l_load_error: BOOLEAN is
		do
			Result := (value=gda_data_model_query_xml_load_error)
		end

	is_mpute_modif_statements_error: BOOLEAN is
		do
			Result := (value=gda_data_model_query_compute_modif_statements_error)
		end

	is_dif_statement_error: BOOLEAN is
		do
			Result := (value=gda_data_model_query_modif_statement_error)
		end

	is_nnection_error: BOOLEAN is
		do
			Result := (value=gda_data_model_query_connection_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_model_query_xml_load_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_QUERY_XML_LOAD_ERROR"
		end

	gda_data_model_query_compute_modif_statements_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_QUERY_COMPUTE_MODIF_STATEMENTS_ERROR"
		end

	gda_data_model_query_modif_statement_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_QUERY_MODIF_STATEMENT_ERROR"
		end

	gda_data_model_query_connection_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_QUERY_CONNECTION_ERROR"
		end


end

