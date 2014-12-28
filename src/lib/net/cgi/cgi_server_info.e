-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_SERVER_INFO
   --
   -- SERVER_NAME, SERVER_PORT, SERVER_PROTOCOL, SERVER_SOFTWARE
   --

insert
   DISPOSABLE
      redefine
         out_in_tagged_out_memory
      end

create {CGI}
   make

feature {ANY}
   name: FIXED_STRING
   port: INTEGER
   protocol: PROTOCOL
   software: FIXED_STRING

feature {CGI}
   error: STRING

feature {}
   make (n, p, q, s: STRING)
      local
         protocols: PROTOCOLS
      do
         if n /= Void then
            name := n.intern
         end
         if p /= Void and then p.is_integer then
            port := p.to_integer
         end
         if q /= Void and then protocols.known_protocol(q) then
            protocol := protocols.protocol(q)
         end
         if s /= Void then
            software := s.intern
         end
      end

   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid SERVER_INFO: "
         error.append(t)
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{CGI_SERVER_INFO")
         if name /= Void then
            tagged_out_memory.append(once " name=")
            tagged_out_memory.append(name)
         end
         if port /= 0 then
            tagged_out_memory.append(once " port=")
            port.append_in(tagged_out_memory)
         end
         if protocol /= Void then
            tagged_out_memory.append(once " protocol=")
            tagged_out_memory.append(protocol.name)
         end
         if software /= Void then
            tagged_out_memory.append(once " software=")
            tagged_out_memory.append(software)
         end
         tagged_out_memory.extend('}')
      end

feature {}
   dispose
      local
         protocols: PROTOCOLS
      do
         protocols.recycle(protocol)
      end

end -- class CGI_SERVER_INFO
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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
