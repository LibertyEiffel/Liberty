class MULTIPLEX_SERVER
   --
   -- If you try to make a real server using our technology, this class may prove useful. Be sure to have seen
   -- the class SOCKETS first.
   --

insert
   SERVER[MULTIPLEX_CONNECTION]
      export {} start, start_in_stack
      end

create {ANY}
   make

feature {}
   make
      local
         host: HOST; tcp: TCP_ACCESS
      do
         -- Start a server on the local machine, listening on port 2001
         create host.make("localhost")
         create tcp.make(host, 2001, True)
         start(tcp)
      end

   new_connection: MULTIPLEX_CONNECTION
      do
         create Result.make(Current)
      end

   handle_error (error_message: STRING)
      do
         if error_message /= Void then
            std_error.put_string(error_message)
            std_error.put_new_line
         else
            std_error.put_string(once "Could not start the server%N")
         end
         die_with_code(1)
      end

feature {MULTIPLEX_CONNECTION}
   shutdown
         -- A connection asked the server to shut down
      do
         server_job.shutdown
      end

   halt
         -- A connection asked the server to halt
      do
         server_job.halt
      end

   connection_done (a_connection: MULTIPLEX_CONNECTION)
         -- A connection is just finished.
      do
         connections := connections - 1
         if connections = 0 and then server_job.done then
            -- and then stack.current_loop /= Void
            handle_shutdown(server_job)
         end
      end

end -- class MULTIPLEX_SERVER
