-- See the Copyright notice at the end of this file.
--
expanded class STRING_RECYCLING_ITEM
	--
	-- Used by STRING_RECYCLING_POOL to track STRING capacities and to allow the use of a sorted array with
	-- "holes" (since STRING's are WEAK_REFERENCE'ed)
	--

insert
	ANY
		redefine
			is_equal
		end

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
		do
			Result := capacity = other.capacity
		end

feature {STRING_RECYCLING_POOL, STRING_RECYCLING_ITEM, STRING_RECYCLING_ITEM_SORTER}
	capacity: INTEGER

	item: STRING is
			-- The STRING item. May become Void if the GC decides so.
		do
			if item_memory /= Void then
				Result := item_memory.item
			end
		end

	set_item (a_item: like item) is
			-- Stores the STRING as being reusable. The GC may remove it afterwards.
		require
			a_item = Void or else a_item.is_empty
		do
			if a_item = Void then
				if item_memory /= Void then
					item_memory.set_item(Void)
				end
			else
				capacity := a_item.capacity
				if item_memory = Void then
					create item_memory.set_item(a_item)
				else
					item_memory.set_item(a_item)
				end
			end
		ensure
			item = a_item
		end

	set_capacity (a_capacity: like capacity) is
			-- Sets the capacity. Useful for array sorting and element comparison. Should not be used when a
			-- STRING is stored.
		require
			a_capacity >= 0
			item = Void
		do
			capacity := a_capacity
		ensure
			capacity = a_capacity
		end

feature {}
	item_memory: WEAK_REFERENCE[STRING]
			-- Holds a recyclable STRING

invariant
	item /= Void implies item.capacity = capacity
	capacity >= 0

end -- class STRING_RECYCLING_ITEM
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
