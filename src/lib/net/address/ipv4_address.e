-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class IPV4_ADDRESS
   -- The host represented by its address. Currently only IPv4 is supported.

inherit
   ADDRESS
      redefine out
      end

create {ANY}
   make

feature {ANY}
   a, b, c, d: INTEGER
         -- The four parts of an IP address.
         -- Example: 192.168.0.1 will be represented:
         --   a = 192
         --   b = 168
         --   c = 0
         --   d = 1

   hash_code: INTEGER
      do
         Result := a & 0x7f |<< 24 | (b |<< 16) | (c |<< 8) | d
      end

   out: STRING
      do
         Result := a.out + "." + b.out + "." + c.out + "." + d.out
      end

feature {ACCESS, ADDRESS}
   new_socket (access: ACCESS): SOCKET
      local
         ip_access: IPV4_ACCESS
      do
         ip_access ::= access
         Result := ip_access.new_ipv4_socket(a, b, c, d)
         if not Result.is_connected then
            error := Result.error
         end
      end

feature {}
   make (ip_a, ip_b, ip_c, ip_d: INTEGER)
      require
         ip_a.in_range(0, 255)
         ip_b.in_range(0, 255)
         ip_c.in_range(0, 255)
         ip_d.in_range(0, 255)
      do
         a := ip_a
         b := ip_b
         c := ip_c
         d := ip_d
      end

end -- class IPV4_ADDRESS
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
