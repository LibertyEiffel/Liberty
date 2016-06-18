-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CLIENT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_client_rollback_transaction (a_client: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_client_commit_transaction (a_client: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_client_begin_transaction (a_client: POINTER; a_name: POINTER; a_level: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_client_perform_drop_database (a_client: POINTER; an_op: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_client_prepare_drop_database (a_client: POINTER; a_db_name: POINTER; a_provider: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_perform_create_database (a_client: POINTER; an_op: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_client_prepare_create_database (a_client: POINTER; a_db_name: POINTER; a_provider: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_get_dsn_specs (a_client: POINTER; a_provider: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_notify_connection_closed_event (a_client: POINTER; a_cnc: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_client_notify_connection_opened_event (a_client: POINTER; a_cnc: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_client_notify_error_event (a_client: POINTER; a_cnc: POINTER; an_error: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_client_notify_event (a_client: POINTER; a_cnc: POINTER; an_event: INTEGER_32; a_params: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_client_close_all_connections (a_client: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_client_find_connection (a_client: POINTER; a_dsn: POINTER; an_username: POINTER; a_password: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_get_connections (a_client: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_open_connection_from_string (a_client: POINTER; a_provider_id: POINTER; a_cnc_string: POINTER; an_username: POINTER; a_password: POINTER; an_options: INTEGER_32; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_declare_connection (a_client: POINTER; a_cnc: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_client_open_connection (a_client: POINTER; a_dsn: POINTER; an_username: POINTER; a_password: POINTER; an_options: INTEGER_32; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_new: POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_client_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_client_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
