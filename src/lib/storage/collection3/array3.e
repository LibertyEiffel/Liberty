-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ARRAY3[E_]
   --
   -- General purpose, resizable, three dimensional array.
   --

inherit
   COLLECTION3[E_]

insert
   NATIVE_ARRAY_COLLECTOR[E_]

create {ANY}
   make, copy, from_collection3, from_collection, from_model

feature {ANY}
   lower1, lower2, lower3, upper1, upper2, upper3: INTEGER

   count1, count2, count3, count: INTEGER

feature {ARRAY3}
   storage: NATIVE_ARRAY[E_]
         -- To store elements line by line.

   capacity: INTEGER
         -- Number of elements in `storage'.

   set_limits(line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER)
      -- set lower1,2,3 and upper1,2,3 to the given values and alloc storage if necessary
      require
         line_min <= line_max + 1
         column_min <= column_max + 1
         depth_min <= depth_max + 1
      do
         lower1 := line_min
         upper1 := line_max
         lower2 := column_min
         upper2 := column_max
         lower3 := depth_min
         upper3 := depth_max
         count1 := upper1 - lower1 + 1
         count2 := upper2 - lower2 + 1
         count3 := upper3 - lower3 + 1
         count := count1 * count2 * count3

         if count > capacity then
            storage := storage.calloc(count)
            capacity := count
         end
      ensure
         lower1_set: lower1 = line_min
         lower2_set: upper1 = line_max
         upper1_set: lower2 = column_min
         upper2_set: upper2 = column_max
         sufficient_storage: capacity >= count
      end

feature {ANY} -- Creation / modification:
   make (line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER)
         -- Reset all bounds `line_minimum' / `line_maximum' / `column_minimum'
         -- `column_maximum' / `depth_min' and `depth_max' using arguments as
         -- new values. All elements are set to the default value of type E_.
      require
         line_min <= line_max
         column_min <= column_max
         depth_min <= depth_max
      do
         lower1 := line_min
         upper1 := line_max
         lower2 := column_min
         upper2 := column_max
         lower3 := depth_min
         upper3 := depth_max
         count1 := upper1 - lower1 + 1
         count2 := upper2 - lower2 + 1
         count3 := upper3 - lower3 + 1
         count := count1 * count2 * count3
         if capacity >= count then
            storage.clear_all(count - 1)
         else
            capacity := count
            storage := storage.calloc(count)
         end
      ensure
         line_minimum = line_min
         line_maximum = line_max
         column_minimum = column_min
         column_maximum = column_max
         depth_minimum = depth_min
         depth_maximum = depth_max
      end

   from_collection3 (model: COLLECTION3[like item])
      local
         i, j, k: INTEGER
      do
         make(model.line_minimum, model.line_maximum, model.column_minimum, model.column_maximum, model.depth_minimum, model.depth_maximum)
         from
            i := line_minimum
         until
            i > line_maximum
         loop
            from
               j := column_minimum
            until
               j > column_maximum
            loop
               from
                  k := depth_minimum
               until
                  k > depth_maximum
               loop
                  put(model.item(i, j, k), i, j, k)
                  k := k + 1
               end
               j := j + 1
            end
            i := i + 1
         end
      ensure then
         lower1 = model.lower1
         lower2 = model.lower2
         lower3 = model.lower3
      end

   from_collection (contents: COLLECTION[E_]
      line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER)
         -- Reset all bounds using `line_min', `line_max', `column_min',
         -- `column_max', `depth_min', and `depth_max'.
         -- Copy all elements of `contents', line by line into Current.
      require
         line_min <= line_max
         column_min <= column_max
         depth_min <= depth_max
         contents.count = (line_max - line_min + 1) * (column_max - column_min + 1) * (depth_max - depth_min + 1)
      local
         i: INTEGER
      do
         make(line_min, line_max, column_min, column_max, depth_min, depth_max)
         from
            i := 0
         until
            i >= count
         loop
            storage.put(contents.item(contents.lower + i), i)
            i := i + 1
         end
      ensure
         line_minimum = line_min
         line_maximum = line_max
         column_minimum = column_min
         column_maximum = column_max
         depth_minimum = depth_min
         depth_maximum = depth_max
         count = contents.count
      end

   from_model (model: COLLECTION[COLLECTION[COLLECTION[E_]]])
         -- The `model' is used to fill line by line the COLLECTION3.
         -- Assume all sub-collections of have the same indexing.
      local
         line, column, depth: INTEGER
      do
         make(model.lower, model.upper, model.first.lower, model.first.upper, model.first.first.lower, model.first.first.upper)
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
                  put(model.item(line).item(column).item(depth), line, column, depth)
                  depth := depth + 1
               end
               column := column + 1
            end
            line := line + 1
         end
      ensure then
         line_minimum = model.lower
         line_maximum = model.upper
         column_minimum = model.first.lower
         column_maximum = model.first.upper
         depth_minimum = model.first.first.lower
         depth_maximum = model.first.first.upper
      end

feature {ANY} -- Resizing:
   resize (line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER)
         -- Resize bounds of the Current array
      require
         line_max >= line_min
         column_max >= column_min
         depth_max >= depth_min
      local
         tmp: like Current; l, c, d: INTEGER
      do
         tmp := standard_twin
         tmp.set_limits(line_min, line_max, column_min, column_max, depth_min, depth_max)

         -- It may be possible to avoid this creation when :
         --    new `capacity' <= old `capacity'
         from
            l := lower1
         until
            l > line_maximum
         loop
            from
               c := lower2
            until
               c > column_maximum
            loop
               from
                  d := lower3
               until
                  d > depth_maximum
               loop
                  if tmp.valid_index(l, c, d) then
                     tmp.put(item(l, c, d), l, c, d)
                  end
                  d := d + 1
               end
               c := c + 1
            end
            l := l + 1
         end
         standard_copy(tmp)
      ensure
         line_minimum = line_min
         line_maximum = line_max
         column_minimum = column_min
         column_maximum = column_max
         depth_minimum = depth_min
         depth_maximum = depth_max
      end

