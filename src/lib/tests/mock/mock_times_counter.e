-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_TIMES_COUNTER

inherit
   MOCK_TIMES

insert
   EIFFELTEST_TOOLS
   COUNTER
      redefine
         set_item
      end

create {MOCK_EXPECTATION}
   set_item

feature {MOCK_EXPECTATION}
   can_call: BOOLEAN
      do
         Result := item > 0
      end

   call
      do
         decrement
      end

   all_called
      do
         assert(all_done)
      end

   all_done: BOOLEAN
      do
         Result := item = 0
      end

feature {MOCK_EXPECTATION}
   set_item (i: INTEGER)
      require --| **** TODO require then
         i >= 0
      do
         Precursor(i)
      end

invariant
   item >= 0

end -- class MOCK_TIMES_COUNTER
--
-- Copyright (c) 2013-2015 Cyril ADRIAN <cyril.adrian@gmail.com>
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
