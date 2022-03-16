-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class SEARCHABLE[E_]
   --
   -- A SEARCHABLE sequence is INDEXABLE, and the index of each
   -- element may be retrieved.
   --

inherit
   INDEXABLE[E_]

feature {ANY} -- Looking and Searching:
   has (x: like item): BOOLEAN
         -- Look for `x' using `is_equal' for comparison.
         --
         -- See also `fast_has', `index_of', `fast_index_of'.
      deferred
      ensure
         definition: Result = valid_index(first_index_of(x))
      end

   fast_has (x: like item): BOOLEAN
         -- Look for `x' using basic `=' for comparison.
         --
         -- See also `has', `fast_index_of', `index_of'.
      deferred
      ensure
         definition: Result = valid_index(fast_first_index_of(x))
      end

   first_index_of (element: like item): INTEGER
         -- Give the index of the first occurrence of `element' using `is_equal' for comparison.
         -- Answer `upper + 1' when `element' is not inside.
         --
         -- See also `fast_first_index_of', `index_of', `last_index_of', `reverse_index_of'.
      deferred
      ensure
         definition: Result = index_of(element, lower)
      end

   index_of (element: like item; start_index: INTEGER): INTEGER
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Return `upper + 1' if the search for `element' failed.
         --
         -- See also `fast_index_of', `reverse_index_of', `first_index_of'.
      deferred
      ensure
         Result.in_range(start_index, upper + 1)
         valid_index(Result) implies (create {SAFE_EQUAL[E_]}).test(element, item(Result))
      end

   reverse_index_of (element: like item; start_index: INTEGER): INTEGER
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or before
         -- `start_index'. Search is done in reverse direction, which means from the `start_index' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_reverse_index_of', `last_index_of', `index_of'.
      require
         valid_index(start_index)
      deferred
      ensure
         Result.in_range(lower - 1, start_index)
         valid_index(Result) implies item(Result).is_equal(element)
      end

   last_index_of (element: like item): INTEGER
         -- Using `is_equal' for comparison, gives the index of the last occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from the `upper' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_last_index_of', `reverse_index_of', `index_of'.
      deferred
      ensure
         definition: Result = reverse_index_of(element, upper)
      end

   fast_first_index_of (element: like item): INTEGER
         -- Give the index of the first occurrence of `element' using basic `=' for comparison.
         -- Answer `upper + 1' when `element' is not inside.
         --
         -- See also `first_index_of', `last_index_of', `fast_last_index_of'.
      deferred
      ensure
         definition: Result = fast_index_of(element, lower)
      end

   fast_index_of (element: like item; start_index: INTEGER): INTEGER
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `upper + 1' when `element' when the search fail.
         --
         -- See also `index_of', `fast_reverse_index_of', `fast_first_index_of'.
      deferred
      ensure
         Result.in_range(start_index, upper + 1)
         valid_index(Result) implies element = item(Result)
      end

   fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER
         -- Using basic `=' comparison, gives the index of the first occurrence of `element' at or before
         -- `start_index'. Search is done in reverse direction, which means from the `start_index' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `reverse_index_of', `fast_index_of', `fast_last_index_of'.
      require
         valid_index(start_index)
      deferred
      ensure
         Result.in_range(lower - 1, start_index)
         valid_index(Result) implies item(Result) = element
      end

   fast_last_index_of (element: like item): INTEGER
         -- Using basic `=' for comparison, gives the index of the last occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from the `upper' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_reverse_index_of', `last_index_of'.
      deferred
      ensure
         definition: Result = fast_reverse_index_of(element, upper)
      end

end -- class SEARCHABLE
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
