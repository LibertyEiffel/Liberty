-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_PROGRESSBAR
   -- This class adds a progress bar widget.

inherit
   NCURSES_WIDGET

create {ANY}
   make

feature {ANY}
   left: INTEGER

   top: INTEGER

   width: INTEGER

   height: INTEGER

   min_value: INTEGER

   max_value: INTEGER

   current_value: INTEGER

   set_value (v: like current_value)
      require
         v.in_range(min_value, max_value)
      do
         current_value := v
      end

   refresh_later
      local
         filled, start, todo: INTEGER
         b: BOOLEAN
         s: STRING
      do
         filled := width * (current_value - min_value) // (max_value - min_value)
         s := current_value.to_string
         start := (width - s.count) // 2
         window.set_attribute(ncurses.a_reverse)
         window.draw_horizontal_line(0, 0, space, filled)
         if is_value_displayed and then filled > start then
            todo := s.count.min(filled - start)
            window.put_string_at(s.substring(1, todo), start, 0)
            start := start + todo
            todo := s.count - todo
            b := True
         end
         window.unset_attribute(ncurses.a_reverse)
         if filled < width then
            window.draw_horizontal_line(filled, 0, space, width - filled)
         end
         if is_value_displayed and then (not b or else todo > 0) then
            window.put_string_at(s.substring(todo + 1, s.count), start, 0)
         end
      end

   is_value_displayed: BOOLEAN

   display_value (b: like is_value_displayed)
      do
         is_value_displayed := b
      end

feature {NCURSES_WIDGET}
   get_window: NCURSES_WINDOW
      do
         Result := window
      end

   parent_resized
      do
         if left + width > parent.width then
            width := parent.width - left - 1
         end
      end

feature {}
   make (p: like parent; x, y, w, min, max: INTEGER)
      require
         ncurses.is_enabled
         p /= Void
         x >= 0
         y >= 0
         x + w <= p.width
         max >= min
      do
         left := x
         top := y
         width := w
         height := 1
         min_value := min
         max_value := max
         current_value := min_value
         set_parent(p)
         window := p.get_window.create_sub_window(left, top, width, height)
      ensure
         left = x
         top = y
         width = w
         height = 1
      end

   window: NCURSES_WINDOW

invariant
   window /= Void
   max_value >= min_value
   current_value.in_range(min_value, max_value)

end -- class NCURSES_PROGRESSBAR
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
