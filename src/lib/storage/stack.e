-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STACK[E_]
   --
   -- A Stack of elements of type `E_'.
   --

insert
   FAST_ARRAY[E_]
      rename last as top,
         add_last as push,
         remove_last as pop,
         make as collection_make
      export {ANY} is_empty, top, pop, push, count;
         {STACK} all
      redefine new_iterator
      end
   ANY
      -- To get reasonable default exports
      undefine out_in_tagged_out_memory, copy, is_equal
      end

creation {ANY}
   make, with_capacity

creation {FAST_ARRAY}
   collection_make

feature {}
   make is
      do
         with_capacity(16)
      ensure
         is_empty
      end

   new_iterator: ITERATOR[E_] is
      do
         check
            False
         end
      end

end -- class STACK
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
