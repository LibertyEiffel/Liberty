-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class SERVER_SOCKET_INPUT_OUTPUT_STREAM

inherit
   SOCKET_INPUT_OUTPUT_STREAM
      redefine socket_disconnected
      end

create {SOCKET_SERVER}
   connect_to

feature {ANY}
   disconnect
      do
         detach
         server.unbind(socket)
      end

feature {}
   connect_to (a_server: SOCKET_SERVER; a_sync: BOOLEAN)
      require
         a_server /= Void
      do
         server := a_server
         socket := a_server.bind(a_sync)
         make
      end

   socket: SOCKET
   server: SOCKET_SERVER

   socket_disconnected (a_socket: SOCKET)
      do
         if server.has_socket(a_socket) then
            server.socket_disconnected(a_socket)
         end
         Precursor(a_socket)
      end

invariant
   server /= Void

end -- class SERVER_SOCKET_INPUT_OUTPUT_STREAM
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
