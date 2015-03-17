class MULTIPLEX_CONNECTION
   --
   -- Handle one connection to the MULTIPLEX_SERVER.
   --
   -- Each connection is very simple: all the data is sent back (it's an "echo" thing), except when one of the
   -- three commands below is issued. A command is a single word written alone on its line. The three commands
   -- are:
   --
   -- bye       simply closes the current connection.
   --
   -- shutdown  will stop the server as soon as all the open connections are closed. The server does not
   --           accept any new connection.
   --
   -- halt      closes all the open connections and shut the server down.
   --

inherit
   CONNECTION
      redefine set_io
      end

create {MULTIPLEX_SERVER}
   make

feature {LOOP_ITEM}
   continue
      local
         s: STRING
      do
         ios.read_line
         s := ios.last_string
         if not s.is_empty then
            inspect
               s
            when "shutdown" then
               ios.disconnect
               server.shutdown
            when "halt" then
               server.halt
            when "bye" then
               ios.disconnect
            else
               std_output.put_integer(id)
               std_output.put_string(once ": ")
               std_output.put_line(s)
            end
         end
      end

feature {SERVER}
   set_io (a_io: like ios)
         -- Called by the server when the connection is initiated. The stream is the socket into which the
         -- connection is plugged.
      do
         Precursor(a_io)
         --a_io.unset_timeout
         a_io.when_disconnect(agent handle_disconnect(?))
         --|a_io.put_string(once "Hello! There are three commands available:%
         --|                     % bye, shutdown and halt.%N")
      end

feature {}
   make (a_server: like server)
      do
         counter.increment
         id := counter.item
         server := a_server
      end

   handle_disconnect (a_io: like ios)
      require
         a_io = ios
         done
      do
         server.connection_done(Current)
      end

   id: INTEGER

   server: MULTIPLEX_SERVER

   counter: COUNTER
      once
         create Result
      end

end -- class MULTIPLEX_CONNECTION
