-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PARSE_ERROR

create {ANY}
   make

feature {ANY}
   index: INTEGER
   message: STRING
   next: PARSE_ERROR

feature {PARSE_ERROR}
   set_next (a_next: like next)
      require
         a_next /= Void
         a_next /= Current
      do
         if next = Void then
            next := a_next
         else
            next.set_next(a_next)
         end
      ensure
         last = a_next
      end

   last: PARSE_ERROR
      do
         if next = Void then
            Result := Current
         else
            Result := next.last
         end
      ensure
         Result /= Void
      end

feature {}
   make (a_index: like index; a_message: like message; a_previous: PARSE_ERROR)
      require
         a_message /= Void
      do
         index := a_index
         message := a_message
         if a_previous /= Void then
            a_previous.set_next(Current)
         end
      ensure
         index = a_index
         message = a_message
         a_previous /= Void implies a_previous.last = Current
      end

end -- class PARSE_ERROR
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
