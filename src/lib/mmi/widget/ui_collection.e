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
   connect_to (a_job: UI_JOB): UI_CONNECT_ITEM
      local
         children_: FAST_ARRAY[UI_CONNECT_ITEM]
      do
         create children_.with_capacity(children.count)
         children.for_each(agent (a_child: UI_; a_children: FAST_ARRAY[UI_CONNECT_ITEM])
                           do
                              a_children.add_last(a_child.connect_to(a_job))
                           end (?, children_))
         Result := Precursor(a_job)
         connect_children(Result, children_)
      end

feature {ANY}
   count: INTEGER
      do
         Result := children.count
      end

   is_empty: BOOLEAN
      do
         Result := children.is_empty
      end

   new_iterator: ITERATOR[UI_]
      do
         Result := children.new_iterator_on_items
      end

   item (a_id: ABSTRACT_STRING): UI_
      require
         a_id /= Void
         has_id(a_id)
      do
         Result := children.fast_reference_at(a_id.intern)
      end

   add (a_ui: UI_)
      require
         a_ui /= Void
         not has(a_ui)
         not has_id(a_ui.id)
      do
         children.add(a_ui, a_ui.id)
      ensure
         has(a_ui)
      end

   has (a_ui: UI_): BOOLEAN
      require
         a_ui /= Void
      do
         Result := children.fast_reference_at(a_ui.id) = a_ui
      ensure
         Result implies item(a_ui.id) = a_ui
      end

   has_id (a_id: ABSTRACT_STRING): BOOLEAN
      require
         a_id /= Void
      do
         Result := children.fast_has(a_id.intern)
      end

   remove (a_ui: UI_)
      require
         a_ui /= Void
      do
         children.fast_remove(a_ui.id)
      ensure
         not has(a_ui)
      end

feature {UI_COLLECTION}
   children: DICTIONARY[UI_, FIXED_STRING]

feature {}
   connect_children (a_connect: UI_CONNECT_ITEM; a_connect_children: FAST_ARRAY[UI_CONNECT_ITEM])
      deferred
      end

invariant
   children /= Void

end -- class UI_COLLECTION
--
-- Copyright (C) 2012-2017: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
