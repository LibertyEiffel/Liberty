-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_DESC_LAYOUT_BORDER
   --
   -- A layout that manages four "borders" and a center (i.e. five zones):
   --
   --    +-----------------------------------------------------------------+
   --    |                                                                 |
   --    |                             NORTH                               |
   --    |                                                                 |
   --    +--------+-----------------------------------------------+--------+
   --    |        |                                               |        |
   --    |        |                                               |        |
   --    |        |                                               |        |
   --    |  WEST  |                    CENTER                     |  EAST  |
   --    |        |                                               |        |
   --    |        |                                               |        |
   --    |        |                                               |        |
   --    +--------+-----------------------------------------------+--------+
   --    |                                                                 |
   --    |                             SOUTH                               |
   --    |                                                                 |
   --    +-----------------------------------------------------------------+
   --

inherit
   CURSES_DESC_LAYOUT

create {CURSES_DESC_PANEL}
   make

feature {CURSES_DESCRIPTOR}
   build (parent: NCURSES_WINDOW) is
      do
         ncurses_widget := parent.create_sub_window(0, 0, 1, 1)
         center_win := make_sub(center)
         north_win := make_sub(north)
         south_win := make_sub(south)
         east_win := make_sub(east)
         west_win := make_sub(west)
      end

   layout (a_x, a_y, a_width, a_height: INTEGER) is
      local
         cx, cy, cw, cwm, ch, chm, nx, ny, nw, nwm, nh, nhm, sx, sy, sw, swm, sh, shm, wx, wy, ww, wwm, wh, whm, ex, ey, ew, ewm, eh, ehm, hh, hhm: INTEGER
      do
         ncurses_widget.move_to_and_resize(a_x, a_y, a_width, a_height)
         x := a_x
         y := a_y
         width := a_width
         height := a_height

         -- prepare mins and maxes
         if center /= Void then
            ch := center.min_height; cw := center.min_width; chm := center.max_height; cwm := center.max_width
         else
            ch := 0; cw := 0; chm := -1; cwm := -1
         end
         if north /= Void then
            nh := north.min_height; nw := north.min_width; nhm := north.max_height; nwm := north.max_width
         else
            nh := 0; nw := 0; nhm := -1; nwm := -1
         end
         if south /= Void then
            sh := south.min_height; sw := south.min_width; shm := south.max_height; swm := south.max_width
         else
            sh := 0; sw := 0; shm := -1; swm := -1
         end
         if east /= Void then
            eh := east.min_height; ew := east.min_width; ehm := east.max_height; ewm := east.max_width
         else
            eh := 0; ew := 0; ehm := -1; ewm := -1
         end
         if west /= Void then
            wh := west.min_height; ww := west.min_width; whm := west.max_height; wwm := west.max_width
         else
            wh := 0; ww := 0; whm := -1; wwm := -1
         end

         -- calculate widths
         nw := a_width
         sw := a_width
         if cwm = -1 then
            cw := 0
            ww := (a_width - cw) // 2
            ew := a_width - cw - ww
         elseif ww + cwm + ew < a_width then
            cw := a_width - ww - ew
            -- ew and ww stay the same
         else
            cw := cwm
            ww := (a_width - cw) // 2
            ew := a_width - cw - ww
         end

         -- calculate heights
         hh := wh
         hhm := whm
         if ch /= -1 then
            if hh = -1 then
               hh := ch
               hhm := chm
            else
               hh := ch.max(hh)
               hhm := chm.min(hhm)
            end
         end
         if wh /= -1 then
            if hh = -1 then
               hh := wh
               hhm := whm
            else
               hh := wh.max(hh)
               hhm := whm.min(hhm)
            end
         end
         if hhm = -1 then
            hh := 0
            nh := (a_height - ch) // 2
            sh := a_height - ch - nh
         elseif wh + hhm + eh < a_height then
            hh := a_width - nh - sh
            -- nh and sh stay the same
         else
            hh := hhm
            nh := (a_height - hh) // 2
            sh := a_height - hh - nh
         end
         if hhm > wh then
            wh := hh
         end
         if chm > hh then
            ch := hh
         end
         if whm > hh then
            wh := hh
         end

         -- calculate positions
         nx := 0
         ny := 0
         wx := 0
         wy := nh
         cx := ww
         cy := nh
         ex := ww + cw
         ey := nh
         sx := 0
         sy := nh + hh

         -- apply
         ncurses_widget.move_to_and_resize(a_x, a_y, a_width, a_height)
         if center /= Void then center.layout(cx, cy, ch, cw) end
         if north /= Void  then  north.layout(nx, ny, nh, nw) end
         if south /= Void  then  south.layout(sx, sy, sh, sw) end
         if east /= Void   then   east.layout(ex, ey, eh, ew) end
         if west /= Void   then   west.layout(wx, wy, wh, ww) end
      end

   x, y, width, height: INTEGER

   min_width: INTEGER is
      do
         if east /= Void then
            Result := Result + east.min_width
         end
         if center /= Void then
            Result := Result + center.min_width
         end
         if west /= Void then
            Result := Result + west.min_width
         end
         if north /= Void then
            Result := Result.max(north.min_width)
         end
         if south /= Void then
            Result := Result.max(south.min_width)
         end
      end

   max_width: INTEGER is
      do
         if east /= Void then
            Result := Result + east.max_width
         end
         if center /= Void then
            Result := Result + center.max_width
         end
         if west /= Void then
            Result := Result + west.max_width
         end
         if north /= Void then
            Result := Result.min(north.max_width)
         end
         if south /= Void then
            Result := Result.min(south.max_width)
         end
      end

   min_height: INTEGER is
      local
         h: INTEGER
      do
         if north /= Void then
            Result := Result + north.min_height
         end
         h := -1
         if center /= Void then
            h := center.min_height
         end
         if east /= Void then
            if h = -1 then
               h := east.min_height
            else
               h := h.max(east.min_height)
            end
         end
         if west /= Void then
            if h = -1 then
               h := west.min_height
            else
               h := h.max(west.min_height)
            end
         end
         if h /= -1 then
            Result := Result + h
         end
         if south /= Void then
            Result := Result + south.min_height
         end
      end

   max_height: INTEGER is
      local
         h: INTEGER
      do
         if north /= Void then
            Result := Result + north.max_height
         end
         h := -1
         if center /= Void then
            h := center.max_height
         end
         if east /= Void then
            if h = -1 then
               h := east.min_height
            else
               h := h.min(east.max_height)
            end
         end
         if west /= Void then
            if h = -1 then
               h := west.min_height
            else
               h := h.min(west.max_height)
            end
         end
         if h /= -1 then
            Result := Result + h
         end
         if south /= Void then
            Result := Result + south.max_height
         end
      end

