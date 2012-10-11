-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CURSES_DESCRIPTOR

insert
   NCURSES_TOOLS
   JSON_HANDLER
   LOGGING

feature {}
   widget (ui: UI_WINDOW; desc: JSON_VALUE): CURSES_DESC_WIDGET is
      require
         desc /= Void
      local
         desc_widget: JSON_OBJECT
         factory: FUNCTION[TUPLE[UI_WINDOW, JSON_OBJECT], CURSES_DESC_WIDGET]
      do
         if desc_widget ?:= desc then
            desc_widget ::= desc
            factory := widgets_factory.aggregate(agent new_widget(desc_widget, ?, ?, ?), Void)
            if factory /= Void then
               Result := factory.item([ui, desc_widget])
            else
               log.error.put_line(once "Invalid widget: unknown type")
            end
         else
            log.error.put_line(once "Invalid widget: not an object")
         end
      end

   new_widget (desc_widget: JSON_OBJECT; res, item: FUNCTION[TUPLE[UI_WINDOW, JSON_OBJECT], CURSES_DESC_WIDGET]; key: STRING): FUNCTION[TUPLE[UI_WINDOW, JSON_OBJECT], CURSES_DESC_WIDGET] is
      do
         if res /= Void then
            Result := res
            if desc_widget.item(key) /= Void then
               log.warning.put_line(once "Ignored extra type: %"#(1)%"" # key)
            end
         elseif desc_widget.item(key) /= Void then
            Result := item
            log.info.put_line(once "Found type: %"#(1)%"" # key)
         end
      end

   widgets_factory: MAP[FUNCTION[TUPLE[UI_WINDOW, JSON_OBJECT], CURSES_DESC_WIDGET], STRING] is
      once
         Result := {HASHED_DICTIONARY[FUNCTION[TUPLE[UI_WINDOW, JSON_OBJECT], CURSES_DESC_WIDGET], STRING]
         <<
            agent (ui: UI_WINDOW; value: JSON_OBJECT): CURSES_DESC_PANEL      is do create Result.make(ui, value) end, "panel"     ;
            agent (ui: UI_WINDOW; value: JSON_OBJECT): CURSES_DESC_BUTTON     is do create Result.make(ui, value) end, "button"    ;
            agent (ui: UI_WINDOW; value: JSON_OBJECT): CURSES_DESC_TEXT_FIELD is do create Result.make(ui, value) end, "text_field";
         >>}
      end

end -- class CURSES_DESCRIPTOR
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
