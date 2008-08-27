-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONNECTION_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_connection_get_schema (a_cnc: POINTER; a_schema: INTEGER_32; a_params: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_supports_feature (a_cnc: POINTER; a_feature: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_value_to_sql_string (a_cnc: POINTER; a_from: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_transaction_status (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_delete_savepoint (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_rollback_savepoint (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_add_savepoint (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_rollback_transaction (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_commit_transaction (a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_begin_transaction (a_cnc: POINTER; a_name: POINTER; a_level: INTEGER_32; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_last_insert_id (a_cnc: POINTER; a_recset: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_execute_command (a_cnc: POINTER; a_cmd: POINTER; a_params: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_execute_non_select_command (a_cnc: POINTER; a_cmd: POINTER; a_params: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_execute_select_command (a_cnc: POINTER; a_cmd: POINTER; a_params: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_change_database (a_cnc: POINTER; a_name: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_events (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_clear_events_list (a_cnc: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_add_events_list (a_cnc: POINTER; an_events_list: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_add_event_string (a_cnc: POINTER; a_str: POINTER; ): POINTER is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_connection_add_event (a_cnc: POINTER; an_event: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_set_password (a_cnc: POINTER; a_password: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_password (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_set_username (a_cnc: POINTER; an_username: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_username (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_cnc_string (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_set_dsn (a_cnc: POINTER; a_datasource: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_dsn (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_database (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_server_version (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_options (a_cnc: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_infos (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_provider_obj (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_provider (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_client (a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_is_opened (a_cnc: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_close_no_warning (a_cnc: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_close (a_cnc: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_open (a_cnc: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_new (a_client: POINTER; a_provider: POINTER; a_dsn: POINTER; an_username: POINTER; a_password: POINTER; an_options: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
