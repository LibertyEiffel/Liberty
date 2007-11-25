indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli, Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"	
	
class POSTGRESQL_DATABASE
--    libpq is the C application programmer's interface to PostgreSQL. libpq is
--    a set of library functions that allow client programs to pass queries to
--    the PostgreSQL backend server and to receive the results of these queries.

--    libpq is also the underlying engine for several other PostgreSQL
--    application interfaces, including those written for C++, Perl, Python, Tcl
--    and ECPG. So some aspects of libpq's behavior will be important to you if
--    you use one of those packages. In particular, Section 27.11, Section 27.12
--    and Section 27.13 describe behavior that is visible to the user of any
--    application that uses libpq.

--    Some short programs are included at the end of this chapter (Section
--    27.16) to show how to write programs that use libpq. There are also
--    several complete examples of libpq applications in the directory
--    src/test/examples in the source code distribution.

--    Client programs that use libpq must include the header file libpq-fe.h and
--    must link with the libpq library.

--                   27.1. Database Connection Control Functions

--    The following functions deal with making a connection to a PostgreSQL
--    backend server. An application program can have several backend
--    connections open at one time. (One reason to do that is to access more
--    than one database.) Each connection is represented by a PGconn object,
--    which is obtained from the function PQconnectdb or PQsetdbLogin. Note that
--    these functions will always return a non-null object pointer, unless
--    perhaps there is too little memory even to allocate the PGconn object. The
--    PQstatus function should be called to check whether a connection was
--    successfully made before queries are sent via the connection object.

inherit
	DATABASE
		undefine
			copy,
			is_equal
		end
	C_STRUCT
	
creation  connect

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PGconn)"
		end

feature 
	is_connected: BOOLEAN is
			-- TODO: Dummy implementation
		do
			Result := handle.is_not_null
		end

feature -- Creation
	connect (some_connection_informations: STRING) is
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
			-- parameters. It specifies a service name in pg_service.conf
			-- that holds additional connection parameters. This allows
			-- applications to specify only a service name so connection
			-- parameters can be centrally maintained.  See
			-- share/pg_service.conf.sample in the installation directory
			-- for information on how to set up the file.

			-- If any parameter is unspecified, then the corresponding
			-- environment variable (see Section 27.11) is checked. If
			-- the environment variable is not set either, then the
			-- indicated built-in defaults are used.
		require
			info_not_void: some_connection_informations/=Void
		do
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
	
	close is
			-- Closes the connection to the server. 
		do
			--			pqfinish (handle)
		end
--    PQreset

--            Resets the communication channel to the server.

--  void PQreset(PGconn *conn);

--            This function will close the connection to the server and attempt
--            to reestablish a new connection to the same server, using all the
--            same parameters previously used. This may be useful for error
--            recovery if a working connection is lost.

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

feature {} -- External calls
	
	pqconnectdb (a_conninfo: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}plugins"
			module_name: "postgresql"
			feature_name: "PQconnectdb"
			}"
		end
--  PGconn *PQsetdbLogin(const char *pghost,
--                       const char *pgport,
--                       const char *pgoptions,
--                       const char *pgtty,
--                       const char *dbName,
--                       const char *login,
--                       const char *pwd);

--  PGconn *PQconnectStart(const char *conninfo);

--  PostgresPollingStatusType PQconnectPoll(PGconn *conn);

feature {} -- PostgresPollingStatusType  enum
	--               CONNECTION_STARTED
	
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


--  void PQfinish(PGconn *conn);

--  void PQreset(PGconn *conn);

--  int PQresetStart(PGconn *conn);

--  PostgresPollingStatusType PQresetPoll(PGconn *conn);

end
