-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ABSTRACT_BACKTRACKING_CUT_POINT
   --
   -- Instances of that class are used by the ABSTRACT_BACKTRACKING
   -- to record "cut points" data. A cut point is an indication of
   -- up to which alternative are to be removed from the exploration.
   --
   -- Instances of that class are inserted in the continuation path
   -- to be retrieved by dynamic cast during calls to cut.
   --

inherit
   ABSTRACT_BACKTRACKING_SEQUENCE
      rename pool as pool_of_cut_points
      end

insert
   ABSTRACT_BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
   top_alternative: ABSTRACT_BACKTRACKING_ALTERNATIVE
         -- Record of what top of the stack of alternative
         -- is to restore when cut is called.
         -- Managed by ABSTRACT_BACKTRACKING.

   set_top_alternative (value: like top_alternative)
      do
         top_alternative := value
      ensure
         definition: top_alternative = value
      end

   next_sequence (explorer: ABSTRACT_BACKTRACKING)
         -- Do nothing: remove itself (as if it were the end
         -- of a sequence) and evaluate the continuation by
         -- issuing a 'continue'.
      do
         explorer.pop_sequence
         explorer.continue
      end

end -- class ABSTRACT_BACKTRACKING_CUT_POINT
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
