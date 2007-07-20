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
	wrapped_version: "3.0"
			
class GDA_CLIENT
	-- The main entry point for libgda client applications. It provides
	-- the way by which client applications open connections. Thus,
	-- before using any other database-oriented function in libgda,
	-- applications must create a GDA_CLIENT object (via `make'), and
	-- once created, open the connections from it.

	-- GDA_CLIENT also provides a way to treat several connections as
	-- if they were only one (a connection pool), which allows
	-- applications to, for instance, commit/rollback a transaction in
	-- all the connections being managed by a unique GdaClient object,
	-- or obtain the list of all tables in all opened connections.

	-- Database creation and destruction is done through a GdaClient
	-- object uding the `create_database' and `drop_database' methods.
	-- Note however that depending on the provider, an opened
	-- connection may be required in order to create or destroy a
	-- database.

inherit G_OBJECT

insert
	GDA_CLIENT_EXTERNALS
	SHARED_G_ERROR
	
creation make, from_external_pointer

feature {} -- Creation
 
	make is
			-- Creates a new GdaClient object, which is the entry point
			-- for libgda client applications. This object, once created,
			-- can be used for opening new database connections and
			-- activating other services available to GDA clients.
		do
			from_external_pointer (gda_client_new)
		end

feature 
	open_connection (a_dsn, a_username, a_password: STRING; some_options: INTEGER): GDA_CONNECTION is
			-- Tries to establishes a connection to a data source. The
			-- connection will be opened if no identical connection is
			-- available in the GdaClient connection pool, and re-used if
			-- available. If you dont want to share the connection,
			-- specify `gda_connection_options_dont_share' as one of the
			-- flags in the options parameter.

			-- The username and password used to actually open the
			-- connection are the first non-Void string being chosen by
			-- order from

			--     o the username or password
			--     o the username or password sprcified in the DSN definition
			--     o the USERNAME= and PASSWORD= parts of the connection string in the DSN
			--       definition

			-- `a_dsn' :      data source name.
			-- `a_username' : user name or Void
			--  `a_password' : password for username, or Void
			--  `some_options' :  options for the connection (see GdaConnectionOptions).

			-- `error' will be updated.
		
			-- TODO: which feature name is better: `open_connection' that
			-- mimicks the original anme or `get_new_connection' which is
			-- more Eiffel-alike?"
		require
			dsn_not_void: a_dsn /= Void
			-- valid_options: are_valid_connection_options (some_options)
		local ptr: POINTER
		do
			ptr:=gda_client_open_connection(handle, a_dsn.to_external,
													  null_or_string(a_username), null_or_string(a_password),
													  some_options, address_of(error.handle))
			if ptr.is_not_null then
				is_successful := True
				Result:=wrappers.reference_at(ptr)
				if Result=Void then -- found an unwrapped C-object
					create Result.from_external_pointer(ptr)
				end
			else
				is_successful := False
			end
		ensure
			not_void_if_successful: is_successful implies (Result /= Void)
			valid_error_when_unsuccessful: (not is_successful) implies error.is_not_null
		end
	
	open_connection_from_string (a_provider_id, a_connection_string, a_username, a_password: STRING; some_options: INTEGER): GDA_CONNECTION is
			-- Tries to open a connection given `a_provider_id' and
			-- `a_connection_string'. This allows applications to open
			-- connections without having to create a data source in the
			-- configuration. The format of `a_connection_string' is
			-- similar to PostgreSQL and MySQL connection strings. It is
			-- a semicolumn-separated series of key=value pairs. Do not
			-- add extra whitespace after the semicolumn separator. The
			-- possible keys depend on the provider, but these keys
			-- should work with all providers: USER, PASSWORD, HOST,
			-- DATABASE, PORT
			
			-- The username and password used to actually open the
			-- connection are the first non-Void string being chosen by
			-- order from
		
			--     o the username or password
			--     o the USERNAME= and PASSWORD= parts of the cnc_string
	
			-- `a_provider_id' : provider ID to connect to.

			-- Result is Void if an error occurred.
		require
			provider_not_void: a_provider_id /= Void
			connection_string_not_void: a_connection_string /= Void
			-- valid_options: are_valid_connection_options (some_options)
		local ptr: POINTER
		do
			ptr := gda_client_open_connection_from_string (handle, a_provider_id.to_external, 
																		  a_connection_string.to_external,
																		  null_or_string(a_user), null_or_string(a_password),
																		  some_options, address_of(error.handle))
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
			end
		end

	connections: G_LIST [GDA_CONNECTION] is
			-- The open connections of Current GDA_CLIENT.
		local temp: like Result
		do
			create temp.from_external_pointer (gda_client_get_connections (handle))
			temp.set_shared
			-- Note from GDA docs: gda_client_get_connection_list "gets
			-- the list of all open connections in the given GdaClient
			-- object. The GList returned is an internal pointer, so
			-- DON'T TRY TO FREE IT." It also cannot be modified. So we 
			-- make a copy of it.
			Result := temp.twin
		end

	find_connection (a_data_source_name, a_username, a_password: STRING): GDA_CONNECTION is
			-- Looks for an open connection given `a_data_source_name'
			-- (per libgda configuration), `a_username' and `a_password'.
			-- This feature iterates over the list of open connections in
			-- the given GdaClient and looks for one that matches the
			-- given data source name, username and password. Void if
			-- some error occurs opening the connection
		require
			dsn_not_void: a_data_source_name /= Void
			username_not_void: a_username /= Void
			password_not_void: a_password /= Void
		local
			ptr: POINTER
		do
			ptr := (gda_client_find_connection
					  (handle, a_data_source_name.to_external,
					   a_username.to_external, a_password.to_external))
			if ptr.is_not_null then
				Result:=wrappers.reference_at(ptr)
				if Result=Void then 
					create Result.from_external_pointer (ptr)
				end
			end
		end

	close_all_connections is
			-- Closes all connections opened by the Current GdaClient.
		do
			gda_client_close_all_connections (handle)
		ensure
			all_closed: connections.is_empty
		end

feature {} -- Transactions
	-- These features operates on all connections opened within a
	-- GdaClient, which could not be what you're looking for.

	-- To execute a transaction on a unique connection, use
	-- `begin_transaction', `commit_transaction' and
	-- `rollback_transaction' of a GDA_CONNECTION
	
	begin_transaction (a_name: STRING; an_isolation_level: INTEGER) is
			-- Starts a transaction on all connections being managed by
			-- the given GdaClient.
		
			-- `a_name': the name of the transation to start

			-- `is_successful' will be True if all transactions could be
			-- started successfully, or False if one of them fails. `error' 
			-- is updated
		require
			name_not_void: a_name /= Void
			valid_isolation_level: is_valid_gda_transaction_isolation_level(an_isolation_level)
		do
			is_successful:=(gda_client_begin_transaction(handle,a_name.to_external,
																		an_isolation_level, address_of(error.handle))).to_boolean
		end

	commit_transaction (a_name: STRING) is
			-- Commits a running transaction on all connections being
			-- managed by the given GdaClient. 
		
			-- `a_name':   the name of the transation to commit
		
			-- `is_successful' will be True if all transactions could be
			-- committed successfully, or False if one of them fails.
			-- `error' is updated.
		require
			name_not_void: a_name /= Void
		do
			is_successful:=(gda_client_commit_transaction(handle,a_name.to_external,address_of(error.handle))).to_boolean
		end	
	
	rollback_transaction (a_name: STRING) is
			-- Cancels a running transaction on all connections being
			-- managed by the given GdaClient.
		
			-- `a_name':   the name of the transation to rollback
		
			-- `is_successful' will be True if all transactions could be
			-- committed successfully, or False if one of them fails.
			-- `error' is updated.
		require
			name_not_void: a_name /= Void
		do
			is_successful:=gda_client_rollback_transaction (handle,a_name.to_external,address_of(error.handle))).to_boolean
		end

