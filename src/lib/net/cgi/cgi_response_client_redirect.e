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
      redefine
         out_in_tagged_out_memory
      end

insert
   CGI_RESPONSE_FIELDS
      redefine
         out_in_tagged_out_memory
      end
   CGI_UTILS
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   set_redirect

feature {CGI_HANDLER}
   path, fragment: FIXED_STRING

   set_redirect (a_path, a_fragment: ABSTRACT_STRING)
      require
         a_path /= Void
         is_valid_path(a_path)
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
   flush (a_cgi: CGI; a_output: OUTPUT_STREAM): BOOLEAN
      local
         uri: STRING
         info: CGI_SERVER_INFO
         tcp: TCP_PROTOCOL
         host: FIXED_STRING
      do
         info := a_cgi.server_info
         if info.protocol /= Void then
            host := a_cgi.header(once "HOST")
            uri := once ""
            uri.clear_count

            if tcp ?:= info.protocol then
               tcp ::= info.protocol
               if tcp.standard_port = info.port then
                  uri.append(tcp.name)
                  uri.append(once "://")
                  if host = Void then
                     uri.append(info.name)
                  else
                     uri.append(host)
                  end
               else
                  uri.append(tcp.name)
                  uri.append(once "://")
                  if host = Void then
                     uri.append(info.name)
                     uri.extend(':')
                     info.port.append_in(uri)
                  else
                     uri.append(host)
                  end
               end
            else
               uri.append(info.protocol.name)
               uri.append(once "://")
               if host = Void then
                  uri.append(info.name)
               else
                  uri.append(host)
               end
            end
            if a_cgi.script_name.is_set then
               uri.extend_unless('/')
               uri.append(a_cgi.script_name.name)
            end

            a_output.put_string(once "Location:")
            a_output.put_string(uri)
            a_output.put_string(path)
            if fragment /= Void then
               a_output.put_character('#')
               a_output.put_string(fragment)
            end
            a_output.put_string(crlf)
            flush_fields(a_output)
            a_output.put_string(crlf)
            Result := True
         end
      end

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{CGI_RESPONSE_CLIENT_REDIRECT path=")
         tagged_out_memory.append(path)
         if fragment /= Void then
            tagged_out_memory.append(once " fragment=")
            tagged_out_memory.append(fragment)
         end
         tagged_out_memory.extend('}')
      end

invariant
   is_valid_path(path)

end -- class CGI_RESPONSE_CLIENT_REDIRECT
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
