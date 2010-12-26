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

creation {ANY}
   make

feature {ANY}
   address: LOCALHOST

   server: SOCKET_SERVER is
      local
         fd: INTEGER
      do
         fd := net_local_server(port)
         if fd >= 0 then
            create Result.make(Current, fd)
         end
      end

feature {}
   make (a_address: LOCALHOST; a_port: INTEGER) is
         -- Access to a server on the given host address listening at the given port
      require
         a_address /= Void
         a_port.in_range(1, 65535)
      do
         address := a_address
         port := a_port
      end

   socket: SOCKET is
      local
         ip: IP_ADDRESS
      do
         ip := address.ip
         if address.error /= Void then
            error := address.error
         else
            create Result.make_local(ip.a, ip.b, ip.c, ip.d, port)
            if not Result.is_connected then
               error := Result.error
            end
         end
      end

end -- class LOCAL_ACCESS
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
