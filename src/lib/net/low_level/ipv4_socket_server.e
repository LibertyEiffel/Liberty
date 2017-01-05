-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class IPV4_SOCKET_SERVER

inherit
   SOCKET_SERVER

create {ACCESS}
   make

feature {}
   access: IPV4_ACCESS

feature {SOCKET_INPUT_OUTPUT_STREAM}
   bind (a_sync: BOOLEAN): SOCKET
      do
         Result := bind_socket(a_sync)
      end

   has_socket (socket: SOCKET): BOOLEAN
      local
         isk: IPV4_SOCKET
      do
         if isk ?:= socket then
            isk ::= socket
            Result := connected_sockets.fast_has(isk)
         end
      end

   socket_disconnected (socket: SOCKET)
      local
         isk: IPV4_SOCKET
      do
         isk ::= socket
         unbind_socket(isk)
      end

feature {}
   connected_sockets: FAST_ARRAY[IPV4_SOCKET]
         -- The currently connected sockets

   sockets_pool: RECYCLING_POOL[IPV4_SOCKET]
         -- Common array containing all the currently disconnected sockets.
      once
         create Result.make
      end

   bind_socket (a_sync: BOOLEAN): IPV4_SOCKET
      do
         if sockets_pool.is_empty then
            create Result.bind(Current, a_sync)
         else
            Result := sockets_pool.item
            check
               not Result.is_connected
            end
            Result.bind(Current, a_sync)
         end
         error := Result.error
         if Result.is_connected then
            connected_sockets.add_last(Result)
         end
      ensure
         Result.is_connected implies connected_sockets.fast_has(Result) and then connected_sockets.count = old connected_sockets.count + 1
         not Result.is_connected implies error /= Void
      end

   unbind_socket (socket: IPV4_SOCKET)
      require
         connected_sockets.fast_has(socket)
      local
         i: INTEGER
      do
         i := connected_sockets.first_index_of(socket)
         connected_sockets.remove(i)
         sockets_pool.recycle(socket)
      ensure
         not connected_sockets.fast_has(socket)
      end

   kill_connections
      local
         s: SOCKET
      do
         from
         until
            connected_sockets.is_empty
         loop
            s := connected_sockets.first
            if s.is_connected then
               s.disconnect
            end
         end
      end

feature {}
   make (a_access: like access; a_socket_fd: like fd)
         -- Connect to an access, which must also provide the file descriptor
      require
         a_access /= Void
         valid_file_descriptor: a_socket_fd >= 0
      do
         access := a_access
         fd := a_socket_fd
         can_connect := True
         create connected_sockets.with_capacity(4)
      end

end -- class IPV4_SOCKET_SERVER
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
