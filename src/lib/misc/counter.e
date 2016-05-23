-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class COUNTER
   --
   -- Simple counter object (useful as a once function).
   --

insert
   REFERENCE[INTEGER]

create {ANY}
   default_create, set_item

feature {ANY}
   increment, next
         -- Increment the `item' of `Current' counter.
      do
         item := item + 1
      ensure
         item = 1 + old item
      end

   decrement, previous
         -- Decrement the `item' of `Current' counter.
      do
         item := item - 1
      ensure
         item + 1 = old item
      end

   reset, start
         -- Reset the `item' of `Current' counter.
      do
         item := 0
      ensure
         item = 0
      end

   append_in (buffer: STRING)
         -- Append the `item' of the `Current' counter in the `buffer'.
      do
         item.append_in(buffer)
      end

   value: INTEGER
      obsolete "use `item' instead"
      do
         Result := item
      end

end -- class COUNTER
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
