class REPOSITORY_SERVER
   --
   -- This class is quite similar to MULTIPLEX_SERVER in the tutorial/net tutorial. It is used here as a central
   -- repository.
   --

inherit
   REPOSITORY[STRING]
      -- The server itself is a repository in regard to its connections.
   XML_STREAM_REPOSITORY[STRING]
      redefine make
      end

insert
   SERVER[REPOSITORY_CONNECTION]
      export {} all
      end

create {ANY}
   make

feature {REPOSITORY_CONNECTION}
   update_from_io_stream (io_stream: INPUT_STREAM)
      require
         io_stream.is_connected
      do
         update_from_stream(io_stream)
      end

   write_to_io_stream (io_stream: OUTPUT_STREAM)
      require
         io_stream.is_connected
      do
         write_to_stream(create {XML_REPOSITORY_OUTPUT}.make(io_stream, "1"))
      end

feature {}
   make
      local
         host: HOST; tcp: TCP_ACCESS
      do
         Precursor
         -- Start a server on the local machine, listening on port 2001
         create host.make("localhost")
         create tcp.make(host, 2001, True)
         start(tcp)
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

   new_connection: REPOSITORY_CONNECTION
      do
         create Result.make(Current)
      end

feature {REPOSITORY_CONNECTION}
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

   connection_done (a_connection: REPOSITORY_CONNECTION)
         -- A connection is just finished.
      do
         connections := connections - 1
         if connections = 0 and then server_job.done and then stack.current_loop /= Void then
            -- If all the connections are closed and the server is shut down, then we exit the loop.
            stack.break
         end
      end

end -- class REPOSITORY_SERVER
