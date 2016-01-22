-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_BIT_STRING
   -- Please do not use this class directly. Look at `ITERATOR'.

inherit
   ITERATOR[BOOLEAN]

create {BIT_STRING}
   make

feature {}
   bit_string: BIT_STRING

   index: INTEGER

   make (bit_string_: like bit_string)
      do
         bit_string := bit_string_
         start
      ensure
         bit_string = bit_string_
      end

feature {ANY}
   start
      do
         index := bit_string.lower
         generation := iterable_generation
      end

   is_off: BOOLEAN
      do
         Result := index > bit_string.upper
      end

   item: BOOLEAN
      do
         Result := bit_string.item(index)
      end

   next
      do
         index := index + 1
      end

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := bit_string.generation
      end

   generation: INTEGER

invariant
   bit_string /= Void

end -- class ITERATOR_ON_BIT_STRING
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
