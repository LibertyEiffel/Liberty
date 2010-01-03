-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ITERABLE[E_]
	--
	-- An `ITERABLE[E_]' is a (potentially infinite) readable sequence of objects of type E_ that can be
	-- accessed through an ITERATOR[E]
	--
	-- TODO: implement iterator-based `do_all', `for_all' and `exists' features.
	--

inherit
	HOARD[E_]

feature {ANY} -- Other features:
	new_iterator: ITERATOR[E_] is
		deferred
		ensure
			Result /= Void
		end

	frozen get_new_iterator: like new_iterator is
		obsolete "Please use new_iterator instead. This SmartEiffel historic feature is badly named."
		do
			Result := new_iterator
		end

feature {ANY} -- Agent-based features:
	do_all (action: ROUTINE[TUPLE[E_]]) is
			-- Apply `action' to every item of `Current'.
			--
			-- See also `for_all', `exists'.
		local
			i: like new_iterator
		do
			from
				i := new_iterator
				i.start
			until
				i.is_off
			loop
				action.call([i.item])
				i.next
			end
		end

	for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
			-- Do all items satisfy `test'?
			--
			-- See also `do_all', `exists'.
		local
			i: like new_iterator
		do
			from
				Result := True
				i := new_iterator
				i.start
			until
				not Result or else i.is_off
			loop
				Result := test.item([i.item])
				i.next
			end
		end

	exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
			-- Does at least one item satisfy `test'?
			--
			-- See also `do_all', `for_all'.
		local
			i: like new_iterator
		do
			from
				i := new_iterator
				i.start
			until
				Result or else i.is_off
			loop
				Result := test.item([i.item])
				i.next
			end
		end

end -- class ITERABLE
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
