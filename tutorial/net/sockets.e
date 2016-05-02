class SOCKETS
   --
   -- This is the first tutorial class to look at, because it gives the most simple examples.
   --

create {ANY}
   make

feature {}
   make
      local
         tcp: TCP_ACCESS; host: HOST; ip: IPV4_ADDRESS
      do
         -- The example just tries to connect to a well-known ftp server
         create host.make(once "ftp.funet.fi")
         create tcp.make(host, 21, True)
         test_socket(tcp)
         -- Now the following lines start a real server, listening on port 2001.
         create ip.make(127, 0, 0, 1)
         create tcp.make(ip, 2001, True)
         test_server(tcp)
      end

   test_socket (access: TCP_ACCESS)
         -- First tutorial: simple network connection
      local
         ios: SOCKET_INPUT_OUTPUT_STREAM
      do
         -- Create a stream connected to the address
         ios := access.stream
         if ios = Void then
            std_error.put_line(access.error)
         elseif ios.is_connected then
            from
               -- actively wait for enough characters to be available
            until
               ios.can_read_line
            loop
            end
            ios.read_line
            io.put_string(ios.last_string)
            io.put_new_line
            ios.disconnect
         else
            std_error.put_line("Socket not connected!")
         end
      end

   test_server (access: TCP_ACCESS)
         -- Second tutorial: create a server. This one is trivial, see MULTIPLEX_SERVER for a real-life
         -- example
      local
         server: SOCKET_SERVER; job: SOCKET_SERVER_JOB
      do
         -- About the stack and the sequencer: see the sequencer tutorial
         create stack.make
         -- Create a server listening at the given address
         server := access.server
         -- Must test if the server is effectively listening (otherwise there was an error: address in use and
         -- so on)

         if server.can_connect then
            -- Create a job that uses this server
            create job.make(server, True)
            -- Add a handler: the agent is called by the server when an incoming connection happens
            job.when_connect(agent handle_connect(?))
            -- Add the job to the sequencer stack
            stack.add_job(job)
            io.put_string(once "Accepting connections on port ")
            io.put_integer(access.port)
            io.put_new_line
            -- And we start the sequencer loop
            stack.run
         end
      end

feature {}
   stack: LOOP_STACK

   handle_connect (ios: SOCKET_INPUT_OUTPUT_STREAM)
         -- Handle a connection to the server. Acts as an echo server.
      local
         stop: BOOLEAN; s: STRING
      do
         from
            io.put_string(once "(new connection accepted)%N")
         until
            stop
         loop
            from
               -- active wait
            until
               ios.can_read_line
            loop
            end
            ios.read_line
            s := ios.last_string
            if not s.is_empty then
               stop := s.same_as(once "stop")
               ios.put_line(s)
            end
         end
         ios.disconnect
         io.put_string(once "(connection cancelled)%N")
         -- This last line will stop the SERVER!
         stack.break
      end

end -- class SOCKETS
