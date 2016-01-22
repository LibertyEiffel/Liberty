-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_WINDOW

inherit
   UI_TYPED_BRIDGE_WINDOW[CURSES_JOB, CURSES_PANEL, CURSES_MENU]

insert
   CURSES_ITEM[UI_WINDOW]
   JSON_HANDLER
   LOGGING

create {CURSES_JOB}
   make

feature {ANY}
   panel: CURSES_PANEL
   menu: CURSES_MENU

   title: UNICODE_STRING
      do
         Result := ui.title
      end

feature {UI_WINDOW}
   set_panel (a_panel: CURSES_PANEL)
      do
         panel := a_panel
      end

   set_menu (a_menu: CURSES_MENU)
      do
         menu := a_menu
      end

feature {CURSES_APPLICATION}
   start: BOOLEAN
      do
         if window = Void then
            attach_window
         end
         Result := menu.start or else panel.start
      end

   key_pressed (code: INTEGER): BOOLEAN
      do
      end

   resized: BOOLEAN
      do
      end

feature {}
   window: CURSES_DESC_WINDOW

   attach_window
      local
         path: STRING
         tfr: TEXT_FILE_READ
         parser: JSON_PARSER
         text: JSON_TEXT
         desc: JSON_OBJECT
      do
         path := once ""
         path.make_from_string(id)
         path.append(once ".curses")
         log.info.put_line(once "Looking for window descriptor #(1)" # path)
         create tfr.connect_to(path)
         if tfr.is_connected then
         log.info.put_line(once "Parsing window descriptor #(1)" # path)
            create parser.make(agent log.error.put_line)
            text := parser.parse_json_text(tfr)
            if text /= Void and desc ?:= text then
               desc ::= text
               log.info.put_line(once "Building window #(1)" # id)
               create window.make(ui, desc)
            else
               log.error.put_line(once "Invalid curses descriptor file: #(1)" # path)
            end
            tfr.disconnect
         else
            log.error.put_line(once "Curses descriptor file not found: #(1)" # path)
         end
      end

end -- class CURSES_WINDOW
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
