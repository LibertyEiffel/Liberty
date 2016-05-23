-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class STRING_POOL
   --
   -- The STRING_POOL is a collection of strings. It is initialized from
   -- another collection. The strings are not kept "as-is"; that way, you
   -- can reuse your initial collection, or the strings in it; the
   -- string_pool won't be changed.
   --
   -- Be aware that using a STRING_POOL is not always interesting, because
   -- it is very memory-consuming. It's advantage, though, is to be able to
   -- find if a string is in the pool or not (and find its index), very
   -- quickly.
   --

insert
   GLOBALS

feature {ANY} -- Interface:
   has_empty: BOOLEAN
      -- The headers list has an empty string

   has (a_string: STRING): BOOLEAN
      require
         string_not_void: a_string /= Void --string_not_empty: a_string.count > 0
      do
         compute_final_state(a_string, 1, a_string.count)
         Result := last_match /= unknown_state
      end

   has_substring (a_string: STRING; first, last: INTEGER): BOOLEAN
      require
         string_not_void: a_string /= Void --string_not_empty:  a_string.count > 0
         first_in_string: first > 0
         last_in_string: last <= a_string.count
         first_before_last: last >= first
      do
         compute_final_state(a_string, first, last)
         Result := last_match /= unknown_state
      end

   index_of (a_string: STRING): INTEGER
      require
         string_not_void: a_string /= Void --string_not_empty: a_string.count > 0
         has_string: has(a_string)
      do
         compute_final_state(a_string, 1, a_string.count)
         Result := last_external_match
      end

   index_of_substring (a_string: STRING; first, last: INTEGER): INTEGER
      require
         string_not_void: a_string /= Void --string_not_empty:  a_string.count > 0
         first_in_string: first > 0
         last_in_string: last <= a_string.count
         first_before_last: last >= first
         has_substring: has_substring(a_string, first, last)
      do
         compute_final_state(a_string, first, last)
         Result := last_external_match
      end

