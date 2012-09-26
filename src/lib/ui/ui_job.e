-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_JOB

inherit
   JOB

insert
   LOGGING

feature {}
   connect (a_application: UI_APPLICATION; a_on_new_job: like on_new_job) is
      require
         a_application /= Void
      do
         if a_on_new_job /= Void then
            on_new_job := a_on_new_job
         else
            on_new_job := agent (job: JOB) is do log.trace.put_line("job lost!") end
         end
         a_application.connect_to(Current)
         restart
      end

   application: UI_TYPED_BRIDGE_APPLICATION[like Current]
   on_new_job: PROCEDURE[TUPLE[JOB]]

feature {UI_ITEM}
   connect_bridge_application (ui: UI_APPLICATION) is
      require
         ui /= Void
      do
         application := new_bridge_application(ui)
         application.connect_to(Current)
      end

   connect_bridge_window (ui: UI_WINDOW) is
      require
         ui /= Void
      do
         new_bridge_window(ui).connect_to(Current)
      end

   connect_bridge_panel (ui: UI_PANEL) is
      require
         ui /= Void
      do
         new_bridge_panel(ui).connect_to(Current)
      end

   connect_bridge_menu (ui: UI_MENU) is
      require
         ui /= Void
      do
         new_bridge_menu(ui).connect_to(Current)
      end

   connect_bridge_text_field (ui: UI_TEXT_FIELD) is
      require
         ui /= Void
      do
         new_bridge_text_field(ui).connect_to(Current)
      end

   connect_bridge_button (ui: UI_BUTTON) is
      require
         ui /= Void
      do
         new_bridge_button(ui).connect_to(Current)
      end

feature {}
   new_bridge_application (ui: UI_APPLICATION): UI_TYPED_BRIDGE_APPLICATION[like Current] is
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_window (ui: UI_WINDOW): UI_TYPED_BRIDGE_WINDOW[like Current] is
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_panel (ui: UI_PANEL): UI_TYPED_BRIDGE_PANEL[like Current] is
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_menu (ui: UI_MENU): UI_TYPED_BRIDGE_MENU[like Current] is
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_text_field (ui: UI_TEXT_FIELD): UI_TYPED_BRIDGE_TEXT_FIELD[like Current] is
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_button (ui: UI_BUTTON): UI_TYPED_BRIDGE_BUTTON[like Current] is
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

invariant
   application /= Void
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
