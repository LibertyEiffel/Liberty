-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_UTILS

feature {ANY} -- checks
   is_token (value: ABSTRACT_STRING): BOOLEAN
      require
         value /= Void
      local
         i: INTEGER
      do
         from
            Result := True
            i := value.lower
         until
            not Result or else i > value.upper
         loop
            Result := not is_separator(value.item(i))
            i := i + 1
         end
      end

   is_separators (value: ABSTRACT_STRING): BOOLEAN
      require
         value /= Void
      local
         i: INTEGER
      do
         from
            Result := True
            i := value.lower
         until
            not Result or else i > value.upper
         loop
            Result := is_separator(value.item(i))
            i := i + 1
         end
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

feature {ANY} -- constants
   crlf: FIXED_STRING
         -- CRLF, the standard Web end-of-line
      do
         Result := "%R%N".intern
      end

feature {}
   is_separator (char: CHARACTER): BOOLEAN
      do
         inspect
            char
         when '(', ')', '<', '>', '@', ',', ';', ':', '\', '"', '/', '[', ']', '?', '=', '{', '}', ' ', '%T' then
            Result := True
         else
            check not Result end
         end
      end

end -- class CGI_UTILS
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
