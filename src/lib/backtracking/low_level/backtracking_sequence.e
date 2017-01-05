-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BACKTRACKING_SEQUENCE
   --
   -- A single node sequence.
   --

inherit
   ABSTRACT_BACKTRACKING_SEQUENCE
      rename pool as pool_of_sequence
      end

insert
   BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
   next: BACKTRACKING_NODE
         -- next node

   set_next (value: BACKTRACKING_NODE)
      require
         value_not_void: value /= Void
      do
         next := value
      ensure
         definition: next = value
         next_not_void: next /= Void
      end

   next_sequence (explorer: BACKTRACKING)
      do
         -- Tell to evaluate 'next' now.
         explorer.set_current_node(next)
         -- Sequence is off, remove it.
         explorer.pop_sequence
      end

end -- class BACKTRACKING_SEQUENCE
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
