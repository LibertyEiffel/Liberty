-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_SERVER_PROVIDER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_server_provider_delete_savepoint (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_rollback_savepoint (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_add_savepoint (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_rollback_transaction (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_commit_transaction (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_begin_transaction (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER; a_level: INTEGER_32; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_last_insert_id (a_provider: POINTER; a_cnc: POINTER; a_recset: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_execute_query (a_provider: POINTER; a_cnc: POINTER; a_query: POINTER; a_params: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_execute_command (a_provider: POINTER; a_cnc: POINTER; a_cmd: POINTER; a_params: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_perform_operation (a_provider: POINTER; a_cnc: POINTER; an_op: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_render_operation (a_provider: POINTER; a_cnc: POINTER; an_op: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_create_operation (a_provider: POINTER; a_cnc: POINTER; a_type: INTEGER_32; an_options: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_supports_operation (a_provider: POINTER; a_cnc: POINTER; a_type: INTEGER_32; an_options: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_change_database (a_provider: POINTER; a_cnc: POINTER; a_name: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_database (a_provider: POINTER; a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_close_connection (a_provider: POINTER; a_cnc: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_open_connection (a_provider: POINTER; a_cnc: POINTER; a_params: POINTER; an_username: POINTER; a_password: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_unescape_string (a_provider: POINTER; a_cnc: POINTER; a_str: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_escape_string (a_provider: POINTER; a_cnc: POINTER; a_str: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_default_dbms_type (a_provider: POINTER; a_cnc: POINTER; a_type: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_value_to_sql_string (a_provider: POINTER; a_cnc: POINTER; a_from: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_string_to_value (a_provider: POINTER; a_cnc: POINTER; a_string: POINTER; a_prefered_type: INTEGER_32; a_dbms_type: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_data_handler_dbms (a_provider: POINTER; a_cnc: POINTER; a_for_type: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_data_handler_gtype (a_provider: POINTER; a_cnc: POINTER; a_for_type: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_schema (a_provider: POINTER; a_cnc: POINTER; a_schema: INTEGER_32; a_params: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_supports_feature (a_provider: POINTER; a_cnc: POINTER; a_feature: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_info (a_provider: POINTER; a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_server_version (a_provider: POINTER; a_cnc: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_version (a_provider: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_server_provider_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
