-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NCURSES_CHARACTERS
   --
   -- Just insert this class to get keyboard key code names available with NCURSES.
   --

feature {}
   space: INTEGER
      once
         Result := ' '.to_integer_8
      end

   return: INTEGER
      once
         Result := '%N'.to_integer_8
      end

   upper_left_corner: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_ULCORNER"
      }"
      end

   lower_left_corner: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_LLCORNER"
      }"
      end

   upper_right_corner: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_URCORNER"
      }"
      end

   lower_right_corner: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_LRCORNER"
      }"
      end

   left_tee: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_LTEE"
      }"
      end

   right_tee: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_RTEE"
      }"
      end

   bottom_tee: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_BTEE"
      }"
      end

   top_tee: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_TTEE"
      }"
      end

   horizontal_line: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_HLINE"
      }"
      end

   vertical_line: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_VLINE"
      }"
      end

   plus: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_PLUS"
      }"
      end

   scanline1: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_S1"
      }"
      end

   scanline9: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_S9"
      }"
      end

   diamond: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_DIAMOND"
      }"
      end

   checker_board: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_CKBOARD"
      }"
      end

   degree: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_DEGREE"
      }"
      end

   plus_minus: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_PLMINUS"
      }"
      end

   bullet: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_BULLET"
      }"
      end

   left_arrow: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_LARROW"
         }"
      end

   right_arrow: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_RARROW"
      }"
      end

   down_arrow: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_DARROW"
      }"
      end

   up_arrow: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_UARROW"
      }"
      end

   board: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_BOARD"
      }"
      end

   lantern: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_LANTERN"
      }"
      end

   block: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_BLOCK"
      }"
      end

   scanline3: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_S3"
      }"
      end

   scanline7: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_S7"
      }"
      end

   less_or_equal: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_LEQUAL"
      }"
      end

   greater_or_equal: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_GEQUAL"
      }"
      end

   pi: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_PI"
      }"
      end

   not_equal: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_NEQUAL"
      }"
      end

   sterling: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "ACS_STERLING"
      }"
      end

end -- class NCURSES_CHARACTERS
   
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
