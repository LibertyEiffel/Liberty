-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BIDIRECTIONAL_ITERATOR[E_]
	-- An iterator that allows to traverse a COLLETION forward and backward.

	-- Such a collection shall be ordered, even if its items are not
	-- COMPARABLE. FOr example a two-way list of three-dimensional points may
	-- be iterated back and forth while the points are not naturally ordered.

inherit ITERATOR[E_]

feature {ANY}
	finish is
			-- Positions the iterator to the last object in the
			-- aggregate to be traversed.
		deferred
		end

	previous is
			-- Positions the iterator to the previous object in the
			-- sequence.
		require
			not is_off
		deferred
		end

end -- class BIDIRECTIONAL_ITERATOR
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
