-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class AUTOMATON[E_]

creation {ANY}
	manifest_creation

feature {ANY}
	run (start_state: ABSTRACT_STRING; e: E_) is
		require
			has(start_state)
		local
			next: ABSTRACT_STRING
			state: STATE[E_]
		do
			from
				state := transition(Void, start_state, e)
				next := state.run(Current, e)
			invariant
				next /= Void implies has(next)
			until
				next = Void
			loop
				state := transition(state, next, e)
				next := state.run(Current, e)
			end
			last_transition(state, e)
		end

	has (state_name: ABSTRACT_STRING): BOOLEAN is
		require
			state_name /= Void
		do
			Result := states.fast_has(state_name.intern)
		end

feature {}
	transition (from_state: STATE[E_]; state_name: ABSTRACT_STRING; e: E_): STATE[E_] is
		do
			debug ("automaton/transition")
				if from_state = Void then
					std_output.put_line("Void => " + state_name.out)
				else
					std_output.put_line(from_state.name.out + " => " + state_name.out)
				end
			end
			before_transition.call([e, from_state])
			Result := states.fast_reference_at(state_name.intern)
			after_transition.call([e, from_state, Result])
		end

	last_transition (from_state: STATE[E_]; e: E_) is
		do
			debug ("automaton/transition")
				std_output.put_line(from_state.name.out + " => Void")
			end
			before_transition.call([e, from_state])
			after_transition.call([e, from_state, Void])
		end

feature {STATE} --|* TODO: should be STATE[E_] (when Liberty can bootstrap)
	call_before_guards (e: E_) is
		do
			before_guards.call([e])
		end

	call_after_guards (e: E_) is
		do
			after_guards.call([e])
		end

feature {ANY}
	set_before_guards (p: like before_guards) is
		do
			before_guards := p
		ensure
			before_guards = p
		end

	set_after_guards (p: like after_guards) is
		do
			after_guards := p
		ensure
			after_guards = p
		end

	set_before_transition (p: like before_transition) is
		do
			before_transition := p
		ensure
			before_transition = p
		end

	set_after_transition (p: like after_transition) is
		do
			after_transition := p
		ensure
			after_transition = p
		end

feature {}
	states: DICTIONARY[STATE[E_], FIXED_STRING]
	before_guards: PROCEDURE[TUPLE[E_]]
	after_guards: PROCEDURE[TUPLE[E_]]
	before_transition: PROCEDURE[TUPLE[E_, STATE[E_]]]
	after_transition: PROCEDURE[TUPLE[E_, STATE[E_], STATE[E_]]]

	default_before_guards, default_after_guards, default_before_transition, default_after_transition is
		do
		end

feature {}
	manifest_make (needed_capacity: INTEGER) is
		do
			create {HASHED_DICTIONARY[STATE[E_], FIXED_STRING]} states.with_capacity(needed_capacity)
			before_guards := agent default_before_guards
			after_guards := agent default_after_guards
			before_transition := agent default_before_transition
			after_transition := agent default_after_transition
		end

	manifest_put (index: INTEGER; state_name: ABSTRACT_STRING; state: STATE[E_]) is
		require
			index >= 0
			not states.fast_has(state_name.intern)
		local
			name: FIXED_STRING
		do
			name := state_name.intern
			state.set_name(name)
			states.add(state, name)
		ensure
			states.fast_has(state_name.intern)
		end

	manifest_semicolon_check: INTEGER is 2

invariant
	states /= Void
	before_guards /= Void
	after_guards /= Void
	before_transition /= Void
	after_transition /= Void

end -- class AUTOMATON
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
