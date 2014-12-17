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

   is_valid_path (a_path: ABSTRACT_STRING): BOOLEAN
      local
         i, state: INTEGER; c: CHARACTER
      do
         if a_path /= Void and then a_path.count > 1 and then a_path.first = '/' then
            from
               Result := True
               i := a_path.lower + 1
            until
               not Result or else i > a_path.upper
            loop
               c := a_path.item(i)
               inspect
                  state
               when 0, 1 then
                  inspect
                     c
                  when '/' then
                     if state = 1 then
                        Result := False
                     else
                        state := 1
                     end
                  when 'a'..'z', 'A'..'Z', '0'..'9', ':', '@', '&', '=', '+', '$', ',' then
                     state := 0
                  when '%%' then
                     state := 2
                  else
                     Result := False
                  end
               when 2 then
                  if c.is_hexadecimal_digit then
                     state := 3
                  else
                     Result := False
                  end
               when 3 then
                  if c.is_hexadecimal_digit then
                     state := 0
                  else
                     Result := False
                  end
               end
               i := i + 1
            end
            Result := Result and then state = 0
         end
      end

feature {CGI}
   flush
      do
         std_output.put_string(once "Location: ")
         std_output.put_string(path)
         if query /= Void then
            std_output.put_character('?')
            std_output.put_string(query)
         end
         std_output.put_new_line
      end

invariant
   is_valid_path(path)

end -- class CGI_RESPONSE_LOCAL_REDIRECT
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
