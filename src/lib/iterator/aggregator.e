-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class AGGREGATOR[E_, R_]

feature {ANY}
   map, map_iter (items: ITERABLE[E_]; action: FUNCTION[TUPLE[E_, R_], R_]; initial: R_): R_
      local
         iterator: ITERATOR[E_]
      do
         Result := initial
         from
            iterator := items.new_iterator
         until
            iterator.is_off
         loop
            Result := action.item([iterator.item, Result])
            iterator.next
         end
      end

   map_index (items: INDEXABLE[E_]; action: FUNCTION[TUPLE[E_, R_, INTEGER], R_]; initial: R_): R_
      local
         i: INTEGER
      do
         Result := initial
         from
            i := items.lower
         until
            i > items.upper
         loop
            Result := action.item([items.item(i), Result, i])
            i := i + 1
         end
      end

end -- class AGGREGATOR
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
