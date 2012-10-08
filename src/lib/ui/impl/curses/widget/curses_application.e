-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_APPLICATION

inherit
   UI_TYPED_BRIDGE_APPLICATION[CURSES_JOB, CURSES_WINDOW]

insert
   CURSES_ITEM[UI_APPLICATION]
      redefine
         make
      end

create {CURSES_JOB}
   make

feature {UI_APPLICATION}
   add (a_window: CURSES_WINDOW) is
      do
         windows.add(a_window, a_window.id)
      end

feature {}
   conf_section: STRING is "curses"

   make (a_ui: like ui) is
      local
         str: JSON_STRING
      do
         Precursor(a_ui)
         create windows.make
         str ::= conf.item(once "start")
         current_window := str.string.as_utf8.intern
      end

   windows: HASHED_DICTIONARY[CURSES_WINDOW, FIXED_STRING]

   current_window: FIXED_STRING

invariant
   windows /= Void
   current_window.intern = current_window

end -- class CURSES_APPLICATION
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
