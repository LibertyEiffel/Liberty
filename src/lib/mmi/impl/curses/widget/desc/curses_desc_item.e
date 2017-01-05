-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CURSES_DESC_ITEM

insert
   CURSES_DESCRIPTOR

feature {CURSES_DESCRIPTOR}
   build (parent: NCURSES_WINDOW)
      require
         parent /= Void
         ncurses_widget = Void
      deferred
      ensure
         ncurses_widget /= Void
      end

   layout (a_x, a_y, a_width, a_height: INTEGER)
      require
         ncurses_widget /= Void
         a_width > 0
         a_height > 0
         a_x.in_range(0, a_width - 1)
         a_y.in_range(0, a_height - 1)
      deferred
      ensure
         x = a_x
         y = a_y
         width = a_width
         height = a_height
      end

   x: INTEGER
      deferred
      end

   y: INTEGER
      deferred
      end

   width: INTEGER
      deferred
      end

   height: INTEGER
      deferred
      end

   min_width: INTEGER
      deferred
      end

   min_height: INTEGER
      deferred
      end

   max_width: INTEGER
      deferred
      end

   max_height: INTEGER
      deferred
      end

feature {}
   ncurses_widget: NCURSES_WINDOW

end -- class CURSES_DESC_ITEM
--
-- Copyright (C) 2012-2017: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