feature {ANY} -- Implementation of others feature from COLLECTION3:
   item (line, column, depth: INTEGER): E_
      do
         Result := storage.item((line - lower1) * count2 * count3 + (column - lower2) * count3 + depth - lower3)
      end

   put (element: like item; line, column, depth: INTEGER)
      do
         storage.put(element, (line - lower1) * count2 * count3 + (column - lower2) * count3 + depth - lower3)
      end

   force (x: like item; line, column, depth: INTEGER)
      require else
         True
      do
         if not valid_index(line, column, depth) then
            resize(line.min(lower1), line.max(upper1), column.min(lower2), column.max(upper2), depth.min(lower3), depth.max(upper3))
         end
         put(x, line, column, depth)
      end

   set_all_with (element: E_)
      do
         storage.set_all_with(element, count - 1)
      end

   replace_all (old_value, new_value: like item)
      do
         storage.replace_all(old_value, new_value, count - 1)
      end

   fast_replace_all (old_value, new_value: like item)
      do
         storage.fast_replace_all(old_value, new_value, count - 1)
      end

   sub_collection3 (line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER): like Current
      local
         i, j, k, n: INTEGER
      do
         Result := standard_twin
         Result.set_limits(line_min, line_max, column_min, column_max, depth_min, depth_max)

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
         Result.lower1 = line_min
         Result.lower2 = column_min
         Result.lower3 = depth_min
         Result.upper1 = line_max
         Result.upper2 = column_max
         Result.upper3 = depth_max
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

   has (x: like item): BOOLEAN
         -- Search if a element x is in the array using `equal'.
         -- See also `fast_has' to choose the appropriate one.
      do
         if count > 0 then
            Result := storage.first_index_of(x, count - 1) <= count - 1
         end
      end

   fast_has (x: like item): BOOLEAN
         -- Search if a element x is in the array using `='.
      do
         if count > 0 then
            Result := storage.fast_first_index_of(x, count - 1) <= count - 1
         end
      end

   all_default: BOOLEAN
      do
         Result := storage.all_default(count - 1)
      end

   swap (line1, column1, depth1, line2, column2, depth2: INTEGER)
      local
         tmp: like item; index1, index2: INTEGER
      do
         index1 := (line1 - lower1) * count2 * count3 + (column1 - lower2) * count3 + depth1 - lower3
         index2 := (line2 - lower1) * count2 * count3 + (column2 - lower2) * count3 + depth2 - lower3
         tmp := storage.item(index1)
         storage.put(storage.item(index2), index1)
         storage.put(tmp, index2)
      end

   copy (other: like Current)
      do
         set_limits(other.lower1, other.upper1, other.lower2, other.upper2, other.lower3, other.upper3)

         storage.copy_from(other.storage, count - 1)
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
   count1 = upper1 - lower1 + 1
   count2 = upper2 - lower2 + 1
   count3 = upper3 - lower3 + 1
   capacity >= count

end -- class ARRAY3
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
