-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_DESC_BUTTON

inherit
   CURSES_DESC_WIDGET

create {CURSES_DESCRIPTOR}
   make

feature {CURSES_DESCRIPTOR}
   build (parent: NCURSES_WINDOW)
      do
         create {NCURSES_BUTTON} ncurses_widget.make(parent, button.label.to_utf8, 0, 0, 1, 1)
      end

   layout (a_x, a_y, a_width, a_height: INTEGER)
      do
         ncurses_widget.move_to_and_resize(a_x, a_y, a_width, a_height)
      end

   x, y, width, height: INTEGER

   min_width, max_width: INTEGER
      do
         Result := button.label.count.max(1)
      end

   min_height, max_height: INTEGER 1

feature {}
   make (ui: UI_WINDOW; desc: JSON_OBJECT)
      local
         str: JSON_STRING
      do
         str ::= desc.item(once "button")
         button ::= ui.panel.find(str.string.as_utf8)
      end

   button: UI_BUTTON

end -- class CURSES_DESC_BUTTON
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
