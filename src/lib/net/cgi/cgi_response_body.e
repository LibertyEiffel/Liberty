-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class CGI_RESPONSE_BODY
   --
   -- CGI response partial implementation: document body
   --

insert
   CGI_UTILS

feature {CGI_HANDLER}
   content_type: FIXED_STRING

   body: OUTPUT_STREAM
      do
         if body_stream = Void then
            body_string := ""
            create body_stream.connect_to(body_string)
         end
         Result := body_stream
      end

feature {CGI, CGI_HANDLER}
   set_content_type (a_content_type: ABSTRACT_STRING)
      require
         a_content_type /= Void
      do
         content_type := a_content_type.intern
      end

feature {}
   flush_content_type (a_output: OUTPUT_STREAM)
      do
         a_output.put_string(once "Content-Type:")
         a_output.put_string(content_type)
         a_output.put_string(crlf)
      end

   flush_body (a_output: OUTPUT_STREAM)
      do
         if body_string /= Void then
            a_output.put_string(body_string)
         end
      end

feature {}
   body_stream: STRING_OUTPUT_STREAM
   body_string: STRING

invariant
   body_stream /= Void implies body_string /= Void
   content_type /= Void

end -- class CGI_RESPONSE_BODY
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
