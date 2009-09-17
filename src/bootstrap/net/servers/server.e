deferred class SERVER[C_ -> CONNECTION]
	--
	-- A standard server. Abstracts out most of the nitty-gritty.
	--

feature {ANY}
	start (access: ACCESS) is
			-- Start a server at the given access point.
		do
			-- First create a job stack (see the Sequencer tutorial for details)
			create stack.make
			-- Set the stand-alone handler
			shutdown_handler := standalone_handler_agent
			-- Now start the server in stand-alone mode (in its own stack)
			if common_start(access) then
				stack.run
			end
		end

	start_in_stack (access: ACCESS; a_stack: like stack; a_shutdown_handler: like shutdown_handler): BOOLEAN is
			-- Start the server in the given stack. True if the server effectively started.
		do
			shutdown_handler := a_shutdown_handler
			stack := a_stack
			Result := common_start(access)
		end

	set_logger (a_logger: like logger) is
		do
			logger := a_logger
		end

	log (a_message: STRING) is
		do
			if logger /= Void then
				logger.call([a_message])
			end
		end

feature {}
	logger: PROCEDURE[TUPLE[STRING]]

feature {}
	standalone_handler_agent: like shutdown_handler is
		do
			Result := agent standalone_shutdown
		end

	common_start (access: ACCESS): BOOLEAN is
		local
			errors: SOCKET_ERRORS; serv: SOCKET_SERVER
		do
			-- Also create the socket server, listening at the given access point
			serv := access.server
			if serv = Void or else not serv.can_connect then
				-- There was a problem: display the error message and exit
				handle_error(errors.last_error)
			else
				create server.make(serv, access.read_sync)
				-- Some hook agents. Those hooks do all the real job! (look below)
				server.when_connect(agent handle_connect)
				server.when_shutdown(agent handle_shutdown)
				-- Add the server to the stack
				stack.add_job(server)
				-- ... and report success
				Result := True
			end
		end

feature {}
	handle_error (error_message: STRING) is
			-- What to do when there was an error
		deferred
		end

	new_connection: C_ is
			-- Create a new connection
		deferred
		end

feature {}
	stack: LOOP_STACK

	server: SOCKET_SERVER_JOB

	connections: INTEGER

	shutdown_handler: PROCEDURE[TUPLE[like Current]]

	handle_connect (a_io: SOCKET_INPUT_OUTPUT_STREAM) is
			-- Handle a connection to the server. This feature is called back by the server when a connection is
			-- attempted (see the `when_connect' feature of SOCKET_SERVER)
		local
			cnx: C_
		do
			cnx := new_connection
			cnx.set_io(a_io)
			stack.add_job(cnx)
			connections := connections + 1
		end

	handle_shutdown (a_server: like server) is
			-- Shutdown gracefully when all connections are closed. This feature is called back by the server
			-- when it is asked to shut down (see the `when_shutdown' feature of SOCKET_SERVER)
		require
			a_server = server
			server.will_shutdown
		do
			if connections = 0 and then shutdown_handler /= Void then
				shutdown_handler.call([Current])
			end
		end

	standalone_shutdown (a_server: like Current) is
		require
			a_server = Current
		do
			stack.break
		end

end -- class SERVER
