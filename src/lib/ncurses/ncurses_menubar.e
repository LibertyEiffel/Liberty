-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_MENUBAR[E_]
   -- This class adds a menu bar widget.

inherit
   NCURSES_WIDGET
      redefine
         set_colors
      end

create{ANY}
   make

feature {ANY}
   left: INTEGER

   top: INTEGER

   width: INTEGER

   height: INTEGER

   set_colors (fg, bg: INTEGER)
      local
         i: INTEGER
      do
         Precursor(fg, bg)
         from
            i := menus.lower
         until
            i > menus.upper
         loop
            menus.item(i).set_colors(fg, bg)
            i := i + 1
         end
      end

   refresh_later
      local
         x, i: INTEGER
         tag: STRING
      do
         window.clear
         from
            x := 0
            i := menus.lower
         variant
            menus.upper - i
         until
            i > menus.upper
         loop
            menus.item(i).hide
            window.put_character_at(' ', x, 0)
            x := x + 1
            tag := menus.item(i).tag
            if i = selected then
               window.set_attribute(ncurses.a_reverse)
            end
            window.put_string_at(tag, x, 0)
            if i = selected then
               window.unset_attribute(ncurses.a_reverse)
            end
            x := x + tag.count
            i := i + 1
         end
         from
         until
            x >= width
         loop
            window.put_character_at(' ', x, 0)
            x := x + 1
         end
      end

   menus: ARRAY[NCURSES_MENU[E_]]

   selected: INTEGER

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
            selected := menus.lower
         until
            done
         loop
            redraw_now
            key := window.wait_keypress
            if key = key_left then
               if selected > menus.lower then
                  selected := selected - 1
               else
                  selected := menus.upper
               end
            elseif key = key_right then
               if selected < menus.upper then
                  selected := selected + 1
               else
                  selected := menus.lower
               end
            elseif key = key_return or else key = key_down then
               menus.item(selected).show
               menus.item(selected).read_choice
               menus.item(selected).hide
               if menus.item(selected).valid_choice then
                  last_choice_memory := menus.item(selected).last_choice
                  done := True
                  valid_choice := True
               end
            elseif key = key_escape or else key = key_up then
               valid_choice := False
               done := True
            end
         end
         selected := menus.lower - 1
         redraw_now
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
   make (p: like parent; y: INTEGER; mns: DICTIONARY[DICTIONARY[E_, STRING], STRING]; with_border: BOOLEAN)
      require
         ncurses.is_enabled
         p /= Void
         y >= 0
         mns /= Void
      local
         m, i, x: INTEGER
         items: ARRAY[NCURSES_MENU_ITEM[E_]]
      do
         left := 0
         top := y
         width := p.width
         from
            m := mns.lower
         variant
            mns.upper - m
         until
            m > mns.upper
         loop
            height := height.max(mns.item(m).count + 1)
            m := m + 1
         end
         if with_border then
            height := height + 2
         end
         window := p.get_window.create_sub_window(left, top, width, height)
         from
            create menus.make(mns.lower, mns.upper)
            m := mns.lower
         variant
            mns.upper - m
         until
            m > mns.upper
         loop
            from
               create items.make(mns.item(m).lower, mns.item(m).upper)
               i := mns.item(m).lower
            variant
               mns.item(m).upper - i
            until
               i > mns.item(m).upper
            loop
               items.put(create {NCURSES_MENU_ITEM[E_]}.make(mns.item(m).key(i), mns.item(m).item(i)), i)
               i := i + 1
            end
            if not with_border then
               x := x + 1
            end
            menus.put(create {NCURSES_MENU[E_]}.make(Current, x, 1, mns.key(m), items, with_border), m)
            if with_border then
               x := x + 1
            end
            x := x + mns.key(m).count
            m := m + 1
         end
         set_parent(p)
         selected := menus.lower - 1
      ensure
         left = 0
         top = y
      end

   window: NCURSES_WINDOW

invariant
   window /= Void
   selected = menus.lower - 1 or else menus.valid_index(selected)

end -- class NCURSES_MENUBAR
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
