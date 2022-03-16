-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_TWO_WAY_LINKED_LIST[E_]
   -- Please do not use this class directly. Look at `ITERATOR'.

inherit
   ITERATOR[E_]

create {ANY}
   make

feature {}
   linked_list: TWO_WAY_LINKED_LIST[E_]
         -- The one to be traversed.

   item_link: TWO_WAY_LINKED_LIST_NODE[E_]
         -- Memorize the current position.

feature {ANY}
   make (twll: TWO_WAY_LINKED_LIST[E_])
      require
         twll /= Void
      do
         linked_list := twll
         start
      ensure
         linked_list = twll
      end

   start
      do
         item_link := linked_list.first_link
         generation := iterable_generation
      end

   is_off: BOOLEAN
      do
         Result := item_link = Void
      end

   item: E_
      do
         Result := item_link.item
      end

   next
      do
         item_link := item_link.next
      end

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := linked_list.generation
      end

   generation: INTEGER

end -- class ITERATOR_ON_TWO_WAY_LINKED_LIST
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
