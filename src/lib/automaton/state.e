-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STATE[E_]

creation {ANY}
	manifest_creation

feature {AUTOMATON}
	name: FIXED_STRING

	set_name (a_name: like name) is
		require
			a_name /= Void
		do
			name := a_name
		ensure
			name = a_name
		end

	run (a: AUTOMATON[E_]; e: E_): ABSTRACT_STRING is
		local
			i: INTEGER; found: BOOLEAN
		do
			a.call_before_guards(e, Current)
			from
				i := guards.lower
			until
				found
			loop
				found := guards.item(i).item([e, Current])
				if found then
					a.call_after_guards(e, Current)
					Result := transitions.item(i).item([e, Current])
				end
				i := i + 1
			end
		end

feature {}
	guards: COLLECTION[PREDICATE[TUPLE[E_, STATE[E_]]]]
			-- Each guard tests if the corresponding transition may be done.

	transitions: COLLECTION[FUNCTION[TUPLE[E_, STATE[E_]], ABSTRACT_STRING]]
			-- The transition gives the name of the successor state.

feature {}
	manifest_make (needed_capacity: INTEGER) is
		do
			create {FAST_ARRAY[PREDICATE[TUPLE[E_, STATE[E_]]]]} guards.with_capacity(needed_capacity)
			create {FAST_ARRAY[FUNCTION[TUPLE[E_, STATE[E_]], ABSTRACT_STRING]]} transitions.with_capacity(needed_capacity)
		end

	manifest_put (index: INTEGER; guard: PREDICATE[TUPLE[E_, STATE[E_]]]; transition: FUNCTION[TUPLE[E_, STATE[E_]], ABSTRACT_STRING]) is
		require
			index >= 0
		do
			guards.add_last(guard)
			transitions.add_last(transition)
		end

	manifest_semicolon_check: INTEGER is 2

invariant
	guards.count = transitions.count
	guards.lower = transitions.lower

end -- class STATE
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
