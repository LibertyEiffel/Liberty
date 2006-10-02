indexing
	description: "GdaConnection -- Management of connections to data sources."
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
										 The GdaConnection class offers access to all operations involving an
										 opened connection to a database. GdaConnection objects are obtained via
										 the GdaClient class.

		Once obtained, applications can use GdaConnection to execute commands, run
										 transactions, and get information about all objects stored in the
										 underlying database.
										 ]"


class GDA_CONNECTION

inherit G_OBJECT 

insert 
	SHARED_G_ERROR
	GDA_CONNECTION_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation	

	-- TODO: if ever necessary  gda_connection_new ()

	--  GdaConnection* gda_connection_new           (GdaClient *client,
	--                                               GdaServerProvider *provider,
	--                                               const gchar *dsn,
	--                                               const gchar *username,
	--                                               const gchar *password,
	--                                               guint options);

	--    This function creates a new GdaConnection object. It is not intended to be
	--    used directly by applications (use gda_client_open_connection instead).

	--    The connection is not opened at this stage; use gda_connection_open() to
	--    open the connection.

	--    client :   a GdaClient object.
	--    provider : a GdaServerProvider object.
	--    dsn :      GDA data source to connect to.
	--    username : user name to use to connect.
	--    password : password for username.
	--    options :  options for the connection.
	--    Returns :  a newly allocated GdaConnection object.

	--    --------------------------------------------------------------------------

	open is
			-- Tries to open the connection.
			-- `is_successful' will be True if the connection is opened, and False 
			-- otherwise. `error' will be updated as necessary
		do
			is_successful := (gda_connection_open
									(handle, address_of(error.handle)).to_boolean)
		end

	close is
			-- Closes the connection to the underlying data source, but
			-- first emits the "conn_to_close" signal.
		do
			gda_connection_close(handle)
		end


	close_no_warning is
			-- Closes the connection to the underlying data source,
			-- without emiting any warning signal.
		do
			gda_connection_close_no_warning (handle)
		end
	
	is_opened: BOOLEAN is
			-- Is the connection opened?
		do
			Result := (gda_connection_is_opened(handle).to_boolean)
		end

	client: GDA_CLIENT is
			-- the GdaClient object associated with a connection. This is
			-- always the client that created the connection, as returned
			-- by GDA_CLIENT `open_connection'.
		local retriever: G_RETRIEVER [GDA_CLIENT]
		do
			Result := (retriever.eiffel_wrapper_from_gobject_pointer
						  (gda_connection_get_client (handle)))
		ensure not_void: Result /= Void
		end

		
	set_client (a_client: GDA_CLIENT) is
			-- Associates 'a_client' with this connection. This feature
			-- is not intended to be called by applications.
		require client_not_void: a_client /= Void
		do
			smart_set_property (client_parameter_spec,
									  create {G_VALUE}.from_gobject(a_client))
		end

	options: INTEGER is
			-- the GdaConnectionOptions used to open this connection.
		do
			Result := gda_connection_get_options (handle)
		ensure are_valid_connection_option (Result)
		end

	-- TODO: set_options
	
	--   gda_connection_get_provider_obj ()

	--  GdaServerProvider* gda_connection_get_provider_obj
	--                                              (GdaConnection *cnc);

	--    Get a pointer to the GdaServerProvider object used to access the database

	--    cnc :     a GdaConnection object
	--    Returns : the GdaServerProvider (NEVER NULL)

	--    --------------------------------------------------------------------------

	--   gda_connection_get_infos ()

	--  GdaServerProviderInfo* gda_connection_get_infos
	--                                              (GdaConnection *cnc);

	--    Get a pointer to a GdaServerProviderInfo structure (which must not be
	--    modified) to retreive specific information about the provider used by cnc.

	--    cnc :     a GdaConnection object
	--    Returns :

	--    --------------------------------------------------------------------------

	server_version: STRING is
			--  the version string of the underlying database server.
		do
			create Result.from_external_copy (gda_connection_get_server_version(handle))
		ensure not_void: Result /= Void
		end

	--   gda_connection_get_server_version ()

	--  const gchar* gda_connection_get_server_version
	--                                              (GdaConnection *cnc);

	--    Gets the version string of the underlying database server.

	--    cnc :     a GdaConnection object.
	--    Returns : the server version string.

	--    --------------------------------------------------------------------------

	database: STRING is
			-- the name of the currently active database
		do
			create Result.from_external_copy (gda_connection_get_database(handle))
		ensure not_void: Result /= Void
		end


	set_dsn (a_datasource: STRING) is
			-- Sets the data source of the connection. If the connection
			-- is already opened, then no action is performed at all and
			-- `is_successfull' will be set to False.
		
			-- If the requested datasource does not exist, then nothing
			-- is done and `is_successfull' will be False.
			dsn_not_void: a_datasource /= Void
		do
			is_successfull:=(gda_connection_set_dsn
								  (handle, a_datasource.to_external)).to_boolean
		end
	
	dsn: STRING is
			--  the data source name the connection object is connected to.
		do
			create Result.from_external_copy (gda_connection_get_dsn(handle))
		ensure not_void: Result /= Void
		end

	connection_string: STRING is
			-- the connection string used to open this connection. The
			-- connection string is the string sent over to the
			-- underlying database provider, which describes the
			-- parameters to be used to open a connection on the
			-- underlying data source.
		do
			create Result.from_external_copy (gda_connection_get_cnc_string(handle))
		ensure not_void: Result /= Void
		end

	-- TODO set_connection_string
	
	provider: STRING is
			-- the provider id that this connection is connected to.
		do
			create Result.from_external_copy (gda_connection_get_provider(handle))
		ensure not_void: Result /= Void
		end

	-- TODO: set_provider
	
	set_username (a_username: STRING) is
			-- Sets the user name for the connection. If the connection
			-- is already opened, then no action is performed at all and
			-- `is_successfull' will be False.
		require
			username_not_void: a_username /= Void
		do
			is_successfull:=(gda_connection_set_username
								  (handle, a_username.to_external)).to_boolean
		end

	username: STRING is
			-- the user name used to open this connection.
		do
			create Result.from_external_copy (gda_connection_get_username(handle))
		ensure not_void: Result /= Void
		end

	set_password (a_password: STRING) is
			-- Sets the user password for the connection to the
			-- server. If the connection is already opened, then no
			-- action is performed at all and `is_successfull' will be False.
		require
			password_not_void: a_password /= Void
		do
			is_successfull:=(gda_connection_set_password
								  (handle, a_password.to_external))
		end

	password: STRING is
			-- the password used to open this connection.
		do
			create Result.from_external_copy (gda_connection_get_password(handle))
		ensure not_void: Result /= Void
		end

	--   gda_connection_add_event ()

	--  void        gda_connection_add_event        (GdaConnection *cnc,
	--                                               GdaConnectionEvent *error);

	--    Adds an event to the given connection. This function is usually called by
	--    providers, to inform clients of events that happened during some
	--    operation.

	--    As soon as a provider (or a client, it does not matter) calls this
	--    function with an event object which is an error, the connection object
	--    (and the associated GdaClient object) emits the "error" signal, to which
	--    clients can connect to be informed of events.

	--    WARNING: the reference to the event object is stolen by this function!

	--    cnc :   a GdaConnection object.
	--    error :

	--    --------------------------------------------------------------------------

	--   gda_connection_add_event_string ()

	--  void        gda_connection_add_event_string (GdaConnection *cnc,
	--                                               const gchar *str,
	--                                               ...);

	--    Adds a new error to the given connection object. This is just a
	--    convenience function that simply creates a GdaConnectionEvent and then
 	--    calls gda_server_connection_add_error.

	--    cnc : a GdaServerConnection object.
	--    str : a format string (see the printf(3) documentation).
	--    ... : the arguments to insert in the error message.

	--    --------------------------------------------------------------------------

	--   gda_connection_add_events_list ()

	--  void        gda_connection_add_events_list  (GdaConnection *cnc,
	--                                               GList *events_list);

	--    This is just another convenience function which lets you add a list of
	--    GdaConnectionEvent's to the given connection.* As with
	--    gda_connection_add_event and gda_connection_add_event_string, this
	--    function makes the connection object emit the "error" signal for each
	--    error event.

	--    events_list is copied to an internal list and freed.

	--    cnc :         a GdaConnection object.
	--    events_list : a list of GdaConnectionEvent.

	--   gda_connection_get_events ()

	--  const GList* gda_connection_get_events      (GdaConnection *cnc);

	--    Retrieves a list of the last errors occurred in the connection. You can
	--    make a copy of the list using gda_connection_event_list_copy.

	--    cnc :     a GdaConnection.
	--    Returns : a GList of GdaConnectionEvent.

	-- gda_connection_clear_events_list ()

	-- void gda_connection_clear_events_list (GdaConnection *cnc);

	-- This function lets you clear the list of GdaConnectionEvent's of
	-- the given connection.

	-- cnc : a GdaConnection object.

	change_database (a_name: STRING) is
			-- Changes the current database for the given
			-- connection. This operation is not available in all
			-- providers. `is_successfull' will be updated.
		require name_not_void: a_name /= Void
		do
			is_successful:=(gda_connection_change_database(handle,a_name.to_external)).to_boolean
		end

	
	single_result: GDA_DATA_MODEL
			-- Results of the last invocation of `execute_command'
	
	execute_command (a_command: GDA_COMMAND; some_parameters: GDA_PARAMETER_LIST) is
			-- Executes a single command on the given connection.
		
			-- This feature lets you retrieve a simple data model from
			-- the underlying difference, instead of having to retrieve a
			-- list of them, as is the case with `execute_command_l'.

			-- Note that if `a_command' is composed of several SQL
			-- statements, the data model returned is the one
			-- corresponding to the last statement.

			-- See the documentation of the `execute_command_l' for
			-- information about the params list of parameters.
		require 
			command_not_void: a_command /= Void
			parameters_not_void: some_parameters /= Void
		local model_ptr: POINTER
		do
			-- Returns : a GdaDataModel containing the data returned by
			-- the data source, NULL if no data was expected, or
			-- GDA_CONNECTION_EXEC_FAILED if an error occurred.
			model_ptr:=(gda_connection_execute_command 
							(handle, a_command.handle,
							 some_parameters.handle, address_of (error.handle)))
			if model_ptr.is_null then single_result:=Void
			else
				-- Note: implementation hints:

				--inspect get_c_type
				--when type_foo then
				--	create {TYPE_FOO} single_result.from_external_pointer (model_ptr)
				--when type_bar then
				--	create {TYPE_BAR} single_result.from_external_pointer (model_ptr)
				--......
				--end
			end
		ensure implemented: False
		end

	results: G_LIST [GDA_DATA_MODEL]
	
	execute_some_commands (some_commands: GDA_COMMAND; some_parameters: GDA_PARAMETER_LIST) is
			-- Send several commands at once to the data source being
			-- accessed by the given GdaConnection object. The GdaCommand
			-- specified can contain a list of commands in its "text"
			-- property (usually a set of SQL commands separated by ';').

			-- `results' will store the results.

			-- cnc: a GdaConnection object.  cmd: a GdaCommand.  params:
			-- parameter list for the commands error: a place to store an
			-- error, or NULL Returns: a list of GdaDataModel's, as
			-- returned by the underlying provider, or NULL if an error
			-- occurred.
		require 
			commands_not_void: some_commands /= Void
			parameters_not_void: some_parameters /= Void
		local ptr: POINTER
		do
			-- The return value is a GList of GdaDataModel's, which you
			-- are responsible to free when not needed anymore (and unref
			-- the data models when they are not used anymore). Note that
			-- some nodes of the returned list may actually not point to
			-- a GdaDataModel but may be NULL (which corresponds to a
			-- command which did not return a data set, like UPDATE
			-- commands).

			-- The params can contain the following parameters: a
			-- "ITER_MODEL_ONLY" parameter of type G_TYPE_BOOLEAN which,
			-- if set to TRUE will preferably return a data model which
			-- can be accessed only using an iterator.

			ptr := (gda_connection_execute_command_l
					  (handle, some_commands.handle, some_parameters.handle,
						address_of (error.handle)))
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
			end
		end
	
		last_insert_id_of (a_record_set: GDA_DATA_MODEL): STRING is
			-- the ID of the last inserted row. A connection must be
			-- specified, and, optionally, a result set. If not NULL, the
			-- underlying provider should try to get the last insert ID
			-- for the given result set.
		
			-- It is Void if an error occurred or no row has been
			-- inserted. It is the caller's reponsibility to free the
			-- returned string.
		require set_not_void: a_record_set /= Void
		local ptr: POINTER
		do
			ptr:=gda_connection_get_last_insert_id(handle, a_record_set.handle)
			if ptr.is_not_null then
				create Result.from_external (ptr)
				-- Note: using plain `from_external' which brings the
				-- pointer under the jurisdiction of Eiffel'GC, since it
				-- is wrapper's reponsibility to free the returned string.
			end
		end

	begin_transaction (a_transaction: GDA_TRANSACTION) is
			-- Starts `a_transaction' on the data source
		
			-- Before starting a transaction, you can check whether the
			-- underlying provider does support transactions or not by
			-- using the `supports' feature.

			-- `is_successfull' will be True if the transaction was
			-- started successfully, FALSE otherwise.
		require transaction_not_void: a_transaction/=Void
		do
			is_successfull:=(gda_connection_begin_transaction
								  (handle, a_transaction.handle)).to_boolean
		end

	commit_transaction  (a_transaction: GDA_TRANSACTION) is
			-- Commits `a_transaction' to the backend database. You need
			-- to do gda_connection_begin_transaction() first.

		
			-- `is_successfull' will be True if the transaction was
			-- started successfully, FALSE otherwise.
		require transaction_not_void: a_transaction/=Void
		do
			is_successfull:=(gda_connection_commit_transaction
								  (handle, a_transaction.handle)).to_boolean


	--    cnc :     a GdaConnection object.
	--    xaction : a GdaTransaction object.
	--    Returns : TRUE if the transaction was finished successfully, FALSE
	--              otherwise.

	--    --------------------------------------------------------------------------

	--   gda_connection_rollback_transaction  (a_transaction: GDA_TRANSACTION) is
			-- Starts `a_transaction' on the data source
		
			-- Before starting a transaction, you can check whether the
			-- underlying provider does support transactions or not by
			-- using the `supports' feature.

			-- `is_successfull' ill be True if the transaction was
			-- started successfully, FALSE otherwise.
		require transaction_not_void: a_transaction/=Void
		do
			is_successfull:=(

	--  gboolean    gda_connection_rollback_transaction
	--                                              (GdaConnection *cnc,
	--                                               GdaTransaction *xaction);

	--    Rollbacks the given transaction. This means that all changes made to the
	--    underlying data source since the last call to
	--    gda_connection_begin_transaction or gda_connection_commit_transaction will
	--    be discarded.

	--    cnc :     a GdaConnection object.
	--    xaction : a GdaTransaction object.
	--    Returns : TRUE if the operation was successful, FALSE otherwise.

	--    --------------------------------------------------------------------------

	--   gda_connection_supports_feature ()

	--  gboolean    gda_connection_supports_feature (GdaConnection *cnc,
	--                                               GdaConnectionFeature feature);

	--    Asks the underlying provider for if a specific feature is supported.

	--    cnc :     a GdaConnection object.
	--    feature : feature to ask for.
	--    Returns : TRUE if the provider supports it, FALSE if not.

	--    --------------------------------------------------------------------------

	--   gda_connection_get_schema ()

	--  GdaDataModel* gda_connection_get_schema     (GdaConnection *cnc,
	--                                               GdaConnectionSchema schema,
	--                                               GdaParameterList *params,
	--                                               GError **error);

	--    Asks the underlying data source for a list of database objects.

	--    This is the function that lets applications ask the different providers
	--    about all their database objects (tables, views, procedures, etc). The set
	--    of database objects that are retrieved are given by the 2 parameters of
	--    this function: schema, which specifies the specific schema required, and
	--    params, which is a list of parameters that can be used to give more detail
	--    about the objects to be returned.

	--    The list of parameters is specific to each schema type.

	--    cnc :     a GdaConnection object.
	--    schema :  database schema to get.
	--    params :  parameter list.
	--    error :   a place to store errors, or NULL
	--    Returns : a GdaDataModel containing the data required. The caller is
	--              responsible of freeing the returned model.

	--    --------------------------------------------------------------------------

	--   gda_connection_create_blob ()

	--  GdaBlob*    gda_connection_create_blob      (GdaConnection *cnc);

	--    Fetch an existing BLOB (Binary Large OBject) using its SQL ID.

	--    cnc :     a GdaConnection object.
	--    Returns : FALSE if the database does not support BLOBs. TRUE otherwise and
	--              the GdaBlob is created and ready to be used.

	--    --------------------------------------------------------------------------

	--   gda_connection_fetch_blob_by_id ()

	--  GdaBlob*    gda_connection_fetch_blob_by_id (GdaConnection *cnc,
	--                                               const gchar *sql_id);

	--    cnc :
	--    sql_id :
	--    Returns :

	--    --------------------------------------------------------------------------

	--   gda_connection_value_to_sql_string ()

	--  gchar*      gda_connection_value_to_sql_string
	--                                              (GdaConnection *cnc,
	--                                               GValue *from);

	--    Produces a fully quoted and escaped string from a GValue

	--    cnc :     a GdaConnection object.
	--    from :    GValue to convert from
	--    Returns : escaped and quoted value or NULL if not supported.

	-- Property Details

	--   The "client" property

	--    "client"               gpointer              : Read / Write

	--    --------------------------------------------------------------------------

	--   The "cnc-string" property

	--    "cnc-string"           gchararray            : Read / Write

	--    Default value: NULL

	--    --------------------------------------------------------------------------

	--   The "dsn" property

	--    "dsn"                  gchararray            : Read / Write

	--    Default value: NULL

	--    --------------------------------------------------------------------------

	--   The "options" property

	--    "options"              guint                 : Read / Write

	--    Default value: 0

	--    --------------------------------------------------------------------------

	--   The "password" property

	--    "password"             gchararray            : Read / Write

--    Default value: NULL

--    --------------------------------------------------------------------------

--   The "provider-obj" property

--    "provider-obj"         gpointer              : Read / Write

--    --------------------------------------------------------------------------

--   The "username" property

--    "username"             gchararray            : Read / Write

--    Default value: NULL

-- Signal Details

--   The "conn-closed" signal

--  void        user_function                  (GdaConnection *gdaconnection,
--                                              gpointer       user_data)          : Run first

--    gdaconnection : the object which received the signal.
--    user_data :     user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "conn-opened" signal

--  void        user_function                  (GdaConnection *gdaconnection,
--                                              gpointer       user_data)          : Run first

--    gdaconnection : the object which received the signal.
--    user_data :     user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "conn-to-close" signal

--  void        user_function                  (GdaConnection *gdaconnection,
--                                              gpointer       user_data)          : Run first

--    gdaconnection : the object which received the signal.
--    user_data :     user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "dsn-changed" signal

--  void        user_function                  (GdaConnection *gdaconnection,
--                                              gpointer       user_data)          : Run last

--    gdaconnection : the object which received the signal.
--    user_data :     user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "error" signal

--  void        user_function                  (GdaConnection      *gdaconnection,
--                                              GdaConnectionEvent *arg1,
--                                              gpointer            user_data)          : Run last

--    gdaconnection : the object which received the signal.
--    arg1 :
--    user_data :     user data set when the signal handler was connected.
feature 
	is_successful: BOOLEAN 
			-- Is last command successfull?

feature -- TODO: Signals


	--  "conn-closed"
	--              void        user_function      (GdaConnection *gdaconnection,
	--                                              gpointer       user_data)          : Run first
	--  "conn-opened"
	--              void        user_function      (GdaConnection *gdaconnection,
	--                                              gpointer       user_data)          : Run first
	--  "conn-to-close"
	--              void        user_function      (GdaConnection *gdaconnection,
	--                                              gpointer       user_data)          : Run first
	--  "dsn-changed"
	--              void        user_function      (GdaConnection *gdaconnection,
	--                                              gpointer       user_data)          : Run last
	--  "error"     void        user_function      (GdaConnection      *gdaconnection,
	--                                              GdaConnectionEvent *arg1,
	--                                              gpointer            user_data)          : Run last

feature {} -- Implementation
	-- Hidded properties parameters specs
	client_parameter_spec: G_PARAM_SPEC is
		once
			Result := find_property (client_property_name)
		ensure Result /= Void
		end

	connection_string_parameter_spec: G_PARAM_SPEC is
		once
			Result := find_property (connection_string_property_name)
		ensure Result /= Void
		end

	dsn_parameter_spec: G_PARAM_SPEC is
		once
			Result := find_property (dsn_property_name)
		ensure Result /= Void
		end

	password_parameter_spec: G_PARAM_SPEC is
		once
			Result := find_property (password_property_name)
		ensure Result /= Void
		end

	provider_parameter_spec: G_PARAM_SPEC is
		once
			Result := find_property (provider_object_property_name)
		ensure Result /= Void
		end

	username_parameter_spec: G_PARAM_SPEC is
		once
			Result := find_property (username_property_name)
		ensure Result /= Void
		end

	
	client_property_name: STRING is "string"
	connection_string_property_name: STRING is "cnc-string"
	dsn_property_name: STRING is "dsn"
	options_property_name: STRING is "options"
	password_property_name: STRING is "password"
	provider_object_property_name: STRING is "provider-obj"
	username_property_name: STRING is "username"

end -- class GDA_CONNECTION
