-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_BACKTRACKING
   --
   -- This class is intended to explore structures that match the and/or
   -- pattern. The and/or pattern is found for example in the evaluation of
   -- the regular expressions, in the evaluation of Prolog queries, in
   -- solving some generic problem of artificial intelligence.
   --
   -- The instances of the class inheriting ABSTRACT_BACKTRACKING are
   -- typically used through code like the following one that enumerate
   -- all the solutions:
   --
   --         from
   --            init_exploration(explorer)
   --            explorer.search_first
   --         until
   --            explorer.is_off
   --         loop
   --            treat_solution(explorer)
   --            explorer.search_next
   --         end
   --
   -- The exploration is the enumeration of all the paths in an abstract
   -- structure made of alternatives or sequences of goals to satisfy.
   --
   -- The class ABSTRACT_BACKTRACKING does not make any assumption on
   -- what is explored. That is its strength because it can be used in
   -- many situations. In such a case, nothing is said about what
   -- is a solution and what is a context. The implementations usually
   -- have to provide it.
   --
   -- A good understanding of how that class works is required if you
   -- intend to use it. See also the more easy-to-use class BACKTRACKING.
   --
   -- See tutorial/backtracking for examples.
   --
   -- The deferred features are 'evaluate_current_state'. 'context_clear',
   -- 'context_push', 'context_restore', 'context_restore_and_pop', 'context_cut'.
   --
   -- When the feature 'evaluate_current_state' is called,
   -- the implementor must perform actions to process the exploration.
   -- Here are some of the common things that can be done (note that
   -- one or more of these actions can be done):
   --   + stand-alone actions
   --     - replace the current state by an other state.
   --     - call 'backtrack': cancel the exploration of the current
   --       alternative and explore the next alternative.
   --     - call 'continue': explore the continuation of the
   --       current alternative.
   --   + actions that can be mixed but that need to be completed by
   --     one of the above actions
   --     - create a sequence of future path to evaluate and push it
   --       to the continuation path by calling 'push_sequence'.
   --     - create an alternative of future alternate path and push it
   --       to the alternative stack by calling 'push_alternative'.
   --     - push a cut point by calling 'push_cut_point'.
   --     - remove all alternatives until upper cut point by calling 'cut'.
   --     - remove all alternatives by calling 'cut_all'.
   --
   --
   -- Because the exploration of and/or abstractions can be huge, that
   -- class requires to manage alternatives and sequences in pools.
   --

insert
   ABSTRACT_BACKTRACKING_GLOBALS

feature {ANY} -- Common client features
   search_first
         -- Resets all and searches the first solution.
         -- The current state must be set. It is the
         -- first state, the root of the search.
         -- When the feature returns, 'search_is_success' must be
         -- checked to know if a solution was found.
         -- When search_is_success=False, it means that there
         -- is no solution at all. Conversely, if search_is_success=True,
         -- then the first solution is found and 'search_next'
         -- can be called to get the next solution if it exists.
      do
         -- prepare search from root
         clear
         stop_search_loop := False
         search_is_success := True
         -- search
         search
      ensure
         success_or_off: search_is_success and not is_off or is_off and not search_is_success
      end

   search_next
         -- Searches the next solution.
         -- When the feature returns, 'search_is_success' must be
         -- checked to know if a solution was found.
         -- When search_is_success=False at the end, it means that there
         -- is no more solution. Conversely, if search_is_success=True,
         -- then a solution is found and 'search_next'
         -- can be called again to get the next solution.
      require
         last_search_was_a_success: search_is_success
      do
         -- prepare next search
         stop_search_loop := False
         backtrack
         -- search
         search
      ensure
         success_or_off: search_is_success and not is_off or is_off and not search_is_success
      end

   search_is_success: BOOLEAN
         -- True when search is successful

   is_off: BOOLEAN
         -- True when search is finished
      do
         Result := not search_is_success
      ensure
         definition: Result = not search_is_success
      end

   clear
         -- Clears the current state to nothing.
      do
         context_clear
         from
            current_continuation := Void
         until
            top_sequence = Void
         loop
            remove_top_sequence
         end
         from
         until
            top_alternative = Void
         loop
            remove_top_alternative
         end
         search_is_success := False
      ensure
         cleared: is_cleared
         no_solution: is_off
      end

   is_cleared: BOOLEAN
         -- True if no partial data remain in the current state
      do
         Result := top_alternative = Void and then top_sequence = Void and then is_off
      ensure
         no_solution_when_cleared: Result implies is_off
      end

