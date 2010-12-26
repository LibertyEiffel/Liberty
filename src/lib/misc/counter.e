-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class COUNTER
   --
   -- Simple counter object (useful as a once function).
   --

feature {ANY}
   value: INTEGER
         -- The `value' of the counter.

   increment is
         -- Increment the `value' of `Current' counter.
      do
         value := value + 1
      ensure
         value = 1 + old value
      end

   decrement is
         -- Decrement the `value' of `Current' counter.
      do
         value := value - 1
      ensure
         value + 1 = old value
      end

   reset is
         -- Reset the `value' of `Current' counter.
      do
         value := 0
      ensure
         value = 0
      end

   append_in (buffer: STRING) is
         -- Append the `value' of the `Current' counter in the `buffer'.
      do
         value.append_in(buffer)
      end

end -- class COUNTER
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
