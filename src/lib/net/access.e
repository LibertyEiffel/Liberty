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
   port: INTEGER
         -- The port on which the server runs

   address: ADDRESS
         -- The host of the server

   error: STRING
         -- If an error occurred

   read_sync: BOOLEAN
         -- True if read access should be synchronous (blocking when there is no data)

   server: SOCKET_SERVER is
         -- Start a server on the given port on localhost, listening to connections bound to the given
         -- address.
      deferred
      end

   stream: SOCKET_INPUT_OUTPUT_STREAM is
         -- Open a connection to the remote address and port.
      do
         Result := a_stream
      ensure
         error = Void implies Result.is_connected
      end

   set_read_sync (a_read_sync: like read_sync) is
      do
         read_sync := a_read_sync
      ensure
         read_sync = a_read_sync
      end

feature {}
   a_stream: CLIENT_SOCKET_INPUT_OUTPUT_STREAM is
      local
         s: like socket
      do
         s := socket
         if error = Void then
            create Result.connect_to(s, read_sync)
         end
      end

   socket: SOCKET is
         -- Create a low-level socket connected to the remote address and host.
      deferred
      ensure
         error = Void implies Result.is_connected
      end

end -- class ACCESS
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
