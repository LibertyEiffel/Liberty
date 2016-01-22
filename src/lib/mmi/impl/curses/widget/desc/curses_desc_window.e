-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_DESC_WINDOW

insert
   CURSES_DESCRIPTOR
   LOGGING

create {CURSES_WINDOW}
   make

feature {ANY}
   panel: CURSES_DESC_PANEL
   menu: CURSES_DESC_MENU

feature {}
   window: NCURSES_WINDOW

   make (ui: UI_WINDOW; desc: JSON_OBJECT)
      require
         desc /= Void
      do
         log.trace.put_line(once "describing panel for window #(1)" # ui.id)
         create panel.make(ui, desc.item(once "panel"))
         log.trace.put_line(once "describing menu for window #(1)" # ui.id)
         create menu.make(ui, desc.item(once "menu"))
         build(ui)
         log.trace.put_line(once "window #(1) is ready" # ui.id)
      end

   build (ui: UI_WINDOW)
      local
         root: NCURSES_WINDOW
      do
         root := ncurses.get_root_window
         create window.make(0, 0, root.width, root.height)
         log.trace.put_line(once "building panel for window #(1)" # ui.id)
         menu.build(window)
         log.trace.put_line(once "building menu for window #(1)" # ui.id)
         panel.build(window)
         log.trace.put_line(once "laying out menu for window #(1)" # ui.id)
         menu.layout(0, 0, root.width, 1)
         log.trace.put_line(once "laying out panel for window #(1)" # ui.id)
         panel.layout(0, menu.height, root.width, root.height - menu.height)
      end

end -- class CURSES_DESC_WINDOW
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
