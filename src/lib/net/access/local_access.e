-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class LOCAL_ACCESS
   -- Access to a server on the local machine.

inherit
   ACCESS
      redefine address
      end

insert
   SOCKET_PLUG_IN

create {ANY}
   make

feature {ANY}
   port: INTEGER
   address: LOCALHOST

   server: SOCKET_SERVER
      local
         fd: INTEGER
      do
         fd := net_local_server(port, sync)
         if fd >= 0 then
            create {LOCAL_SOCKET_SERVER} Result.make(Current, fd)
         end
      end

feature {ADDRESS}
   new_local_socket: SOCKET
      do
         create {LOCAL_SOCKET} Result.make(port, sync)
      end

feature {}
   make (a_address: LOCALHOST; a_port: INTEGER; a_sync: BOOLEAN)
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

end -- class LOCAL_ACCESS
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
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
