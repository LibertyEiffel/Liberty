-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_DESC_TEXT_FIELD

inherit
   CURSES_DESC_WIDGET

create {CURSES_DESCRIPTOR}
   make

feature {CURSES_DESCRIPTOR}
   build (parent: NCURSES_WINDOW) is
      do
         -- TODO
      end

   layout (a_x, a_y, a_width, a_height: INTEGER) is
      do
         ncurses_widget.move_to_and_resize(a_x, a_y, a_width, a_height)
      end

   x, y, width, height, min_width, min_height, max_width, max_height: INTEGER

feature {}
   make (ui: UI_WINDOW; desc: JSON_OBJECT) is
      do
      end

end -- class CURSES_DESC_TEXT_FIELD
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
