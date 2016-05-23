-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_SORTER[X_]
   --
   -- Some algorithms to sort any COLLECTION, using a given order relation
   -- in deferred methods `lt', `gt', `lte' and `gte'.
   --
   -- Elements are sorted using increasing order: small elements
   -- at the beginning of the collection, large at the end (decreasing
   -- order is implemented by class REVERSE_COLLECTION_SORTER). Note that
   -- "small" means "a is smaller than b" when "lt (a, b)", no matter what
   -- `lt' is.
   --

feature {} -- Auxiliary functions
   lt (x, y: X_): BOOLEAN
      deferred
      end

   gt (x, y: X_): BOOLEAN
      do
         Result := lt(y, x)
      end

   lte (x, y: X_): BOOLEAN
      do
         Result := not lt(y, x)
      end

   gte (x, y: X_): BOOLEAN
      do
         Result := not lt(x, y)
      end

feature {ANY}
   is_sorted (c: COLLECTION[X_]): BOOLEAN
         -- Is `c' already sorted ?
         -- Uses `lte' for comparison.
      require
         c /= Void
      local
         i, c_upper: INTEGER; elt1, elt2: X_
      do
         i := c.lower
         c_upper := c.upper
         Result := True
         if c_upper > i then
            from
               elt1 := c.item(i)
            invariant
               c.valid_index(i)
            until
               not Result or else i >= c_upper
            loop
               i := i + 1
               elt2 := c.item(i)
               Result := lte(elt1, elt2)
               elt1 := elt2
            end
         end
      ensure
         c.is_equal(old c.twin)
      end

   has (c: COLLECTION[X_]; element: X_): BOOLEAN
      require
         c /= Void
         is_sorted(c)
      do
         Result := not c.is_empty and then c.item(index_of(c, element)).is_equal(element)
      ensure
         Result = c.has(element)
      end

   index_of (c: COLLECTION[X_]; element: X_): INTEGER
      require
         c /= Void
         is_sorted(c)
      do
         from
            Result := insert_index(c, element)
            if Result > c.lower then
               Result := Result - 1
            end
         until
            Result <= c.lower or else c.item(Result).is_equal(element) or else lt(c.item(Result), element)
         loop
            Result := Result - 1
         end
      ensure
         not c.is_empty implies c.valid_index(Result)
         c.has(element) implies c.item(Result).is_equal(element)
      end

   add (c: COLLECTION[X_]; element: X_)
         -- Add `element' in collection `c' keeping the sorted property.
      require
         c /= Void
         is_sorted(c)
      do
         c.add(element, insert_index(c, element))
      ensure
         c.count = old c.count + 1
         is_sorted(c)
      end

   insert_index (c: COLLECTION[X_]; element: X_): INTEGER
         -- retrieve the upper index for which gt
      require
         c /= Void
         is_sorted(c)
      local
         min, max: INTEGER
      do
         check
         -- is implied by count and is_empty post conditions of COLLECTION
            c.is_empty implies c.upper + 1 = c.lower
         end
         from
            min := c.lower
            max := c.upper + 1
         variant
            max - min
         until
            min = max
         loop
            check
               min < max
            end
            Result := (min + max) #// 2 --|*** (PH 10/09/04) if indexes are negatives?
            if lte(c.item(Result), element) then
               min := Result + 1
            else
               max := Result
            end
         end
         Result := min
      ensure
         c.valid_index(Result) implies gt(c.item(Result), element)
         c.valid_index(Result - 1) implies lte(c.item(Result - 1), element)
         Result.in_range(c.lower, c.upper + 1)
      end

   sort (c: COLLECTION[X_])
         -- Sort `c' using the default most efficient sorting algorithm
         -- already implemented.
      require
         c /= Void
      do
         if not is_sorted(c) then
            quick_sort(c)
         end
      ensure
         c.count = old c.count
         is_sorted(c)
      end

   quick_sort (c: COLLECTION[X_])
         -- Sort `c' using the quick sort algorithm.
      require
         c /= Void
      do
         quick_sort_region(c, c.lower, c.upper)
      ensure
         c.count = old c.count
         is_sorted(c)
      end

   von_neuman_sort (c: COLLECTION[X_])
         -- Sort `c' using the Von Neuman algorithm.
         -- This algorithm needs to create a second collection.
         -- Uses infix "lte" for comparison.
      require
         c /= Void
      local
         src, dest, tmp: COLLECTION[X_]; nb, count, d_count, c_count, lower, imax: INTEGER
      do
         c_count := c.count
         if c_count > 1 then
            lower := c.lower
            imax := c.upper + 1
            from
               count := 1
            until
               count >= c_count
            loop
               count := count * 2
               nb := nb + 1
            end
            if nb.is_odd then
               src := c
               dest := c.twin
            else
               dest := c
               src := c.twin
            end
            from
               count := 1
            variant
               c_count * 2 - count
            until
               count >= c_count
            loop
               d_count := count * 2
               tmp := dest
               dest := src
               src := tmp
               von_neuman_line(src, dest, count, d_count, lower, imax)
               count := d_count
            end
         end
      ensure
         c.count = old c.count
         is_sorted(c)
      end

   heap_sort (c: COLLECTION[X_])
         -- Sort `c' using the heap sort algorithm.
      require
         c /= Void
      local
         i, c_lower, c_upper: INTEGER
      do
         c_lower := c.lower
         c_upper := c.upper
         if c_upper > c_lower then
            from
               -- Build the very first heap first :
               from
                  i := c_lower + c.count #// 2 + 1
               until
                  i < c_lower
               loop
                  heap_repair(c, c_lower, i, c_upper)
                  i := i - 1
               end
               --
               i := c_upper
            until
               i < c_lower + 1
            loop
               c.swap(c_lower, i)
               heap_repair(c, c_lower, c_lower, i - 1)
               i := i - 1
            end
         end
      ensure
         c.count = old c.count
         is_sorted(c)
      end

   bubble_sort (c: COLLECTION[X_])
         -- Sort `c' using the bubble sort algorithm.
         -- Uses infix "<" for comparison.
      require
         c /= Void
      local
         i, imax, imin: INTEGER; modified: BOOLEAN
      do
         from
            imax := c.upper
            imin := c.lower
            modified := True
         until
            not modified or else imin >= imax
         loop
            from
               modified := False
               i := imax
               imin := imin + 1
            until
               i < imin
            loop
               if lt(c.item(i), c.item(i - 1)) then
                  c.swap(i, i - 1)
                  modified := True
               end
               i := i - 1
            end
            if modified then
               from
                  modified := False
                  i := imin
                  imax := imax - 1
               until
                  i > imax
               loop
                  if lt(c.item(i + 1), c.item(i)) then
                     c.swap(i, i + 1)
                     modified := True
                  end
                  i := i + 1
               end
            end
         end
      ensure
         c.count = old c.count
         is_sorted(c)
      end

feature {}
   von_neuman_line (src, dest: COLLECTION[X_]; count, d_count, lower, imax: INTEGER)
      require
         src /= dest
         src.lower = dest.lower
         src.upper = dest.upper
         count >= 1
         d_count = count * 2
         lower = src.lower
         imax = src.upper + 1
      local
         sg1: INTEGER
      do
         from
            sg1 := lower
         until
            sg1 >= imax
         loop
            von_neuman_inner_sort(src, dest, sg1, count, imax)
            sg1 := sg1 + d_count
         end
      ensure
         d_count >= dest.count implies is_sorted(dest)
      end

   von_neuman_inner_sort (src, dest: COLLECTION[X_]; sg1, count, imax: INTEGER)
      require
         src.valid_index(sg1)
      local
         i1, i2, i, i1max, i2max: INTEGER
      do
         from
            i1 := sg1
            i2 := sg1 + count
            i1max := i2.min(imax)
            i2max := (i2 + count).min(imax)
            i := i1
         until
            i1 >= i1max or else i2 >= i2max
         loop
            if lte(src.item(i1), src.item(i2)) then
               dest.put(src.item(i1), i)
               i1 := i1 + 1
            else
               dest.put(src.item(i2), i)
               i2 := i2 + 1
            end
            i := i + 1
         end
         if i1 >= i1max then
            from
            until
               i2 >= i2max
            loop
               dest.put(src.item(i2), i)
               i2 := i2 + 1
               i := i + 1
            end
         else
            from
            until
               i1 >= i1max
            loop
               dest.put(src.item(i1), i)
               i1 := i1 + 1
               i := i + 1
            end
         end
      end

   heap_repair (c: COLLECTION[X_]; c_lower, first, last: INTEGER)
         -- Repair the heap from the node number `first'
         -- It considers that the last item of c is number `last'
         -- It supposes that children are heaps.
      require
         c /= Void
         c.lower = c_lower
         c_lower <= first
         last <= c.upper
      local
         left_idx, right_idx: INTEGER
      do
         left_idx := 1 - c_lower + 2 * first
         if left_idx <= last then
            -- not a leaf :
            right_idx := 2 - c_lower + 2 * first
            if left_idx = last then
               if lt(c.item(first), c.item(left_idx)) then
                  c.swap(first, left_idx)
               end
            elseif gt(c.item(first), c.item(left_idx)) then
               if lt(c.item(first), c.item(right_idx)) then
                  c.swap(first, right_idx)
                  heap_repair(c, c_lower, right_idx, last)
               end
            elseif gt(c.item(left_idx), c.item(right_idx)) then
               c.swap(first, left_idx)
               heap_repair(c, c_lower, left_idx, last)
            else
               c.swap(first, right_idx)
               heap_repair(c, c_lower, right_idx, last)
            end
         end
      end

   quick_sort_region (c: COLLECTION[X_]; left, right: INTEGER)
      local
         middle: INTEGER; i: INTEGER
      do
         if left < right then
            i := left + (right - left) #// 2 + 1
            c.swap(left, i)
            middle := left
            from
               i := left + 1
            until
               i > right
            loop
               if lt(c.item(i), c.item(left)) then
                  middle := middle + 1
                  c.swap(middle, i)
               end
               i := i + 1
            end
            c.swap(left, middle)
            quick_sort_region(c, left, middle - 1)
            quick_sort_region(c, middle + 1, right)
         end
      end

end -- class ABSTRACT_SORTER
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
