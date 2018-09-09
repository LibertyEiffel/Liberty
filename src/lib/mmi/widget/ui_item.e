-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_ITEM

feature {ANY}
   id: FIXED_STRING

   connect_to (a_job: UI_JOB): UI_CONNECT_ITEM
      require
         a_job /= Void
      do
         Result := connect_bridge(a_job)
         if registered = Void then
            create registered.make(0)
            registered.add_last(create {WEAK_REFERENCE[UI_CONNECT_ITEM]}.set_item(Result))
         elseif not registered.exists(agent (item: WEAK_REFERENCE[UI_CONNECT_ITEM]; new: UI_CONNECT_ITEM): BOOLEAN
                                      do
                                         if item.item = Void then
                                            item.set_item(new)
                                            Result := True
                                         end
                                      end (?, Result))
         then
            registered.add_last(create {WEAK_REFERENCE[UI_CONNECT_ITEM]}.set_item(Result))
         end
      end

feature {}
   connect_bridge (a_job: UI_JOB): UI_CONNECT_ITEM
      require
         a_job /= Void
      deferred
      end

   id_memory: like id_memory_
      do
         Result := id_memory_
         if Result = Void then
            Result := id
            id_memory_ := Result
         end
      end

   id_memory_: FIXED_STRING
   registered: FAST_ARRAY[WEAK_REFERENCE[UI_CONNECT_ITEM]]

invariant
   has_id: id /= Void
   constant_id: id = id_memory
   interned_id: id.intern = id

end -- class UI_ITEM
--
-- Copyright (C) 2012-2018: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
