-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_RESPONSE_LOCAL_REDIRECT
   --
   -- CGI response implementation: local redirect
   --

inherit
   CGI_RESPONSE
      redefine
         out_in_tagged_out_memory
      end

insert
   CGI_UTILS
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   set_redirect

feature {CGI_HANDLER}
   path, query: FIXED_STRING

   set_redirect (a_path, a_query: ABSTRACT_STRING)
      require
         is_valid_path(a_path)
      do
         path := a_path.intern
         if a_query /= Void then
            query := a_query.intern
         end
      ensure
         path = a_path.intern
         a_query = Void implies query = Void
         a_query /= Void implies query = a_query.intern
      end

feature {CGI}
   flush (a_cgi: CGI; a_output: OUTPUT_STREAM): BOOLEAN
      do
         a_output.put_string(once "Location:")
         if a_cgi.script_name.is_set then
            a_output.put_character('/')
            a_output.put_string(a_cgi.script_name.name)
         end
         a_output.put_string(path)
         if query /= Void then
            a_output.put_character('?')
            a_output.put_string(query)
         end
         a_output.put_string(crlf)
         a_output.put_string(crlf)
         Result := True
      end

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{CGI_RESPONSE_LOCAL_REDIRECT path=")
         tagged_out_memory.append(path)
         if query /= Void then
            tagged_out_memory.append(once " query=")
            tagged_out_memory.append(query)
         end
         tagged_out_memory.extend('}')
      end

invariant
   is_valid_path(path)

end -- class CGI_RESPONSE_LOCAL_REDIRECT
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