feature {ANY} -- Control of the exploration
   push_sequence (sequence: like top_sequence)
         -- Pushes the `sequence' in front of the continuation path.
      require
         sequence_not_void: sequence /= Void
      do
         sequence.set_continuation(current_continuation)
         sequence.set_previous(top_sequence)
         top_sequence := sequence
         current_continuation := top_sequence
      ensure
         is_on_top: top_sequence = sequence
         is_first_continuation: current_continuation = sequence
         previous_top_linked: top_sequence.previous = old top_sequence
         previous_continuation_linked: top_sequence.continuation = old current_continuation
      end

   push_alternative (alternative: like top_alternative)
         -- Pushes the `alternative' before the continuation path.
      require
         alternative_not_void: alternative /= Void
      do
         context_push
         alternative.set_continuation(current_continuation)
         alternative.set_top_sequence(top_sequence)
         alternative.set_previous(top_alternative)
         top_alternative := alternative
         if current_continuation /= Void then
            current_continuation := current_continuation.get_twin
            current_continuation.set_previous(top_sequence)
            top_sequence := current_continuation
         end
      ensure
         is_on_top: top_alternative = alternative
         previous_top_linked: top_alternative.previous = old top_alternative
         top_sequence_recorded: top_alternative.top_sequence = old top_sequence
         continuation_recorded: top_alternative.continuation = old current_continuation
      end

   continue
         -- Continues the exploration of the current path.
      do
         if current_continuation /= Void then
            current_continuation.next_sequence(Current)
         else
            stop_search_loop := True
         end
      end

   backtrack
         -- Stops the exploration of the current path and
         -- tries to explore the next alternative path.
      do
         if top_alternative /= Void then
            top_alternative.next_alternative(Current)
         else
            from
            until
               top_sequence = Void
            loop
               remove_top_sequence
            end
            current_continuation := Void
            stop_search_loop := True
            search_is_success := False
         end
      end

   push_cut_point
         -- Inserts a cut point into the continuation path.
         -- The inserted cut point records the current
         -- top of the alternatives.
      local
         cut_point: ABSTRACT_BACKTRACKING_CUT_POINT
      do
         -- creates the cut point
         cut_point := pool_of_cut_points.get_instance
         cut_point.set_top_alternative(top_alternative)
         push_sequence(cut_point)
      end

   cut
         -- Removes the alternatives until the one recorded by the next
         -- cut point in the continuation path.
      local
         sequence: like top_sequence; cut_point: ABSTRACT_BACKTRACKING_CUT_POINT
         alternative: ABSTRACT_BACKTRACKING_ALTERNATIVE
      do
         -- retrieves the first cut point in the continuation path
         from
            sequence := current_continuation
         until
            sequence = Void
         loop
            if cut_point ?:= sequence then
               cut_point ::= sequence
               sequence := sequence.continuation
            else
               alternative := cut_point.top_alternative
               sequence := Void
            end
         end
         -- removes the alternatives until the one that
         -- recorded in the retrieved cut point.
         cut_until(alternative)
      end

   cut_all
         -- Cuts all alternatives.
      do
         cut_until(Void)
      end

feature {} -- Internal
   stop_search_loop: BOOLEAN
         -- True if at the end of a search.
         -- This occurs if either a solution is found
         -- (and then search_is_success=True) or no solution
         -- is found (and then search_is_success=False).
         -- That feature should be modified only by `continue'
         -- and `backtrack'.

   search
         -- Common search loop to search_first and search_next
      do
         from
         until
            stop_search_loop
         loop
            evaluate_current_state
         end
      ensure
         stop_search_loop
      end

   cut_until (alternative: ABSTRACT_BACKTRACKING_ALTERNATIVE)
         -- Cut all alternatives until 'alternative'.
         -- To cut an alternative is currently to remove it.
      do
         from
         until
            top_alternative = alternative
         loop
            context_cut
            remove_top_alternative
         end
      ensure
         definition: top_alternative = alternative
      end

