-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PACKRAT_POSITION

insert
   PACKRAT_INTERNAL
      redefine
         default_create, is_equal
      end

create {PACKRAT_INTERNAL}
   default_create

feature {PACKRAT_INTERNAL}
   next (buffer: MINI_PARSER_BUFFER): like Current
      do
         buffer.next
         index := buffer.current_index
         if not buffer.end_reached then
            inspect
               buffer.current_character
            when '%N' then
               line := line + 1
               column := 1
            when '%R' then
               -- ignored
            else
               column := column + 1
            end
         end
         Result := Current
      end

feature {PACKRAT_INTERNAL}
   line: INTEGER
   column: INTEGER
   index: INTEGER

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := index = other.index
      end

feature {}
   default_create
      do
         index := 1
         line := 1
         column := 1
      end

end -- class PACKRAT_POSITION
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
