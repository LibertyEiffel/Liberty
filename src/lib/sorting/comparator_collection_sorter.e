-- See the Copyright notice at the end of this file.
--
expanded class COMPARATOR_COLLECTION_SORTER[X]
	--
	-- Some algorithms to sort any COLLECTION using an external comparator.
	--
	-- Elements are sorted using the order given by the comparator: large elements at the beginning of the collection, small at the
	-- end (increasing order is implemented by class COLLECTION_SORTER).
	--
	-- Note that without setting a comparator (using `set_comparator'), collections won't get sorted.
	--
	-- How to use this expanded class :
	--
	--          local
	--             sorter: COMPARATOR_COLLECTION_SORTER[INTEGER]
	--             array: ARRAY[INTEGER]
	--          do
	--             array := <<1,3,2>>
	--             sorter.set_comparator(agent my_comparator)
	--             sorter.sort(array)
	--             check
	--                sorter.is_sorted(array)
	--             end
	--             ...
	--

insert
	ABSTRACT_SORTER[X]
		redefine default_create
		end

creation {ANY}
	default_create, with_comparator

feature {ANY}
	set_comparator (a_comparator: like comparator) is
		do
			comparator := a_comparator
		end

	comparator: PREDICATE[TUPLE[X, X]]

feature {}
	lt (x, y: X): BOOLEAN is
		do
			Result := comparator.item([x, y])
		end

	default_comparator (x, y: X): BOOLEAN is
		do
			Result := True -- does not sort by default (sort algorithms are conservative)
		end

	default_create is
		do
			set_comparator(agent default_comparator(?, ?))
		end

	with_comparator (a_comparator: like comparator) is
		do
			set_comparator(a_comparator)
		end

end -- class COMPARATOR_COLLECTION_SORTER
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
