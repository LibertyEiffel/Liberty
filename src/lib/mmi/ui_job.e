-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_JOB

inherit
   JOB

insert
   LOGGING

feature {}
   connect (a_application: UI_APPLICATION; a_on_new_job: like on_new_job)
      require
         a_application /= Void
      local
         dummy: UI_CONNECT_ITEM
      do
         if a_on_new_job /= Void then
            on_new_job := a_on_new_job
         else
            on_new_job := agent (job: JOB) is do log.trace.put_line("job lost!") end
         end
         dummy := a_application.connect_to(Current)
         restart
      end

   application: UI_TYPED_BRIDGE_APPLICATION[like Current,
                                            UI_TYPED_BRIDGE_WINDOW[like Current,
                                                                   UI_TYPED_BRIDGE_PANEL[like Current,
                                                                                         UI_TYPED_BRIDGE_WIDGET[like Current]],
                                                                   UI_TYPED_BRIDGE_MENU[like Current,
                                                                                        UI_TYPED_BRIDGE_MENU_ITEM[like Current]]]]

   on_new_job: PROCEDURE[TUPLE[JOB]]

feature {UI_ITEM}
   connect_bridge_application (ui: UI_APPLICATION): UI_CONNECT_TYPED_ITEM[like new_bridge_application]
      require
         ui /= Void
      do
         application := new_bridge_application(ui)
         application.connect_to(Current)
         create Result.set_item(application)
      end

   connect_bridge_window (ui: UI_WINDOW): UI_CONNECT_TYPED_ITEM[like new_bridge_window]
      require
         ui /= Void
      local
         window: like new_bridge_window
      do
         window := new_bridge_window(ui)
         window.connect_to(Current)
         create Result.set_item(window)
      end

   connect_bridge_panel (ui: UI_PANEL): UI_CONNECT_TYPED_ITEM[like new_bridge_panel]
      require
         ui /= Void
      local
         panel: like new_bridge_panel
      do
         panel := new_bridge_panel(ui)
         panel.connect_to(Current)
         create Result.set_item(panel)
      end

   connect_bridge_menu (ui: UI_MENU): UI_CONNECT_TYPED_ITEM[like new_bridge_menu]
      require
         ui /= Void
      local
         menu: like new_bridge_menu
      do
         menu := new_bridge_menu(ui)
         menu.connect_to(Current)
         create Result.set_item(menu)
      end

   connect_bridge_text_field (ui: UI_TEXT_FIELD): UI_CONNECT_TYPED_ITEM[like new_bridge_text_field]
      require
         ui /= Void
      local
         text_field: like new_bridge_text_field
      do
         text_field := new_bridge_text_field(ui)
         text_field.connect_to(Current)
         create Result.set_item(text_field)
      end

   connect_bridge_button (ui: UI_BUTTON): UI_CONNECT_TYPED_ITEM[like new_bridge_button]
      require
         ui /= Void
      local
         button: like new_bridge_button
      do
         button := new_bridge_button(ui)
         button.connect_to(Current)
         create Result.set_item(button)
      end

feature {}
   new_bridge_application (ui: UI_APPLICATION): like application
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_window (ui: UI_WINDOW): UI_TYPED_BRIDGE_WINDOW[like Current, UI_TYPED_BRIDGE_PANEL[like Current, UI_TYPED_BRIDGE_WIDGET[like Current]], UI_TYPED_BRIDGE_MENU[like Current, UI_TYPED_BRIDGE_MENU_ITEM[like Current]]]
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_panel (ui: UI_PANEL): UI_TYPED_BRIDGE_PANEL[like Current, UI_TYPED_BRIDGE_WIDGET[like Current]]
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_menu (ui: UI_MENU): UI_TYPED_BRIDGE_MENU[like Current, UI_TYPED_BRIDGE_MENU_ITEM[like Current]]
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_text_field (ui: UI_TEXT_FIELD): UI_TYPED_BRIDGE_TEXT_FIELD[like Current]
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

   new_bridge_button (ui: UI_BUTTON): UI_TYPED_BRIDGE_BUTTON[like Current]
      require
         ui /= Void
      deferred
      ensure
         Result /= Void
      end

invariant
   on_new_job /= Void

end -- class UI_JOB
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
