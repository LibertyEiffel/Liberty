-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class SOCKET_SERVER
   --
   -- A socket server waits for connections to happen on some given access point. It then defers treatment to
   -- handlers (see the `when_connect' feature).
   --
   -- Please use ACCESS.server to create a SOCKET_SERVER.
   --

insert
   SOCKET_HANDLER
   SOCKET_PLUG_IN

feature {ANY}
   can_connect: BOOLEAN
         -- True if some client can connect to the server.

   error: STRING

   shutdown
         -- Wait for the connections to finish, then stop the server.
         -- No more connections will be accepted.
      require
         can_connect
      do
         can_connect := False
         net_shutdown(fd)
         net_disconnect(fd)
      ensure
         not can_connect
      end

   halt
         -- Force all the connected sockets to disconnect, then shutdown
      require
         can_connect
      do
         kill_connections
         shutdown
      ensure
         not can_connect
      end

   new_stream (read_sync: BOOLEAN): SOCKET_INPUT_OUTPUT_STREAM
      do
         create {SERVER_SOCKET_INPUT_OUTPUT_STREAM} Result.connect_to(Current, read_sync)
      end

feature {EVENTS_SET, SOCKET}
   fd: INTEGER
         -- The file descriptor of the socket; it is used to wait for some connection.

feature {SOCKET_INPUT_OUTPUT_STREAM}
   bind (a_sync: BOOLEAN): SOCKET
         -- Create a socket for the stream to connect upon (used by the stream at creation)
      deferred
      ensure
         has_socket(Result)
      end

   unbind (socket: SOCKET)
         -- Close the socket and unbind it
      require
         socket.is_connected
         has_socket(socket)
      do
         socket.disconnect
         -- will call socket_disconnected
      ensure
         not has_socket(socket)
         not socket.is_connected
      end

   has_socket (socket: SOCKET): BOOLEAN
      deferred
      end

   socket_disconnected (socket: SOCKET)
      require
         not socket.is_connected
         has_socket(socket)
      deferred
      ensure
         not has_socket(socket)
      end

feature {}
   kill_connections
      deferred
      end

feature {ANY}
   event_connection: EVENT_DESCRIPTOR
      do
         Result := connection_occurred
         if Result = Void then
            create connection_occurred.make(Current)
            Result := connection_occurred
         end
      end

feature {}
   connection_occurred: NETWORK_CONNECTION_OCCURRED

end -- class SOCKET_SERVER
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
