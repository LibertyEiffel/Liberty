indexing
	description: "External calls for GDA_CLIENT"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_CLIENT_EXTERNALS
insert
	GDA_CLIENT_EVENT_ENUM
	GDA_CONNECTION_OPTIONS_ENUM

feature {} -- External calls
	gda_client_new: POINTER is -- GdaClient*
		external  "C use  <libgda/libgda.h>"
		end
	
	gda_client_open_connection   (a_client, a_const_dsn, a_const_username, a_const_passwd: POINTER; some_options: INTEGER): POINTER is -- GdaConnection*
			-- GdaConnection* gda_client_open_connection (GdaClient
			-- *client, const gchar *dsn, const gchar *username, const
			-- gchar *password, GdaConnectionOptions options);
		require valid_options: are_valid_connection_options (some_options)w
		external "C use  <libgda/libgda.h>"
		end
	
	gda_client_open_connection_from_string (a_client, provider_id, cnc_string: POINTER; options: INTEGER): POINTER is -- GdaConnection*
			-- GdaConnection* gda_client_open_connection_from_string
			-- GdaClient *client, const gchar *provider_id, const
			-- gchar *cnc_string, GdaConnectionOptions options);
		require valid_options: are_valid_connection_options (some_options)
		external "C use  <libgda/libgda.h>"
		end

	gda_client_get_connection_list (a_client: POINTER): POINTER is 
			-- const GList* gda_client_get_connection_list (GdaClient
			-- *client);
		external "C use  <libgda/libgda.h>"
		end

	gda_client_find_connection   (a_client, a_dsn, a_username, a_password: POINTER): POINTER is -- GdaConnection *
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
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaClient)"
		end
end
