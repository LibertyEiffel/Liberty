-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class UI_WINDOW

insert
   UI_ITEM
      redefine
         connect_to
      end

create {ANY}
   make

feature {ANY}
   panel: UI_PANEL
   menu: UI_MENU
   title: UNICODE_STRING

   set_title (a_title: UNICODE_STRING)
      do
         title := a_title
      end

feature {ANY}
   connect_to (a_job: UI_JOB): UI_CONNECT_ITEM
      local
         connect_result: UI_CONNECT_TYPED_ITEM[UI_BRIDGE_WINDOW]
         connect_panel: UI_CONNECT_TYPED_ITEM[UI_BRIDGE_PANEL]
         connect_menu: UI_CONNECT_TYPED_ITEM[UI_BRIDGE_MENU]
      do
         connect_panel ::= panel.connect_to(a_job)
         connect_menu ::= menu.connect_to(a_job)
         Result := Precursor(a_job)
         connect_result ::= Result
         connect_result.item.set_panel(connect_panel.item)
         connect_result.item.set_menu(connect_menu.item)
      end

feature {}
   make (a_id: ABSTRACT_STRING)
      require
         a_id /= Void
      do
         id := a_id.intern
         create panel.make(a_id)
         create menu.make(a_id)
         title := once U"(new window)"
      ensure
         id = a_id.intern
      end

feature {}
   connect_bridge (a_job: UI_JOB): UI_CONNECT_ITEM
      do
         Result := a_job.connect_bridge_window(Current)
      end

end -- class UI_WINDOW
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
