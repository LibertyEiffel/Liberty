-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_MENU[E_]
   -- This class adds a menu widget.

inherit
   NCURSES_WIDGET

create{ANY}
   make

feature {ANY}
   left: INTEGER

   top: INTEGER

   width: INTEGER

   height: INTEGER

   refresh_later
      local
         x, y, i: INTEGER
      do
         if has_border then
            x := 1
            y := 1
            window.draw_border
         end
         from
            i := items.lower
         variant
            items.upper - i
         until
            i > items.upper
         loop
            if i = selected then
               window.set_attribute(ncurses.a_reverse)
            end
            window.put_string_at(items.item(i).tag, x, y)
            if i = selected then
               window.unset_attribute(ncurses.a_reverse)
            end
            y := y + 1
            i := i + 1
         end
      end

   tag: STRING

   items: ARRAY[NCURSES_MENU_ITEM[E_]]

   selected: INTEGER

   has_border: BOOLEAN

   get_choice: E_
      obsolete "Use `read_choice' and `last_choice' instead."
      do
         read_choice
         if valid_choice then
            Result := last_choice
         end
      end

   read_choice
      local
         key: INTEGER; done: BOOLEAN
      do
         from
            selected := items.lower
         until
            done
         loop
            redraw_now
            key := window.wait_keypress
            if key = key_up then
               if selected > items.lower then
                  selected := selected - 1
               else
                  done := True
               end
            elseif key = key_down and then selected < items.upper then
               selected := selected + 1
            elseif key = key_return then
               last_choice_memory := items.item(selected).value
               valid_choice := True
               done := True
            elseif key = key_escape then
               valid_choice := False
               done := True
            end
         end
      end

   valid_choice: BOOLEAN

   last_choice: E_
      require
         valid_choice
      do
         Result := last_choice_memory
      end

feature {}
   last_choice_memory: E_

feature {NCURSES_WIDGET}
   get_window: NCURSES_WINDOW
      do
         Result := window
      end

   parent_resized
      do
      end

feature {}
   make (p: like parent; x, y: INTEGER; t: like tag; its: like items; with_border: BOOLEAN)
      require
         ncurses.is_enabled
         p /= Void
         x >= 0
         y >= 0
         not t.is_empty
         its.count > 0
      local
         i: INTEGER
      do
         left := x
         top := y
         tag := t
         items := its
         selected := items.lower
         has_border := with_border
         height := items.count
         from
            i := items.lower
         variant
            items.upper - i
         until
            i > items.upper
         loop
            width := width.max(items.item(i).tag.count + 1)
            i := i + 1
         end
         if has_border then
            width := width + 1
            height := height + 2
         end
         set_parent(p)
         window := p.get_window.create_sub_window(left, top, width, height)
      ensure
         left = x
         top = y
         tag = t
         items = its
         selected = items.lower
         has_border = with_border
      end

   window: NCURSES_WINDOW

invariant
   window /= Void
   items.valid_index(selected)

end -- class NCURSES_MENU
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
