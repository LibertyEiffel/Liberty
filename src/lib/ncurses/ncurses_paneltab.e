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

create{NCURSES_PANEL}
   make, no_label

feature {ANY}
   left: INTEGER
      do
         Result := panel.left
      end

   top: INTEGER
      do
         Result := panel.top
      end

   width: INTEGER
      do
         Result := panel.width
      end

   height: INTEGER
      do
         Result := panel.height
      end

   refresh_later
      local
         i: INTEGER
      do
         if label /= Void then
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
         end

         if is_raised then
            Precursor
            draw_children(True)
         else
            draw_children(False)
         end
      end

   is_raised: BOOLEAN

   raise
      do
         panel.raise(Current)
      end

feature {NCURSES_PANEL}
   set_raise (raised: like is_raised)
      do
         is_raised := raised
         clear
      end

feature {}
   no_label (p: like panel)
      require
         p /= Void
      do
         panel := p
         make_sub_window(p.get_window, p.left, p.top, p.width, p.height)
         set_parent(p)
      ensure
         label = Void
         parent = p
         panel = p
      end

   make (p: like panel; text: STRING; label_position: INTEGER)
      require
         p /= Void
         text /= Void
      do
         no_label(p)
         create label.make(Current, text, label_position, 0, text.count + 2, 3)
      ensure
         label /= Void
      end

   panel: NCURSES_PANEL
   label: NCURSES_LABEL

invariant
   panel /= Void
   parent /= Void

end -- class NCURSES_PANELTAB
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
