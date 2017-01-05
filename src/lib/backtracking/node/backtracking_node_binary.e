-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BACKTRACKING_NODE_BINARY
   --
   -- Node for a sequence of 2 nodes
   --

inherit
   BACKTRACKING_NODE
      undefine
         fill_tagged_out_memory
      end

insert
   BACKTRACKING_NODE_FILL

feature {ANY}
   first: BACKTRACKING_NODE
         -- first node of the sequence

   second: BACKTRACKING_NODE
         -- second node of the sequence

   make (frst, scnd: BACKTRACKING_NODE)
      require
         first_not_void: frst /= Void
         second_not_void: scnd /= Void
      do
         first := frst
         second := scnd
      ensure
         definition: first = frst and second = scnd
         first_not_void: first /= Void
         second_not_void: second /= Void
      end

   set_first (value: BACKTRACKING_NODE)
      require
         value_not_void: value /= Void
      do
         first := value
      ensure
         definition: first = value
         first_not_void: first /= Void
      end

   set_second (value: BACKTRACKING_NODE)
      require
         value_not_void: value /= Void
      do
         second := value
      ensure
         definition: second = value
         second_not_void: second /= Void
      end

invariant
   first_not_void: first /= Void
   second_not_void: second /= Void

end -- class BACKTRACKING_NODE_BINARY
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
