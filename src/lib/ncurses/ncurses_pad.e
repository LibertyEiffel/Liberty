-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_PAD
   --
   -- One window in the NCURSES world.
   --
   -- The current position of the cursor is given by `cursor_x' and `cursor_y'.
   --

inherit
   NCURSES_WINDOW
      redefine refresh_later
      end

create {ANY}
   make_pad

create {NCURSES_PAD}
   make_sub_pad

feature {ANY}
   create_sub_pad (x, y, columns, lines: INTEGER): NCURSES_PAD
      require
         ncurses.is_enabled
      do
         create Result.make_sub_pad(Current, x, y, columns, lines)
      end

   set_visible (vl, vt: INTEGER)
         -- Convenience only
      do
         set_visible_left(vl)
         set_visible_top(vt)
      end

   set_visible_left (vl: like visible_left)
      require
         vl >= 0
      do
         visible_left := vl
      ensure
         visible_left = vl
      end

   visible_left: INTEGER

   set_visible_top (vt: like visible_top)
      require
         vt >= 0
      do
         visible_top := vt
      ensure
         visible_top = vt
      end

   visible_top: INTEGER

   set_viewport (x, y, w, h: INTEGER)
      require
         x.in_range(0, parent.width - 2)
         y.in_range(0, parent.height - 2)
         w >= 1
         h >= 1
         (x + w).in_range(1, parent.width - 1)
         (y + h).in_range(1, parent.height - 1)
      do
         viewport_left := x
         viewport_top := y
         viewport_width := w
         viewport_height := h
      ensure
         viewport_left = x
         viewport_top = y
         viewport_width = w
         viewport_height = h
      end

   viewport_left, viewport_top, viewport_width, viewport_height: INTEGER

   refresh_later
      local
         ok: INTEGER
      do
         ok := pnoutrefresh(widget, visible_top, visible_left, viewport_top, viewport_left, viewport_top + viewport_height, viewport_left + viewport_width)
         ncurses.check_for_error(ok = ncurses.ok)
      end

feature {}
   make_pad (columns, lines: INTEGER)
      do
         set_widget(newpad(lines, columns))
         set_parent(ncurses.get_root_window)
         init
      end

   make_sub_pad (p: NCURSES_PAD; x, y, columns, lines: INTEGER)
      require
         ncurses.is_enabled
      do
         set_widget(subpad(p.widget, lines, columns, y, x))
         set_parent(p)
         init
      end

   newpad (h, w: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "newpad"
         }"
      end

   subpad (orig: POINTER; h, w, y, x: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "subpad"
         }"
      end

   pnoutrefresh (pad: POINTER; pminrow, pmincol, sminrow, smincol, smaxrow, smaxcol: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "pnoutrefresh"
         }"
      end

end -- class NCURSES_PAD
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
