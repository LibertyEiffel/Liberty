note
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli 
					
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

	wrapped_version: "3.99.3"

class GDA_CONNECTION
	-- GdaConnection -- Management of connections to data sources

	-- The GDA_CONNECTION class offers access to all operations involving an
	--   opened connection to a database. GdaConnection objects are not instiated
	--   directly but by GdaClient objects using gda_client_open_connection() and
	--   gda_client_open_connection_from_string()
	
	--   Applications can then use GdaConnection objects to execute commands, run
	--   transactions, and get information about all objects stored in the
	--   underlying database.
	--
inherit
	G_OBJECT

insert
	SHARED_G_ERROR
	GDA_CONNECTION_EXTERNALS

create {ANY} from_dsn, from_string, from_external_pointer

feature {} -- Creation
	from_dsn (a_dsn, an_auth_string: STRING; some_options: GDA_CONNECTION_OPTIONS)
		-- Opening database connections with libgda, using a pre-defined data
		-- source (`a_dsn;), see gda_config_define_dsn() for more information
		-- about how to define a DSN. If you don't want to define a DSN, it is
		-- possible to use `from_string' instead of this method.

		-- `error' is updated.
	
		-- The dsn string must have the following format:
		-- "[<username>[:<password>]@]<DSN>" (if <username> and/or <password>
		-- are provided, and auth_string is NULL, then these username and
		-- passwords will be used). Note that if provided, <username> and
		-- <password> must be encoded as per RFC 1738, see gda_rfc1738_encode()
		-- for more information.

		-- The auth_string can contain the authentication information for the
		-- server to accept the connection. It is a string containing
		-- semi-colon seperated named value, usually like
		-- "USERNAME=...;PASSWORD=..." where the ... are replaced by actual
		-- values. Note that each name and value must be encoded as per RFC
		-- 1738, see gda_rfc1738_encode() for more information.

		-- The actual named parameters required depend on the provider being
		-- used, and that list is available as the auth_params member of the
		-- GdaProviderInfo structure for each installed provider (use
		-- gda_config_get_provider_info() to get it). Also one can use the
		-- "gda-sql-4.0 -L" command to list the possible named parameters.
	require
		a_dsn/=Void
		an_auth_string/=Void
	local p: POINTER
	do
		p:=gda_connection_open_from_dsn
		(a_dsn.to_external, an_auth_string.to_external, some_options.value,
		address_of(error.handle))
		if p.is_not_null 
			then from_external_pointer(p)
		end
	end

	from_string (a_provider_name, a_connection_string: STRING; some_options: GDA_CONNECTIO_OPTIONS)
		-- Opens a connection given a provider ID and a connection string. This
		-- allows applications to open connections without having to create a
		-- data source (DSN) in the configuration. The format of cnc_string is
		-- similar to PostgreSQL and MySQL connection strings. It is a
		-- semicolumn-separated series of <key>=<value> pairs, where each key
		-- and value are encoded as per RFC 1738, see gda_rfc1738_encode() for
		-- more information.

		-- The possible keys depend on the provider, the "gda-sql-4.0 -L"
		-- command can be used to list the actual keys for each installed
		-- database provider.
		
		-- For example the connection string to open an SQLite connection to a
		-- database file named "my_data.db" in the current directory would be
		-- "DB_DIR=.;DB_NAME=my_data".
		
		-- The cnc_string string must have the following format:
		-- "[<provider>://][<username>[:<password>]@]<connection_params>" (if
		-- <username> and/or <password> are provided, and auth_string is NULL,
		-- then these username and passwords will be used, and if <provider> is
		-- provided and provider_name is NULL then this provider will be used).
		-- Note that if provided, <username>, <password> and <provider> must be
		-- encoded as per RFC 1738, see gda_rfc1738_encode() for more
		-- information.
		
		--   The auth_string must contain the authentication information for
		--   the server to accept the connection. It is a string containing
		--   semi-colon seperated named values, usually like
		--   "USERNAME=...;PASSWORD=..." where the ... are replaced by actual
		--   values. Note that each name and value must be encoded as per RFC
		--   1738, see gda_rfc1738_encode() for more information.
		
		--   The actual named parameters required depend on the provider being
		--   used, and that list is available as the auth_params member of the
		--   GdaProviderInfo structure for each installed provider (use
		--   gda_config_get_provider_info() to get it). Similarly to the format
		--   of the connection string, use the "gda-sql-4.0 -L" command to list
		--   the possible named parameters.
		
		--   Additionally, it is possible to have the connection string respect
		--   the "<provider_name>://<real cnc string>" format, in which case
		--   the provider name and the real connection string will be extracted
		--   from that string (note that if provider_name is not NULL then it
		--   will still be used as the provider ID).
	require
		a_connection_string/=Void
	local p: POINTER
	do
		p:=gda_connection_open_from_string
		(null_or_string(a_provider_name), a_connection_string.to_external,
		null_or_string(an_auth_string), some_options,value,
		address_or(error.handle))

		if p.is_not_null then
			from_external_pointer(p)
		end
	end
	
feature {ANY}
	open
		-- Tries to open the connection. `is_successful' will be True if the
		-- connection is opened, and False otherwise and `error' is updated.
	require is_not_null
	do
		is_successful:=gda_connection_open(handle,address_of(error.handle)).to_boolean
	ensure is_successful and then is_opened
	end
	
	close
		-- Closes the connection to the underlying data source, but first emits
		-- the "conn_to_close" signal.
	require is_not_null
	do
		gda_connection_close(handle)	--
	end

	close_no_warning
		-- Closes the connection to the underlying data source, without emiting
		-- any warning signal.
	require is_not_null
	do
		gda_connection_close_no_warning(handle)		--
	end
	
	is_opened: BOOLEAN
		-- Is connection opened?
	do
		Result := gda_connection_is_opened(handle).to_boolean
	end

	create_parser, get_new_parser: GDA_SQL_PARSER
		-- Creates a new parser object able to parse the SQL dialect understood
		-- by Current connection. Result is Void if the GDA_SERVER_PROVIDER
		-- object used internally does not have its own parser; a general SQL
		-- parser can be obtained creating a GDA_SQL_PARSER.
	local p: POINTER; factory: G_OBJECT_EXPANDED_FACTORY[GDA_SQL_PARSER]
	do
		p:=gda_connection_create_parser(handle)
		if p.is_not_null then
			Result:=factory.wrapper(p)
		end
	end
	
	statement_to_sql (a_statement: GDA_STATEMENT; some_parameters: GDA_SET; some_flags: GDA_STATEMENT_SQL_FLAG): STRING
		-- `a_statement' rendered as an SQL statement, adapted to the SQL
		-- dialect used by Current connection and `some_flags';
		-- `some_parameters' can be Void. `used_parameters' will contain the
		-- list of individual GDA_HOLDER objects within `some_parameters' which
		-- have been used. `error' is updated. Result will be Void if an error
		-- occurred. 
	local sql_ptr, params_used: POINTER
	do
		sql_ptr := gda_connection_statement_to_sql(handle, a_statement.handle,
		null_or(some_parameters), 
		some_flags.value,
		address_of(params_used), error.reference)
		if sql_ptr.is_not_null then
         create Result.from_external(sql_ptr) 
		end
		if params_used.is_not_null then
         create used_parameters.from_external_pointer(params_used)
		end
	end

	used_parameters: G_OBJECT_SLIST[GDA_HOLDER] 
		-- Parameters used in the last invocation of `statement_to_sql'.

	prepare (a_statement: GDA_STATEMENT)
		-- Ask the database accessed through Current connection to prepare the
		-- usage of `a_statement'. This is only usefull if `a_statement' will
		-- be used more than once (however some database providers may always
		-- prepare stamements before executing them).
	
		-- This feature is also usefull to make sure `a_statement' is fully
		-- understood by the database before actually executing it.
	
		-- Note however that it is also possible that `prepare' fails when
		-- `execute' does not fail (this will usually be the case with
		-- statements such as "SELECT * FROM ##tablename::string" because
		-- database usually don't allow variables to be used in place of a
		-- table name).

		-- `is_successful' and `error' are updated.
	do
		is_successful:=gda_connection_statement_prepare
		(handle, a_statement.handle, error.reference).to_boolean
	end
	
	execute (a_statement: GDA_STATEMENT; some_parameters: GDA_SET; a_model_usage: GDA_STATEMENT_MODEL_USAGE): G_OBJECT
		-- Executes `a_statement'.

		-- As `a_statement' can, by design (and if not abused), contain only
		-- one SQL statement, the return object will either be:

		-- * a GdaDataModel if `a_statement' is a SELECT statement (a
		-- `gda_sql_statement_select', see GDA_SQL_STATEMENT_TYPE containing the
		-- results of the SELECT. The resulting data model is by default read
		-- only, but modifications can be made possible using
		-- gda_pmodel_set_modification_query() and/or
		-- gda_pmodel_compute_modification_queries().

		--     o a GdaSet for any other SQL statement which correctly executed. In this
		--       case (if the provider supports it), then the GdaSet may contain value
		--       holders named:

		--          o a (gint) GdaHolder named "IMPACTED_ROWS"

		--          o a (GObject) GdaHolder named "EVENT" which contains a
		--            GdaConnectionEvent

		--   If last_insert_row is not NULL and stmt is an INSERT statement, then it
		--   will contain (if the provider used by cnc supports it) a new GdaSet object
		--   composed of value holders named "+<column number>" starting at column 0
		--   which contain the actual inserted values. For example if a table is
		--   composed of an 'id' column which is auto incremented and a 'name' column
		--   then the execution of a "INSERT INTO mytable (name) VALUES ('joe')" query
		--   will return a GdaSet with two holders:

		--     o one named '+0' which may for example contain 1

		--     o one named '+1' which will contain 'joe'

		--   See the provider's limitations section for more details about this feature
		--   depending on which database is accessed.

	--   cnc :             a GdaConnection
	--   stmt :            a GdaStatement object
	--   params :          a GdaSet object (which can be obtained using
	--                     gda_statement_get_parameters()), or NULL
	--   model_usage :
	--   last_insert_row : a place to store a new GdaSet object which contains the
	--                     values of the last inserted row, or NULL
	--   error :           a place to store errors, or NULL
	--   Returns :         a GObject, or NULL if an error occurred
		do

	--
	-- GObject*            gda_connection_statement_execute    (GdaConnection *cnc,
	--                                                          GdaStatement *stmt,
	--                                                          GdaSet *params,
	--                                                          GdaStatementModelUsage model_usage,
	--                                                          GdaSet **last_insert_row,
	--                                                          GError **error);
	--
--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_statement_execute_select ()
	--
	-- GdaDataModel*       gda_connection_statement_execute_select
	--                                                         (GdaConnection *cnc,
	--                                                          GdaStatement *stmt,
	--                                                          GdaSet *params,
	--                                                          GError **error);
	--
	--   Executes a selection command on the given connection. The
	--   gda_execute_select_command() method can be easier to use if one prefers to
	--   use some SQL directly.
	--
	--   This function returns a GdaDataModel resulting from the SELECT statement,
	--   or NULL if an error occurred.
	--
	--   This function is just a convenience function around the
	--   gda_connection_statement_execute() function.
	--
	--   See the documentation of the gda_connection_statement_execute() for
	--   information about the params list of parameters.
	--
	--   cnc :     a GdaConnection object.
	--   stmt :    a GdaStatement object.
	--   params :  a GdaSet object (which can be obtained using
	--             gda_statement_get_parameters()), or NULL
	--   error :   a place to store an error, or NULL
	--   Returns : a GdaDataModel containing the data returned by the data source,
	--             or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_statement_execute_select_full ()
	--
	-- GdaDataModel*       gda_connection_statement_execute_select_full
	--                                                         (GdaConnection *cnc,
	--                                                          GdaStatement *stmt,
	--                                                          GdaSet *params,
	--                                                          GdaStatementModelUsage model_usage,
	--                                                          GType *col_types,
	--                                                          GError **error);
	--
	--   Executes a selection command on the given connection.
	--
	--   This function returns a GdaDataModel resulting from the SELECT statement,
	--   or NULL if an error occurred.
	--
	--   This function is just a convenience function around the
	--   gda_connection_statement_execute() function.
	--
	--   See the documentation of the gda_connection_statement_execute() for
	--   information about the params list of parameters.
	--
	--   cnc :         a GdaConnection object.
	--   stmt :        a GdaStatement object.
	--   params :      a GdaSet object (which can be obtained using
	--                 gda_statement_get_parameters()), or NULL
	--   model_usage : specifies how the returned data model will be used as a
	--                 GdaStatementModelUsage enum
	--   col_types :   an array of GType to request each returned GdaDataModel's
	--                 column's GType, terminated with the G_TYPE_NONE value. Any
	--                 value left to 0 will make the database provider determine
	--                 the real GType. col_types can also be NULL if no column type
	--                 is specified.
	--   error :       a place to store an error, or NULL
	--   Returns :     a GdaDataModel containing the data returned by the data
	--                 source, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_statement_execute_select_fullv ()
	--
	-- GdaDataModel*       gda_connection_statement_execute_select_fullv
	--                                                         (GdaConnection *cnc,
	--                                                          GdaStatement *stmt,
	--                                                          GdaSet *params,
	--                                                          GdaStatementModelUsage model_usage,
	--                                                          GError **error,
	--                                                          ...);
	--
	--   Executes a selection command on the given connection.
	--
	--   This function returns a GdaDataModel resulting from the SELECT statement,
	--   or NULL if an error occurred.
	--
	--   This function is just a convenience function around the
	--   gda_connection_statement_execute() function.
	--
	--   See the documentation of the gda_connection_statement_execute() for
	--   information about the params list of parameters.
	--
	--   cnc :         a GdaConnection object.
	--   stmt :        a GdaStatement object.
	--   params :      a GdaSet object (which can be obtained using
	--                 gda_statement_get_parameters()), or NULL
	--   model_usage : specifies how the returned data model will be used as a
	--                 GdaStatementModelUsage enum
	--   error :       a place to store an error, or NULL
	--   ... :         a (-1 terminated) list of (column number, GType) specifying
	--                 for each column mentionned the GType of the column in the
	--                 returned GdaDataModel.
	--   Returns :     a GdaDataModel containing the data returned by the data
	--                 source, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_statement_execute_non_select ()
	--
	-- gint                gda_connection_statement_execute_non_select
	--                                                         (GdaConnection *cnc,
	--                                                          GdaStatement *stmt,
	--                                                          GdaSet *params,
	--                                                          GdaSet **last_insert_row,
	--                                                          GError **error);
	--
	--   Executes a non-selection statement on the given connection. The
	--   gda_execute_non_select_command() method can be easier to use if one
	--   prefers to use some SQL directly.
	--
	--   This function returns the number of rows affected by the execution of
	--   stmt, or -1 if an error occurred, or -2 if the connection's provider does
	--   not return the number of rows affected.
	--
	--   This function is just a convenience function around the
	--   gda_connection_statement_execute() function. See the documentation of the
	--   gda_connection_statement_execute() for information about the params list
	--   of parameters.
	--
	--   See gda_connection_statement_execute() form more information about
	--   last_insert_row.
	--
	--   cnc :             a GdaConnection object.
	--   stmt :            a GdaStatement object.
	--   params :          a GdaSet object (which can be obtained using
	--                     gda_statement_get_parameters()), or NULL
	--   last_insert_row : a place to store a new GdaSet object which contains the
	--                     values of the last inserted row, or NULL
	--   error :           a place to store an error, or NULL
	--   Returns :         the number of rows affected (>=0) or -1 or -2
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_batch_execute ()
	--
	-- GSList*             gda_connection_batch_execute        (GdaConnection *cnc,
	--                                                          GdaBatch *batch,
	--                                                          GdaSet *params,
	--                                                          GdaStatementModelUsage model_usage,
	--                                                          GError **error);
	--
	--   Executes all the statements contained in batch (in the order in which they
	--   were added to batch), and returns a list of GObject objects, at most one
	--   GObject for each statement; see gda_connection_statement_execute() for
	--   details about the returned objects.
	--
	--   If one of the statement fails, then none of the subsequent statement will
	--   be executed, and the method returns the list of GObject created by the
	--   correct execution of the previous statements. If a transaction is
	--   required, then it should be started before calling this method.
	--
	--   cnc :         a GdaConnection object
	--   batch :       a GdaBatch object which contains all the statements to
	--                 execute
	--   params :      a GdaSet object (which can be obtained using
	--                 gda_batch_get_parameters()), or NULL
	--   model_usage : specifies how the returned data model(s) will be used, as a
	--                 GdaStatementModelUsage enum
	--   error :       a place to store errors, or NULL
	--   Returns :     a list of GObject objects
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_begin_transaction ()
	--
	-- gboolean            gda_connection_begin_transaction    (GdaConnection *cnc,
	--                                                          const gchar *name,
	--                                                          GdaTransactionIsolation level,
	--                                                          GError **error);
	--
	--   Starts a transaction on the data source, identified by the name parameter.
	--
	--   Before starting a transaction, you can check whether the underlying
	--   provider does support transactions or not by using the
	--   gda_connection_supports_feature() function.
	--
	--   cnc :     a GdaConnection object.
	--   name :    the name of the transation to start, or NULL
	--   level :
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if the transaction was started successfully, FALSE
	--             otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_commit_transaction ()
	--
	-- gboolean            gda_connection_commit_transaction   (GdaConnection *cnc,
	--                                                          const gchar *name,
	--                                                          GError **error);
	--
	--   Commits the given transaction to the backend database. You need to call
	--   gda_connection_begin_transaction() first.
	--
	--   cnc :     a GdaConnection object.
	--   name :    the name of the transation to commit, or NULL
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if the transaction was finished successfully, FALSE
	--             otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_rollback_transaction ()
	--
	-- gboolean            gda_connection_rollback_transaction (GdaConnection *cnc,
	--                                                          const gchar *name,
	--                                                          GError **error);
	--
	--   Rollbacks the given transaction. This means that all changes made to the
	--   underlying data source since the last call to
	--   #gda_connection_begin_transaction() or
	--   #gda_connection_commit_transaction() will be discarded.
	--
	--   cnc :     a GdaConnection object.
	--   name :    the name of the transation to commit, or NULL
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if the operation was successful, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_add_savepoint ()
	--
	-- gboolean            gda_connection_add_savepoint        (GdaConnection *cnc,
	--                                                          const gchar *name,
	--                                                          GError **error);
	--
	--   Adds a SAVEPOINT named name.
	--
	--   cnc :     a GdaConnection object
	--   name :    name of the savepoint to add
	--   error :   a place to store errors or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_rollback_savepoint ()
	--
	-- gboolean            gda_connection_rollback_savepoint   (GdaConnection *cnc,
	--                                                          const gchar *name,
	--                                                          GError **error);
	--
	--   Rollback all the modifications made after the SAVEPOINT named name.
	--
	--   cnc :     a GdaConnection object
	--   name :    name of the savepoint to rollback to
	--   error :   a place to store errors or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_delete_savepoint ()
	--
	-- gboolean            gda_connection_delete_savepoint     (GdaConnection *cnc,
	--                                                          const gchar *name,
	--                                                          GError **error);
	--
	--   Delete the SAVEPOINT named name when not used anymore.
	--
	--   cnc :     a GdaConnection object
	--   name :    name of the savepoint to delete
	--   error :   a place to store errors or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_transaction_status ()
	--
	-- GdaTransactionStatus* gda_connection_get_transaction_status
	--                                                         (GdaConnection *cnc);
	--
	--   Get the status of cnc regarding transactions. The returned object should
	--   not be modified or destroyed; however it may be modified or destroyed by
	--   the connection itself.
	--
	--   If NULL is returned, then no transaction has been associated with cnc
	--
	--   cnc :     a GdaConnection object
	--   Returns : a GdaTransactionStatus object, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_options ()
	--
	-- GdaConnectionOptions gda_connection_get_options         (GdaConnection *cnc);
	--
	--   Gets the GdaConnectionOptions used to open this connection.
	--
	--   cnc :     a GdaConnection object.
	--   Returns : the connection options.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_provider_obj ()
	--
	-- GdaServerProvider*  gda_connection_get_provider_obj     (GdaConnection *cnc);
	--
	--   Get a pointer to the GdaServerProvider object used to access the database
	--
	--   cnc :     a GdaConnection object
	--   Returns : the GdaServerProvider (NEVER NULL)
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_provider_name ()
	--
	-- const gchar*        gda_connection_get_provider_name    (GdaConnection *cnc);
	--
	--   Get the name (identifier) of the database provider used by cnc
	--
	--   cnc :     a GdaConnection object
	--   Returns : a non modifiable string
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_set_dsn ()
	--
	-- gboolean            gda_connection_set_dsn              (GdaConnection *cnc,
	--                                                          const gchar *datasource);
	--
	--   Sets the data source of the connection. If the connection is already
	--   opened, then no action is performed at all and FALSE is returned.
	--
	--   If the requested datasource does not exist, then nothing is done and FALSE
	--   is returned.
	--
	--   cnc :        a GdaConnection object
	--   datasource : a gda datasource
	--   Returns :    TRUE on success
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_dsn ()
	--
	-- const gchar*        gda_connection_get_dsn              (GdaConnection *cnc);
	--
	--   cnc :     a GdaConnection object
	--   Returns : the data source name the connection object is connected to.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_cnc_string ()
	--
	-- const gchar*        gda_connection_get_cnc_string       (GdaConnection *cnc);
	--
	--   Gets the connection string used to open this connection.
	--
	--   The connection string is the string sent over to the underlying database
	--   provider, which describes the parameters to be used to open a connection
	--   on the underlying data source.
	--
	--   cnc :     a GdaConnection object.
	--   Returns : the connection string used when opening the connection.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_add_event ()
	--
	-- void                gda_connection_add_event            (GdaConnection *cnc,
	--                                                          GdaConnectionEvent *event);
	--
	--   Adds an event to the given connection. This function is usually called by
	--   providers, to inform clients of events that happened during some
	--   operation.
	--
	--   As soon as a provider (or a client, it does not matter) calls this
	--   function with an event object which is an error, the connection object
	--   emits the "error" signal, to which clients can connect to be informed of
	--   events.
	--
	--   WARNING: the reference to the event object is stolen by this function!
	--
	--   cnc :   a GdaConnection object.
	--   event : is stored internally, so you don't need to unref it.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_add_event_string ()
	--
	-- GdaConnectionEvent* gda_connection_add_event_string     (GdaConnection *cnc,
	--                                                          const gchar *str,
	--                                                          ...);
	--
	--   Adds a new error to the given connection object. This is just a
	--   convenience function that simply creates a GdaConnectionEvent and then
	--   calls gda_server_connection_add_error.
	--
	--   cnc :     a GdaConnection object.
	--   str :     a format string (see the printf(3) documentation).
	--   ... :     the arguments to insert in the error message.
	--   Returns : a new GdaConnectionEvent object, however the caller does not
	--             hold a reference to the returned object, and if need be the
	--             caller must call g_object_ref() on it.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_add_events_list ()
	--
	-- void                gda_connection_add_events_list      (GdaConnection *cnc,
	--                                                          GList *events_list);
	--
	--   This is just another convenience function which lets you add a list of
	--   GdaConnectionEvent's to the given connection.* As with
	--   gda_connection_add_event and gda_connection_add_event_string, this
	--   function makes the connection object emit the "error" signal for each
	--   error event.
	--
	--   events_list is copied to an internal list and freed.
	--
	--   cnc :         a GdaConnection object.
	--   events_list : a list of GdaConnectionEvent.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_events ()
	--
	-- const GList*        gda_connection_get_events           (GdaConnection *cnc);
	--
	--   Retrieves a list of the last errors occurred during the connection. The
	--   returned list is chronologically ordered such as that the most recent
	--   event is the GdaConnectionEvent of the first node.
	--
	--   Warning: the cnc object may change the list if connection events occur
	--
	--   cnc :     a GdaConnection.
	--   Returns : a GList of GdaConnectionEvent objects (the list should not be
	--             modified)
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_clear_events_list ()
	--
	-- void                gda_connection_clear_events_list    (GdaConnection *cnc);
	--
	--   This function lets you clear the list of GdaConnectionEvent's of the given
	--   connection.
	--
	--   cnc : a GdaConnection object.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_create_operation ()
	--
	-- GdaServerOperation* gda_connection_create_operation     (GdaConnection *cnc,
	--                                                          GdaServerOperationType type,
	--                                                          GdaSet *options,
	--                                                          GError **error);
	--
	--   Creates a new GdaServerOperation object which can be modified in order to
	--   perform the type type of action. It is a wrapper around the
	--   gda_server_provider_create_operation() method.
	--
	--   cnc :     a GdaConnection object
	--   type :    the type of operation requested
	--   options : an optional list of parameters
	--   error :   a place to store an error, or NULL
	--   Returns : a new GdaServerOperation object, or NULL in the connection's
	--             provider does not support the type type of operation or if an
	--             error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_perform_operation ()
	--
	-- gboolean            gda_connection_perform_operation    (GdaConnection *cnc,
	--                                                          GdaServerOperation *op,
	--                                                          GError **error);
	--
	--   Performs the operation described by op (which should have been created
	--   using gda_connection_create_operation()). It is a wrapper around the
	--   gda_server_provider_perform_operation() method.
	--
	--   cnc :     a GdaConnection object
	--   op :      a GdaServerOperation object
	--   error :   a place to store an error, or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GdaConnectionFeature
	--
	-- typedef enum {
	--         GDA_CONNECTION_FEATURE_AGGREGATES,
	--         GDA_CONNECTION_FEATURE_BLOBS,
	--         GDA_CONNECTION_FEATURE_INDEXES,
	--         GDA_CONNECTION_FEATURE_INHERITANCE,
	--         GDA_CONNECTION_FEATURE_NAMESPACES,
	--         GDA_CONNECTION_FEATURE_PROCEDURES,
	--         GDA_CONNECTION_FEATURE_SEQUENCES,
	--         GDA_CONNECTION_FEATURE_SQL,
	--         GDA_CONNECTION_FEATURE_TRANSACTIONS,
	--         GDA_CONNECTION_FEATURE_SAVEPOINTS,
	--         GDA_CONNECTION_FEATURE_SAVEPOINTS_REMOVE,
	--         GDA_CONNECTION_FEATURE_TRIGGERS,
	--         GDA_CONNECTION_FEATURE_UPDATABLE_CURSOR,
	--         GDA_CONNECTION_FEATURE_USERS,
	--         GDA_CONNECTION_FEATURE_VIEWS,
	--         GDA_CONNECTION_FEATURE_XA_TRANSACTIONS,
	--
	--         GDA_CONNECTION_FEATURE_LAST
	-- } GdaConnectionFeature;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_supports_feature ()
	--
	-- gboolean            gda_connection_supports_feature     (GdaConnection *cnc,
	--                                                          GdaConnectionFeature feature);
	--
	--   Asks the underlying provider for if a specific feature is supported.
	--
	--   cnc :     a GdaConnection object.
	--   feature : feature to ask for.
	--   Returns : TRUE if the provider supports it, FALSE if not.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_meta_store ()
	--
	-- GdaMetaStore*       gda_connection_get_meta_store       (GdaConnection *cnc);
	--
	--   Get or initializes the GdaMetaStore associated to cnc
	--
	--   cnc :     a GdaConnection object
	--   Returns : a GdaMetaStore object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_update_meta_store ()
	--
	-- gboolean            gda_connection_update_meta_store    (GdaConnection *cnc,
	--                                                          GdaMetaContext *context,
	--                                                          GError **error);
	--
	--   Updates cnc's associated GdaMetaStore. If context is not NULL, then only
	--   the parts described by context will be updated, and if it is NULL, then
	--   the complete meta store will be updated.
	--
	--   cnc :     a GdaConnection object.
	--   context : description of which part of cnc's associated GdaMetaStore
	--             should be updated, or NULL
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GdaConnectionMetaType
	--
	-- typedef enum {
	--         GDA_CONNECTION_META_NAMESPACES,
	--         GDA_CONNECTION_META_TYPES,
	--         GDA_CONNECTION_META_TABLES,
	--         GDA_CONNECTION_META_VIEWS,
	--         GDA_CONNECTION_META_FIELDS
	-- } GdaConnectionMetaType;
	--
	--   GDA_CONNECTION_META_NAMESPACES lists the namespaces (or schemas for
	--                                  PostgreSQL)
	--   GDA_CONNECTION_META_TYPES
	--   GDA_CONNECTION_META_TABLES     lists the tables
	--   GDA_CONNECTION_META_VIEWS
	--   GDA_CONNECTION_META_FIELDS
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_get_meta_store_data ()
	--
	-- GdaDataModel*       gda_connection_get_meta_store_data  (GdaConnection *cnc,
	--                                                          GdaConnectionMetaType meta_type,
	--                                                          GError **error,
	--                                                          gint nb_filters,
	--                                                          ...);
	--
	--   Retreives data stored in cnc's associated GdaMetaStore object. This method
	--   is usefull to easily get some information about the meta-data associated
	--   to cnc, such as the list of tables, views, and other database objects.
	--
	--   Note: it's up to the caller to make sure the information contained within
	--   cnc's associated GdaMetaStore is up to date using
	--   gda_connection_update_meta_store() (it can become outdated if the
	--   database's schema is accessed from outside of Libgda).
	--
	--   For more information about the returned data model's attributes, or about
	--   the meta_type and @... filter arguments, see this description.
	--
	--   cnc :        a GdaConnection object.
	--   meta_type :  describes which data to get.
	--   error :      a place to store errors, or NULL
	--   nb_filters : the number of filters in the @... argument
	--   ... :        a list of (filter name (gchar *), filter value (GValue*))
	--                pairs specifying the filter to apply to the returned data
	--                model's contents (there must be nb_filters pairs)
	--   Returns :    a GdaDataModel containing the data required. The caller is
	--                responsible for freeing the returned model using
	--                g_object_unref().
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_value_to_sql_string ()
	--
	-- gchar*              gda_connection_value_to_sql_string  (GdaConnection *cnc,
	--                                                          GValue *from);
	--
	--   Produces a fully quoted and escaped string from a GValue
	--
	--   cnc :     a GdaConnection object.
	--   from :    GValue to convert from
	--   Returns : escaped and quoted value or NULL if not supported.
	--
	--Property Details
	--
	--  The "auth-string" property
	--
	--   "auth-string"              gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "cnc-string" property
	--
	--   "cnc-string"               gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "dsn" property
	--
	--   "dsn"                      gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "meta-store" property
	--
	--   "meta-store"               GdaMetaStore*         : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "options" property
	--
	--   "options"                  GdaConnectionOptions  : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "provider-obj" property
	--
	--   "provider-obj"             GdaServerProvider*    : Read / Write
	--
	--Signal Details
	--
	--  The "conn-closed" signal
	--
	-- void                user_function                      (GdaConnection *gdaconnection,
	--                                                         gpointer       user_data)          : Run Last
	--
	--   gdaconnection : the object which received the signal.
	--   user_data :     user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "conn-opened" signal
	--
	-- void                user_function                      (GdaConnection *gdaconnection,
	--                                                         gpointer       user_data)          : Run First
	--
	--   gdaconnection : the object which received the signal.
	--   user_data :     user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "conn-to-close" signal
	--
	-- void                user_function                      (GdaConnection *gdaconnection,
	--                                                         gpointer       user_data)          : Run First
	--
	--   gdaconnection : the object which received the signal.
	--   user_data :     user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "dsn-changed" signal
	--
	-- void                user_function                      (GdaConnection *gdaconnection,
	--                                                         gpointer       user_data)          : Run Last
	--
	--   gdaconnection : the object which received the signal.
	--   user_data :     user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "error" signal
	--
	-- void                user_function                      (GdaConnection      *gdaconnection,
	--                                                         GdaConnectionEvent *arg1,
	--                                                         gpointer            user_data)          : Run Last
	--
	--   gdaconnection : the object which received the signal.
	--   arg1 :
	--   user_data :     user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "transaction-status-changed" signal
	--
	-- void                user_function                      (GdaConnection *gdaconnection,
	--                                                         gpointer       user_data)          : Run Last
	--
	--   gdaconnection : the object which received the signal.
	--   user_data :     user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--   Generated by GTK-Doc V1.10
      end
end -- class GDA_CONNECTION
