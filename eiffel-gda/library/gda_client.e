indexing
	description: "GdaClient -- Database client access."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

			documentation: "[
								 This class is the main entry point for libgda client applications. 
								 It provides the way by which client applications open connections. Thus,
								 before using any other database-oriented function in libgda, applications
								 must create a GdaClient object (via gda_client_new), and, once created,
								 open the connections from it.

								 GdaClient also provides a way to treat several connections as if they were
								 only one (a connection pool), which allows applications to, for instance,
								 commit/rollback a transaction in all the connections being managed by a
								 unique GdaClient object, or obtain the list of all tables in all opened
								 connections.
								 
								 Database creation and destruction is done through a GdaClient object uding
								 the gda_client_create_database() and gda_client_drop_database() methods.
								 Note however that depending on the provider, an opened connection may be
								 required in order to create or destroy a database.
								 ]"
class GDA_CLIENT

inherit G_OBJECT

insert
	GDA
	GDA_CLIENT_EXTERNALS
	
creation make, from_external_pointer

feature {} -- Creation
 
	make is
			-- Creates a new GdaClient object, which is the entry point
			-- for libgda client applications.This object, once created,
			-- can be used for opening new database connections and
			-- activating other services available to GDA clients.
		do
			from_external_pointer (gda_client_new)
		end

