-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READLINE_PANEL

inherit
   UI_TYPED_BRIDGE_PANEL[READLINE_JOB, READLINE_WIDGET[UI_WIDGET]]

insert
   READLINE_WIDGET[UI_PANEL]
      redefine
         make
      end

create {READLINE_JOB}
   make

feature {UI_PANEL}
   add (a_child: READLINE_WIDGET[UI_WIDGET]) is
      do
         children.add(a_child, a_child.id)
      end

feature {}
   children: HASHED_DICTIONARY[READLINE_WIDGET[UI_WIDGET], FIXED_STRING]

   make (a_ui: like ui) is
      do
         Precursor(a_ui)
         create children.make
      end

invariant
   children /= Void

end -- class READLINE_PANEL
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
