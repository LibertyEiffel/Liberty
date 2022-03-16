-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class UI_PANEL

inherit
   UI_WIDGET
      undefine
         connect_to, out_in_tagged_out_memory
      redefine
         find
      end

insert
   UI_COLLECTION[UI_WIDGET]
      redefine
         children
      end

create {ANY}
   make

feature {ANY}
   find (a_id: ABSTRACT_STRING): UI_WIDGET
      local
         id_: FIXED_STRING
      do
         id_ := a_id.intern
         if id = id_ then
            Result := Current
         else
            Result := children.aggregate(agent (res, val: UI_WIDGET; key: FIXED_STRING): UI_WIDGET
                                         do
                                            if res /= Void then
                                               Result := res
                                            elseif key = id_ then
                                               Result := val
                                            else
                                               Result := val.find(id_)
                                            end
                                         end (?, ?, ?), Void)
         end
      end

feature {}
   make (a_id: ABSTRACT_STRING)
      require
         a_id /= Void
      do
         id := a_id.intern
         create children.make
      ensure
         id = a_id.intern
      end

   children: HASHED_DICTIONARY[UI_WIDGET, FIXED_STRING]

   connect_bridge (a_job: UI_JOB): UI_CONNECT_ITEM
      do
         Result := a_job.connect_bridge_panel(Current)
      end

   connect_children (a_connect: UI_CONNECT_ITEM; a_connect_children: FAST_ARRAY[UI_CONNECT_ITEM])
      local
         connect: UI_CONNECT_TYPED_ITEM[UI_BRIDGE_PANEL]
      do
         connect ::= a_connect
         a_connect_children.for_each(agent (child: UI_CONNECT_ITEM)
                                     local
                                        connect_child: UI_CONNECT_TYPED_ITEM[UI_BRIDGE_WIDGET]
                                     do
                                        connect_child ::= child
                                        connect.item.add(connect_child.item)
                                     end (?))
      end

end -- class UI_PANEL
--
-- Copyright (C) 2012-2022: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
