-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_MATCHERS

insert
   ANY
      redefine
         out_in_tagged_out_memory
      end

create {MOCK_EXPECT}
   make0, make1, make2, make3, make4, make5, make6, make7, make8, make9, make10

feature {MOCK_EXPECTATION}
   count: INTEGER
      do
         Result := matchers.count
      end

   valid_index (i: INTEGER): BOOLEAN
      do
         Result := i.in_range(1, count)
      end

   item (i: INTEGER): MOCK_MATCHER
      require
         valid_index(i)
      do
         Result := matchers.item(i - 1)
      end

   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         if count > 0 then
            tagged_out_memory.extend('(')
            from
               i := matchers.lower
            until
               i > matchers.upper
            loop
               if i > matchers.lower then
                  tagged_out_memory.append(once ", ")
               end
               matchers.item(i).out_in_tagged_out_memory
               i := i + 1
            end
            tagged_out_memory.extend(')')
         end
      end

feature {}
   make0
      do
         create matchers
      end

   make1 (a1: MOCK_MATCHER)
      require
         a1 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1 >> }
      end

   make2 (a1, a2: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2 >> }
      end

   make3 (a1, a2, a3: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3 >> }
      end

   make4 (a1, a2, a3, a4: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4 >> }
      end

   make5 (a1, a2, a3, a4, a5: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
         a5 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4, a5 >> }
      end

   make6 (a1, a2, a3, a4, a5, a6: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
         a5 /= Void
         a6 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4, a5, a6 >> }
      end

   make7 (a1, a2, a3, a4, a5, a6, a7: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
         a5 /= Void
         a6 /= Void
         a7 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4, a5, a6, a7 >> }
      end

   make8 (a1, a2, a3, a4, a5, a6, a7, a8: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
         a5 /= Void
         a6 /= Void
         a7 /= Void
         a8 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4, a5, a6, a7, a8 >> }
      end

   make9 (a1, a2, a3, a4, a5, a6, a7, a8, a9: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
         a5 /= Void
         a6 /= Void
         a7 /= Void
         a8 /= Void
         a9 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4, a5, a6, a7, a8, a9 >> }
      end

   make10 (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10: MOCK_MATCHER)
      require
         a1 /= Void
         a2 /= Void
         a3 /= Void
         a4 /= Void
         a5 /= Void
         a6 /= Void
         a7 /= Void
         a8 /= Void
         a9 /= Void
         a10 /= Void
      do
         matchers := {FAST_ARRAY[MOCK_MATCHER] << a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 >> }
      end

   matchers: FAST_ARRAY[MOCK_MATCHER]

invariant
   matchers.for_all(agent (m: MOCK_MATCHER): BOOLEAN do then m /= Void end (?))

end -- class MOCK_MATCHERS
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
