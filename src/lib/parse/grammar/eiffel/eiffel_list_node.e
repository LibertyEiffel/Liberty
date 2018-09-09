-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class EIFFEL_LIST_NODE

inherit
   EIFFEL_NODE
      undefine out_in_tagged_out_memory
      end

insert
   TRAVERSABLE[EIFFEL_NODE]

feature {ANY}
   frozen new_iterator: ITERATOR[EIFFEL_NODE]
      do
         check
            dont_use_this: False
         end
      end

   source_line: INTEGER
      do
         if count > 0 then
            Result := first.source_line
         end
      end

   source_column: INTEGER
      do
         if count > 0 then
            Result := first.source_column
         end
      end

   source_index: INTEGER
      do
         if count > 0 then
            Result := first.source_index
         end
      end

feature {EIFFEL_GRAMMAR}
   add (a_child: like item)
      deferred
      ensure
         count = old count + 1
         first = a_child -- because the grammar is right-recursive the last child is added first
      end

end -- class EIFFEL_LIST_NODE
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
