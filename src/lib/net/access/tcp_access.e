-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class TCP_ACCESS
   -- Access to a TCP server.

inherit
   IPV4_ACCESS

insert
   SOCKET_PLUG_IN

create {ANY}
   make

feature {ANY}
   server: SOCKET_SERVER
      local
         fd: INTEGER
      do
         fd := net_tcp_socket(sync)
         if fd >= 0 then
            set_preopen_options(fd)
            fd := net_bind_server(fd, port, af_inet)
            if fd >= 0 then
               create {IPV4_SOCKET_SERVER} Result.make(Current, fd)
            end
         end
      end

   set_address_reuse (value: BOOLEAN)
         -- When `value', servers are created with reusable addresses
         -- See SO_REUSEADDR in IP sockets documentation for details
      do
         address_reuse := value
      ensure
         address_reuse = value
      end

   address_reuse: BOOLEAN
         -- Should created servers should be created with a reusable bind address?

feature {}
   make (a_address: ADDRESS; a_port: INTEGER; a_sync: BOOLEAN)
         -- Access to a server on the given host address listening at the given port
      require
         a_address /= Void
         a_port.in_range(1, 65535)
      do
         address := a_address
         port := a_port
         sync := a_sync
      end

   sync: BOOLEAN

feature {} -- Option handling
   set_preopen_options(fd: INTEGER)
         -- Set the socket options that should be set after creating the
         -- socket and before binding it
      do
         if address_reuse then
            set_integer_socket_option (fd, so_reuse_addr, 1)
         end
      end

   set_integer_socket_option(fd, opt_name, opt_val: INTEGER)
      local
         op_result: INTEGER
      do
         op_result := net_set_int_option(fd, sol_socket, opt_name, opt_val)
         if net_last_error.is_not_null then
            create error.from_external(net_last_error)
         end
      ensure
         net_last_error_number = 0
      end

feature {IPV4_ADDRESS}
   new_ipv4_socket (a, b, c, d: INTEGER): SOCKET
      do
         create {IPV4_SOCKET} Result.make_tcp(a, b, c, d, port, sync)
      end

end -- class TCP_ACCESS
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
