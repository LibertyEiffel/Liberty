-- See the Copyright notice at the end of this file.
--
class QUEUE[E_]
	--
	-- A Queue of elements of type `E_'.
	--

insert
	RING_ARRAY[E_]
		rename add as collection_add,
			add_last as add,
			remove as collection_remove,
			remove_first as remove,
			make as collection_make,
			with_capacity as collection_with_capacity
		export {ANY} is_empty, add, remove, first, count;
			{QUEUE} all
		redefine
			get_new_iterator
		end
	ANY
		-- To get reasonable default exports
		undefine fill_tagged_out_memory, copy, is_equal
		end

creation {ANY}
	make, with_capacity

creation {RING_ARRAY}
	collection_make

feature {}
	make is
			-- Create an empty array. Also consider `with_capacity',
			-- since growing a full queue is rather expensive.
		do
			with_capacity(16)
		ensure
			is_empty
		end

	with_capacity (needed_capacity: INTEGER) is
			-- Create an empty array with capacity initialized
			-- at least to `needed_capacity'
		require
			needed_capacity >= 0
		do
			collection_with_capacity(needed_capacity, 1)
		end

	get_new_iterator: ITERATOR[E_] is
		do
			check
				False
			end
		end

end -- class QUEUE
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
