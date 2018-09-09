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

create {SOCKET_HANDLER}
   make, bind

feature {SOCKET_HANDLER}
   port: INTEGER

feature {SOCKET_SERVER, SOCKET_HANDLER}
   bind (server: SOCKET_SERVER; a_sync: BOOLEAN)
         -- Binds the socket to the server.
      do
         if bind_values.is_null then
            bind_values := bind_values.calloc(6)
         end
         net_accept(server.fd, bind_values, a_sync)
         fd := bind_values.item(5)
         if fd >= 0 then
            check
               last_error = Void
               local_ip_a: bind_values.item(0) = 127
               local_ip_b: bind_values.item(1) = 0
               local_ip_c: bind_values.item(2) = 0
               local_ip_d: bind_values.item(3) = 1
            end
            make(bind_values.item(4), a_sync)
            is_connected := True
            delay_read := False
         else
            error := last_error
         end
      end

feature {}
   make (a_port: INTEGER; a_sync: BOOLEAN)
      do
         set_sync(a_sync)
         if last_delayed_read = Void then
            create last_delayed_read.make(buffer_size)
         end
         port := a_port
         connect(net_local(a_port, a_sync))
      end

   bind_values: NATIVE_ARRAY[INTEGER]

end -- class LOCAL_SOCKET
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
