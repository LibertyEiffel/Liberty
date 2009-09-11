-- See the Copyright notice at the end of this file.
--
deferred class NCURSES_COLORS
	--
	-- Just insert this class to get colors names available with NCURSES.
	--

feature {}
	black_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_BLACK"
			}"
		end
	
	red_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_RED"
			}"
		end
	
	green_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_GREEN"
			}"
		end
	
	yellow_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_YELLOW"
			}"
		end
	
	blue_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_BLUE"
			}"
		end
	
	magenta_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_MAGENTA"
			}"
		end
	
	cyan_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_CYAN"
			}"
		end
	
	white_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_WHITE"
			}"
		end
	
end -- class NCURSES_COLORS
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN, Pierre-Nicolas CLAUSS
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
	
