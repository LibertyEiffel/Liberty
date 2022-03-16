-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NCURSES_WIDGET

inherit
   DISPOSABLE

insert
   NCURSES_TOOLS
   NCURSES_KEYS
   NCURSES_COLORS
   NCURSES_CHARACTERS

feature {ANY}
   left: INTEGER
      require
         ncurses.is_enabled
      deferred
      end

   top: INTEGER
      require
         ncurses.is_enabled
      deferred
      end

   width: INTEGER
      require
         ncurses.is_enabled
      deferred
      end

   height: INTEGER
      require
         ncurses.is_enabled
      deferred
      end

   redraw_later
      local
         i: INTEGER
      do
         if not hidden then
            refresh_later
            if children /= Void and then not is_children_drawing_disable then
               from
                  i := children.lower
               variant
                  children.upper - i
               until
                  i > children.upper
               loop
                  children.item(i).redraw_later
                  i := i + 1
               end
            end
         end
      end

   redraw_now
      do
         redraw_later
         ncurses.refresh_pending
      end

   refresh_later
      deferred
      end

   hidden: BOOLEAN

   show
      do
         hidden := False
      end

   hide
      do
         hidden := True
      end

   is_children_drawing_disable: BOOLEAN

   draw_children (b: like is_children_drawing_disable)
      do
         is_children_drawing_disable := not b
      end

   set_foreground_color (color: INTEGER)
      do
         get_window.set_fg_color(color)
      end

   set_background_color (color: INTEGER)
      do
         get_window.set_bg_color(color)
      end

   set_colors (foreground, background: INTEGER)
      do
         get_window.set_both_colors(foreground, background)
      end

   get_foreground_color: INTEGER
      do
         Result := get_window.get_fg_color
      end

   get_background_color: INTEGER
      do
         Result := get_window.get_bg_color
      end

feature {NCURSES_WIDGET}
   set_parent (p: like parent)
      do
         parent := p
         parent.add_child(Current)
      end

   get_window: NCURSES_WINDOW
      deferred
      end

   add_child (child: NCURSES_WIDGET)
      do
         if children = Void then
            create children.with_capacity(2)
         end
         children.add_last(child)
      end

   delete
      do
         dispose_children
      end

   parent_resized
      require
         ncurses.is_enabled
      deferred
      end

   propagate_resize
      require
         ncurses.is_enabled
      local
         i: INTEGER
      do
         parent_resized
         if children /= Void then
            from
               i := children.lower
            variant
               children.upper - i
            until
               i > children.upper
            loop
               children.item(i).propagate_resize
               i := i + 1
            end
         end
      end

   screen_left: INTEGER
      do
         Result := left
         if parent /= Void then
            Result := Result + parent.screen_left
         end
      end

   screen_top: INTEGER
      do
         Result := top
         if parent /= Void then
            Result := Result + parent.screen_top
         end
      end

   parent: NCURSES_WIDGET

   children: FAST_ARRAY[NCURSES_WIDGET]

feature {}
   dispose
      do
         delete
      end

   dispose_children
      local
         i: INTEGER
      do
         if children /= Void then
            from
               i := children.lower
            variant
               children.upper - i
            until
               i > children.upper
            loop
               children.item(i).delete
               i := i + 1
            end
         end
      end

end -- class NCURSES_WIDGET
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
