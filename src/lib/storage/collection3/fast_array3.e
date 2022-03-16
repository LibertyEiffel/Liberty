-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FAST_ARRAY3[E_]
   --
   -- Resizable three dimensional array.
   -- Unlike ARRAY3, the `lower1', `lower2' and `lower3' bounds are
   -- frozen to 0. Thus, one can expect better performances.
   --

inherit
   COLLECTION3[E_]

insert
   NATIVE_ARRAY_COLLECTOR[E_]

create {ANY}
   make, copy, from_collection3, from_collection, from_model

feature {ANY}
   upper1, count1, upper2, count2, upper3, count3, count: INTEGER

feature {}
   count2x3: INTEGER
         -- To speed up access, this value is always equal to
         -- `count2' * `count3'

feature {FAST_ARRAY3}
   storage: NATIVE_ARRAY[E_]

   capacity: INTEGER -- of `storage'.

feature {ANY}
   lower1: INTEGER 0

   lower2: INTEGER 0

   lower3: INTEGER 0

   make (new_count1, new_count2, new_count3: INTEGER)
         -- Create or reset `Current' with new dimensions.
         -- All elements are set to the default value of type E_.
      require
         new_count1 > 0
         new_count2 > 0
         new_count3 > 0
      do
         count1 := new_count1
         upper1 := new_count1 - 1
         count2 := new_count2
         upper2 := new_count2 - 1
         count3 := new_count3
         count2x3 := count2 * count3
         upper3 := new_count3 - 1
         count := count1 * count2x3
         if capacity < count then
            capacity := count
            storage := storage.calloc(capacity)
         else
            storage.clear_all(capacity - 1)
         end
      ensure
         count1 = new_count1
         count2 = new_count2
         count3 = new_count3
         all_default
      end

   from_collection3 (model: COLLECTION3[like item])
         -- Uses the `model' to update Current.
      local
         i, j, k: INTEGER
      do
         make(model.upper1 + 1, model.upper2 + 1, model.upper3 + 1)
         from
            i := 0
         until
            i > upper1
         loop
            from
               j := 0
            until
               j > upper2
            loop
               from
                  k := 0
               until
                  k > upper3
               loop
                  put(model.item(i, j, k), i, j, k)
                  k := k + 1
               end
               j := j + 1
            end
            i := i + 1
         end
      end

   from_collection (contents: COLLECTION[E_]; new_count1, new_count2, new_count3: INTEGER)
         -- Reset all bounds using `new_count#i'.
         -- Copy all elements of `contents', line by line into Current.
      require
         new_count1 >= 0
         new_count2 >= 0
         new_count3 >= 0
         contents.count = new_count1 * new_count2 * new_count3
      local
         i: INTEGER
      do
         make(new_count1, new_count2, new_count3)
         from
            i := 0
         until
            i >= count
         loop
            storage.put(contents.item(contents.lower + i), i)
            i := i + 1
         end
      ensure
         line_maximum = new_count1 - 1
         column_maximum = new_count2 - 1
         depth_maximum = new_count3 - 1
         count = contents.count
      end

   from_model (model: COLLECTION[COLLECTION[COLLECTION[E_]]])
         -- The `model' is used to fill line by line the COLLECTION3.
         -- Assume all sub-collections of have the same indexing.
      local
         line, column, depth, n: INTEGER
      do
         make(model.upper - model.lower + 1, model.first.upper - model.first.lower + 1, model.first.first.upper - model.first.first.lower + 1)
         from
            line := model.lower
         until
            line > model.upper
         loop
            from
               column := model.first.lower
            until
               column > model.first.upper
            loop
               from
                  depth := model.first.first.lower
               until
                  depth > model.first.first.upper
               loop
                  storage.put(model.item(line).item(column).item(depth), n)
                  n := n + 1
                  depth := depth + 1
               end
               column := column + 1
            end
            line := line + 1
         end
      ensure then
         line_maximum = model.upper - model.lower
         column_maximum = model.first.upper - model.first.lower
         depth_maximum = model.first.first.upper - model.first.first.lower
      end

feature {ANY} -- Implementation of others feature from COLLECTION3:
   item (line, column, depth: INTEGER): E_
      do
         Result := storage.item(line * count2x3 + column * count3 + depth)
      end

   put (x: like item; line, column, depth: INTEGER)
      do
         storage.put(x, line * count2x3 + column * count3 + depth)
      end

   force (element: like item; line, column, depth: INTEGER)
      do
         if not valid_index(line, column, depth) then
            resize(line.max(upper1) + 1, column.max(upper2) + 1, depth.max(upper3) + 1)
         end
         put(element, line, column, depth)
      end

   copy (other: like Current)
      do
         count1 := other.count1
         upper1 := count1 - 1
         count2 := other.count2
         upper2 := count2 - 1
         count3 := other.count3
         count2x3 := count2 * count3
         upper3 := count3 - 1
         count := count1 * count2x3
         if capacity < count then
            capacity := count
            storage := storage.calloc(capacity)
         end
         storage.copy_from(other.storage, count - 1)
      end

   sub_collection3 (line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER): like Current
      local
         i, j, k, n: INTEGER
      do
         create Result.make(line_max - line_min + 1, column_max - column_min + 1, depth_max - depth_min + 1)
         from
            i := line_min
            k := 0
         until
            i > line_max
         loop
            from
               j := column_min
            until
               j > column_max
            loop
               from
                  k := depth_min
               until
                  k > depth_max
               loop
                  Result.storage.put(item(i, j, k), n)
                  n := n + 1
                  k := k + 1
               end
               j := j + 1
            end
            i := i + 1
         end
      ensure then
         Result.upper1 = line_max - line_min
         Result.upper2 = column_max - column_min
         Result.upper3 = depth_max - depth_min
      end

