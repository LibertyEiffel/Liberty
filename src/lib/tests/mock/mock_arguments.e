-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_ARGUMENTS

insert
   ANY
      redefine
         out_in_tagged_out_memory
      end

create {MOCK_EXPECT, MOCK_OBJECT}
   make0, make1, make2, make3, make4, make5, make6, make7, make8, make9, make10

feature {ANY}
   count: INTEGER
      do
         Result := arguments.count
      end

   valid_index (i: INTEGER): BOOLEAN
      do
         Result := i.in_range(1, count)
      end

   item (i: INTEGER): MOCK_ARGUMENT
      require
         valid_index(i)
      do
         Result := arguments.item(i - 1)
      end

   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         if count > 0 then
            tagged_out_memory.extend('(')
            from
               i := arguments.lower
            until
               i > arguments.upper
            loop
               if i > arguments.lower then
                  tagged_out_memory.append(once ", ")
               end
               arguments.item(i).out_in_tagged_out_memory
               i := i + 1
            end
            tagged_out_memory.extend(')')
         end
      end

feature {}
   make0
      do
         create arguments
      end

   make1 (a1: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1 >> }
      end

   make2 (a1, a2: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2 >> }
      end

   make3 (a1, a2, a3: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3 >> }
      end

   make4 (a1, a2, a3, a4: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4 >> }
      end

   make5 (a1, a2, a3, a4, a5: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4, a5 >> }
      end

   make6 (a1, a2, a3, a4, a5, a6: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4, a5, a6 >> }
      end

   make7 (a1, a2, a3, a4, a5, a6, a7: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4, a5, a6, a7 >> }
      end

   make8 (a1, a2, a3, a4, a5, a6, a7, a8: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4, a5, a6, a7, a8 >> }
      end

   make9 (a1, a2, a3, a4, a5, a6, a7, a8, a9: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4, a5, a6, a7, a8, a9 >> }
      end

   make10 (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10: MOCK_ARGUMENT)
      do
         arguments := {FAST_ARRAY[MOCK_ARGUMENT] << a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 >> }
      end

   arguments: FAST_ARRAY[MOCK_ARGUMENT]

end -- class MOCK_ARGUMENTS
--
-- Copyright (C) 2013-2018: Cyril ADRIAN <cyril.adrian@gmail.com>
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
