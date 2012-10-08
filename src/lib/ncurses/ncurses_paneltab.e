-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_PANELTAB
   -- This class adds a tab to a panel widget.

inherit
   NCURSES_WINDOW
      rename make as make_window
      redefine left, top, width, height, refresh_later
      end

creation{NCURSES_PANEL}
   make

feature{ANY}
   left: INTEGER is
      do
         Result := panel.left
      end

   top: INTEGER is
      do
         Result := panel.top
      end

   width: INTEGER is
      do
         Result := panel.width
      end

   height: INTEGER is
      do
         Result := panel.height
      end

   refresh_later is
      local
         i: INTEGER
      do
         if is_raised then
            from
               i := 3
            variant
               height - i
            until
               i > height - 1
            loop
               draw_horizontal_line(0, i, space, width - 1)
               i := i + 1
            end
            label.draw_horizontal_line(1, 0, horizontal_line, label.width - 2)
            label.draw_vertical_line(0, 1, vertical_line, label.height - 2)
            label.draw_vertical_line(label.width - 1, 1, vertical_line, label.height - 2)
            label.draw_horizontal_line(1, label.height - 1, space, label.width - 2)
            label.change_character_at(upper_left_corner, 0, 0)
            label.change_character_at(upper_right_corner, label.width - 1, 0)
            label.change_character_at(lower_right_corner, 0, label.height - 1)
            label.change_character_at(lower_left_corner, label.width - 1, label.height - 1)
            Precursor
         else
            label.draw_horizontal_line(1, 0, horizontal_line, label.width - 2)
            label.draw_vertical_line(0, 1, vertical_line, label.height - 2)
            label.draw_vertical_line(label.width - 1, 1, vertical_line, label.height - 2)
            label.draw_horizontal_line(1, label.height - 1, horizontal_line, label.width - 2)
            label.change_character_at(upper_left_corner, 0, 0)
            label.change_character_at(upper_right_corner, label.width - 1, 0)
            label.change_character_at(bottom_tee, 0, label.height - 1)
            label.change_character_at(bottom_tee, label.width - 1, label.height - 1)
            label.refresh_later
         end
         draw_children(is_raised)
      end

   is_raised: BOOLEAN

   raise is
      do
         panel.raise(Current)
      end

feature{NCURSES_PANEL}
   set_raise (raised: like is_raised) is
      do
         is_raised := raised
      end

feature{}
   make (p: like panel; text: STRING; label_position: INTEGER) is
      require
         p /= Void
         text /= Void
      do
         panel := p
         set_parent(panel)
         make_sub_window(panel.get_window, left, top, width, height)
         create label.make(Current, text, label_position, 0, text.count + 2, 3)
      end

   panel: NCURSES_PANEL

   label: NCURSES_LABEL

invariant
   parent /= Void

end -- class NCURSES_PANELTAB
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