feature {}
   make_sub (desc: CURSES_DESC_WIDGET): NCURSES_WINDOW is
      do
         if desc /= Void then
            Result := ncurses_widget.create_sub_window(0, 0, 1, 1)
            desc.build(Result)
         end
      end

   make (ui: UI_WINDOW; options: JSON_ARRAY; desc_widgets: JSON_VALUE) is
      local
         obj: JSON_OBJECT
         str: JSON_STRING
         i: INTEGER
      do
         if obj ?:= desc_widgets then
            obj ::= desc_widgets
            center := widget(ui, obj.item(once "center"))
            north  := widget(ui, obj.item(once "north"))
            south  := widget(ui, obj.item(once "south"))
            east   := widget(ui, obj.item(once "east"))
            west   := widget(ui, obj.item(once "wset"))
         else
            log.error.put_line(once "Invalid widgets object")
         end

         from
            i := options.lower + 1 -- ignore the first argument which is the name of the layout
         until
            i > options.upper
         loop
            if str ?:= options.item(i) then
               str ::= options.item(i)
               log.warning.put_line(once "Ignored layout option: %"#(1)%"" # str.string.as_utf8)
            else
               log.error.put_line(once "Invalid layout option")
            end
            i := i + 1
         end
      end

   center, north, south, east, west: CURSES_DESC_WIDGET
   center_win, north_win, south_win, east_win, west_win: NCURSES_WINDOW

end -- class CURSES_DESC_LAYOUT_BORDER
--
-- Copyright (c) 2012 Cyril ADRIAN <cyril.adrian@gmail.com>.
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
