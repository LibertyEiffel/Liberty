-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class LOCALHOST
   --
   -- The very machine on which the program runs
   --
   -- The name resolution part was originally written by Serge Romanchenko <se@sir.nensi.net>
   --

inherit
   HOST
      rename
         make as make_host
      export
         {} make_host;
         {ANY} last_error, last_error_number
      redefine
         new_socket
      end

create {ANY}
   make

feature {ANY}
   fqdn: STRING
         -- Fully Qualified Domain Name
      do
         Result := once ""
         Result.copy(host_name)
         Result.extend('.')
         Result.append(domain_name)
      end

   host_name: STRING
         -- Short host name
      local
         e: POINTER
      do
         e := net_gethostname
         if e /= default_pointer then
            Result := once ""
            Result.from_external_copy(e)
         end
      end

   domain_name: STRING
         -- Full domain name (without the `host_name`)
      local
         e: POINTER
      do
         e := net_getdomainname
         if e /= default_pointer then
            Result := once ""
            Result.from_external_copy(e)
         end
      end

   set_host_name (a_host_name: STRING)
      require
         a_host_name /= Void and then not a_host_name.is_empty
      do
         net_sethostname(a_host_name.to_external, a_host_name.count)
      end

   set_domain_name (a_domain_name: STRING)
      require
         a_domain_name /= Void and then not a_domain_name.is_empty
      do
         net_setdomainname(a_domain_name.to_external, a_domain_name.count)
      end

feature {ACCESS, ADDRESS}
   new_socket (access: ACCESS): SOCKET
      local
         local_access: LOCAL_ACCESS
      do
         local_access ::= access
         Result := local_access.new_local_socket
         if not Result.is_connected then
            error := Result.error
         end
      end

feature {}
   make
      do
         make_host(once "localhost")
      end

end -- class LOCALHOST
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
