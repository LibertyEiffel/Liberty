indexing
	description: "Database client access."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli, GnomeDB developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "3.0.2"

class GDA_CLIENT
	-- GDA_CLIENT  is the main entry point for libgda client applications. It
	-- provides the way by which client applications open connections. Thus,
	-- before using any other database-oriented function in libgda,
	-- applications must create a GdaClient object (via make), and,
	-- once created, open the connections from it.

	-- GdaClient also provides a way to treat several connections as if they
	-- were only one (a connection pool), which allows applications to, for
	-- instance, commit/rollback a transaction in all the connections being
	-- managed by a unique GdaClient object, or obtain the list of all tables
	-- in all opened connections.
	
	-- Database creation and destruction is done through a GdaClient object
	-- uding the `create_database' and `drop_database'
	-- methods.  Note however that 'depending on the provider, an opened
	-- connection may be required in order to create or destroy a database.

inherit G_OBJECT redefine default_create end

insert 
	GDA_CLIENT_EXTERNALS undefine default_create end
	SHARED_G_ERROR  undefine default_create end

creation default_create, from_external_pointer

feature {} -- Creation
	default_create is
		--   Creates a new GdaClient object, which is the entry point for
		--   libgda client applications. This object, once created, can be used
		--   for opening new database connections and activating other services
		--   available to GDA clients.
	do
			from_external_pointer(gda_client_new)
		end
	
