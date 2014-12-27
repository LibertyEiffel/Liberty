-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_RESPONSE_CLIENT_REDIRECT
   --
   -- CGI response implementation: client redirect
   --

inherit
   CGI_RESPONSE

insert
   CGI_RESPONSE_FIELDS
   CGI_UTILS
   URL_VALIDITY

create {ANY}
   set_redirect

feature {CGI_HANDLER}
   path, fragment: FIXED_STRING

   set_redirect (a_path, a_fragment: ABSTRACT_STRING)
      require
         valid_url(a_path)
         a_path /= Void
      do
         path := a_path.intern
         if a_fragment /= Void then
            fragment := a_fragment.intern
         end
      ensure
         path = a_path.intern
         a_fragment = Void implies fragment = Void
         a_fragment /= Void implies fragment = a_fragment.intern
      end

feature {CGI}
   flush (a_cgi: CGI; a_output: OUTPUT_STREAM)
      local
         uri: ABSTRACT_STRING
         info: CGI_SERVER_INFO
         tcp: TCP_PROTOCOL
      do
         info := a_cgi.server_info
         if tcp ?:= info.protocol then
            tcp ::= info.protocol
            if tcp.standard_port = info.port then
               uri := "#(1)://#(2)" # tcp.name # info.name
            else
               uri := "#(1)://#(2):#(3)" # tcp.name # info.name # info.port.out
            end
         else
            uri := "#(1)://#(2)" # info.protocol.name # info.name
         end
         if a_cgi.script_name.is_set then
            uri := "#(1)/#(2)" # uri # a_cgi.script_name.name
         end

         a_output.put_string(once "Location:")
         a_output.put_string(uri)
         if fragment /= Void then
            a_output.put_character('#')
            a_output.put_string(fragment)
         end
         a_output.put_string(crlf)
         flush_fields(a_output)
      end

invariant
   valid_url(path)

end -- class CGI_RESPONSE_CLIENT_REDIRECT
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