feature 
	open_connection, get_new_connection (a_dsn, a_username, a_password: STRING; some_options: INTEGER): GDA_CONNECTION is
			-- Establishes a connection to a data source. The connection
			-- will be opened if no identical connection is available in
			-- the GdaClient connection pool, and re-used if
			-- available. If you dont want to share the connection,
			-- specify `gda_connection_options_dont_share' as one of the
			-- flags in the options parameter.

			-- This feature is the way of opening database connections
			-- with libgda.

			-- `a_dsn': data source name.

			-- `a_username': user name.

			-- `a_password': password for username.

			-- `some_options':  options for the connection (see GdaConnectionOptions).
		
			-- Void if some error occurs opening the connection
		obsolete "TODO: which feature name is better: `open_connection' or `get_new_connection'?"
		require
			dsn_not_void: a_dns /= Void
			username_not_void: a_username /= Void
			password_not_void: a_password /= Void
			valid_options: are_valid_connection_options (some_options)
		local ptr: POINTER
		do
			ptr := gda_client_open_connection (handle,
														  a_dsn.to_external,
														  a_username.to_external,
														  a_password.to_external,
														  some_options)
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	open_connection_from_string, connection_from_string (a_provider_id, a_connection_string: STRING; some_options: INTEGER): GDA_CONNECTION is
			-- Opens a connection given `a_provider_id' and
			-- `a_connection_string'. This allows applications to open
			-- connections without having to create a data source in the
			-- configuration. The format of `a_connection_string' is
			-- similar to PostgreSQL and MySQL connection strings. It is
			-- a ";"-separated series of "key=value" pairs. Do not add
			-- extra whitespace after the ; separator. The possible keys
			-- depend on the provider, but these keys should work with
			-- all providers: `USER', `PASSWORD', `HOST', `DATABASE',
			-- `PORT'. Void if some error occurs opening the connection
		obsolete "TODO: which feature name is better: `open_connection_from_string' or `connection_from_string'?"
		require
			provider_not_void: a_provider_id /= Void
			connection_string_not_void: a_connection_string /= Void
			valid_options: are_valid_connection_options (some_options)
		local ptr: POINTER
		do
			ptr := (gda_client_open_connection_from_string 
					  (handle, a_provider_id.to_external, 
						a_connection_string.to_external, some_options))
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	connections: G_LIST [GDA_CONNECTION] is
		-- The open connections of Current GDA_CLIENT.
		do
			create Result.from_external_pointer 
			(gda_client_get_connection_list (handle))
			-- Note from GDA docs: gda_client_get_connection_list "gets
			-- the list of all open connections in the given GdaClient
			-- object. The GList returned is an internal pointer, so
			-- DON'T TRY TO FREE IT." This should be automatically
			-- handled because GDA_CONNECTIONs are SHARED_C_STRUCT. Paolo
			-- 2006-09-08
		end

	find_connection (a_data_source_name, a_username, a_password: STRING): GDA_CONNECTION is
			-- Looks for an open connection given a data source name (per
			-- libgda configuration), a username and a password.  This
			-- feature iterates over the list of open connections in the
			-- given GdaClient and looks for one that matches the given
			-- data source name, username and password. Void if some
			-- error occurs opening the connection
		require
			dsn_not_void: a_dns /= Void
			username_not_void: a_username /= Void
			password_not_void: a_password /= Void
		local ptr:POINTER
		do
			ptr:=(gda_client_find_connection 
					(handle, a_dsn.to_external,
					 a_username.to_external, a_password.to_external))
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	close_all_connections is
			-- Closes all connections opened by the Current GdaClient.
		do
			gda_client_close_all_connections (handle)
		end

	-- TODO:  gda_client_notify_event ()

	--  void        gda_client_notify_event         (GdaClient *client,
	--                                               GdaConnection *cnc,
	--                                               GdaClientEvent event,
	--                                               GdaParameterList *params);

	--    Notifies an event to the given GdaClient's listeners. The event can be anything (see
	--    GdaClientEvent) ranging from a connection opening operation, to changes made to a table in
	--    an underlying database.

	--    client : a GdaClient object.
	--    cnc :    a GdaConnection object where the event has occurred.
	--    event :  event ID.
	--    params : parameters associated with the event.

	--    ----------------------------------------------------------------------------------------------

	-- TODO:  gda_client_notify_error_event ()

	--  void        gda_client_notify_error_event   (GdaClient *client,
	--                                               GdaConnection *cnc,
	--                                               GdaError *error);

	--    Notifies the given GdaClient of the GDA_CLIENT_EVENT_ERROR event.

	--    client : a GdaClient object.
	--    cnc :    a GdaConnection object.
	--    error :  the error to be notified.

	-- TODO:   ----------------------------------------------------------------------------------------------

	--   gda_client_notify_connection_opened_event ()

	--  void        gda_client_notify_connection_opened_event
	--                                              (GdaClient *client,
	--                                               GdaConnection *cnc);

	--    Notifies the given GdaClient of the GDA_CLIENT_EVENT_CONNECTION_OPENED event.

	--    client : a GdaClient object.
	--    cnc :    a GdaConnection object.

	--    ----------------------------------------------------------------------------------------------

	-- TODO:  gda_client_notify_connection_closed_event ()

	--  void        gda_client_notify_connection_closed_event
	--                                              (GdaClient *client,
	--                                               GdaConnection *cnc);

	--    Notifies the given GdaClient of the GDA_CLIENT_EVENT_CONNECTION_CLOSED event.

	--    client : a GdaClient object.
	--    cnc :    a GdaConnection object.

	--    ----------------------------------------------------------------------------------------------

	-- TODO:  gda_client_notify_transaction_started_event ()

	--  void        gda_client_notify_transaction_started_event
	--                                              (GdaClient *client,
	--                                               GdaConnection *cnc,
	--                                               GdaTransaction *xaction);

	--    Notifies the given GdaClient of the GDA_CLIENT_EVENT_TRANSACTION_STARTED event.

	--    client :  a GdaClient object.
	--    cnc :     a GdaConnection object.
	--    xaction : a GdaTransaction object.

	--    ----------------------------------------------------------------------------------------------

	-- TODO:  gda_client_notify_transaction_committed_event ()

	--  void        gda_client_notify_transaction_committed_event
	--                                              (GdaClient *client,
	--                                               GdaConnection *cnc,
	--                                               GdaTransaction *xaction);

	--    Notifies the given GdaClient of the GDA_CLIENT_EVENT_TRANSACTION_COMMITTED event.

	--    client :  a GdaClient object.
	--    cnc :     a GdaConnection object.
	--    xaction : a GdaTransaction object.

	--    ----------------------------------------------------------------------------------------------

	-- TODO:  gda_client_notify_transaction_cancelled_event ()

	--  void        gda_client_notify_transaction_cancelled_event
	--                                              (GdaClient *client,
	--                                               GdaConnection *cnc,
	--                                               GdaTransaction *xaction);

	--    Notifies the given GdaClient of the GDA_CLIENT_EVENT_TRANSACTION_CANCELLED event.

	--    client :  a GdaClient object.
	--    cnc :     a GdaConnection object.
	--    xaction : a GdaTransaction object.

