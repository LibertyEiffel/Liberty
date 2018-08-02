-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_DESC_PANEL

inherit
   CURSES_DESC_WIDGET

create {CURSES_DESCRIPTOR}
   make

feature {CURSES_DESCRIPTOR}
   build (parent: NCURSES_WINDOW)
      do
         layout_manager.build(parent)
         ncurses_widget := layout_manager.ncurses_widget
      end

   layout (a_x, a_y, a_width, a_height: INTEGER)
      do
         layout_manager.layout(a_x, a_y, a_width, a_height)
      end

   x: INTEGER
      do
         Result := layout_manager.x
      end

   y: INTEGER
      do
         Result := layout_manager.y
      end

   width: INTEGER
      do
         Result := layout_manager.width
      end

   height: INTEGER
      do
         Result := layout_manager.height
      end

   min_width: INTEGER
      do
         Result := layout_manager.min_width
      end

   min_height: INTEGER
      do
         Result := layout_manager.min_height
      end

   max_width: INTEGER
      do
         Result := layout_manager.max_width
      end

   max_height: INTEGER
      do
         Result := layout_manager.max_height
      end

feature {}
   layout_manager: CURSES_DESC_LAYOUT

   make (ui: UI_WINDOW; desc: JSON_VALUE)
      local
         descriptor: JSON_OBJECT
         layout_val: JSON_VALUE
         layout_str: JSON_STRING
         layout_ary: JSON_ARRAY
      do
         if desc = Void or else {JSON_NULL} ?:= desc then
            -- nothing to do
         elseif not descriptor ?:= desc then
            log.error.put_line(once "Invalid panel descriptor")
         else
            descriptor ::= desc
            layout_val := descriptor.item(once "layout")
            if layout_val = Void then
               log.error.put_line(once "Missing panel layout")
            elseif layout_str ?:= layout_val then
               layout_str ::= layout_val
               make_layout(ui, layout_str, Void, descriptor.item(once "widgets"))
            elseif layout_ary ?:= layout_val then
               layout_ary ::= layout_val
               if layout_ary.count > 0 and then layout_str ?:= layout_ary.first then
                  layout_str ::= layout_ary.first
                  make_layout(ui, layout_str, layout_ary, descriptor.item(once "widgets"))
               else
                  log.error.put_line(once "Invalid panel layout")
               end
            else
               log.error.put_line(once "Invalid panel layout")
            end
         end
      end

   make_layout (ui: UI_WINDOW; layout_str: JSON_STRING; layout_ary: JSON_ARRAY; widgets: JSON_VALUE)
      require
         layout_str /= Void
         layout_ary /= Void implies layout_ary.first = layout_str
      do
         if widgets = Void then
            log.error.put_line(once "Missing widgets")
         else
            inspect
               layout_str.string.to_utf8
            when "border" then
               create {CURSES_DESC_LAYOUT_BORDER} layout_manager.make(ui, layout_ary, widgets)
            when "string" then
               create {CURSES_DESC_LAYOUT_STRING} layout_manager.make(ui, layout_ary, widgets)
            else
               log.error.put_line(once "Invalid panel layout")
            end
         end
      end

end -- class CURSES_DESC_PANEL
--
-- Copyright (C) 2012-2018: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
