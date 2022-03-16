-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class LINKED_COLLECTION[E_]
   --
   -- Common root of LINKED_LIST and TWO_WAY_LINKED_LIST.
   --

insert
   COLLECTION[E_]

feature {ANY}
   lower: INTEGER 1
         -- Lower index bound is frozen.

   upper: INTEGER
         -- Memorized upper index bound.

   make
         -- Make an empty list
      deferred
      end

   remove_head (n: INTEGER)
      local
         i: INTEGER
      do
         from
            i := n
         until
            i = 0
         loop
            remove_first
            i := i - 1
         end
      end

   remove_tail (n: INTEGER)
      local
         i: INTEGER
      do
         from
            i := n
         until
            i = 0
         loop
            remove_last
            i := i - 1
         end
      end

   first_index_of (element: like item): INTEGER
      do
         Result := index_of(element, lower)
      end

   fast_first_index_of (element: like item): INTEGER
      do
         Result := fast_index_of(element, lower)
      end

feature {} -- Implement manifest generic creation:
   manifest_make (needed_capacity: INTEGER)
         -- Manifest creation of a list of items of type E_.
      do
         make
      end

   manifest_put (index: INTEGER; element: like item)
      do
         add_last(element)
      end

end -- class LINKED_COLLECTION
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