feature -- Global transactions
	is_successful: BOOLEAN 
			-- Is last `begin_transaction', `commit_transaction' or `rollback_transaction' successful?

	begin_transaction (a_transaction: GDA_TRANSACTION) is
			-- Starts a transaction on all connections being managed by
			-- the given GdaClient. It is important to note that this
			-- operates on all connections opened within a GdaClient,
			-- which could not be what you're looking for.

			-- To execute a transaction on a unique connection, use
			-- GDA_CONNECTION's `begin_transaction', `commit_transaction'
			-- and `rollback_transaction'.
		
			-- `is_successful' will be True if all transactions
			-- could be started successfully, or FALSE if one of them
			-- fails.
		require 
			transaction_not_void: a_transaction /= Void
		do
			 is_transaction_started := (gda_client_begin_transaction 
				 								(handle, a_transaction.handle)).to_boolean
		end

	commit_transaction (a_transaction: GDA_TRANSACTION) is
			-- Commits a running transaction on all connections being
			-- managed by the given GdaClient. It is important to note
			-- that this operates on all connections opened within a
			-- GdaClient, which could not be what you're looking for.

			-- To execute a transaction on a unique connection, use
			-- GDA_CONNECTION's `begin_transaction', `commit_transaction'
			-- and `rollback_transaction'.
		
			-- `is_successful' will be True if all transactions could be
			-- committed successfully, or FALSE if one of them fails.
		require 
			transaction_not_void: a_transaction /= Void
		do
			is_successful := (gda_client_commit_transaction
									(handle, a_transaction.handle)).to_boolean
		end

	rollback_transaction (a_transaction: GDA_TRANSACTION) is
			-- Cancels a running transaction on all connections being
			-- managed by the given GdaClient. It is important to note
			-- that this operates on all connections opened within a
			-- GdaClient, which could not be what you're looking for.

			-- To execute a transaction on a unique connection, use
			-- GDA_CONNECTION's `begin_transaction', `commit_transaction'
			-- and `rollback_transaction'.

			-- `is_successful' will be True if all transactions could be
			-- cancelled successfully, or False if one of them fails.
				 
		require 
			transaction_not_void: a_transaction /= Void
		do
			is_successful := (gda_client_rollback_transaction 
									(handle, a_transaction.handle)).to_boolean
		end                                              

--- from version 1.9.103

feature -- Signals

 "event-notification"
             void        user_function      (GdaClient *gdaclient,
                                             gpointer   arg1,
                                             gint       arg2,
                                             gpointer   arg3,
                                             gpointer   user_data)      : Run last


Details

  GdaClient

 typedef struct _GdaClient GdaClient;

   --------------------------------------------------------------------------

  enum GdaClientEvent

 typedef enum {
         GDA_CLIENT_EVENT_INVALID,

         /* events usually notified by the library itself, and which the providers
            should notify on very special cases (like a transaction being started
            or committed via a BEGIN/COMMIT command directly sent to the
            execute_command method on the provider */
         GDA_CLIENT_EVENT_ERROR,                 /* params: "error" */
         GDA_CLIENT_EVENT_CONNECTION_OPENED,     /* params: */
         GDA_CLIENT_EVENT_CONNECTION_CLOSED,     /* params: */
         GDA_CLIENT_EVENT_TRANSACTION_STARTED,   /* params: "transaction" */
         GDA_CLIENT_EVENT_TRANSACTION_COMMITTED, /* params: "transaction" */
         GDA_CLIENT_EVENT_TRANSACTION_CANCELLED, /* params: "transaction" */
 } GdaClientEvent;

   --------------------------------------------------------------------------

  gda_client_new ()

 GdaClient*  gda_client_new                  (void);

   Creates a new GdaClient object, which is the entry point for libgda client
   applications. This object, once created, can be used for opening new
   database connections and activating other services available to GDA
   clients.

   Returns : the newly created object.

   --------------------------------------------------------------------------

  gda_client_declare_connection ()

 void        gda_client_declare_connection   (GdaClient *client,
                                              GdaConnection *cnc);

   Declares the cnc to client. This function should not be used directly

   client : a GdaClient object
   cnc :    a GdaConnection object

   --------------------------------------------------------------------------

  gda_client_open_connection ()

 GdaConnection* gda_client_open_connection   (GdaClient *client,
                                              const gchar *dsn,
                                              const gchar *username,
                                              const gchar *password,
                                              GdaConnectionOptions options,
                                              GError **error);

   This function is the way of opening database connections with libgda.

   Establishes a connection to a data source. The connection will be opened
   if no identical connection is available in the GdaClient connection pool,
   and re-used if available. If you dont want to share the connection,
   specify GDA_CONNECTION_OPTIONS_DONT_SHARE as one of the flags in the
   options parameter.

   The username and password used to actually open the connection are the
   first non-NULL string being chosen by order from

     o the username or password
     o the username or password sprcified in the DSN definition
     o the USERNAME= and PASSWORD= parts of the connection string in the DSN
       definition

   client :   a GdaClient object.
   dsn :      data source name.
   username : user name or NULL
   password : password for username, or NULL
   options :  options for the connection (see GdaConnectionOptions).
   error :    a place to store an error, or NULL
   Returns :  the opened connection if successful, NULL if there is an error.

   --------------------------------------------------------------------------

  gda_client_open_connection_from_string ()

 GdaConnection* gda_client_open_connection_from_string
                                             (GdaClient *client,
                                              const gchar *provider_id,
                                              const gchar *cnc_string,
                                              const gchar *username,
                                              const gchar *password,
                                              GdaConnectionOptions options,
                                              GError **error);

   Opens a connection given a provider ID and a connection string. This
   allows applications to open connections without having to create a data
   source in the configuration. The format of cnc_string is similar to
   PostgreSQL and MySQL connection strings. It is a semicolumn-separated
   series of key=value pairs. Do not add extra whitespace after the
   semicolumn separator. The possible keys depend on the provider, but these
   keys should work with all providers: USER, PASSWORD, HOST, DATABASE, PORT

   The username and password used to actually open the connection are the
   first non-NULL string being chosen by order from

     o the username or password
     o the USERNAME= and PASSWORD= parts of the cnc_string

   client :      a GdaClient object.
   provider_id : provider ID to connect to.
   cnc_string :  connection string.
   username :    user name.
   password :    password for username.
   options :     options for the connection (see GdaConnectionOptions).
   error :       a place to store an error, or NULL
   Returns :     the opened connection if successful, NULL if there is an
                 error.

   --------------------------------------------------------------------------

  gda_client_get_connections ()

 const GList* gda_client_get_connections     (GdaClient *client);

   Gets the list of all open connections in the given GdaClient object. The
   GList returned is an internal pointer, so DON'T TRY TO FREE IT.

   client :  a GdaClient object.
   Returns : a GList of GdaConnection objects; dont't modify that list

   --------------------------------------------------------------------------

  gda_client_find_connection ()

 GdaConnection* gda_client_find_connection   (GdaClient *client,
                                              const gchar *dsn,
                                              const gchar *username,
                                              const gchar *password);

   Looks for an open connection given a data source name (per libgda
   configuration), a username and a password.

   This function iterates over the list of open connections in the given
   GdaClient and looks for one that matches the given data source name,
   username and password.

   client :   a GdaClient object.
   dsn :      data source name.
   username : user name.
   password : password for username.
   Returns :  a pointer to the found connection, or NULL if it could not be
              found.

   --------------------------------------------------------------------------

  gda_client_close_all_connections ()

 void        gda_client_close_all_connections
                                             (GdaClient *client);

   Closes all connections opened by the given GdaClient object.

   client : a GdaClient object.

   --------------------------------------------------------------------------

  gda_client_notify_event ()

 void        gda_client_notify_event         (GdaClient *client,
                                              GdaConnection *cnc,
                                              GdaClientEvent event,
                                              GdaParameterList *params);

   Notifies an event to the given GdaClient's listeners. The event can be
   anything (see GdaClientEvent) ranging from a connection opening operation,
   to changes made to a table in an underlying database.

   client : a GdaClient object.
   cnc :    a GdaConnection object where the event has occurred.
   event :  event ID.
   params : parameters associated with the event.

   --------------------------------------------------------------------------

  gda_client_notify_error_event ()

 void        gda_client_notify_error_event   (GdaClient *client,
                                              GdaConnection *cnc,
                                              GdaConnectionEvent *error);

   Notifies the given GdaClient of the GDA_CLIENT_EVENT_ERROR event.

   client : a GdaClient object.
   cnc :    a GdaConnection object.
   error :  the error to be notified.

   --------------------------------------------------------------------------

  gda_client_notify_connection_opened_event ()

 void        gda_client_notify_connection_opened_event
                                             (GdaClient *client,
                                              GdaConnection *cnc);

   Notifies the given GdaClient of the GDA_CLIENT_EVENT_CONNECTION_OPENED
   event.

   client : a GdaClient object.
   cnc :    a GdaConnection object.

   --------------------------------------------------------------------------

  gda_client_notify_connection_closed_event ()

 void        gda_client_notify_connection_closed_event
                                             (GdaClient *client,
                                              GdaConnection *cnc);

   Notifies the given GdaClient of the GDA_CLIENT_EVENT_CONNECTION_CLOSED
   event.

   client : a GdaClient object.
   cnc :    a GdaConnection object.

   --------------------------------------------------------------------------

  gda_client_notify_transaction_started_event ()

 void        gda_client_notify_transaction_started_event
                                             (GdaClient *client,
                                              GdaConnection *cnc,
                                              GdaTransaction *xaction);

   Notifies the given GdaClient of the GDA_CLIENT_EVENT_TRANSACTION_STARTED
   event.

   client :  a GdaClient object.
   cnc :     a GdaConnection object.
   xaction : a GdaTransaction object.

   --------------------------------------------------------------------------

  gda_client_notify_transaction_committed_event ()

 void        gda_client_notify_transaction_committed_event
                                             (GdaClient *client,
                                              GdaConnection *cnc,
                                              GdaTransaction *xaction);

   Notifies the given GdaClient of the GDA_CLIENT_EVENT_TRANSACTION_COMMITTED
   event.

   client :  a GdaClient object.
   cnc :     a GdaConnection object.
   xaction : a GdaTransaction object.

   --------------------------------------------------------------------------

  gda_client_notify_transaction_cancelled_event ()

 void        gda_client_notify_transaction_cancelled_event
                                             (GdaClient *client,
                                              GdaConnection *cnc,
                                              GdaTransaction *xaction);

   Notifies the given GdaClient of the GDA_CLIENT_EVENT_TRANSACTION_CANCELLED
   event.

   client :  a GdaClient object.
   cnc :     a GdaConnection object.
   xaction : a GdaTransaction object.

   --------------------------------------------------------------------------

  gda_client_begin_transaction ()

 gboolean    gda_client_begin_transaction    (GdaClient *client,
                                              GdaTransaction *xaction);

   Starts a transaction on all connections being managed by the given
   GdaClient. It is important to note that this operates on all connections
   opened within a GdaClient, which could not be what you're looking for.

   To execute a transaction on a unique connection, use
   gda_connection_begin_transaction, gda_connection_commit_transaction and
   gda_connection_rollback_transaction.

   client :  a GdaClient object.
   xaction : a GdaTransaction object.
   Returns : TRUE if all transactions could be started successfully, or FALSE
             if one of them fails.

   --------------------------------------------------------------------------

  gda_client_commit_transaction ()

 gboolean    gda_client_commit_transaction   (GdaClient *client,
                                              GdaTransaction *xaction);

   Commits a running transaction on all connections being managed by the
   given GdaClient. It is important to note that this operates on all
   connections opened within a GdaClient, which could not be what you're
   looking for.

   To execute a transaction on a unique connection, use
   gda_connection_begin_transaction, gda_connection_commit_transaction and
   gda_connection_rollback_transaction.

   client :  a GdaClient object.
   xaction : a GdaTransaction object.
   Returns : TRUE if all transactions could be committed successfully, or
             FALSE if one of them fails.

   --------------------------------------------------------------------------

  gda_client_rollback_transaction ()

 gboolean    gda_client_rollback_transaction (GdaClient *client,
                                              GdaTransaction *xaction);

   Cancels a running transaction on all connections being managed by the
   given GdaClient. It is important to note that this operates on all
   connections opened within a GdaClient, which could not be what you're
   looking for.

   To execute a transaction on a unique connection, use
   gda_connection_begin_transaction, gda_connection_commit_transaction and
   gda_connection_rollback_transaction.

   client :  a GdaClient object.
   xaction : a GdaTransaction object.
   Returns : TRUE if all transactions could be cancelled successfully, or
             FALSE if one of them fails.

   --------------------------------------------------------------------------

  gda_client_get_dsn_specs ()

 gchar*      gda_client_get_dsn_specs        (GdaClient *client,
                                              const gchar *provider);

   Get an XML string representing the parameters which can be present in the
   DSN string used to open a connection.

   client :   a GdaClient object.
   provider : a provider
   Returns :  a string (free it after usage), or NULL if an error occurred

   --------------------------------------------------------------------------

  gda_client_prepare_create_database ()

 GdaServerOperation* gda_client_prepare_create_database
                                             (GdaClient *client,
                                              const gchar *provider);

   Creates a new GdaServerOperation object which contains the specifications
   required to create a database. Once these specifications provided, use
   gda_client_perform_create_database() to perform the database creation.

   client :   a GdaClient object.
   provider : a provider
   Returns :  new GdaServerOperation object, or NULL if the provider does not
              support database creation

   --------------------------------------------------------------------------

  gda_client_perform_create_database ()

 gboolean    gda_client_perform_create_database
                                             (GdaClient *client,
                                              const gchar *provider,
                                              GdaServerOperation *op,
                                              GError **error);

   Creates a new database using the specifications in op.

   client :   a GdaClient object.
   provider : a provider
   op :       a GdaServerOperation object obtained using
              gda_client_prepare_server_operation()
   error :    a place to store en error, or NULL
   Returns :  TRUE if no error occurred and the database has been created

   --------------------------------------------------------------------------

  gda_client_prepare_drop_database ()

 GdaServerOperation* gda_client_prepare_drop_database
                                             (GdaClient *client,
                                              const gchar *provider);

   Creates a new GdaServerOperation object which contains the specifications
   required to drop a database. Once these specifications provided, use
   gda_client_perform_drop_database() to perform the database creation.

   client :   a GdaClient object.
   provider : a provider
   Returns :  new GdaServerOperation object, or NULL if the provider does not
              support database destruction

   --------------------------------------------------------------------------

  gda_client_perform_drop_database ()

 gboolean    gda_client_perform_drop_database
                                             (GdaClient *client,
                                              const gchar *provider,
                                              GdaServerOperation *op,
                                              GError **error);

   Destroys an existing database using the specifications in op.

   client :   a GdaClient object.
   provider : a provider
   op :       a GdaServerOperation object obtained using
              gda_client_prepare_server_operation()
   error :    a place to store en error, or NULL
   Returns :  TRUE if no error occurred and the database has been destroyed

Signal Details

  The "event-notification" signal

 void        user_function                  (GdaClient *gdaclient,
                                             gpointer   arg1,
                                             gint       arg2,
                                             gpointer   arg3,
                                             gpointer   user_data)      : Run last

   gdaclient : the object which received the signal.
   arg1 :
   arg2 :
   arg3 :
   user_data : user data set when the signal handler was connected.

See Also

   GdaConnection.

References

   Visible links
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/index.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_begin.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/architecture.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/installation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/getting_started.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/migration.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_libgda_api.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch06.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/init_config.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/data_models.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/data_conv.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch11.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch12.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch13.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/misc.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch15.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch16.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_tools.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-list-config.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-test-connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-diagnose.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-author-dict.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-inspect-dict.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_providers.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-provider-introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-provider-class.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-provider-recordset.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_libgda-reports.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-reports-introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-reports.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/fdl.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ix01.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/index.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#top_of_page
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#desc
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#object_hierarchy
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#signal_proto
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#GdaClient-struct
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#GdaClientEvent
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-new
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-declare-connection
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-open-connection
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#GdaConnectionOptions
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-open-connection-from-string
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#GdaConnectionOptions
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-get-connections
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-find-connection
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-close-all-connections
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#GdaClientEvent
   . GdaParameterList
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaParameterList.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-error-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaConnectionEvent
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnectionEvent.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-connection-opened-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-connection-closed-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-transaction-started-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-transaction-committed-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-notify-transaction-cancelled-event
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-begin-transaction
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-commit-transaction
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-rollback-transaction
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-get-dsn-specs
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-prepare-create-database
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-perform-create-database
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-prepare-drop-database
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-perform-drop-database
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#GdaClient-event-notification
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-new
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#GdaConnectionOptions
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#GdaConnectionOptions
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#GdaConnectionOptions
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#GdaConnectionOptions
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#GdaClientEvent
   . GdaParameterList
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaParameterList.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#GdaClientEvent
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaConnectionEvent
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnectionEvent.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-begin-transaction
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-commit-transaction
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-rollback-transaction
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-begin-transaction
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-commit-transaction
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-rollback-transaction
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-begin-transaction
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-commit-transaction
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html#gda-connection-rollback-transaction
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaTransaction
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaTransaction.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-perform-create-database
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html#gda-client-perform-drop-database
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaServerOperation
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaServerOperation.html
   . GdaClient
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaClient.html
   . GdaConnection
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaConnection.html
 
end -- class GDA_CLIENT

