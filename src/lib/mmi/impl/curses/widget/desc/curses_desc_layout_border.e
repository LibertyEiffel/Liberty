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
   build (parent: NCURSES_WINDOW)
      do
         ncurses_widget := parent.create_sub_window(0, 0, parent.width, parent.height)
         center_win := make_sub(center)
         north_win := make_sub(north)
         south_win := make_sub(south)
         east_win := make_sub(east)
         west_win := make_sub(west)
      end

   layout (a_x, a_y, a_width, a_height: INTEGER)
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

         debug
            log.trace.put_new_line
            log.trace.put_line(once "AT INIT (height=#(1) width=#(2)):" # &a_height # &a_width)
            log.trace.put_line(once "center | height - min=#(1)%Tmax=#(2)%T| width - min=#(3)%Tmax=#(4)" # &ch # &chm # &cw # &cwm)
            log.trace.put_line(once " north | height - min=#(1)%Tmax=#(2)%T| width - min=#(3)%Tmax=#(4)" # &nh # &nhm # &nw # &nwm)
            log.trace.put_line(once " south | height - min=#(1)%Tmax=#(2)%T| width - min=#(3)%Tmax=#(4)" # &sh # &shm # &sw # &swm)
            log.trace.put_line(once "  east | height - min=#(1)%Tmax=#(2)%T| width - min=#(3)%Tmax=#(4)" # &eh # &ehm # &ew # &ewm)
            log.trace.put_line(once "  west | height - min=#(1)%Tmax=#(2)%T| width - min=#(3)%Tmax=#(4)" # &wh # &whm # &ww # &wwm)
            log.trace.put_new_line
         end

         -- calculate widths
         nw := a_width
         sw := a_width
         if cwm = -1 then
            if wwm /= -1 then
               if ewm /= -1 then
                  ww := a_width // 2
               else
                  ww := a_width
               end
            end
            ew := a_width - ww
         elseif ww + cwm + ew < a_width then
            cw := a_width - ww - ew
            -- ew and ww stay the same
         else
            cw := cwm
            if wwm /= -1 then
               if ewm /= -1 then
                  ww := (a_width - cw) // 2
               else
                  ww := a_width - cw
               end
            end
            ew := a_width - cw - ww
         end

         -- calculate heights
         hh := eh
         hhm := ehm
         if chm /= -1 then
            if hhm = -1 then
               hh := ch
               hhm := chm
            else
               hh := ch.max(hh)
               hhm := chm.min(hhm)
            end
         end
         if whm /= -1 then
            if hhm = -1 then
               hh := wh
               hhm := whm
            else
               hh := wh.max(hh)
               hhm := whm.min(hhm)
            end
         end

         debug
            log.trace.put_line(once "hh=#(1) hhm=#(2)" # &hh # &hhm)
            log.trace.put_new_line
         end

         if hhm = -1 then
            if nhm /= -1 then
               if shm /= -1 then
                  nh := a_height // 2
               else
                  nh := a_height
               end
            end
            sh := a_height - nh
         elseif wh + hhm + eh < a_height then
            hh := a_height - nh - sh
            -- nh and sh stay the same
         else
            hh := hhm
            if nhm /= -1 then
               if shm /= -1 then
                  nh := (a_height - hh) // 2
               else
                  nh := a_height - hh
               end
            end
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
         ex := a_width - ew
         ey := nh
         sx := 0
         sy := a_height - sh

         debug
            log.trace.put_line(once "AT APPLY (before max fix):")
            if chm /= -1 then log.trace.put_line(once "center | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &cx # &cy # &ch # &cw) end
            if nhm /= -1 then log.trace.put_line(once " north | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &nx # &ny # &nh # &nw) end
            if shm /= -1 then log.trace.put_line(once " south | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &sx # &sy # &sh # &sw) end
            if ehm /= -1 then log.trace.put_line(once "  east | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &ex # &ey # &eh # &ew) end
            if whm /= -1 then log.trace.put_line(once "  west | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &wx # &wy # &wh # &ww) end
            log.trace.put_new_line
         end

         -- fix max
         if chm /= -1 then ch := ch.min(chm) end
         if nhm /= -1 then nh := nh.min(nhm) end
         if shm /= -1 then sh := sh.min(shm) end
         if ehm /= -1 then eh := eh.min(ehm) end
         if whm /= -1 then wh := wh.min(whm) end
         if cwm /= -1 then cw := cw.min(cwm) end
         if nwm /= -1 then nw := nw.min(nwm) end
         if swm /= -1 then sw := sw.min(swm) end
         if ewm /= -1 then ew := ew.min(ewm) end
         if wwm /= -1 then ww := ww.min(wwm) end

         debug
            log.trace.put_line(once "AT APPLY (after max fix):")
            if chm /= -1 then log.trace.put_line(once "center | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &cx # &cy # &ch # &cw) end
            if nhm /= -1 then log.trace.put_line(once " north | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &nx # &ny # &nh # &nw) end
            if shm /= -1 then log.trace.put_line(once " south | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &sx # &sy # &sh # &sw) end
            if ehm /= -1 then log.trace.put_line(once "  east | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &ex # &ey # &eh # &ew) end
            if whm /= -1 then log.trace.put_line(once "  west | x=#(1)%Ty=#(2)%Theight=#(3)%Twidth=#(4)" # &wx # &wy # &wh # &ww) end
            log.trace.put_new_line
         end

         -- apply
         ncurses_widget.resize(a_width, a_height)
         if chm /= -1 then center.layout(cx, cy, cw, ch) end
         if nhm /= -1 then  north.layout(nx, ny, nw, nh) end
         if shm /= -1 then  south.layout(sx, sy, sw, sh) end
         if ehm /= -1 then   east.layout(ex, ey, ew, eh) end
         if whm /= -1 then   west.layout(wx, wy, ww, wh) end
      end

   x, y, width, height: INTEGER

   min_width: INTEGER
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

   max_width: INTEGER
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

   min_height: INTEGER
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

   max_height: INTEGER
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
   make_sub (desc: CURSES_DESC_WIDGET): NCURSES_WINDOW
      do
         if desc /= Void then
            Result := ncurses_widget.create_sub_window(0, 0, 1, 1)
            desc.build(Result)
         end
      end

   make (ui: UI_WINDOW; options: JSON_ARRAY; desc_widgets: JSON_VALUE)
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

         if options /= Void then
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
      end

   center, north, south, east, west: CURSES_DESC_WIDGET
   center_win, north_win, south_win, east_win, west_win: NCURSES_WINDOW

end -- class CURSES_DESC_LAYOUT_BORDER
--
-- Copyright (C) 2012-2022: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
