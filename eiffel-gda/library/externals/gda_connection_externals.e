indexing
	description: "External calls for GDA_CONNECTION"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_CONNECTION_EXTERNALS
insert
	GDA_CONNECTION_OPTIONS_ENUM
	GDA_CONNECTION_FEATURE_ENUM
	GDA_CONNECTION_SCHEMA_ENUM

feature {} -- External calls

	gda_connection_new (a_client, a_provider, a_dsn, a_username, a_password: POINTER; some_options: INTEGER): POINTER is
			-- GdaConnection* gda_connection_new (GdaClient *client,
			-- GdaServerProvider *provider, const gchar *dsn, const gchar
			-- *username, const gchar *password, GdaConnectionOptions
			-- options);
      external "C use <libgda/libgda.h>"
      end

	gda_connection_open (a_connection, an_error_handle: POINTER): INTEGER is 
			-- gboolean gda_connection_open (GdaConnection *cnc, GError
			-- **error);
      external "C use <libgda/libgda.h>"
      end

	gda_connection_close (a_connection: POINTER) is
			-- void gda_connection_close (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_close_no_warning (a_connection: POINTER) is
			-- void gda_connection_close_no_warning (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_is_opened (a_connection: POINTER): INTEGER is
			-- gboolean gda_connection_is_opened (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_get_client (a_connection: POINTER): POINTER is -- GdaClient* 
			-- GdaClient* gda_connection_get_client (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_get_options (a_connection: POINTER): INTEGER is
			--GdaConnectionOptions gda_connection_get_options (GdaConnection 
			--*cnc);
		obsolete "Result should be NATURAL, since it is a guint"
		external "C use <libgda/libgda.h>"
		ensure positive: Result>=0
		end

	gda_connection_get_provider_obj (a_connection: POINTER): POINTER is
			-- GdaServerProvider* gda_connection_get_provider_obj
			-- (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_infos (a_connection: POINTER): POINTER is
			-- GdaServerProviderInfo* gda_connection_get_infos
			-- (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_get_server_version (a_connection: POINTER): POINTER is -- const gchar*
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_server_version"
		end

	gda_connection_get_database (a_connection: POINTER): POINTER is 
			-- const gchar* gda_connection_get_database (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_database"
		end

	gda_connection_set_dsn (a_connection, a_datasource: POINTER): INTEGER is
			-- gboolean gda_connection_set_dsn (GdaConnection *cnc, const
			-- gchar *datasource);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_dsn (a_connection: POINTER): POINTER is
			-- const gchar* gda_connection_get_dsn (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_dsn"
		end

	gda_connection_get_cnc_string (a_connection: POINTER): POINTER is
			-- const gchar* gda_connection_get_cnc_string (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_cnc_string"
		end

	gda_connection_get_provider (a_connection: POINTER): POINTER is
			-- const gchar* gda_connection_get_provider (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_provider"
		end
	
	gda_connection_set_username (a_connection, a_username: POINTER): INTEGER is
			-- gboolean gda_connection_set_username (GdaConnection *cnc, const
			-- gchar *datasource);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_username (a_connection: POINTER): POINTER is
			-- const gchar* gda_connection_get_username (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_username"
		end
	
	gda_connection_set_password (a_connection, a_password: POINTER): INTEGER is
			-- gboolean gda_connection_set_password (GdaConnection *cnc, const
			-- gchar *datasource);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_password (a_connection: POINTER): POINTER is
			-- const gchar* gda_connection_get_password (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		alias "(void*)gda_connection_get_password"
		end

	gda_connection_add_event (a_connection, an_error: POINTER) is
			-- void gda_connection_add_event (GdaConnection *cnc,
			-- GdaConnectionEvent *error);
		external "C use <libgda/libgda.h>"
		end

	-- TODO: should this call be wrapped, since it is variadic?  void
	-- gda_connection_add_event_string (GdaConnection *cnc, const gchar
	-- *str, ...);

	gda_connection_add_events_list (a_connection, an_event_list: POINTER) is
			-- void gda_connection_add_events_list (GdaConnection *cnc,
			-- GList *events_list);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_events (a_connection: POINTER): POINTER is
			-- const GList* gda_connection_get_events (GdaConnection
			-- *cnc);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_clear_events_list (a_connection: POINTER) is
			-- void gda_connection_clear_events_list (GdaConnection
			-- *cnc);
		external "C use <libgda/libgda.h>"
		end
		
	gda_connection_change_database (a_connection, a_name: POINTER): INTEGER is
			-- gboolean gda_connection_change_database (GdaConnection *cnc, const gchar *name);
		external "C use <libgda/libgda.h>"
		end
 
-- from version 1.9.103

	gda_connection_execute_command (a_connection, a_command, a_parameter_list, an_error: POINTER): POINTER is
			-- GdaDataModel* gda_connection_execute_command
			-- (GdaConnection *cnc, GdaCommand *cmd, GdaParameterList
			-- *params, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_execute_command_l (a_connection, a_command, a_parameter_list, an_error: POINTER): POINTER is
			-- GList* gda_connection_execute_command_l (GdaConnection
			-- *cnc, GdaCommand *cmd, GdaParameterList *params, GError
			-- **error);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_last_insert_id (a_connection, a_data_model: POINTER): POINTER is
			-- gchar* gda_connection_get_last_insert_id (GdaConnection
			-- *cnc, GdaDataModel *recset);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_begin_transaction (a_connection, a_gdatransaction: POINTER): INTEGER is
			-- gboolean gda_connection_begin_transaction (GdaConnection *cnc, GdaTransaction *xaction)
		external "C use <libgda/libgda.h>"
		end
	

	 gda_connection_commit_transaction (a_connection, a_transaction: POINTER): INTEGER is
			-- gboolean gda_connection_commit_transaction (GdaConnection *cnc, GdaTransaction *xaction)
		external "C use <libgda/libgda.h>"
		end

	gda_connection_rollback_transaction (a_connection, a_transaction: POINTER) is
			-- gboolean gda_connection_rollback_transaction (GdaConnection *cnc, GdaTransaction *xaction)
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_supports_feature (a_connection: POINTER; a_feature: INTEGER): BOOLEAN is
			-- gboolean gda_connection_supports_feature (GdaConnection
			-- *cnc, GdaConnectionFeature feature);
		external "C use <libgda/libgda.h>"
		end

	gda_connection_get_schema (a_connection: POINTER; a_schema: INTEGER; a_parameter_list, an_error: POINTER): POINTER is 
			-- GdaDataModel* gda_connection_get_schema (GdaConnection
			-- *cnc, GdaConnectionSchema schema, GdaParameterList
			-- *params, GError **error);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_create_blob (a_connection: POINTER): POINTER is 
			--  GdaBlob* gda_connection_create_blob (GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_fetch_blob_by_id (a_conncetion, an_sql_id: POINTER): POINTER is
			-- GdaBlob* gda_connection_fetch_blob_by_id (GdaConnection
			-- *cnc, const gchar *sql_id);
		external "C use <libgda/libgda.h>"
		end
	
	gda_connection_value_to_sql_string (a_connection, a_gvalue: POINTER): POINTER is
			-- gchar* gda_connection_value_to_sql_string (GdaConnection
			-- *cnc, GValue *from);
		external "C use <libgda/libgda.h>"
		end
	
end