feature {} -- Internal deferred
   evaluate_current_state
         -- That feature is called to evaluate the current state.
         -- Called repeatedly by `search' until `stop_search_loop'.
      deferred
      end

   context_clear
         -- Clear any saved context.
         -- Called by the features `clear' and `search_first'.
      deferred
      end

   context_push
         -- Push the current context.
         -- Called each time that an alternative begins.
      deferred
      end

   context_restore
         -- Restore the context to the last saved one.
         -- The saved context MUST remain available for future use.
         -- Called each time that a new alternative (of the
         -- previous alternative point) is starting.
      deferred
      end

   context_restore_and_pop
         -- Restore the context to the last saved one and drop it.
         -- The saved context MUST be removed.
         -- Called each time that the last alternative (of the
         -- previous alternative point) is starting.
         -- Should be similar to `context_restore' followed by `context_cut'.
      deferred
      end

   context_cut
         -- Remove the last saved context.
         -- Called by `cut', `cut_all' or `cut_until'.
      deferred
      end

feature {ABSTRACT_BACKTRACKING_SEQUENCE} -- Specific to sequences
   top_sequence: ABSTRACT_BACKTRACKING_SEQUENCE
         -- Stack of sequences represented by its top (can
         -- be Void)

   current_continuation: like top_sequence
         -- The current continuation path

   pop_sequence
         -- Removes the current sequence and replace it by
         -- the next sequence in the continuation path.
      require
         top_sequence /= Void
         current_continuation /= Void
      do
         -- technical note: because the sequences are
         -- free to record there iteration state, the
         -- continuations, that can be used several times,
         -- need to be copied when not Void.
         current_continuation := top_sequence.continuation
         remove_top_sequence
         if current_continuation /= Void then
            current_continuation := current_continuation.get_twin
            current_continuation.set_previous(top_sequence)
            top_sequence := current_continuation
         end
      end

feature {ABSTRACT_BACKTRACKING_ALTERNATIVE} -- Specific to alternatives
   top_alternative: ABSTRACT_BACKTRACKING_ALTERNATIVE
         -- Stack of alternatives represented by its top (can
         -- be Void)

   continue_alternative
         -- Returns to the alternative on the top of the stack
         -- and put its saved continuation path as the
         -- current continuation path.
      require
         top_alternative /= Void
      do
         -- removes useless data
         from
         until
            top_sequence = top_alternative.top_sequence
         loop
            remove_top_sequence
         end
         -- restores the saved continuation path
         context_restore
         current_continuation := top_alternative.continuation
         if current_continuation /= Void then
            current_continuation := top_sequence.get_twin
            current_continuation.set_previous(top_sequence)
            top_sequence := current_continuation
         end
      ensure
         alternative_remain: top_alternative = old top_alternative
      end

   pop_alternative
         -- Returns to the alternative on the top of the stack
         -- and put its saved continuation path as the
         -- current continuation path.
         -- Remove the alternative from the stack of alternatives.
         -- Same as `continue_alternative' but also removes
         -- the alternative.
      require
         top_alternative /= Void
      do
         -- removes useless data
         from
         until
            top_sequence = top_alternative.top_sequence
         loop
            remove_top_sequence
         end
         -- restore the saved continuation path and pop the alternative
         context_restore_and_pop
         current_continuation := top_alternative.continuation
         remove_top_alternative
      ensure
         alternative_poped: top_alternative = old top_alternative.previous
         top_sequence_restored: top_sequence = old top_alternative.top_sequence
         continuation_restored: current_continuation = old top_alternative.continuation
      end

feature {} -- internal: allocation and collection
   remove_top_sequence
         -- Removes the top sequence.
      require
         top_sequence /= Void
      local
         sequence: like top_sequence
      do
         sequence := top_sequence
         top_sequence := sequence.previous
         sequence.release
      ensure
         top_sequence = old top_sequence.previous
      end

   remove_top_alternative
         -- Removes the top alternative.
      require
         top_alternative /= Void
      local
         alternative: like top_alternative
      do
         alternative := top_alternative
         top_alternative := alternative.previous
         alternative.release
      ensure
         top_alternative = old top_alternative.previous
      end

invariant
   current_continuation = Void or current_continuation = top_sequence
   top_sequence = Void implies current_continuation = Void

end -- class ABSTRACT_BACKTRACKING
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
