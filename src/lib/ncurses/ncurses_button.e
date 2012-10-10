-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_BUTTON
   -- This class adds a button widget. It is just a label with a "focused" attribute.

inherit
   NCURSES_LABEL
      redefine refresh_later
      end

creation {ANY}
   make

feature {ANY}
   refresh_later is
      do
         if is_focused
            window.set_attribute(ncurses.a_reverse)
         end
         Precursor
         if is_focused then
            window.unset_attribute(ncurses.a_reverse)
         end
      end

   is_focused: BOOLEAN

   set_focused (enable: BOOLEAN) is
      do
         is_focused := enable
      end

end -- class NCURSES_BUTTON
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
