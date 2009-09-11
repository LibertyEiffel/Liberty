-- See the Copyright notice at the end of this file.
--
deferred class BACKTRACKING_NODE_BINARY
	--
	-- Node for a sequence of 2 nodes
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	first: BACKTRACKING_NODE
			-- first node of the sequence

	second: BACKTRACKING_NODE
			-- second node of the sequence

	make (frst, scnd: BACKTRACKING_NODE) is
		require
			first_not_void: frst /= Void
			second_not_void: scnd /= Void
		do
			first := frst
			second := scnd
		ensure
			definition: first = frst and second = scnd
			first_not_void: first /= Void
			second_not_void: second /= Void
		end

	set_first (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			first := value
		ensure
			definition: first = value
			first_not_void: first /= Void
		end

	set_second (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			second := value
		ensure
			definition: second = value
			second_not_void: second /= Void
		end

invariant
	first_not_void: first /= Void
	second_not_void: second /= Void

end -- class BACKTRACKING_NODE_BINARY
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
