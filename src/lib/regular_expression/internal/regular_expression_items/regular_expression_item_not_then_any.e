-- See the Copyright notice at the end of this file.
--
class REGULAR_EXPRESSION_ITEM_NOT_THEN_ANY
	--
	-- negate the node such that if node matches it makes
	-- a backtrack but conversly if node fails, the character
	-- is accepted (any character) and exploration continues.
	--

inherit
	REGULAR_EXPRESSION_ITEM
	REGULAR_EXPRESSION_ITEM_GLOBALS

creation {ANY}
	make

feature {ANY}
	node: BACKTRACKING_NODE
			-- the node to negate

	make, set_node (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			node := value
		ensure
			definition: node = value
			node_not_void: node /= Void
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.push_cut_point
			matcher.push_or(the_any_character_item)
			matcher.push_and(the_cut_and_false_node)
			matcher.set_current_node(node)
		end

end -- class REGULAR_EXPRESSION_ITEM_NOT_THEN_ANY
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
