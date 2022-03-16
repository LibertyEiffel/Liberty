-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_BACKTRACKING_SEQUENCE
   --
   -- Abstract realisation of a sequence iterator
   -- for the ABSTRACT_BACKTRACKING
   --
   -- The ABSTRACT_BACKTRACKING uses the fields
   -- continuation to record the continuation path
   -- and calls the feature 'next_sequence' to let
   -- the current object choose how to continue the
   -- exploration.
   --

inherit
   ABSTRACT_BACKTRACKING_POOLABLE
      rename pool_link as previous,
         set_pool_link as set_previous
      export {ABSTRACT_BACKTRACKING_POOL, ABSTRACT_BACKTRACKING} set_previous
      redefine previous
      end

feature {ABSTRACT_BACKTRACKING_POOL, ABSTRACT_BACKTRACKING}
   previous: ABSTRACT_BACKTRACKING_SEQUENCE
         -- For the linked stack of sequences.
         -- Managed by ABSTRACT_BACKTRACKING.

feature {ABSTRACT_BACKTRACKING}
   continuation: ABSTRACT_BACKTRACKING_SEQUENCE
         -- The sequence to continue after a success in
         -- exploration of the current sequence.
         -- Managed by ABSTRACT_BACKTRACKING.

   set_continuation (value: like continuation)
      do
         continuation := value
      ensure
         definition: continuation = value
      end

   next_sequence (explorer: ABSTRACT_BACKTRACKING)
         -- Called by ABSTRACT_BACKTRACKING to let
         -- the current object switch to the next state
         -- to explore.
         -- Two actions must be performed by that feature:
         --   - make iteration actions and then call
         --      'pop_sequence' if this is the last state
         --      to be explored.
         --   - select the state to be evaluated or
         --      call 'continue' or call 'backtrack'.
      require
         is_on_top: Current = explorer.top_sequence
      deferred
      end

end -- class ABSTRACT_BACKTRACKING_SEQUENCE
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
