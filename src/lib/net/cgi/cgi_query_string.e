-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_QUERY_STRING
   --
   -- QUERY_STRING
   --

feature {ANY}
   string: FIXED_STRING

feature {CGI}
   error: STRING

   set (t: STRING)
      require
         not t.is_empty
      local
         pos, state: INTEGER; escape: INTEGER_8; s: STRING; c: CHARACTER
      do
         from
            s := once ""
            s.clear_count
            pos := t.lower
         until
            error /= Void or else not t.valid_index(pos)
         loop
            c := t.item(pos)
            inspect
               state
            when 0 then
               inspect
                  c
               when ';', '/', '?', ':', '@', '&', '=', '+', '$', ',' then
                  -- reserved
                  s.extend(c) --| **** TODO depends on context, see RFC 3875
               when 'A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.', '!', '~', '*', '%'', '(', ')' then
                  -- unreserved
                  s.extend(c)
               when '%%' then
                  -- escaped
                  state := 1
               else
                  set_error(t)
               end
            when 1 then
               if c.is_hexadecimal_digit then
                  escape := c.hexadecimal_value
                  state := 2
               else
                  set_error(t)
               end
            when 2 then
               if c.is_hexadecimal_digit then
                  escape := escape * 16 + c.hexadecimal_value
                  s.extend(escape.to_character)
                  state := 0
               else
                  set_error(t)
               end
            end
            pos := pos + 1
         end
         if state = 0 then
            string := s.intern
         else
            set_error(t)
         end
      end

feature {}
   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid QUERY_STRING: "
         error.append(t)
      end

end -- class CGI_QUERY_STRING
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
