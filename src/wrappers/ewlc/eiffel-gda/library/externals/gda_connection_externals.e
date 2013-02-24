-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONNECTION_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_connection_get_meta_store_data (a_cnc: POINTER; a_meta_type: INTEGER_32; an_error: POINTER; a_nb_filters: INTEGER_32; ): POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_update_meta_store (a_cnc: POINTER; a_context: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_supports_feature (a_cnc: POINTER; a_feature: INTEGER_32): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_value_to_sql_string (a_cnc: POINTER; a_from: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_transaction_status (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_delete_savepoint (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_rollback_savepoint (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_add_savepoint (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_rollback_transaction (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_commit_transaction (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_begin_transaction (a_cnc: POINTER; a_name: POINTER; a_level: INTEGER_32; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_execute_non_select (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; a_last_insert_row: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_execute_select_full (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; a_model_usage: INTEGER_32; a_col_types: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_execute_select_fullv (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; a_model_usage: INTEGER_32; an_error: POINTER; ): POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_execute_select (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_execute (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; a_model_usage: INTEGER_32; a_last_insert_row: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_prepare (a_cnc: POINTER; a_stmt: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_statement_to_sql (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; a_flags: INTEGER_32; a_params_used: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_batch_execute (a_cnc: POINTER; a_batch: POINTER; a_params: POINTER; a_model_usage: INTEGER_32; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_create_parser (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_events (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_clear_events_list (a_cnc: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_add_events_list (a_cnc: POINTER; an_events_list: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_add_event_string (a_cnc: POINTER; a_str: POINTER; ): POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_add_event (a_cnc: POINTER; an_event: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_authentication (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_cnc_string (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_set_dsn (a_cnc: POINTER; a_datasource: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_dsn (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_perform_operation (a_cnc: POINTER; an_op: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_create_operation (a_cnc: POINTER; a_type: INTEGER_32; an_options: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_provider_name (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_provider_obj (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_options (a_cnc: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_is_opened (a_cnc: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_close_no_warning (a_cnc: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_close (a_cnc: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_open (a_cnc: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_open_from_string (a_provider_name: POINTER; a_cnc_string: POINTER; an_auth_string: POINTER; an_options: INTEGER_32; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_open_from_dsn (a_dsn: POINTER; an_auth_string: POINTER; an_options: INTEGER_32; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_error_quark: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
