-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class NCURSES_TOOLS
   --
   -- To share the access to the `ncurses' singleton.
   -- Just insert this class in order to use NCURSES.
   -- See example in the tutorial/ncurses directory.
   --

feature {ANY}
   ncurses: NCURSES
         -- Access to the `ncurses' singleton.
      once
         create Result.make
      end

feature {ANY}
   invisible_cursor_mode: INTEGER 0
         -- In this mode the cursor is invisible.

   default_visible_cursor_mode: INTEGER 1
         -- The default visible cursor mode.

   special_visible_cursor_mode: INTEGER 2
         -- In this mode cursor may blink in a more special or in a more visible way.

   valid_cursor_visibility (code: INTEGER): BOOLEAN
         -- Check that code is one of `invisible_cursor_mode', `default_visible_cursor_mode'
         -- or `special_visible_cursor_mode'.
      do
         inspect
            code
         when invisible_cursor_mode, default_visible_cursor_mode, special_visible_cursor_mode then
            Result := True
         else
            check
               not Result
            end
         end
      ensure
         Result = code.in_range(invisible_cursor_mode, special_visible_cursor_mode)
      end

end -- class NCURSES_TOOLS

--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
