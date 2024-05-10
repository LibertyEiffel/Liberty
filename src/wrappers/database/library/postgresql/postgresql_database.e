note
	description: "."
	copyright: "(C) 2006 Paolo Redaelli, Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date: $"
	revision: "$Revision: $"
	
deferred class POSTGRESQL_DATABASE
	-- Eiffel interface to PostgreSQL is based on libpq, the C
	-- application programmer's interface to PostgreSQL. libpq is a set
	-- of library functions that allow client programs to pass queries
	-- to the PostgreSQL backend server and to receive the results of
	-- these queries.

inherit
	DATABASE
		undefine
			copy,
			is_equal
		end
	C_STRUCT
		undefine
			copy,
			is_equal
		end
	
insert LIBPQ_FE_EXTERNALS

-- create {ANY}  connect

feature {} -- size
	dispose
			-- cleanup
		do
			if is_connected then
				close
			end
		end

feature {ANY} 
	is_connected: BOOLEAN
			-- TODO: Dummy implementation
		do
			Result := handle.is_not_null
		end

feature {ANY} -- Creation
	connect (some_connection_informations: STRING)
			-- Makes a new connection to the database server.
		
			-- This function opens a new database connection using the
			-- parameters taken from the string conninfo. Unlike
			-- `login' below, the parameter set can be extended
			-- without changing the function signature, so use of this
			-- function (or its nonblocking analogues PQconnectStart and
			-- PQconnectPoll) is preferred for new application
			-- programming.
		
			-- The passed string can be empty to use all default
			-- parameters, or it can contain one or more parameter
			-- settings separated by whitespace. Each parameter setting
			-- is in the form keyword = value.  Spaces around the equal
			-- sign are optional. To write an empty value or a value
			-- containing spaces, surround it with single quotes, e.g.,
			-- keyword = 'a value'. Single quotes and backslashes within
			-- the value must be escaped with a backslash, i.e., \' and
			-- \\.

			-- The currently recognized parameter key words are:

			-- `host': Name of host to connect to. If this begins with a
			-- slash, it specifies Unix-domain communication rather than
			-- TCP/IP communication; the value is the name of the
			-- directory in which the socket file is stored. The default
			-- behavior when host is not specified is to connect to a
			-- Unix-domain socket in /tmp (or whatever socket directory
			-- was specified when PostgreSQL was built). On machines
			-- without Unix-domain sockets, the default is to connect to
			-- localhost.

			-- `hostaddr': Numeric IP address of host to connect to. This
			-- should be in the standard IPv4 address format, e.g.,
			-- 172.28.40.9. If your machine supports IPv6, you can also
			-- use those addresses. TCP/IP communication is always used
			-- when a nonempty string is specified for this parameter.

			-- Using hostaddr instead of host allows the application to
			-- avoid a host name look-up, which may be important in
			-- applications with time constraints. However, Kerberos
			-- authentication requires the host name. The following
			-- therefore applies: If host is specified without hostaddr,
			-- a host name lookup occurs. If hostaddr is specified
			-- without host, the value for hostaddr gives the remote
			-- address. When Kerberos is used, a reverse name query
			-- occurs to obtain the host name for Kerberos. If both host
			-- and hostaddr are specified, the value for hostaddr gives
			-- the remote address; the value for host is ignored, unless
			-- Kerberos is used, in which case that value is used for
			-- Kerberos authentication. (Note that authentication is
			-- likely to fail if libpq is passed a host name that is not
			-- the name of the machine at hostaddr.) Also, host rather
			-- than hostaddr is used to identify the connection in
			-- ~/.pgpass (see Section 27.12).

			-- Without either a host name or host address, libpq will
			-- connect using a local Unix-domain socket; or on machines
			-- without Unix-domain sockets, it will attempt to connect to
			-- localhost.

			-- `port': Port number to connect to at the server host, or
			-- socket file name extension for Unix-domain connections.

			-- `dbname': The database name. Defaults to be the same as
			-- the user name.

			-- `user': PostgreSQL user name to connect as. Defaults to be
			-- the same as the operating system name of the user running
			-- the application.

			-- `password': Password to be used if the server demands
			-- password authentication.

			-- `connect_timeout': Maximum wait for connection, in seconds
			-- (write as a decimal integer string). Zero or not specified
			-- means wait indefinitely. It is not recommended to use a
			-- timeout of less than 2 seconds.

			-- `options': Command-line options to be sent to the server.

			-- `tty': Ignored (formerly, this specified where to send
			-- server debug output).

			-- `sslmode': This option determines whether or with what
			-- priority an SSL connection will be negotiated with the
			-- server.  There are four modes: disable will attempt only
			-- an unencrypted SSL connection; allow will negotiate,
			-- trying first a non-SSL connection, then if that fails,
			-- trying an SSL connection; prefer (the default) will
			-- negotiate, trying first an SSL connection, then if that
			-- fails, trying a regular non-SSL connection; require will
			-- try only an SSL connection.
		
			-- If PostgreSQL is compiled without SSL support, using
			-- option require will cause an error, while options allow
			-- and prefer will be accepted but libpq will not in fact
			-- attempt an SSL connection.
		
			-- `requiressl': This option is deprecated in favor of the
			-- sslmode setting.

			-- If set to 1, an SSL connection to the server is required
			-- (this is equivalent to sslmode require).  libpq will then
			-- refuse to connect if the server does not accept an SSL
			-- connection. If set to 0 (default), libpq will negotiate
			-- the connection type with the server (equivalent to sslmode
			-- prefer). This option is only available if PostgreSQL is
			-- compiled with SSL support.

			-- `service': Service name to use for additional
			-- parameters. It specifies a service name in pg3C_service.conf
			-- that holds additional connection parameters. This allows
			-- applications to specify only a service name so connection
			-- parameters can be centrally maintained.  See
			-- share/pg_service.conf.sample in the installation directory
			-- for information on how to set up the file.

			-- If any parameter is unspecified, then the corresponding
			-- environment variable (see Section 27.11) is checked. If
			-- the environment variable is not set either, then the
			-- indicated built-in defaults are used.
		do
			check
				info_not_void: some_connection_informations /= Void	
			end
			handle:= pqconnectdb (some_connection_informations.to_external)
		end
	
	-- TODO: PQsetdbLogin Makes a new connection to the database
	-- server. -- PGconn *PQsetdbLogin(const char *pghost, const char
	-- *pgport, const char *pgoptions, const char *pgtty, const char
	-- *dbName, const char *login, const char *pwd);

	-- This is the predecessor of PQconnectdb with a fixed set of
	-- parameters. It has the same functionality except that the
	-- missing parameters will always take on default values. Write
	-- NULL or an empty string for any one of the fixed parameters that
	-- is to be defaulted.

	-- TODO: PQsetdb Makes a new connection to the database server.
	-- PGconn *PQsetdb(char *pghost, char *pgport, char *pgoptions,
	-- char *pgtty, char *dbName);

	-- This is a macro that calls PQsetdbLogin with null pointers for
	-- the login and pwd parameters. It is provided for backward
	-- compatibility with very old programs.

	--    PQconnectStart
	--    PQconnectPoll

	--            Make a connection to the database server in a nonblocking manner.
	
	--  PGconn *PQconnectStart(const char *conninfo);
	
	--  PostgresPollingStatusType PQconnectPoll(PGconn *conn);
	
	-- These two functions are used to open a connection to a database
	-- server such that your application's thread of execution is not
	-- blocked on remote I/O whilst doing so. The point of this
	-- approach is that the waits for I/O to complete can occur in the
	-- application's main loop, rather than down inside PQconnectdb,
	-- and so the application can manage this operation in parallel
	-- with other activities.

	-- The database connection is made using the parameters taken from
	-- the string conninfo, passed to PQconnectStart. This string is in
	-- the same format as described above for PQconnectdb.
	
	-- Neither PQconnectStart nor PQconnectPoll will block, so long as
	-- a number of restrictions are met:
	
	-- * The hostaddr and host parameters are used appropriately to
	--   ensure that name and reverse name queries are not made. See
	--   the documentation of these parameters under PQconnectdb above
	--   for details.

	--               * If you call PQtrace, ensure that the stream object into which
	--                 you trace will not block.
	
	--               * You ensure that the socket is in the appropriate state before
	--                 calling PQconnectPoll, as described below.
	
	--            To begin a nonblocking connection request, call conn =
	--            PQconnectStart("connection_info_string"). If conn is null, then
	--            libpq has been unable to allocate a new PGconn structure.
	--            Otherwise, a valid PGconn pointer is returned (though not yet
	--            representing a valid connection to the database). On return from
	--            PQconnectStart, call status = PQstatus(conn). If status equals
	--            CONNECTION_BAD, PQconnectStart has failed.
	
	--            If PQconnectStart succeeds, the next stage is to poll libpq so
	--            that it may proceed with the connection sequence. Use
	--            PQsocket(conn) to obtain the descriptor of the socket underlying
	--            the database connection. Loop thus: If PQconnectPoll(conn) last
	--            returned PGRES_POLLING_READING, wait until the socket is ready to
	--            read (as indicated by select(), poll(), or similar system
	--            function). Then call PQconnectPoll(conn) again. Conversely, if
	--            PQconnectPoll(conn) last returned PGRES_POLLING_WRITING, wait
	--            until the socket is ready to write, then call PQconnectPoll(conn)
	--            again. If you have yet to call PQconnectPoll, i.e., just after the
	--            call to PQconnectStart, behave as if it last returned
	--            PGRES_POLLING_WRITING. Continue this loop until
	--            PQconnectPoll(conn) returns PGRES_POLLING_FAILED, indicating the
	--            connection procedure has failed, or PGRES_POLLING_OK, indicating
	--            the connection has been successfully made.
	
	--            At any time during connection, the status of the connection may be
	--            checked by calling PQstatus. If this gives CONNECTION_BAD, then
	--            the connection procedure has failed; if it gives CONNECTION_OK,
	--            then the connection is ready. Both of these states are equally
	--            detectable from the return value of PQconnectPoll, described
	--            above. Other states may also occur during (and only during) an
	--            asynchronous connection procedure. These indicate the current
	--            stage of the connection procedure and may be useful to provide
	--            feedback to the user for example. These statuses are:
	
	--                 CONNECTION_STARTED
	
	--                         Waiting for connection to be made.
	
	--                 CONNECTION_MADE
	
	--                         Connection OK; waiting to send.
	
	--                 CONNECTION_AWAITING_RESPONSE
	
	--                         Waiting for a response from the server.
	
	--                 CONNECTION_AUTH_OK
	
	--                         Received authentication; waiting for backend start-up
	--                         to finish.
	
	--                 CONNECTION_SSL_STARTUP
	
	--                         Negotiating SSL encryption.
	
	--                 CONNECTION_SETENV
	
	--                         Negotiating environment-driven parameter settings.
	
	--            Note that, although these constants will remain (in order to
	--            maintain compatibility), an application should never rely upon
	--            these occurring in a particular order, or at all, or on the status
	--            always being one of these documented values. An application might
	--            do something like this:
	
	--  switch(PQstatus(conn))
	--  {
	--      case CONNECTION_STARTED:
	--          feedback = "Connecting...";
	--          break;
	
	--      case CONNECTION_MADE:
	--          feedback = "Connected to server...";
	--          break;
	--  .
	--  .
	--  .
	--      default:
	--          feedback = "Connecting...";
	--  }
	
	--            The connect_timeout connection parameter is ignored when using
	--            PQconnectPoll; it is the application's responsibility to decide
	--            whether an excessive amount of time has elapsed. Otherwise,
	--            PQconnectStart followed by a PQconnectPoll loop is equivalent to
	--            PQconnectdb.
	
	--            Note that if PQconnectStart returns a non-null pointer, you must
	--            call PQfinish when you are finished with it, in order to dispose
	--            of the structure and any associated memory blocks. This must be
--            done even if the connection attempt fails or is abandoned.
	
	--    PQconndefaults
	
	--            Returns the default connection options.
	
	--  PQconninfoOption *PQconndefaults(void);
	
	--  typedef struct
	--  {
	--      char   *keyword;   /* The keyword of the option */
	--      char   *envvar;    /* Fallback environment variable name */
	--      char   *compiled;  /* Fallback compiled in default value */
	--      char   *val;       /* Option's current value, or NULL */
	--      char   *label;     /* Label for field in connect dialog */
	--      char   *dispchar;  /* Character to display for this field
	--                            in a connect dialog. Values are:
	--                            ""        Display entered value as is
	--                            "*"       Password field - hide value
	--                            "D"       Debug option - don't show by default */
	--      int     dispsize;  /* Field size in characters for dialog */
	--  } PQconninfoOption;
	
	--            Returns a connection options array. This may be used to determine
	--            all possible PQconnectdb options and their current default values.
	--            The return value points to an array of PQconninfoOption
	--            structures, which ends with an entry having a null keyword
	--            pointer. Note that the current default values (val fields) will
	--            depend on environment variables and other context. Callers must
	--            treat the connection options data as read-only.
	
	--            After processing the options array, free it by passing it to
	--            PQconninfoFree. If this is not done, a small amount of memory is
	--            leaked for each call to PQconndefaults.
	
	--    PQfinish
	
	close
			-- Closes the connection to the server. 
		do
			pqfinish (handle)
      handle := default_pointer
		end

	reset
			-- Resets the communication channel to the server.  It closes
			-- the connection to the server and attempt to reestablish a
			-- new connection to the same server, using all the same
			-- parameters previously used. This may be useful for error
			-- recovery if a working connection is lost.
		do
			pqreset(handle)
		end


--    PQresetStart
--    PQresetPoll

--            Reset the communication channel to the server, in a nonblocking
--            manner.

--  int PQresetStart(PGconn *conn);

--  PostgresPollingStatusType PQresetPoll(PGconn *conn);

--            These functions will close the connection to the server and
--            attempt to reestablish a new connection to the same server, using
--            all the same parameters previously used. This may be useful for
--            error recovery if a working connection is lost. They differ from
--            PQreset (above) in that they act in a nonblocking manner. These
--            functions suffer from the same restrictions as PQconnectStart and
--            PQconnectPoll.

--            To initiate a connection reset, call PQresetStart. If it returns
--            0, the reset has failed. If it returns 1, poll the reset using
--            PQresetPoll in exactly the same way as you would create the
--            connection using PQconnectPoll.

--    --------------------------------------------------------------------------

feature {ANY} 
	prepare_command (some_sql: STRING): PREPARED_COMMAND
		do
		end

	prepare_query (some_sql: STRING): PREPARED_QUERY
		do
		end

	execute (some_sql: STRING)
		do
			not_yet_implemented
		end

	result_set: RESULT_SET [RESULT_ROW]
		do
			not_yet_implemented
		end

feature {ANY} -- Connection Status 
	-- These functions may be used to interrogate the status of an
	-- existing database connection object.

	-- Tip: libpq application programmers should be careful to maintain
	-- the PGconn abstraction. Use the accessor functions described
	-- below to get at the contents of PGconn. Reference to internal
	-- PGconn fields using libpq-int.h is not recommended because they
	-- are subject to change in the future.

	-- The following functions return parameter values established at connection. These values are fixed for the life of the PGconn object.

	-- PQdb

	--     Returns the database name of the connection.

	--     char *PQdb(const PGconn *conn);

	-- PQuser

	--     Returns the user name of the connection.

	--     char *PQuser(const PGconn *conn);

	-- PQpass

	--     Returns the password of the connection.

	--     char *PQpass(const PGconn *conn);

	-- PQhost

	--     Returns the server host name of the connection.

	--     char *PQhost(const PGconn *conn);

	-- PQport

	--     Returns the port of the connection.

	--     char *PQport(const PGconn *conn);

	-- PQtty

	--     Returns the debug TTY of the connection. (This is obsolete, since the server no longer pays attention to the TTY setting, but the function remains for backwards compatibility.)

	--     char *PQtty(const PGconn *conn);

	-- PQoptions

	--     Returns the command-line options passed in the connection request.

	--     char *PQoptions(const PGconn *conn);

	-- The following functions return status data that can change as operations are executed on the PGconn object.

	-- PQstatus

	--     Returns the status of the connection.

	--     ConnStatusType PQstatus(const PGconn *conn);

	--     The status can be one of a number of values. However, only two of these are seen outside of an asynchronous connection procedure: CONNECTION_OK and CONNECTION_BAD. A good connection to the database has the status CONNECTION_OK. A failed connection attempt is signaled by status CONNECTION_BAD. Ordinarily, an OK status will remain so until PQfinish, but a communications failure might result in the status changing to CONNECTION_BAD prematurely. In that case the application could try to recover by calling PQreset.

	--     See the entry for PQconnectStart and PQconnectPoll with regards to other status codes that might be seen. 
	-- PQtransactionStatus

	--     Returns the current in-transaction status of the server.

	--     PGTransactionStatusType PQtransactionStatus(const PGconn *conn);

	--     The status can be PQTRANS_IDLE (currently idle), PQTRANS_ACTIVE (a command is in progress), PQTRANS_INTRANS (idle, in a valid transaction block), or PQTRANS_INERROR (idle, in a failed transaction block). PQTRANS_UNKNOWN is reported if the connection is bad. PQTRANS_ACTIVE is reported only when a query has been sent to the server and not yet completed.

	--     Caution

	--     PQtransactionStatus will give incorrect results when using a PostgreSQL 7.3 server that has the parameter autocommit set to off. The server-side autocommit feature has been deprecated and does not exist in later server versions.
	-- PQparameterStatus

	--     Looks up a current parameter setting of the server.

	--     const char *PQparameterStatus(const PGconn *conn, const char *paramName);

	--     Certain parameter values are reported by the server automatically at connection startup or whenever their values change. PQparameterStatus can be used to interrogate these settings. It returns the current value of a parameter if known, or NULL if the parameter is not known.

	--     Parameters reported as of the current release include server_version, server_encoding, client_encoding, is_superuser, session_authorization, DateStyle, TimeZone, integer_datetimes, and standard_conforming_strings. (server_encoding, TimeZone, and integer_datetimes were not reported by releases before 8.0; standard_conforming_strings was not reported by releases before 8.1.) Note that server_version, server_encoding and integer_datetimes cannot change after startup.

	--     Pre-3.0-protocol servers do not report parameter settings, but libpq includes logic to obtain values for server_version and client_encoding anyway. Applications are encouraged to use PQparameterStatus rather than ad hoc code to determine these values. (Beware however that on a pre-3.0 connection, changing client_encoding via SET after connection startup will not be reflected by PQparameterStatus.) For server_version, see also PQserverVersion, which returns the information in a numeric form that is much easier to compare against.

	--     If no value for standard_conforming_strings is reported, applications may assume it is off, that is, backslashes are treated as escapes in string literals. Also, the presence of this parameter may be taken as an indication that the escape string syntax (E'...') is accepted.

	--     Although the returned pointer is declared const, it in fact points to mutable storage associated with the PGconn structure. It is unwise to assume the pointer will remain valid across queries.
	-- PQprotocolVersion

	--     Interrogates the frontend/backend protocol being used.

	--     int PQprotocolVersion(const PGconn *conn);

	--     Applications may wish to use this to determine whether certain features are supported. Currently, the possible values are 2 (2.0 protocol), 3 (3.0 protocol), or zero (connection bad). This will not change after connection startup is complete, but it could theoretically change during a connection reset. The 3.0 protocol will normally be used when communicating with PostgreSQL 7.4 or later servers; pre-7.4 servers support only protocol 2.0. (Protocol 1.0 is obsolete and not supported by libpq.)
	-- PQserverVersion

	--     Returns an integer representing the backend version.

	--     int PQserverVersion(const PGconn *conn);

	--     Applications may use this to determine the version of the database server they are connected to. The number is formed by converting the major, minor, and revision numbers into two-decimal-digit numbers and appending them together. For example, version 8.1.5 will be returned as 80105, and version 8.2 will be returned as 80200 (leading zeroes are not shown). Zero is returned if the connection is bad.
	-- PQerrorMessage

	--     Returns the error message most recently generated by an operation on the connection.

	--     char *PQerrorMessage(const PGconn *conn);

	--     Nearly all libpq functions will set a message for PQerrorMessage if they fail. Note that by libpq convention, a nonempty PQerrorMessage result will include a trailing newline. The caller should not free the result directly. It will be freed when the associated PGconn handle is passed to PQfinish. The result string should not be expected to remain the same across operations on the PGconn structure. 
	-- PQsocket

	--     Obtains the file descriptor number of the connection socket to the server. A valid descriptor will be greater than or equal to 0; a result of -1 indicates that no server connection is currently open. (This will not change during normal operation, but could change during connection setup or reset.)

	--     int PQsocket(const PGconn *conn);

	-- PQbackendPID

	--     Returns the process ID (PID) of the backend server process handling this connection.

	--     int PQbackendPID(const PGconn *conn);

	--     The backend PID is useful for debugging purposes and for comparison to NOTIFY messages (which include the PID of the notifying backend process). Note that the PID belongs to a process executing on the database server host, not the local host! 
	-- PQgetssl

	--     Returns the SSL structure used in the connection, or null if SSL is not in use.

	--     SSL *PQgetssl(const PGconn *conn);

	--     This structure can be used to verify encryption levels, check server certificates, and more. Refer to the OpenSSL documentation for information about this structure.

	-- You must define USE_SSL in order to get the correct prototype
	-- for this function. Doing this will also automatically include
	-- ssl.h from OpenSSL.


end
