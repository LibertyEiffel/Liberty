-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_SET[E_]
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[E_]

creation {ANY}
	make

feature {}
	set: SET[E_]
			-- The one to be traversed.

	item_index: INTEGER

feature {ANY}
	make (d: SET[E_]) is
		require
			d /= Void
		do
			set := d
			start
		ensure
			set = d
		end

	start is
		do
			item_index := 1
			generation := iterable_generation
		end

	is_off: BOOLEAN is
		do
			Result := item_index > set.count
		end

	item: E_ is
		do
			Result := set.item(item_index)
		end

	next is
		do
			item_index := item_index + 1
		end

feature {}
	iterable_generation: INTEGER is
		do
			Result := set.generation
		end

end -- class ITERATOR_ON_SET
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
