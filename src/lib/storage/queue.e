-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class QUEUE[E_]
   --
   -- A Queue of elements of type `E_'.
   --

insert
   RING_ARRAY[E_]
      rename add as collection_add,
         add_last as add,
         remove as collection_remove,
         remove_first as remove,
         make as collection_make,
         with_capacity as collection_with_capacity
      export {ANY} is_empty, add, remove, first, count;
         {QUEUE} all
      redefine
         new_iterator
      end
   ANY
      -- To get reasonable default exports
      undefine out_in_tagged_out_memory, copy, is_equal, default_create
      end

create {ANY}
   make, with_capacity

create {RING_ARRAY}
   collection_make

feature {}
   make
         -- Create an empty array. Also consider `with_capacity',
         -- since growing a full queue is rather expensive.
      do
         with_capacity(16)
      ensure
         is_empty
      end

   with_capacity (needed_capacity: INTEGER)
         -- Create an empty array with capacity initialized
         -- at least to `needed_capacity'
      require
         needed_capacity >= 0
      do
         collection_with_capacity(needed_capacity, 1)
      end

   new_iterator: ITERATOR[E_]
      do
         check
            False
         end
      end

end -- class QUEUE
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
