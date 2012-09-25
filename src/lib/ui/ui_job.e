-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_JOB

inherit
   JOB

insert
   LOGGING

feature {}
   connect (a_window: like window; a_on_new_job: like on_new_job) is
      require
         not a_window.is_connected
      do
         a_window.connect_to(Current)
         window := a_window
         if a_on_new_job /= Void then
            on_new_job := a_on_new_job
         else
            on_new_job := agent (job: JOB) is do log.trace.put_line("job lost!") end
         end
      ensure
         window = a_window
      end

   window: UI_WINDOW
   on_new_job: PROCEDURE[TUPLE[JOB]]

feature {UI_ITEM}
   new_bridge_window (id: FIXED_STRING): UI_TYPED_BRIDGE_WINDOW[like Current] is
      require
         id /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_panel (id: FIXED_STRING): UI_TYPED_BRIDGE_PANEL[like Current] is
      require
         id /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_menu (id: FIXED_STRING): UI_TYPED_BRIDGE_MENU[like Current] is
      require
         id /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_text_field (id: FIXED_STRING): UI_TYPED_BRIDGE_TEXT_FIELD[like Current] is
      require
         id /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_button (id: FIXED_STRING): UI_TYPED_BRIDGE_BUTTON[like Current] is
      require
         id /= Void
      deferred
      ensure
         Result /= Void
      end

invariant
   window /= Void
   on_new_job /= Void

end -- class UI_JOB
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
