-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_connection_dsn_not_found_error) or else 
				(a_value = gda_connection_provider_not_found_error) or else 
				(a_value = gda_connection_provider_error) or else 
				(a_value = gda_connection_conn_open_error) or else 
				(a_value = gda_connection_do_query_error) or else 
				(a_value = gda_connection_nonexist_dsn_error) or else 
				(a_value = gda_connection_no_cnc_spec_error) or else 
				(a_value = gda_connection_no_provider_spec_error) or else 
				(a_value = gda_connection_open_error) or else 
				(a_value = gda_connection_execute_command_error) or else 
				(a_value = gda_connection_statement_type_error))
		end


feature {ANY} -- Setters
	default_create, set_dsn_not_found_error
		do
			value := gda_connection_dsn_not_found_error
		end

	set_provider_not_found_error
		do
			value := gda_connection_provider_not_found_error
		end

	set_provider_error
		do
			value := gda_connection_provider_error
		end

	set_conn_open_error
		do
			value := gda_connection_conn_open_error
		end

	set_do_query_error
		do
			value := gda_connection_do_query_error
		end

	set_nonexist_dsn_error
		do
			value := gda_connection_nonexist_dsn_error
		end

	set_no_cnc_spec_error
		do
			value := gda_connection_no_cnc_spec_error
		end

	set_no_provider_spec_error
		do
			value := gda_connection_no_provider_spec_error
		end

	set_open_error
		do
			value := gda_connection_open_error
		end

	set_execute_command_error
		do
			value := gda_connection_execute_command_error
		end

	set_statement_type_error
		do
			value := gda_connection_statement_type_error
		end


feature {ANY} -- Queries
	is_dsn_not_found_error: BOOLEAN
		do
			Result := (value=gda_connection_dsn_not_found_error)
		end

	is_provider_not_found_error: BOOLEAN
		do
			Result := (value=gda_connection_provider_not_found_error)
		end

	is_provider_error: BOOLEAN
		do
			Result := (value=gda_connection_provider_error)
		end

	is_conn_open_error: BOOLEAN
		do
			Result := (value=gda_connection_conn_open_error)
		end

	is_do_query_error: BOOLEAN
		do
			Result := (value=gda_connection_do_query_error)
		end

	is_nonexist_dsn_error: BOOLEAN
		do
			Result := (value=gda_connection_nonexist_dsn_error)
		end

	is_no_cnc_spec_error: BOOLEAN
		do
			Result := (value=gda_connection_no_cnc_spec_error)
		end

	is_no_provider_spec_error: BOOLEAN
		do
			Result := (value=gda_connection_no_provider_spec_error)
		end

	is_open_error: BOOLEAN
		do
			Result := (value=gda_connection_open_error)
		end

	is_execute_command_error: BOOLEAN
		do
			Result := (value=gda_connection_execute_command_error)
		end

	is_statement_type_error: BOOLEAN
		do
			Result := (value=gda_connection_statement_type_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_dsn_not_found_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_DSN_NOT_FOUND_ERROR"
		end

	gda_connection_provider_not_found_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_PROVIDER_NOT_FOUND_ERROR"
		end

	gda_connection_provider_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_PROVIDER_ERROR"
		end

	gda_connection_conn_open_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_CONN_OPEN_ERROR"
		end

	gda_connection_do_query_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_DO_QUERY_ERROR"
		end

	gda_connection_nonexist_dsn_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_NONEXIST_DSN_ERROR"
		end

	gda_connection_no_cnc_spec_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_NO_CNC_SPEC_ERROR"
		end

	gda_connection_no_provider_spec_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_NO_PROVIDER_SPEC_ERROR"
		end

	gda_connection_open_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_OPEN_ERROR"
		end

	gda_connection_execute_command_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EXECUTE_COMMAND_ERROR"
		end

	gda_connection_statement_type_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_STATEMENT_TYPE_ERROR"
		end


end

