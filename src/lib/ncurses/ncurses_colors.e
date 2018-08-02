-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NCURSES_COLORS
   --
   -- Just insert this class to get colors names available with NCURSES.
   --

feature {}
   black_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_BLACK"
         }"
      end

   red_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_RED"
         }"
      end

   green_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_GREEN"
         }"
      end

   yellow_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_YELLOW"
         }"
      end

   blue_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_BLUE"
         }"
      end

   magenta_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_MAGENTA"
         }"
      end

   cyan_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_CYAN"
         }"
      end

   white_color: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "COLOR_WHITE"
         }"
      end

end -- class NCURSES_COLORS

--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
