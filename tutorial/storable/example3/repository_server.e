class REPOSITORY_SERVER
   --
   -- This class is quite similar to MULTIPLEX_SERVER in the tutorial/net tutorial. It is used here as a central
   -- repository.
   --

inherit
   REPOSITORY[STRING]
      -- The server itself is a repository in regard to its connections.
   XML_STREAM_REPOSITORY[STRING]
      export {REPOSITORY_CONNECTION} update_from_stream, write_to_stream
      redefine make
      end

insert
   SERVER[REPOSITORY_CONNECTION]
      export {} all
      end

create {ANY}
   make

feature {}
   make is
      local
         host: HOST; tcp: TCP_ACCESS
      do
         Precursor
         -- Start a server on the local machine, listening on port 2001
         create host.make("localhost")
         create tcp.make(host, 2001)
         start(tcp)
      end

   handle_error (error_message: STRING) is
      do
         if error_message /= Void then
            std_error.put_string(error_message)
            std_error.put_new_line
         else
            std_error.put_string(once "Could not start the server%N")
         end
         die_with_code(1)
      end

   new_connection: REPOSITORY_CONNECTION is
      do
         create Result.make(Current)
      end

feature {REPOSITORY_CONNECTION}
   shutdown is
         -- A connection asked the server to shut down
      do
         server.shutdown
      end

   halt is
         -- A connection asked the server to halt
      do
         server.halt
      end

   connection_done (a_connection: REPOSITORY_CONNECTION) is
         -- A connection is just finished.
      do
         connections := connections - 1
         if connections = 0 and then server.done and then stack.current_loop /= Void then
            -- If all the connections are closed and the server is shut down, then we exit the loop.
            stack.break
         end
      end

end -- class REPOSITORY_SERVER