feature 
	open_connection (a_dsn, a_username, a_password: STRING; some_options: GDA_CONNECTION_OPTIONS): GDA_CONNECTION is
		-- Establishes a connection to a data source. 
		
		-- The connection will be opened if no identical connection is
		-- available in the GdaClient connection pool, and re-used if
		-- available. If you dont want to share the connection, specify
		-- GDA_CONNECTION_OPTIONS_DONT_SHARE as one of the flags in the options
		-- parameter.
	
		-- The username and password used to actually open the connection are
		-- the first non-Void  string being chosen by order from
	
		--     o the username or password
		--     o the username or password sprcified in the DSN definition
		--     o the USERNAME= and PASSWORD= parts of the connection string in the DSN
		--       definition
	require
		dsn_not_void: a_dsn /= Void
	local p: POINTER
	do
		-- If a new GdaConnection is created, then the caller will hold a
		-- reference on it, and if a GdaConnection already existing is used,
		-- then the reference count of that object will be increased by one.

		--   client :   a GdaClient object.
		--   dsn :      data source name.
		--   username : user name or NULL
		--   password : password for username, or NULL
		--   options :  options for the connection (see GdaConnectionOptions).
		--   error :    a place to store an error, or NULL
		--   Returns :  the opened connection if successful, NULL if there was an
		--              error.
		p:= gda_client_open_connection(handle,
		a_dsn, null_or_string(a_username), null_or_string(a_password), 
		some_options.value, address_of(error.handle))
		if p.is_not_null 
			then create Result.from_external_pointer(p) 
		end
	end

	open_connection_from_string (a_provider_id, a_cnc_string, a_username, a_password: STRING; some_options: GDA_CONNECTION_OPTIONS): GDA_CONNECTION is
		-- Opens a connection given a provider ID and a connection string. This
		-- allows applications to open connections without having to create a
		-- data source in the configuration. The format of cnc_string is
		-- similar to PostgreSQL and MySQL connection strings. It is a
		-- semicolumn-separated series of key=value pairs. Do not add extra
		-- whitespace after the semicolumn separator. The possible keys depend
		-- on the provider, but these keys should work with all providers:
		-- USER, PASSWORD, HOST, DATABASE, PORT
	
		-- The username and password used to actually open the connection are
		-- the first non-NULL string being chosen by order from

	--     o the username or password
	--     o the USERNAME= and PASSWORD= parts of the cnc_string
	--
	--   client :      a GdaClient object.
	--   provider_id : provider ID to connect to.
	--   cnc_string :  connection string.
	--   username :    user name.
	--   password :    password for username.
	--   options :     options for the connection (see GdaConnectionOptions).
	--   error :       a place to store an error, or NULL
	--   Returns :     the opened connection if successful, NULL if there is an
	--                 error.
	require
		provider_not_void: a_provider_id/=Void
		connection_not_void: a_cnc_string /= Void
		username_not_void: a_username/=Void
		password_not_void: a_password/=Void
	local p: POINTER
	do
		p:=gda_client_open_connection_from_string(handle,a_provider_id.to_external, a_cnc_string.to_external, a_username.to_external, a_password.to_external, some_options.value, address_of(error.handle))
		if p.is_not_null
			then create Result.from_external_pointer(p)
		end
	end
	
	connections: G_OBJECT_LIST[GDA_CONNECTION] is 
		-- the list of all open connections in the given GdaClient object

		-- WARNING: currently the returned list is the internal data structure of GDA. Don't modify it. 
	do
		create Result.from_external_pointer(gda_client_get_connections(handle))
		-- Gets The  GList returned is an internal pointer, so DON'T TRY TO FREE IT.
		--   Returns : a GList of GdaConnection objects; dont't modify that list
		-- TODO:	ensure Result.is_petrified
	end
	
	find_connection (a_dsn, a_username, a_password: STRING): GDA_CONNECTION is
		-- Looks for an open connection given a data source name (per libgda
		-- configuration), a username and a password. Void if such a connection
		-- could't be found.
	local p: POINTER
	do
		p:= gda_client_find_connection (handle, a_dsn, a_username, a_password)
		-- This function iterates over the list of open connections in the
		-- given GdaClient and looks for one that matches the given data source
		-- name, username and password.  client :   a GdaClient object.  dsn :
		-- data source name.  username : user name.  password : password for
		-- username.  Returns :  a pointer to the found connection, or NULL if
		-- it could not be found.
		if p.is_not_null 
			then create Result.from_external_pointer(p) 
		end
	end
	
	close_all_connections is
		--Closes all connections opened by the given GdaClient object.
	do
		gda_client_close_all_connections (handle)
	end
	
	
	--  gda_client_notify_event ()
	--
	-- void                gda_client_notify_event             (GdaClient *client,
	--                                                          GdaConnection *cnc,
	--                                                          GdaClientEvent event,
	--                                                          GdaParameterList *params);
	--
	--   Notifies an event to the given GdaClient's listeners. The event can be
	--   anything (see GdaClientEvent) ranging from a connection opening operation,
	--   to changes made to a table in an underlying database.
	--
	--   client : a GdaClient object.
	--   cnc :    a GdaConnection object where the event has occurred.
	--   event :  event ID.
	--   params : parameters associated with the event.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_notify_error_event ()
	--
	-- void                gda_client_notify_error_event       (GdaClient *client,
	--                                                          GdaConnection *cnc,
	--                                                          GdaConnectionEvent *error);
	--
	--   Notifies the given GdaClient of the GDA_CLIENT_EVENT_ERROR event.
	--
	--   client : a GdaClient object.
	--   cnc :    a GdaConnection object.
	--   error :  the error to be notified.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_notify_connection_opened_event ()
	--
	-- void                gda_client_notify_connection_opened_event
	--                                                         (GdaClient *client,
	--                                                          GdaConnection *cnc);
	--
	--   Notifies the given GdaClient of the GDA_CLIENT_EVENT_CONNECTION_OPENED
	--   event.
	--
	--   client : a GdaClient object.
	--   cnc :    a GdaConnection object.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_notify_connection_closed_event ()
	--
	-- void                gda_client_notify_connection_closed_event
	--                                                         (GdaClient *client,
	--                                                          GdaConnection *cnc);
	--
	--   Notifies the given GdaClient of the GDA_CLIENT_EVENT_CONNECTION_CLOSED
	--   event.
	--
	--   client : a GdaClient object.
	--   cnc :    a GdaConnection object.
	--
	--   --------------------------------------------------------------------------
	--
	begin_transaction (a_name: STRING; a_level: GDA_TRANSACTION_ISOLATION) is
		-- Starts a transaction on all connections being managed by the given
		-- GdaClient. It is important to note that this operates on all
		-- connections opened within a GdaClient, which could not be what
		-- you're looking for.

		-- `error' and `is_successful' are updated.

		-- To execute a transaction on a unique connection, use
		-- GDA_CONNECTION's `begin_transaction', `commit_transaction' and
		-- `rollback_transaction'.
	require name_not_void: a_name/=Void
	do
		is_successful := (gda_client_begin_transaction
			(handle, a_name.to_external, a_level.value, address_of(error.handle))).to_boolean
	end
	
	commit_transaction (a_name: STRING) is
		-- Commits a running transaction on all connections being managed by the
		--   given GdaClient. It is important to note that this operates on all
		--   connections opened within a GdaClient, which could not be what you're
		--   looking for.
		--   Returns : TRUE if all transactions could be committed successfully, or
		--             FALSE if one of them fails.
	do
		is_successful:= (gda_client_commit_transaction (handle, a_name.to_external, address_of(error.handle))).to_boolean
	end


	rollback_transaction (a_name: STRING) is
		-- Cancels a running transaction (named `a_name') on all connections being managed by
		-- the given GdaClient. It is important to note that this operates on
		-- all connections opened within a GdaClient, which could not be what
		-- you're looking for.
	
		--  To execute a transaction on a unique connection, use
		--  GDA_CONNECTION's `begin_transaction', `commit_transaction' and
		--  `rollback_transaction'.

		-- `is_successful' will be True if all transactions could be cancelled
		-- successfully, or False if one of them fails.
	do
		is_successful := (gda_client_rollback_transaction(handle, a_name.to_external, address_of(error.handle))).to_boolean
	end
	--  gda_client_get_dsn_specs ()
	--
	-- gchar*              gda_client_get_dsn_specs            (GdaClient *client,
	--                                                          const gchar *provider);
	--
	--   Get an XML string representing the parameters which can be present in the
	--   DSN string used to open a connection.
	--
	--   client :   a GdaClient object.
	--   provider : a provider
	--   Returns :  a string (free it after usage), or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_prepare_create_database ()
	--
	-- GdaServerOperation* gda_client_prepare_create_database  (GdaClient *client,
	--                                                          const gchar *db_name,
	--                                                          const gchar *provider);
	--
	--   Creates a new GdaServerOperation object which contains the specifications
	--   required to create a database. Once these specifications provided, use
	--   gda_client_perform_create_database() to perform the database creation.
	--
	--   If db_name is left NULL, then the name of the database to create will have
	--   to be set in the returned GdaServerOperation using
	--   gda_server_operation_set_value_at().
	--
	--   client :   a GdaClient object.
	--   db_name :  the name of the database to create, or NULL
	--   provider : a provider
	--   Returns :  new GdaServerOperation object, or NULL if the provider does not
	--              support database creation
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_perform_create_database ()
	--
	-- gboolean            gda_client_perform_create_database  (GdaClient *client,
	--                                                          GdaServerOperation *op,
	--                                                          GError **error);
	--
	--   Creates a new database using the specifications in op, which must have
	--   been obtained using gda_client_prepare_create_database()
	--
	--   client :  a GdaClient object.
	--   op :      a GdaServerOperation object obtained using
	--             gda_client_prepare_create_database()
	--   error :   a place to store en error, or NULL
	--   Returns : TRUE if no error occurred and the database has been created
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_prepare_drop_database ()
	--
	-- GdaServerOperation* gda_client_prepare_drop_database    (GdaClient *client,
	--                                                          const gchar *db_name,
	--                                                          const gchar *provider);
	--
	--   Creates a new GdaServerOperation object which contains the specifications
	--   required to drop a database. Once these specifications provided, use
	--   gda_client_perform_drop_database() to perform the database creation.
	--
	--   If db_name is left NULL, then the name of the database to drop will have
	--   to be set in the returned GdaServerOperation using
	--   gda_server_operation_set_value_at().
	--
	--   client :   a GdaClient object.
	--   db_name :  the name of the database to drop, or NULL
	--   provider : a provider
	--   Returns :  new GdaServerOperation object, or NULL if the provider does not
	--              support database destruction
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_client_perform_drop_database ()
	--
	-- gboolean            gda_client_perform_drop_database    (GdaClient *client,
	--                                                          GdaServerOperation *op,
	--                                                          GError **error);
	--
	--   Destroys an existing database using the specifications in op, which must
	--   have been obtained using gda_client_prepare_drop_database()
	--
	--   client :  a GdaClient object.
	--   op :      a GdaServerOperation object obtained using
	--             gda_client_prepare_drop_database()
	--   error :   a place to store en error, or NULL
	--   Returns : TRUE if no error occurred and the database has been destroyed
	--
	--Signal Details
	--
	--  The "event-notification" signal
	--
	-- void                user_function                      (GdaClient        *gdaclient,
	--                                                         GdaConnection    *arg1,
	--                                                         GdaClientEvent    arg2,
	--                                                         GdaParameterList *arg3,
	--                                                         gpointer          user_data)      : Run Last
	--
	--   gdaclient : the object which received the signal.
	--   arg1 :
	--   arg2 :
	--   arg3 :
	--   user_data : user data set when the signal handler was connected.
	--
	--See Also
	--
	--   GdaConnection.
	--
	--   --------------------------------------------------------------------------
feature {}
	struct_size : INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaClient)"
		end

end -- class GDA_CLIENT
