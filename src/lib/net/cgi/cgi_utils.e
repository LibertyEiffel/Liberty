-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_UTILS

feature {ANY}
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

   crlf: FIXED_STRING
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
