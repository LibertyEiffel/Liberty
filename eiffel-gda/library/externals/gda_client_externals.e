indexing
	description: "External calls for GDA_CLIENT"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_CLIENT_EXTERNALS

insert
	ANY undefine copy, is_equal end
	GDA_CLIENT_EVENT_ENUM
	GDA_CONNECTION_OPTIONS_ENUM

feature {} -- External calls
	gda_client_new: POINTER is -- GdaClient*
		external  "C use  <libgda/libgda.h>"
		end

	gda_client_declare_connection   (a_client, a_connection: POINTER) is
			-- void gda_client_declare_connection (GdaClient *client,
			-- GdaConnection *cnc);
		external  "C use  <libgda/libgda.h>"
		end

	gda_client_open_connection (a_client, a_const_dsn, a_const_username, a_const_passwd: POINTER; some_options: INTEGER; an_error: POINTER): POINTER is 
			-- GdaConnection* gda_client_open_connection (GdaClient
			-- *client, const gchar *dsn, const gchar *username, const
			-- gchar *password, GdaConnectionOptions options, GError
			-- **error); TODO: require valid_options:
			-- are_valid_connection_options (some_options)w
		external "C use  <libgda/libgda.h>"
		end
	
	gda_client_open_connection_from_string (a_client, provider_id, cnc_string, a_username, a_password: POINTER; some_options: INTEGER; an_error_handle: POINTER): POINTER is
			-- GdaConnection* gda_client_open_connection_from_string
			-- (GdaClient *client, const gchar *provider_id, const gchar
			-- *cnc_string, const gchar *username, const gchar *password,
			-- GdaConnectionOptions options, GError **error);
		--TODO: require valid_options: are_valid_connection_options (some_options)
		external "C use  <libgda/libgda.h>"
		end

	gda_client_get_connections (a_client: POINTER): POINTER is
			-- const GList* gda_client_get_connections (GdaClient *client);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_find_connection (a_client, a_dsn, a_username, a_password: POINTER): POINTER is 
			-- GdaConnection* gda_client_find_connection (GdaClient
			-- *client, const gchar *dsn, const gchar *username, const
			-- gchar *password);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_close_all_connections (a_client: POINTER) is
		external "C use  <libgda/libgda.h>"
		end

	gda_client_notify_event (a_client, a_connection, an_event, a_parameter_list: POINTER): POINTER is
			-- void gda_client_notify_event (GdaClient *client,
			-- GdaConnection *cnc, GdaClientEvent event, GdaParameterList
			-- *params);
		external "C use  <libgda/libgda.h>"
		end
	
	gda_client_notify_error_event (a_client, a_connection, an_error: POINTER): POINTER is 
			--  void gda_client_notify_error_event (GdaClient *client
			--  GdaConnection *cnc, GdaError *error);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_notify_connection_opened_event (a_client, a_connection: POINTER) is
			--  void gda_client_notify_connection_opened_event (GdaClient
			--  *client, GdaConnection *cnc);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_notify_connection_closed_event (a_client, a_connection: POINTER) is
			-- void gda_client_notify_connection_closed_event (GdaClient
			-- *client, GdaConnection *cnc);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_notify_transaction_started_event (a_client, a_connection, a_transaction: POINTER) is 
			-- void gda_client_notify_transaction_started_event
			-- (GdaClient *client, GdaConnection *cnc, GdaTransaction
			-- *xaction);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_notify_transaction_committed_event (a_client, a_connection, a_transaction: POINTER) is
			-- void gda_client_notify_transaction_committed_event
			-- (GdaClient *client, GdaConnection *cnc, GdaTransaction
			-- *xaction);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_notify_transaction_cancelled_event (a_client, a_connection, a_transaction: POINTER) is
			-- void gda_client_notify_transaction_cancelled_event
			-- (GdaClient *client, GdaConnection *cnc, GdaTransaction
			-- *xaction);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_begin_transaction (a_client, a_transaction: POINTER): INTEGER is
			-- gboolean gda_client_begin_transaction (GdaClient *client,
			-- GdaTransaction *xaction);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_commit_transaction (a_client, a_transaction: POINTER): INTEGER is
			-- gboolean gda_client_commit_transaction (GdaClient *client,
			-- GdaTransaction *xaction);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_rollback_transaction (a_client, a_transaction: POINTER): INTEGER is
			-- gboolean gda_client_rollback_transaction (GdaClient
			-- *client, GdaTransaction *xaction);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_get_dsn_specs (a_client, a_provider: POINTER): POINTER is
			-- gchar* gda_client_get_dsn_specs (GdaClient *client, const
			-- gchar *provider);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_prepare_create_database (a_client, a_provider: POINTER): POINTER is
			-- GdaServerOperation* gda_client_prepare_create_database
			-- (GdaClient *client, const gchar *provider);
		external "C use  <libgda/libgda.h>"
		end
	
	gda_client_perform_create_database (a_client, a_provider, an_operation, an_error: POINTER): INTEGER is
			-- gboolean gda_client_perform_create_database (GdaClient
			-- *client, const gchar *provider, GdaServerOperation *op,
			-- GError **error);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_prepare_drop_database (a_client, a_provider: POINTER): POINTER is
			-- GdaServerOperation* gda_client_prepare_drop_database
			-- (GdaClient *client, const gchar *provider);
		external "C use  <libgda/libgda.h>"
		end
	
	gda_client_perform_drop_database (a_client, a_provider, an_operation, an_error: POINTER): INTEGER is
			-- gboolean gda_client_perform_drop_database (GdaClient
			-- *client, const gchar *provider, GdaServerOperation *op,
			-- GError **error);
		external "C use  <libgda/libgda.h>"
		end
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaClient)"
		end
end
