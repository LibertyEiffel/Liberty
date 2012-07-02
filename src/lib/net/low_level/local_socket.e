-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class LOCAL_SOCKET
   --
   -- A local SOCKET.
   --

inherit
   SOCKET_IMPL

creation {SOCKET_HANDLER}
   make

feature {SOCKET_HANDLER}
   port: INTEGER

feature {}
   make (a_port: INTEGER) is
      do
         if last_read = Void then
            create last_read.make(default_buffer_size)
         end
         port := a_port
         connect(net_local(a_port))
      end

   connect (a_fd: like fd) is
      do
         if a_fd >= 0 then
            is_connected := True
            fd := a_fd
         else
            error := last_error
         end
      end

end -- class LOCAL_SOCKET
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
