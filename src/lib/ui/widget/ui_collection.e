-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_COLLECTION[UI_ -> UI_ITEM]

inherit
   ITERABLE[UI_]

insert
   UI_ITEM
      undefine
         out_in_tagged_out_memory
      redefine
         connect_to
      end

feature {ANY}
   connect_to (a_job: like job) is
      do
         Precursor(a_job)
         children.do_all(agent (a_child: UI_; a_job: like job) is
                         do
                            a_child.connect_to(a_job)
                         end (?, a_job))
      end

feature {ANY}
   count: INTEGER is
      do
         Result := children.count
      end

   is_empty: BOOLEAN is
      do
         Result := children.is_empty
      end

   new_iterator: ITERATOR[UI_] is
      do
         Result := children.new_iterator
      end

feature {UI_COLLECTION}
   children: ITERABLE[UI_]

invariant
   children /= Void

end -- class UI_COLLECTION
--
-- Copyright (c) 2012 Cyril ADRIAN <cyril.adrian@gmail.com>.
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
