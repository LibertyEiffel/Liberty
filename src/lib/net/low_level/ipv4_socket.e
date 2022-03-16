-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class IPV4_SOCKET
   --
   -- An IPv4 SOCKET.
   --

inherit
   SOCKET_IMPL

create {SOCKET_HANDLER}
   make_tcp, make_udp

create {SOCKET_SERVER, SOCKET_HANDLER}
   bind

feature {SOCKET_HANDLER}
   a, b, c, d: INTEGER
   port: INTEGER

feature {SOCKET_SERVER, SOCKET_HANDLER}
   bind (server: SOCKET_SERVER; a_sync: BOOLEAN)
         -- Binds the socket to the server.
      do
         if bind_values.is_null then
            bind_values := bind_values.calloc(6)
         end
         net_accept(server.fd, bind_values, a_sync)
         error := last_error
         fd := bind_values.item(5)
         if error = Void and then fd >= 0 then
            common_make(bind_values.item(0), bind_values.item(1), bind_values.item(2), bind_values.item(3), bind_values.item(4), a_sync)
            is_connected := True
            is_remote_connected := True
            delay_read := False
         end
      end

feature {}
   common_make (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER; a_sync: BOOLEAN)
      do
         set_sync(a_sync)
         a := ip_a
         b := ip_b
         c := ip_c
         d := ip_d
         if last_delayed_read = Void then
            create last_delayed_read.make(buffer_size)
         end
         port := a_port
         sync := a_sync
      end

   make_tcp (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER; a_sync: BOOLEAN)
      do
         common_make(ip_a, ip_b, ip_c, ip_d, a_port, a_sync)
         connect(net_tcp(a, b, c, d, a_port, a_sync))
      end

   make_udp (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER; a_sync: BOOLEAN)
      do
         common_make(ip_a, ip_b, ip_c, ip_d, a_port, a_sync)
         connect(net_udp(a, b, c, d, a_port, a_sync))
      end

   bind_values: NATIVE_ARRAY[INTEGER]

end -- class IPV4_SOCKET
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
