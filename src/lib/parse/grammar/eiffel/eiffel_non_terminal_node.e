-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class EIFFEL_NON_TERMINAL_NODE

inherit
   EIFFEL_NODE

feature {ANY}
   name_at (index: INTEGER): FIXED_STRING
      require
         valid_index(index)
      deferred
      end

   node_at (index: INTEGER): EIFFEL_NODE
      require
         valid_index(index)
      deferred
      end

   valid_index (index: INTEGER): BOOLEAN
      deferred
      ensure
         definition: Result = (index >= lower and then index <= upper)
      end

   lower: INTEGER
      deferred
      ensure
         Result >= 0
      end

   upper: INTEGER
      deferred
      ensure
         Result >= upper - 1
      end

   count: INTEGER
      deferred
      ensure
         definition: Result = upper - lower + 1
      end

   is_empty: BOOLEAN
      deferred
      ensure
         definition: Result = (count = 0)
      end

   source_line: INTEGER
      do
         if count > 0 then
            Result := node_at(0).source_line
         end
      end

   source_column: INTEGER
      do
         if count > 0 then
            Result := node_at(0).source_column
         end
      end

   source_index: INTEGER
      do
         if count > 0 then
            Result := node_at(0).source_index
         end
      end

feature {EIFFEL_GRAMMAR}
   set (index: INTEGER; node: EIFFEL_NODE)
      require
         valid_index(index)
      deferred
      ensure
         node_at(index) = node
      end

end -- class EIFFEL_NON_TERMINAL_NODE
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
