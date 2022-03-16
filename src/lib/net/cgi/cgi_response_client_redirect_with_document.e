-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_RESPONSE_CLIENT_REDIRECT_WITH_DOCUMENT
   --
   -- CGI response implementation: client redirect with document
   --

inherit
   CGI_RESPONSE_CLIENT_REDIRECT
      redefine
         flush, out_in_tagged_out_memory
      end

insert
   CGI_RESPONSE_BODY
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   set_redirect

feature {CGI}
   flush (a_cgi: CGI; a_output: OUTPUT_STREAM): BOOLEAN
      do
         if Precursor(a_cgi, a_output) then
            a_output.put_string(once "Status:302")
            a_output.put_string(crlf)
            a_output.put_string(crlf)
            flush_body(a_output)
            Result := True
         end
      end

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{CGI_RESPONSE_CLIENT_REDIRECT_WITH_DOCUMENT path=")
         tagged_out_memory.append(path)
         if fragment /= Void then
            tagged_out_memory.append(once " fragment=")
            tagged_out_memory.append(fragment)
         end
         tagged_out_memory.extend('}')
      end

end -- class CGI_RESPONSE_CLIENT_REDIRECT_WITH_DOCUMENT
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
