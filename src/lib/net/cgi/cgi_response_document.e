-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_RESPONSE_DOCUMENT
   --
   -- CGI response implementation: CGI-document (the most used)
   --

inherit
   CGI_RESPONSE

insert
   CGI_RESPONSE_FIELDS
   CGI_REPONSE_BODY

create {ANY}
   set_error, set_content_type

feature {CGI_HANDLER}
   status: INTEGER

   error: FIXED_STRING
      do
         Result := error_memory.intern
      end

feature {CGI, CGI_HANDLER}
   set_error (a_error: ABSTRACT_STRING)
      require
         a_error /= Void
      do
         status := 500
         if error_memory = Void then
            create error_memory.make_from_string(a_error)
         else
            error_memory.extend('%N')
            error_memory.append(a_error)
         end
         set_content_type(once "text/plain")
      end

   set_status (a_status: INTEGER)
      require
         status = 200 implies a_status.in_range(201, 299)
         status = 500 implies a_status.in_range(501, 599)
      do
         status := a_status
      ensure
         status = a_status
      end

feature {CGI}
   flush
      do
         flush_content_type
         if status /= 200 then
            std_output.put_string(once "Status: ")
            std_output.put_integer(status)
            std_output.put_new_line
         end
         flush_fields
         if error = Void then
            flush_body
         else
            std_output.put_new_line
            std_output.put_string(error)
            std_output.put_new_line
         end
      end

feature {}
   error_memory: STRING

invariant
   status.in_range(200, 599)

end -- class CGI_RESPONSE_DOCUMENT
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
