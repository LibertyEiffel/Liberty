-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class SOCKET_PLUG_IN

feature {}
   last_error: STRING
      local
         e: POINTER
      do
         e := net_last_error
         if e /= default_pointer then
            Result := once ""
            Result.from_external(e)
         end
      end

   last_error_number: INTEGER
      require
         last_error /= Void
      do
         Result := net_last_error_number
      end

feature {} -- Plugin
   net_tcp (ip_a, ip_b, ip_c, ip_d: INTEGER; a_port: INTEGER; a_sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_tcp"
         }"
      end

   net_udp (ip_a, ip_b, ip_c, ip_d: INTEGER; a_port: INTEGER; a_sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_udp"
         }"
      end

   net_local (a_port: INTEGER; a_sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_local"
         }"
      end

   net_select (a_fd: INTEGER; a_timeout: REAL): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_select_one"
         }"
      end

   net_read (a_fd, a_count: INTEGER; a_buffer: POINTER; sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_read"
         }"
      end

   net_write (a_fd, a_count: INTEGER; a_buffer: NATIVE_ARRAY[CHARACTER]): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_write"
         }"
      end

   net_accept (a_fd: INTEGER; a_val: NATIVE_ARRAY[INTEGER]; a_sync: BOOLEAN)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_accept"
         }"
      end

   net_disconnect (a_fd: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_disconnect"
         }"
      end

   net_shutdown (a_fd: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_shutdown"
         }"
      end

   net_last_error: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_last_error"
         }"
      end

   net_last_error_number: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_last_error_number"
         }"
      end

   net_last_error_try_again: BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_last_error_try_again()"
         }"
      end

   net_hostname (a_hostname: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_hostname"
         }"
      end

   net_tcp_server (port: INTEGER; a_sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_tcp_server"
         }"
      end

   net_udp_server (port: INTEGER; a_sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_udp_server"
         }"
      end

   net_local_server (port: INTEGER; a_sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_local_server"
         }"
      end

   net_bind_server(socket, port, sockfamily: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_bind_server"
         }"
      end

   net_set_int_option(fd, level, optname, opt_val: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_set_int_option"
         }"
      end

   net_tcp_socket (sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_tcp_socket"
         }"
      end

   net_udp_socket (sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_udp_socket"
         }"
      end

   net_local_socket (sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_local_socket"
         }"
      end

feature {} -- Name resolution -- see LOCALHOST
   net_gethostname: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_gethostname()"
         }"
      end

   net_sethostname (hn: POINTER; size: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_sethostname"
         }"
      end

   net_getdomainname: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_getdomainname()"
         }"
      end

   net_setdomainname (dn: POINTER; size: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_setdomainname"
         }"
      end

feature {} -- Macros for setting options
   sol_socket: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "SOL_SOCKET"
         }"
      end

   so_reuse_addr: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "SO_REUSEADDR"
         }"
      end

   af_inet: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "AF_INET"
         }"
      end

end -- class SOCKET_PLUG_IN
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
