-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class ACCESS
   -- Access to a server running on some host (at some address).

insert
   SOCKET_HANDLER

feature {ANY}
   address: ADDRESS
         -- The host of the server

   error: STRING
         -- If an error occurred

   server: SOCKET_SERVER
         -- Start a server on the given access on localhost, listening to connections bound to the given
         -- address.
      deferred
      end

   stream: SOCKET_INPUT_OUTPUT_STREAM
         -- Open a connection to the remote address and access.
      do
         Result := a_stream
      ensure
         error = Void implies Result.is_connected
      end

feature {}
   a_stream: CLIENT_SOCKET_INPUT_OUTPUT_STREAM
      local
         s: like socket
      do
         s := socket
         if error = Void then
            create Result.connect_to(s)
         end
      end

   socket: SOCKET
         -- Create a low-level socket connected to the remote address and host.
      do
         Result := address.new_socket(Current)
         if address.error /= Void then
            error := address.error
         end
      ensure
         error = Void implies Result.is_connected
      end

end -- class ACCESS
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
