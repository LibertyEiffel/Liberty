-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_TIMES_COUNTER

inherit
   MOCK_TIMES
      redefine
         out_in_tagged_out_memory
      end

insert
   EIFFELTEST_TOOLS
      redefine
         out_in_tagged_out_memory
      end
   COUNTER
      redefine
         set_item, out_in_tagged_out_memory
      end

create {MOCK_EXPECTATION}
   set_item

feature {ANY}
   out_in_tagged_out_memory
      do
         inspect
            initial
         when 0 then
            tagged_out_memory.append(once "never")
         when 1 then
            if item = initial then
               tagged_out_memory.append(once "once")
            else
               check
                  item = 0
               end
               tagged_out_memory.append(once "no more, out of one time")
            end
         else
            inspect
               item
            when 0 then
               tagged_out_memory.append(once "no more")
            when 1 then
               tagged_out_memory.append(once "once")
            else
               item.append_in(tagged_out_memory)
               tagged_out_memory.append(once " times")
            end
            if initial /= item then
               tagged_out_memory.append(once ", out of ")
               initial.append_in(tagged_out_memory)
               tagged_out_memory.append(once " times")
            end
         end
      end

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
         label_assert(once "all done", all_done)
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
         initial := i
         Precursor(i)
      end

feature {}
   initial: INTEGER

invariant
   initial >=0
   item.in_range(0, initial)

end -- class MOCK_TIMES_COUNTER
--
-- Copyright (C) 2013-2022: Cyril ADRIAN <cyril.adrian@gmail.com>
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
