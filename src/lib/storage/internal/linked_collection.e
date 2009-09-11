-- See the Copyright notice at the end of this file.
--
deferred class LINKED_COLLECTION[E_]
	--
	-- Common root of LINKED_LIST and TWO_WAY_LINKED_LIST.
	--

insert
	COLLECTION[E_]

feature {ANY}
	lower: INTEGER is 1
			-- Lower index bound is frozen.

	upper: INTEGER
			-- Memorized upper index bound.

	make is
			-- Make an empty list
		deferred
		end

	remove_head (n: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				remove_first
				i := i - 1
			end
		end

	remove_tail (n: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				remove_last
				i := i - 1
			end
		end

	first_index_of (element: like item): INTEGER is
		do
			Result := index_of(element, lower)
		end
			
	fast_first_index_of (element: like item): INTEGER is
		do
			Result := fast_index_of(element, lower)
		end
			
feature {} -- Implement manifest generic creation:
	manifest_make (needed_capacity: INTEGER) is
			-- Manifest creation of a list of items of type E_.
		do
			make
		end

	manifest_put (index: INTEGER; element: like item) is
		do
			add_last(element)
		end

end -- class LINKED_COLLECTION
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
