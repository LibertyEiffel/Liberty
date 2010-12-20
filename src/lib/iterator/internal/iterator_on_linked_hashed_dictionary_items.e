-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_LINKED_HASHED_DICTIONARY_ITEMS[V_, K_]
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[V_]

creation {ANY}
	make

feature {}
	first, node: LINKED_HASHED_DICTIONARY_NODE[V_, K_]

feature {ANY}
	make (a_node: like node) is
		require
			a_node /= Void
		do
			first := a_node
			node := Void
		ensure
			first = a_node
			node = Void
		end

	start is
		do
			node := first
		end

	is_off: BOOLEAN is
		do
			Result := node = Void
		end

	item: V_ is
		do
			Result := node.item
		end

	next is
		do
			if node.next_link = first then
				node := Void
			else
				node := node.next_link
			end
		end

end -- class ITERATOR_ON_LINKED_HASHED_DICTIONARY_ITEMS
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
