-- See the Copyright notice at the end of this file.
--
class TWO_WAY_LINKED_LIST_NODE[E_]
	--
	-- To implement TWO_WAY_LINKED_LIST.
	--

inherit
	ANY_TWO_WAY_LINKED_LIST_NODE

creation {TWO_WAY_LINKED_LIST}
	make

feature {ITERATOR_ON_TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST_NODE}
	item: E_

	previous, next: like Current

feature {TWO_WAY_LINKED_LIST}
	make (i: like item; p: like previous; n: like next) is
		do
			item := i
			previous := p
			next := n
		ensure
			item = i
			previous = p
			next = n
		end

feature {TWO_WAY_LINKED_LIST, TWO_WAY_LINKED_LIST_NODE}
	set_item (i: like item) is
		do
			item := i
		ensure
			item = i
		end

	set_next (n: like next) is
		do
			next := n
		ensure
			next = n
		end

	set_all_with (v: like item) is
		local
			lnk: like Current
		do
			from
				lnk := Current
			until
				lnk = Void
			loop
				lnk.set_item(v)
				lnk := lnk.next
			end
		end

	set_previous (p: like previous) is
		do
			previous := p
		ensure
			previous = p
		end

end -- class TWO_WAY_LINKED_LIST_NODE
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
