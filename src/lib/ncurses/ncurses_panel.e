-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_PANEL
   -- This class adds a tabbing panel widget.

inherit
   NCURSES_WIDGET

create{ANY}
   make, no_tabs

feature {ANY}
   left: INTEGER

   top: INTEGER

   width: INTEGER

   height: INTEGER

   tabs_hidden: BOOLEAN

   add_tab (text: STRING): NCURSES_PANELTAB
      require
         ncurses.is_enabled
         text /= Void
      do
         if tabs_hidden then
            create Result.no_label(Current)
         else
            create Result.make(Current, text, last_left)
            last_left := last_left + text.count + 2
         end
         if tabs = Void then
            create tabs.with_capacity(2)
         end
         tabs.add_last(Result)
         Result.raise
      end

   refresh_later
      do
         if not tabs_hidden and then last_left + 1 < width then
            window.draw_horizontal_line(last_left, top + 2, horizontal_line, width - last_left + 1)
         end
      end

feature {NCURSES_WIDGET}
   get_window: NCURSES_WINDOW
      do
         Result := window
      end

   parent_resized
      do
      end

feature {NCURSES_PANELTAB}
   raise (pt: NCURSES_PANELTAB)
      local
         i: INTEGER
         tab: NCURSES_PANELTAB
      do
         if tabs /= Void then
            from
               i := tabs.lower
            variant
               tabs.upper - i
            until
               i > tabs.upper
            loop
               tab := tabs.item(i)
               -- We can safely use `=' instead of `is_equal' here because all NCURSES_PANELTAB must be created through `add_tab' and are thus elements of `tabs'
               tab.set_raise(tab = pt)
               i := i + 1
            end
         end
      end

feature {}
   make (nw: like window; x, y, w, h: INTEGER)
      require
         ncurses.is_enabled
         nw /= Void
         x >= 0
         y >= 0
         x + w <= nw.width
         y + h <= nw.height
      do
         set_parent(nw)
         window := nw
         left := x
         top := y
         width := w
         height := h
      ensure
         left = x
         top = y
         width = w
         height = h
         not tabs_hidden
      end

   no_tabs (nw: like window; x, y, w, h: INTEGER)
      require
         ncurses.is_enabled
         nw /= Void
         x >= 0
         y >= 0
         x + w <= nw.width
         y + h <= nw.height
      do
         make(nw, x, y, w, h)
         tabs_hidden := True
      ensure
         left = x
         top = y
         width = w
         height = h
         tabs_hidden
      end

   last_left: INTEGER

   tabs: FAST_ARRAY[NCURSES_PANELTAB]

   window: NCURSES_WINDOW

invariant
   tabs_hidden implies last_left = 0

end -- class NCURSES_PANEL
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
