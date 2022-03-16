-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TWO_WAY_LINKED_LIST_NODE[E_]
   --
   -- To implement TWO_WAY_LINKED_LIST.
   --

inherit
   ANY_TWO_WAY_LINKED_LIST_NODE

create {TWO_WAY_LINKED_LIST}
   make

feature {ITERATOR_ON_TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST_NODE}
   item: E_

   previous, next: like Current

feature {TWO_WAY_LINKED_LIST}
   make (i: like item; p: like previous; n: like next)
      do
         item := i
         previous := p
         next := n
      ensure
         item = i
         previous = p
         next = n
      end

feature {TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST_NODE}
   set_item (i: like item)
      do
         item := i
      ensure
         item = i
      end

   set_next (n: like next)
      do
         next := n
      ensure
         next = n
      end

   set_all_with (v: like item)
      local
         lnk: like Current
      do
         from
            lnk := Current
         until
            lnk = Void
         loop
            lnk.set_item(v)
            lnk := lnk.next
         end
      end

   set_previous (p: like previous)
      do
         previous := p
      ensure
         previous = p
      end

end -- class TWO_WAY_LINKED_LIST_NODE
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