feature -- Database creation and dropping
	dsn_specs (a_provides: STRING): STRING is
			-- an XML string representing the parameters which can be
			-- present in the DSN string used to open a connection.
		local ptr: POINTER
		do
			ptr:=gda_client_get_dsn_specs(handle, a_provider.to_external)
			if ptr.is_not_null then
				create Result.from_external(ptr)
			end
		end

	prepare_create_database (a_database_name, a_provider: STRING): GDA_SERVER_OPERATION is
			-- A new GDA_SERVER_OPERATION object which contains the
			-- specifications required to create a database. Once these
			-- specifications provided, use `perform_create_database' to
			-- perform the database creation.
			
			-- `a_database_name': the name of the database to create. If
			-- it is left Void, then the name of the database to create
			-- will have to be set in the Result using `set_value_at'.
	
			-- Can be Void if the provider does not support database
			-- creation.

			-- Note: This feature and `perform_create_database' follow
			-- closely the original C API. It is debatable if that
			-- approach is a correct OO design. Surely it requires revere
			-- precondition in the latter feature. Perhaps it is meant to
			-- allow the end-user to set up some provider-dependant
			-- settings before actual database creation. Paolo 2007-07-07
		local ptr: POINTER
		do
			ptr := (gda_client_prepare_create_database (handle,
																	  null_or(a_database_name),
																	  a_provider.to_external))
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

	perform_create_database (an_operation: GDA_SERVER_OPERATION) is
			-- Creates a new database using the specifications in op,
			-- which must have been obtained using
			-- gda_client_prepare_create_database()
		
			-- `is_successful' is True if no error occurred and the
			-- database has been created; otherwise `error' is updated
		require operation_is_database_creation: -- TODO
		do
			is_successful:=(gda_client_perform_create_database(handle,an_operation.handle,
																				address_of(error.handle))).to_boolean
		end
	
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

feature {} -- "event-notification" signal (TODO)
	
feature {} -- Unwrapped code
	-- NOTE: gda_client_declare_connection is not wrapped. See below

	-- void gda_client_declare_connection (GdaClient *client,
	-- GdaConnection *cnc);

	--   Declares the cnc to client. This function should not be used directly

	--   client : a GdaClient object
	--   cnc :    a GdaConnection object
	--
	--
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

end -- class GDA_CLIENT

