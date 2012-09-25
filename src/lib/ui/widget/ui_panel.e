-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class UI_PANEL

inherit
   UI_WIDGET
      undefine
         connect_to, out_in_tagged_out_memory
      end

insert
   UI_COLLECTION[UI_WIDGET]
      redefine
         children
      end

create {ANY}
   make

feature {}
   make (a_id: ABSTRACT_STRING) is
      require
         a_id /= Void
      do
         id := a_id.intern
         create children.make
      ensure
         id = a_id.intern
      end

   children: HASHED_DICTIONARY[UI_WIDGET, FIXED_STRING]

feature {}
   bridge: UI_BRIDGE_PANEL

   set_bridge is
      do
         bridge := job.new_bridge_panel(id)
      end

end -- class UI_PANEL
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
