-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class INTEGER_RANGE[E_->COMPARABLE]

inherit
   TRAVERSABLE[E_]
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   lower: INTEGER
   upper: INTEGER

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         first.out_in_tagged_out_memory
         tagged_out_memory.append(once "..")
         last.out_in_tagged_out_memory
         tagged_out_memory.extend(']')
      end

   count: INTEGER
      do
         Result := upper - lower + 1
      end

   first: E_
      do
         Result := item(lower)
      end

   last: E_
      do
         Result := item(upper)
      end

   new_iterator: ITERATOR[E_]
      do
         create {INTEGER_RANGE_ITERATOR[E_]} Result.make(lower, upper, itemize)
      end

   item (i: INTEGER): E_
      do
         Result := itemize.item([i])
      end

   is_empty: BOOLEAN False

   has, fast_has (i: INTEGER): BOOLEAN
      do
         Result := i.in_range(lower, upper)
      end

   index_of, fast_index_of, reverse_index_of, fast_reverse_index_of (i: E_; start: INTEGER): INTEGER
      do
         Result := indexize.item([i])
      end

   first_index_of, fast_first_index_of, last_index_of, fast_last_index_of (i: E_): INTEGER
      do
         Result := indexize.item([i])
      end

   make (low, up: INTEGER; a_itemize: like itemize; a_indexize: like indexize)
      require
         low <= up
         a_itemize /= Void
         a_indexize /= Void
      do
         lower := low
         upper := up
         itemize := a_itemize
         indexize := a_indexize
      ensure
         lower = low
         upper = up
         itemize = a_itemize
         indexize = a_indexize
      end

feature {}
   itemize: FUNCTION[TUPLE[INTEGER], E_]
   indexize: FUNCTION[TUPLE[E_], INTEGER]

invariant
   itemize /= Void
   indexize /= Void

end -- class INTEGER_RANGE
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
