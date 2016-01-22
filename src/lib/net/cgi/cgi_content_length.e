-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_CONTENT_LENGTH
   --
   -- CONTENT_LENGTH
   --

feature {CGI, CGI_HANDLER}
   length: INTEGER
      require
         is_known
      attribute
      end

   is_known: BOOLEAN
      do
         Result := not unknown
      end

feature {CGI}
   error: BOOLEAN

   set_length (a_length: like length)
      require
         a_length >= 0
      do
         unknown := False
         length := a_length
      ensure
         is_known
         length = a_length
      end

   set_error
      do
         error := True
      ensure
         error
      end

feature {}
   unknown: BOOLEAN

invariant
   length >= 0

end -- class CGI_CONTENT_LENGTH
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