feature {ANY} -- Initialization:
   from_collection (a_headers: COLLECTION[STRING])
         -- Initializes the automaton. The given strings will be the ones
         -- that can be matched. In that case, `match' will return the index
         -- of the matched string in that collection.
         --
         -- Be aware that the processing time is quite heavy during the
         -- initialization. It's the pay-off to make it really lighter
         -- matches. Don't use the string_pool for a one-time test, it's only
         -- useful in the long run.
         --
         -- After initialization, you can safely discard or modify the
         -- collection; it will not change the automaton.
      require
         headers_not_void: a_headers /= Void
         headers_not_empty: a_headers.count > 0
         -- each string contains a different word
         --headers_not_empty: -- each string is non-empty
         unique_headers:
      local
         cs: COLLECTION_SORTER[STRING]
      do
         counter.next
         id := counter.item
         create headers.from_collection(a_headers)
         cs.sort(headers)
         count_states
         make_transitions_array
         compile_headers
         externalize_tags(a_headers)
         debug
            report(a_headers)
         end
      end

feature {} -- At initialization time:
   report (a_headers: COLLECTION[STRING])
      local
         i, j, n, st: INTEGER; s: STRING
      do
         echo.put_string(once "STRING_POOL#")
         echo.put_integer(id)
         echo.put_string(once ": ")
         echo.put_integer(maxstate + 1)
         echo.put_string(once " transition")
         if maxstate > 0 then
            echo.put_character('s')
         end

         echo.put_string(once ".%N")
         from
            i := a_headers.lower
         until
            i > a_headers.upper
         loop
            s := a_headers.item(i)
            echo.put_string("%T%"")
            echo.put_string(s)
            echo.put_string(once "%": ")
            if s.is_empty then
               st := empty_idx
            else
               from
                  st := unknown_state
                  n := s.count
                  j := 1
               until
                  j > n
               loop
                  if j > 1 then
                     echo.put_character(',')
                  end
                  st := state(st, s.item(j))
                  echo.put_integer(st)
                  j := j + 1
               end
            end

            echo.put_string(once " -> ")
            io.flush
            echo.put_integer(tag_state.fast_at(st))
            echo.put_new_line
            i := i + 1
         end
      end

   count_states
      local
         c, k: CHARACTER; i, j: INTEGER; again, next_c: BOOLEAN; s: STRING; defstate, oldstate, newstate: INTEGER
      do
         transition_memory.make(headers.count)
         transition_memory.set_all_with(unknown_state)
         from
            maxstate := 0
            newstate := unknown_state
            defstate := headers.upper
            again := True
            i := 1
         until
            not again
         loop
            again := False
            from
               next_c := True
               j := headers.lower
            until
               j > headers.upper
            loop
               s := headers.item(j)
               if not has_empty and then s.is_empty then
                  has_empty := True
                  empty_idx := j
               end

               debug
                  io.put_string(s)
                  io.put_string(once "%T[")
                  io.put_integer(i)
                  io.put_string(once "]%N")
               end
               if oldstate /= transition_memory.item(j) then
                  oldstate := transition_memory.item(j)
                  next_c := True
               end

               if i > s.count then
                  next_c := True
               else
                  check
                     transition_memory.item(j) /= j
                  end
                  again := True
                  k := s.item(i)
                  if i = s.count then
                     check
                        next_c or else c /= k
                     end
                     newstate := j
                     c := k
                  elseif next_c or else c /= k then
                     defstate := defstate + 1
                     newstate := defstate
                     c := k
                  end

                  next_c := False
                  check
                     newstate /= unknown_state
                  end
                  transition_memory.put(newstate, j)
               end

               j := j + 1
            end

            i := i + 1
         end

         maxstate := defstate
         debug
            io.put_string(once "maxstate = ")
            io.put_integer(maxstate)
            io.put_new_line
         end
      end

   compile_headers
         -- Create the automaton.
      local
         c, k: CHARACTER; i, j: INTEGER; again, next_c: BOOLEAN; s: STRING; defstate, oldstate, newstate: INTEGER
      do
         transition_memory.make(headers.count)
         transition_memory.set_all_with(unknown_state)
         newstate := unknown_state
         defstate := headers.upper
         from
            again := True
            i := 1
         until
            not again
         loop
            again := False
            from
               next_c := True
               j := headers.lower
            until
               j > headers.upper
            loop
               s := headers.item(j)
               debug
                  io.put_string(s)
                  io.put_string(once "%T[")
                  io.put_integer(i)
                  io.put_string(once "]%N")
               end
               if oldstate /= transition_memory.item(j) then
                  oldstate := transition_memory.item(j)
                  next_c := True
               end

               if i > s.count then
                  next_c := True
               else
                  check
                     transition_memory.item(j) /= j
                  end
                  again := True
                  k := s.item(i)
                  if i = s.count then
                     check
                        next_c or else c /= k
                     end
                     newstate := j
                     c := k
                     set_state(newstate, oldstate, k)
                  elseif next_c or else c /= k then
                     defstate := defstate + 1
                     newstate := defstate
                     c := k
                     set_state(newstate, oldstate, k)
                  end

                  next_c := False
                  check
                     newstate /= unknown_state
                  end
                  transition_memory.put(newstate, j)
               end

               j := j + 1
            end

            i := i + 1
         end
      end

   externalize_tags (a_headers: COLLECTION[STRING])
         -- Create tag_state
      local
         intern, extern: INTEGER; s: STRING
      do
         if tag_state = Void then
            create {AVL_DICTIONARY[INTEGER, INTEGER]} tag_state.make
         else
            tag_state.clear_count
         end
         from
            extern := a_headers.lower
         until
            extern > a_headers.upper
         loop
            s := a_headers.item(extern)
            intern := the_final_state(s, 1, s.count)
            debug
               echo.put_integer(intern)
               echo.put_string(once " [int] <-> ")
               echo.put_integer(extern)
               echo.put_string(once " [ext]%N")
            end
            tag_state.fast_put(extern, intern)
            extern := extern + 1
         end
      end

feature {} -- State management:
   make_transitions_array
      deferred
      end

   set_state (new_state, previous_state: INTEGER; character: CHARACTER)
      require
         previous_state.in_range(unknown_state, maxstate)
         new_state.in_range(0, maxstate)
      deferred
      ensure
         state(previous_state, character) = new_state
      end

   state (previous_state: INTEGER; character: CHARACTER): INTEGER
      require
         previous_state.in_range(unknown_state, maxstate)
      deferred
      end

feature {} -- Finding a string:
   compute_final_state (a_string: STRING; first, last: INTEGER)
      do
         last_match := the_final_state(a_string, first, last)
         if last_match > headers.count then
            last_match := unknown_state
         elseif last_match /= unknown_state then
            check
               headers.item(last_match).is_equal(a_string.substring(first, last))
            end
            -- now externalize
            last_external_match := tag_state.fast_at(last_match)
         end
      end

   the_final_state (a_string: STRING; first, last: INTEGER): INTEGER
      local
         i: INTEGER
      do
         if a_string.is_empty then
            Result := empty_idx
         else
            from
               Result := state(unknown_state, a_string.item(first))
               i := first + 1
            until
               i > last or else Result = unknown_state
            loop
               Result := state(Result, a_string.item(i))
               i := i + 1
            end
         end
      end

feature {}
   maxstate: INTEGER

   id: INTEGER

   empty_idx: INTEGER

   last_match: INTEGER

   last_external_match: INTEGER

   tag_state: DICTIONARY[INTEGER, INTEGER] -- internal => external states

feature {}
   unknown_state: INTEGER -1

   headers: FAST_ARRAY[STRING]

   transition_memory: FAST_ARRAY[INTEGER]
      once
         create Result.with_capacity(4)
      end

   counter: COUNTER
      once
         create Result
      end

end -- class STRING_POOL
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
