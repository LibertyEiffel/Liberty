-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_DESC_LAYOUT_STRING
   --
   -- A layout that manages a string of widgets (either horizontally or vertically)
   --

inherit
   CURSES_DESC_LAYOUT

create {CURSES_DESC_PANEL}
   make

feature {CURSES_DESCRIPTOR}
   build (parent: NCURSES_WINDOW)
      do
         ncurses_widget := parent.create_sub_window(0, 0, parent.width, parent.height)
         widgets.for_each(agent {CURSES_DESC_WIDGET}.build(ncurses_widget))
      end

   layout (a_x, a_y, a_width, a_height: INTEGER)
      local
         wx, wy: REFERENCE[INTEGER]
      do
         x := a_x
         y := a_y
         width := a_width
         height := a_height
         ncurses_widget.move_to_and_resize(a_x, a_y, a_width, a_height)

         create wx
         create wy
         inspect
            justify
         when justify_head then
            widgets.for_each(agent layout_groupped_widgets(?, wx, wy))
         when justify_tail then
            if orientation = orientation_horizontal then
               wx.set_item(a_width - min_width)
            else
               wy.set_item(a_height - min_height)
            end
            widgets.for_each(agent layout_groupped_widgets(?, wx, wy))
         when justify_center then
            if orientation = orientation_horizontal then
               wx.set_item((a_width - min_width) // 2)
            else
               wy.set_item((a_height - min_height) // 2)
            end
            widgets.for_each(agent layout_groupped_widgets(?, wx, wy))
         when justify_spread_out then
            not_yet_implemented
         end
      end

   x, y, width, height: INTEGER

   min_width: INTEGER
      do
         if orientation = orientation_horizontal then
            Result := aggregate(agent {CURSES_DESC_WIDGET}.min_width, agent {INTEGER} + ?).max(1)
         else
            Result := aggregate(agent {CURSES_DESC_WIDGET}.min_width, agent {INTEGER}.max).max(1)
         end
      end

   min_height: INTEGER
      do
         if orientation = orientation_horizontal then
            Result := aggregate(agent {CURSES_DESC_WIDGET}.min_height, agent {INTEGER}.max).max(1)
         else
            Result := aggregate(agent {CURSES_DESC_WIDGET}.min_height, agent {INTEGER} + ?).max(1)
         end
      end

   max_width: INTEGER
      do
         if orientation = orientation_horizontal then
            Result := aggregate(agent {CURSES_DESC_WIDGET}.max_width, agent {INTEGER} + ?).max(1)
         else
            Result := aggregate(agent {CURSES_DESC_WIDGET}.max_width, agent {INTEGER}.min).max(min_width)
         end
      end

   max_height: INTEGER
      do
         if orientation = orientation_horizontal then
            Result := aggregate(agent {CURSES_DESC_WIDGET}.max_height, agent {INTEGER}.min).max(min_height)
         else
            Result := aggregate(agent {CURSES_DESC_WIDGET}.max_height, agent {INTEGER} + ?).max(1)
         end
      end

feature {}
   layout_groupped_widgets (w: CURSES_DESC_WIDGET; wx, wy: REFERENCE[INTEGER])
      do
         w.layout(wx.item, wy.item, w.min_width, w.min_height)
         if orientation = orientation_horizontal then
            wx.set_item(wx.item + w.width)
         else
            wy.set_item(wy.item + w.height)
         end
      end

   aggregate (item: FUNCTION[TUPLE[CURSES_DESC_WIDGET], INTEGER];
              func: FUNCTION[TUPLE[INTEGER, INTEGER], INTEGER]): INTEGER
      local
         res: REFERENCE[INTEGER]
      do
         create res
         widgets.for_each(agent (w: CURSES_DESC_WIDGET; val: FUNCTION[TUPLE[CURSES_DESC_WIDGET], INTEGER])
                          do
                             res.set_item(func.item([res.item, val.item([w])]))
                          end (?, item))
         Result := res.item
      end

feature {}
   make (ui: UI_WINDOW; options: JSON_ARRAY; desc_widgets: JSON_VALUE)
      local
         ary: JSON_ARRAY
         str: JSON_STRING
         i: INTEGER
      do
         if ary ?:= desc_widgets then
            ary ::= desc_widgets
            create widgets.with_capacity(ary.count)
            from
               i := ary.lower
            until
               i > ary.upper
            loop
               widgets.add_last(widget(ui, ary.item(i)))
               i := i + 1
            end
         else
            log.error.put_line(once "Invalid widgets array")
         end

         if options /= Void then
            from
               i := options.lower + 1 -- ignore the first argument which is the name of the layout
            until
               i > options.upper
            loop
               if str ?:= options.item(i) then
                  str ::= options.item(i)
                  inspect
                     str.string.to_utf8
                  when "head", "left", "top" then
                     if justify = 0 then
                        justify := justify_head
                     else
                        log.warning.put_line(once "Ignored extra layout 'justify' option: %"#(1)%"" # str.string.as_utf8)
                     end
                  when "tail", "right", "bottom" then
                     if justify = 0 then
                        justify := justify_tail
                     else
                        log.warning.put_line(once "Ignored extra layout 'justify' option: %"#(1)%"" # str.string.as_utf8)
                     end
                  when "center", "middle" then
                     if justify = 0 then
                        justify := justify_center
                     else
                        log.warning.put_line(once "Ignored extra layout 'justify' option: %"#(1)%"" # str.string.as_utf8)
                     end
                  when "spread_out" then
                     if justify = 0 then
                        justify := justify_spread_out
                     else
                        log.warning.put_line(once "Ignored extra layout 'justify' option: %"#(1)%"" # str.string.as_utf8)
                     end
                  when "horizontal" then
                     if orientation = 0 then
                        orientation := orientation_horizontal
                     else
                        log.warning.put_line(once "Ignored extra layout 'orientation' option: %"#(1)%"" # str.string.as_utf8)
                     end
                  when "vertical" then
                     if orientation = 0 then
                        orientation := orientation_vertical
                     else
                        log.warning.put_line(once "Ignored extra layout 'orientation' option: %"#(1)%"" # str.string.as_utf8)
                     end
                  else
                     log.warning.put_line(once "Ignored layout option: %"#(1)%"" # str.string.as_utf8)
                  end
               else
                  log.error.put_line(once "Invalid layout option")
               end
               i := i + 1
            end
            if orientation = 0 then
               orientation := orientation_horizontal
               log.info.put_line(once "Using default orientation: %"horizontal%"")
            end
            if justify = 0 then
               justify := justify_head
               log.info.put_line(once "Using default justify: %"left%"")
            end
         end
      end

   widgets: FAST_ARRAY[CURSES_DESC_WIDGET]

   orientation: INTEGER_8
   orientation_horizontal: INTEGER_8 1
   orientation_vertical: INTEGER_8 2

   justify: INTEGER_8
   justify_spread_out: INTEGER_8 1
   justify_head: INTEGER_8 2
   justify_center: INTEGER_8 3
   justify_tail: INTEGER_8 4

invariant
   orientation = orientation_horizontal xor orientation = orientation_vertical
   justify.in_range(justify_spread_out, justify_tail)

end -- class CURSES_DESC_LAYOUT_STRING
--
-- Copyright (C) 2012-2016: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
