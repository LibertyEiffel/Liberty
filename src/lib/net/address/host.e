-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HOST
   -- The host is represented by a name. The name will be resolved by a DNS.

inherit
   ADDRESS
      redefine out
      end

insert
   SOCKET_PLUG_IN
      undefine out
      end

create {ANY}
   make

feature {ANY}
   hostname: STRING
         -- The name of the host

   ip: IPV4_ADDRESS
      do
         if resolved = Void and then error = Void then
            resolve
         end
         Result := resolved
      end

   hash_code: INTEGER
      do
         Result := ip.hash_code
      end

   out: STRING
      do
         Result := hostname + " (" + ip.out + ")"
      end

feature {}
   resolved: IPV4_ADDRESS

   resolve
         -- Resolve the host address by looking for the IP address (uses DNS resolution)
      require
         resolved = Void
      local
         a, b, c, d, ipaddr: INTEGER
      do
         ipaddr := net_hostname(hostname.to_external)
         a := ipaddr |>>> 24
         b := ipaddr |>>> 16 & 0x000000ff
         c := ipaddr |>>> 8 & 0x000000ff
         d := ipaddr & 0x000000ff
         error := last_error
         if error = Void then
            create resolved.make(a, b, c, d)
         end
      ensure
         (error = Void) /= (resolved = Void)
      end

feature {ACCESS, ADDRESS}
   new_socket (access: ACCESS): SOCKET
      local
         addr: like ip
      do
         addr := ip
         if addr = Void then
            check
               error /= Void
            end
         else
            Result := addr.new_socket(access)
            if not Result.is_connected then
               error := Result.error
            end
         end
      end

feature {}
   make (a_hostname: STRING)
      require
         a_hostname /= Void
      do
         hostname := a_hostname
      end

end -- class HOST
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
