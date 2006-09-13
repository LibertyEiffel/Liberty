indexing
	description: "."
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
								 This class is the main entry point for libgda client applications. It provides the way by
								 which client applications open connections. Thus, before using any other database-oriented
								 function in libgda, applications must create a GdaClient object (via gda_client_new),
								 and, once created, open the connections from it.
								 
								 GdaClient also provides a way to treat several connections as if they were only one (a
								 connection pool), which allows applications to, for instance, commit/rollback a transaction in
								 all the connections being managed by a unique GdaClient object, or obtain the list of all
								 tables in all opened connections.
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
 
end -- class GDA_CLIENT

