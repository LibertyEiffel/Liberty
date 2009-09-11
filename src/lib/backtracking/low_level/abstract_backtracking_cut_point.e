-- See the Copyright notice at the end of this file.
--
class ABSTRACT_BACKTRACKING_CUT_POINT
	--
	-- Instances of that class are used by the ABSTRACT_BACKTRACKING
	-- to record "cut points" data. A cut point is an indication of
	-- up to wich alternative are to be removed from the exploration.
	--
	-- Instances of that class are inserted in the continuation path
	-- to be retrieved by dynamic cast during calls to cut.
	--

inherit
	ABSTRACT_BACKTRACKING_SEQUENCE
		rename pool as pool_of_cut_points
		end

insert
	ABSTRACT_BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
	top_alternative: ABSTRACT_BACKTRACKING_ALTERNATIVE
			-- Record of what top of the stack of alternative
			-- is to restore when cut is called.
			-- Managed by ABSTRACT_BACKTRACKING.

	set_top_alternative (value: like top_alternative) is
		do
			top_alternative := value
		ensure
			definition: top_alternative = value
		end

	next_sequence (explorer: ABSTRACT_BACKTRACKING) is
			-- Do nothing: remove itself (as if it were the end
			-- of a sequence) and evaluate the continuation by
			-- issuing a 'continue'.
		do
			explorer.pop_sequence
			explorer.continue
		end

end -- class ABSTRACT_BACKTRACKING_CUT_POINT
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
