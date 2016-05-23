-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_PANEL

inherit
   UI_TYPED_BRIDGE_PANEL[CURSES_JOB, CURSES_WIDGET[UI_WIDGET]]

insert
   CURSES_WIDGET[UI_PANEL]
      redefine
         make
      end

create {CURSES_JOB}
   make

feature {UI_PANEL}
   add (a_child: CURSES_WIDGET[UI_WIDGET])
      do
         children.add(a_child, a_child.id)
      end

feature {CURSES_ITEM}
   start: BOOLEAN
      do
         Result := children.for_all(agent {CURSES_WIDGET[UI_WIDGET]}.start)
      end

   key_pressed (code: INTEGER): BOOLEAN
      do
      end

   resized: BOOLEAN
      do
      end

feature {}
   children: HASHED_DICTIONARY[CURSES_WIDGET[UI_WIDGET], FIXED_STRING]

   make (a_ui: like ui)
      do
         Precursor(a_ui)
         create children.make
      end

invariant
   children /= Void

end -- class CURSES_PANEL
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
