-- See the Copyright notice at the end of this file.
--
expanded class BACKTRACKING_REGULAR_EXPRESSION_PATTERN
	--
	-- Class for backtracking (compiled) regular expressions pattern.
	--

feature {ANY}
	group_count: INTEGER
			-- The count of groups of the regular expression.

	is_valid: BOOLEAN is
			-- Is the current pattern valid?
		do
			Result := root /= Void
		end

feature {BACKTRACKING_REGULAR_EXPRESSION}
	root: BACKTRACKING_NODE
			-- The root item.

feature {BACKTRACKING_REGULAR_EXPRESSION_BUILDER}
	make (top: like root; grpcnt: INTEGER) is
			-- Initializing
		require
			top_not_void: top /= Void
		do
			root := top
			group_count := grpcnt
		ensure
			definition: root = top and group_count = grpcnt
			valid: is_valid
		end

end -- class BACKTRACKING_REGULAR_EXPRESSION_PATTERN
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
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
