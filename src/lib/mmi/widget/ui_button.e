-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class UI_BUTTON

inherit
   UI_WIDGET

create {ANY}
   make

feature {ANY}
   label: UNICODE_STRING

   set_label (a_label: UNICODE_STRING)
      do
         label := a_label
      end

feature {ANY}
   on_click (action: PROCEDURE[TUPLE[UI_BUTTON]])
      require
         action /= Void
      do
         actions.add_last(action)
      end

   click
      do
         actions.for_each(agent (action: PROCEDURE[TUPLE[UI_BUTTON]]) do action.call([Current]) end)
      end

feature {}
   make (a_id: ABSTRACT_STRING)
      require
         a_id /= Void
      do
         id := a_id.intern
         create actions.with_capacity(1)
      ensure
         id = a_id.intern
      end

   actions: FAST_ARRAY[PROCEDURE[TUPLE[UI_BUTTON]]]

feature {}
   connect_bridge (a_job: UI_JOB): UI_CONNECT_ITEM
      do
         Result := a_job.connect_bridge_button(Current)
      end

end -- class UI_BUTTON
--
-- Copyright (C) 2012-2016: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