feature {ANY} -- Writing:
   set_all_with (x: E_)
         -- All element are set with the value x.
      do
         storage.set_all_with(x, count - 1)
      end

   all_default: BOOLEAN
      do
         Result := storage.all_default(count - 1)
      end

   slice (l1, up1, l2, up2, l3, up3: INTEGER): like Current
         -- Create a new collection initialized with elements of
         -- range `low'..`up'. Result has the same dynamic type
         -- as Current collection.
      local
         line, column, depth: INTEGER
      do
         from
            create Result.make(up1 - l1 + 1, up2 - l2 + 1, up3 - l3 + 1)
            line := l1
         until
            line > up1
         loop
            from
               column := l2
            until
               column > up2
            loop
               from
                  depth := l3
               until
                  depth > up3
               loop
                  Result.put(item(line, column, depth), line - l1, column - l2, depth - l3)
                  depth := depth + 1
               end
               column := column + 1
            end
            line := line + 1
         end
      end

   set_slice (element: like item; l1, up1, l2, up2, l3, up3: INTEGER)
         -- Set all the elements in the
         -- range [(l1,up1),(l2,up2),(l3,up3)] of
         -- Current with the element 'element'.
      local
         i, j, k: INTEGER
      do
         from
            i := l1 * count2x3
         until
            i > up1 * count2x3
         loop
            from
               j := l2 * count3
            until
               j > up2 * count3
            loop
               from
                  k := l3
               until
                  k > up3
               loop
                  storage.put(element, i + j + k)
                  k := k + 1
               end
               j := j + count3
            end
            i := i + count2x3
         end
      end

   swap (line1, column1, depth1, line2, column2, depth2: INTEGER)
      local
         tmp: like item; c3, c2x3, index1, index2: INTEGER
      do
         c3 := count3
         c2x3 := count2x3
         index1 := line1 * c2x3 + column1 * c3 + depth1
         index2 := line2 * c2x3 + column2 * c3 + depth2
         tmp := storage.item(index1)
         storage.put(storage.item(index2), index1)
         storage.put(tmp, index2)
      end

feature {ANY} -- Looking and comparison:
   occurrences (elt: E_): INTEGER
      do
         Result := storage.occurrences(elt, count - 1)
      end

   fast_occurrences (elt: E_): INTEGER
      do
         Result := storage.fast_occurrences(elt, count - 1)
      end

feature {ANY} -- Resizing:
   resize (new_count1, new_count2, new_count3: INTEGER)
      require
         new_count1 > 0
         new_count2 > 0
         new_count3 > 0
      local
         tmp: like Current; l, c, d: INTEGER
      do
         create tmp.make(new_count1, new_count2, new_count3)
         -- It may be possible to avoid this creation when :
         --    new `capacity' <= old `capacity'
         from
            l := line_maximum
         until
            l < 0
         loop
            from
               c := column_maximum
            until
               c < 0
            loop
               from
                  d := depth_maximum
               until
                  d < 0
               loop
                  if tmp.valid_index(l, c, d) then
                     tmp.put(item(l, c, d), l, c, d)
                  end
                  d := d - 1
               end
               c := c - 1
            end
            l := l - 1
         end
         standard_copy(tmp)
      ensure
         upper1 = new_count1 - 1
         count1 = new_count1
         upper2 = new_count2 - 1
         count2 = new_count2
         upper3 = new_count3 - 1
         count3 = new_count3
         count = new_count1 * new_count2 * new_count3
      end

feature {ANY} -- Looking and Searching:
   has (x: like item): BOOLEAN
         -- Look for `x' using `equal' for comparison.
      do
         if count > 0 then
            Result := storage.first_index_of(x, count - 1) <= count - 1
         end
      end

   fast_has (x: like item): BOOLEAN
         -- Same as `has' but use `=' for comparison
      do
         if count > 0 then
            Result := storage.fast_first_index_of(x, count - 1) <= count - 1
         end
      end

feature {ANY} -- Other features:
   replace_all (old_value, new_value: like item)
      do
         storage.replace_all(old_value, new_value, count - 1)
      end

   fast_replace_all (old_value, new_value: like item)
      do
         storage.fast_replace_all(old_value, new_value, count - 1)
      end

feature {} -- Garbage collector tuning (very low-level):
   mark_native_arrays
         -- For performance reasons, the unused area of `storage' is always left as it is when
         -- some elements are removed. No time is lost to clean the released area with a Void
         -- or a 0 value. Thus, the unused area of `storage' may contains references of
         -- actually unreachable objects. The following `mark_native_arrays' actually replace
         -- the default behavior (the call is automatic) in order to mark only reachable
         -- objects.
      local
         i: INTEGER
      do
         from
            i := count - 1
         until
            i < 0
         loop
            mark_item(storage, i)
            i := i - 1
         end
      end

invariant
   count1 = upper1 + 1
   count2 = upper2 + 1
   count3 = upper3 + 1
   count = count1 * count2 * count3
   count2x3 = count2 * count3
   capacity >= count

end -- class FAST_ARRAY3
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
