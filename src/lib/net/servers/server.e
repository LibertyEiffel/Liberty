-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class SERVER[C_ -> CONNECTION]
   --
   -- A standard server. Abstracts out most of the nitty-gritty.
   --

feature {ANY} -- Access

   start (a_access: ACCESS)
         -- Launch a `Current' using the given `a_access' point.
      do
         -- First create a job stack (see the Sequencer tutorial for details)
         create stack.make
         -- Set the stand-alone handler
         shutdown_handler := standalone_handler_agent
         -- Now start the server in stand-alone mode (in its own stack)
         if common_start(a_access) then
            stack.run
         end
      end

   start_in_stack (a_access: ACCESS; a_stack: like stack; a_shutdown_handler: like shutdown_handler): BOOLEAN
         -- Assing `a_shutdown_handler' as `shutdown_handler' and
         -- start `Current' using `a_access' in the given `a_stack'.
         -- True if `Current' effectively started.
         -- Note that is function is not pure (has side effects on `Current')
      do
         shutdown_handler := a_shutdown_handler
         stack := a_stack
         Result := common_start(a_access)
      ensure
         shutdown_handler = a_shutdown_handler
         stack = a_stack
      end

   set_logger (a_logger: like logger)
         -- Assign `logger' with the value of `a_logger'
      do
         logger := a_logger
      ensure
         logger = a_logger
      end

   log (a_message: ABSTRACT_STRING)
         -- Write `a_message' in the `logger', if any.
      do
         if logger /= Void then
            logger.call([a_message])
         end
      end

feature {} -- Implementation

   logger: PROCEDURE[TUPLE[ABSTRACT_STRING]]
         -- Used to log message

   standalone_handler_agent: like shutdown_handler
         -- An Agent to be use to launch `standalone_shutdown'
      do
         Result := agent standalone_shutdown
      end

   common_start (a_access: ACCESS): BOOLEAN
         -- Start `Current' using `a_access'.
      local
         l_errors: SOCKET_ERRORS;
         l_socket_server: SOCKET_SERVER
      do
         -- Also create the socket server, listening at the given a_access point
         l_socket_server := a_access.server
         if l_socket_server = Void or else not l_socket_server.can_connect then
            -- There was a problem: display the error message and exit
            handle_error(l_errors.last_error)
         else
            create server_job.make(l_socket_server, True)
            -- Some hook agents. Those hooks do all the real job! (look below)
            server_job.when_connect(agent handle_connect)
            server_job.when_shutdown(agent handle_shutdown)
            -- Add the server to the stack
            stack.add_job(server_job)
            -- ... and report success
            Result := True
         end
      end

   handle_error (a_error_message: STRING)
         -- What to do when there was an error with message `a_error_message'
      deferred
      end

   new_connection: C_
         -- Create a new connection
      deferred
      end

   stack: LOOP_STACK
         -- Used to loop between connections

   server_job: SOCKET_SERVER_JOB
         -- A job use in `Current'

   connections: INTEGER
         -- The number of {CONNECTION} in `Current'

   shutdown_handler: PROCEDURE[TUPLE[like Current]]
         -- Agent launched when `Current' is shutdowning

   handle_connect (a_io: SOCKET_INPUT_OUTPUT_STREAM)
         -- Handle a connection to the `Current'. This feature is called back by the `server_job' when a connection
         -- attempted (see the `when_connect' feature of SOCKET_SERVER)
      local
         l_connection: C_
      do
         l_connection := new_connection
         l_connection.set_io(a_io)
         stack.add_job(l_connection)
         connections := connections + 1
      end

   handle_shutdown (a_server_job: like server_job)
         -- Shutdown gracefully when all connections are closed. This feature is called back by the `server_job'
         -- (or `a_server_job') when it is asked to shut down (see the `when_shutdown' feature of SOCKET_SERVER)
      require
         a_server_job = server_job
         server_job.will_shutdown
      do
         if connections = 0 and then shutdown_handler /= Void then
            shutdown_handler.call([Current])
         end
      end

   standalone_shutdown (a_server: like Current)
         -- Force `Current' to shutdown.
      require
         a_server = Current
      do
         stack.break
      end

end -- class SERVER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
