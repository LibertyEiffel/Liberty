-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class EZMQ_SOCKET_ZMQ_BIND
   --
   -- The standard ZMQ implementation of the EZMQ socket, using "zmq_bind()"
   --

inherit
   EZMQ_SOCKET_ZMQ

create {ANY}
   make

feature {}
   make (a_type: like type; a_endpoint: like endpoint)
      require
         a_endpoint /= Void
      local
         r: INTEGER
      do
         make0(a_type, a_endpoint)
         if is_valid then
            r := zmq_bind(socket, a_endpoint.to_external)
            if r /= 0 then
               bind_error_action.call([r, a_type, a_endpoint])
            else
               is_connected := True
            end
         end
      end

end -- class EZMQ_SOCKET_ZMQ_BIND
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
