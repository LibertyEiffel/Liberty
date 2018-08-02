-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LINKED_LIST_NODE[E_]
   --
   -- To implement LINKED_LIST.
   --

inherit
   ANY_LINKED_LIST_NODE

create {LINKED_LIST}
   make

feature {LINKED_LIST_NODE, ITERATOR_ON_LINKED_LIST, LINKED_LIST}
   item: E_

   next: like Current

feature {LINKED_LIST}
   make (i: like item; n: like next)
      do
         item := i
         next := n
      ensure
         item = i
         next = n
      end

feature {LINKED_LIST_NODE, LINKED_LIST}
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

end -- class LINKED_LIST_NODE
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
