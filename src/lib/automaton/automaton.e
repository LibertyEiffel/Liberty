-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class AUTOMATON[E_]

create {ANY}
   manifest_creation

feature {ANY} -- Simple one-shot execution
   run (start_state: ABSTRACT_STRING; e: E_)
      require
         has(start_state)
      local
         context: AUTOMATON_CONTEXT[E_]
      do
         from
            context := start(start_state, e)
         until
            not context.is_valid
         loop
            next(context)
         end
      end

   has (state_name: ABSTRACT_STRING): BOOLEAN
      require
         state_name /= Void
      do
         Result := states.fast_has(state_name.intern)
      end

feature {ANY} -- Step-by-step execution
   start (start_state: ABSTRACT_STRING; e: E_): AUTOMATON_CONTEXT[E_]
      require
         has(start_state)
      local
         state: STATE[E_]
      do
         create Result.make(e)
         state := next_transition(Void, start_state, e)
         check
            state_exists: state /= Void
         end
         Result.set_current_state(state)
      ensure
         Result.is_valid
         Result.current_state /= Void
      end

   next (context: AUTOMATON_CONTEXT[E_])
      require
         context.is_valid
      local
         next_state: ABSTRACT_STRING
         state: STATE[E_]
      do
         next_state := context.current_state.run(Current, context.data)
         if next_state /= Void then
            check has(next_state) end
            state := next_transition(context.current_state, next_state, context.data)
            check
               state_exists: state /= Void
            end
            context.set_current_state(state)
         else
            last_transition(context.current_state, context.data)
            context.invalidate
         end
      end

feature {}
   next_transition (from_state: STATE[E_]; state_name: ABSTRACT_STRING; e: E_): STATE[E_]
      do
         debug ("automaton/transition")
            if from_state = Void then
               std_output.put_line("Void => " + state_name.out)
            else
               std_output.put_line(from_state.name.out + " => " + state_name.out)
            end
         end
         Result := states.fast_reference_at(state_name.intern)
         transition.call([e, from_state, Result])
      end

   last_transition (from_state: STATE[E_]; e: E_)
      require
         from_state /= Void
      local
         no_state: STATE[E_]
      do
         debug ("automaton/transition")
            std_output.put_line(from_state.name.out + " => Void")
         end
         transition.call([e, from_state, no_state])
      end

feature {STATE} --|* TODO: should be STATE[E_] (when Liberty can bootstrap)
   call_before_guards (e: E_; state: STATE[E_])
      do
         before_guards.call([e, state])
      end

   call_after_guards (e: E_; state: STATE[E_])
      do
         after_guards.call([e, state])
      end

feature {ANY}
   set_before_guards (p: like before_guards)
      do
         before_guards := p
      ensure
         before_guards = p
      end

   set_after_guards (p: like after_guards)
      do
         after_guards := p
      ensure
         after_guards = p
      end

   set_transition (p: like transition)
      do
         transition := p
      ensure
         transition = p
      end

feature {}
   states: DICTIONARY[STATE[E_], FIXED_STRING]
         -- A dictionary of all the states

   before_guards: PROCEDURE[TUPLE[E_, STATE[E_]]]
         -- That agent is called before checking guards. The given state is the current one.

   after_guards: PROCEDURE[TUPLE[E_, STATE[E_]]]
         -- That agent is called after checking guards, whether a guard was raised or not. The given state
         -- the current one.

   transition: PROCEDURE[TUPLE[E_, STATE[E_], STATE[E_]]]
         -- That agent is called when the next state was found. The given states are resp. the current one
         -- (Void if first transition) and the successor (Void is last transition).

   default_before_guards, default_after_guards, default_transition
      do
      end

feature {}
   manifest_make (needed_capacity: INTEGER)
      do
         create {HASHED_DICTIONARY[STATE[E_], FIXED_STRING]} states.with_capacity(needed_capacity)
         before_guards := agent default_before_guards
         after_guards := agent default_after_guards
         transition := agent default_transition
      end

   manifest_put (index: INTEGER; state_name: ABSTRACT_STRING; state: STATE[E_])
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

   manifest_semicolon_check: INTEGER 2

invariant
   states /= Void
   before_guards /= Void
   after_guards /= Void
   transition /= Void

end -- class AUTOMATON
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
