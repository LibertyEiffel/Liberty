-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ITERATOR[E_]
	--
	-- The iterator pattern at work: this abstract class defines a
	-- traversal interface for any kind of aggregates data structure.
	-- An iterator can be used when you need to do something on all
	-- elements in the data structure, but there is no order concept.
	--
	-- To create a new iterator, use `new_iterator' in the
	-- corresponding data structure.
	--
	-- See examples in directory SmartEiffel/tutorial/iterator.

feature {ANY}
	start is
			-- Positions the iterator to the first object in the
			-- aggregate to be traversed.
		deferred
		end

	is_off: BOOLEAN is
			-- Returns True when there are no more objects in the
			-- sequence.
		deferred
		end

	item: E_ is
			-- Returns the object at the current position in the
			-- sequence.
		require
			not is_off
		deferred
		end

	next is
			-- Positions the iterator to the next object in the
			-- sequence.
		require
			not is_off
		deferred
		end

end -- class ITERATOR
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
