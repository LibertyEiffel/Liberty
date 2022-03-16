-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READLINE_WINDOW

inherit
   UI_TYPED_BRIDGE_WINDOW[READLINE_JOB, READLINE_PANEL, READLINE_MENU]

insert
   READLINE_ITEM[UI_WINDOW]
   LOGGING

create {READLINE_JOB}
   make

feature {ANY}
   panel: READLINE_PANEL
   menu: READLINE_MENU

   title: UNICODE_STRING
      do
         Result := ui.title
      end

feature {UI_WINDOW}
   set_panel (a_panel: READLINE_PANEL)
      do
         panel := a_panel
      end

   set_menu (a_menu: READLINE_MENU)
      do
         menu := a_menu
      end

feature {READLINE_APPLICATION}
   run (context: READLINE_CONTEXT): BOOLEAN
      do
         Result := menu.run(context) or else panel.run(context)
      end

end -- class READLINE_WINDOW
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
