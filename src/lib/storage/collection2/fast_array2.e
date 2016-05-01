-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FAST_ARRAY2[E_]
   --
   -- Resizable two dimensional array.
   -- Unlike ARRAY2, the `lower1' bound and the `lower2' bound are
   -- frozen to 0. Thus, one can expect better performances.
   --

inherit
   COLLECTION2[E_]

insert
   NATIVE_ARRAY_COLLECTOR[E_]
   
create {ANY}
   make, copy, from_collection, from_collection2, from_model, manifest_creation

feature {ANY}
   upper1, count1, upper2, count2, count: INTEGER

feature {FAST_ARRAY2}
   storage: NATIVE_ARRAY[E_]

   capacity: INTEGER -- of `storage'.

feature {ANY}
   lower1: INTEGER 0

   lower2: INTEGER 0

   make (new_count1, new_count2: INTEGER)
         -- Create or reset Current with new dimensions.
         -- All elements are set to the default value of type E_.
      require
         new_count1 >= 0
         new_count2 >= 0
      do
         count1 := new_count1
         upper1 := new_count1 - 1
         count2 := new_count2
         upper2 := new_count2 - 1
         count := count1 * count2
         if capacity < count then
            capacity := count
            storage := storage.calloc(capacity)
         else
            storage.clear_all(capacity - 1)
         end
      ensure
         count1 = new_count1
         count2 = new_count2
         all_default
      end

   from_collection2 (model: COLLECTION2[like item])
         -- Uses the `model' to update Current.
      local
         line, column, l, c: INTEGER
      do
         make(model.count1, model.count2)
         from
            line := lower1
            l := model.lower1
         until
            line > upper1
         loop
            from
               column := lower2
               c := model.lower2
            until
               column > upper2
            loop
               put(model.item(l, c), line, column)
               column := column + 1
               c := c + 1
            end
            line := line + 1
            l := l + 1
         end
      end

   from_collection (contents: COLLECTION[E_]; new_count1, new_count2: INTEGER)
         --  Reset all bounds using `new_count#i'.
         --  Copy all elements of `contents', line by line into Current.
      require
         new_count1 >= 0
         new_count2 >= 0
         contents.count = new_count1 * new_count2
      local
         i: INTEGER
      do
         make(new_count1, new_count2)
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
         count = contents.count
      end

   from_model (model: COLLECTION[COLLECTION[E_]])
         -- The `model' is used to fill line by line the COLLECTION2.
         -- Assume all sub-collections of `model' have the number of items.
      local
         line, column, l, c: INTEGER
      do
         if model.is_empty then
            make(0, 0)
         else
            make(model.count, model.first.count)
         end
         from
            line := lower1
            l := model.lower
         until
            line > upper1
         loop
            from
               column := lower2
               c := model.item(l).lower
            until
               column > upper2
            loop
               put(model.item(l).item(c), line, column)
               column := column + 1
               c := c + 1
            end
            line := line + 1
            l := l + 1
         end
      end

   sub_collection2 (line_min, line_max, column_min, column_max: INTEGER): like Current
      local
         line, column, l, c: INTEGER
      do
         create Result.make(line_max - line_min + 1, column_max - column_min + 1)
         from
            line := Result.lower1
            l := line_min
         until
            line > Result.upper1
         loop
            from
               column := Result.lower2
               c := column_min
            until
               column > Result.upper2
            loop
               Result.put(item(l, c), line, column)
               column := column + 1
               c := c + 1
            end
            line := line + 1
            l := l + 1
         end
      end

feature {ANY} -- Implementation of others feature from COLLECTION2:
   item (line, column: INTEGER): E_
      do
         Result := storage.item(line * count2 + column)
      end

   put (x: like item; line, column: INTEGER)
      do
         storage.put(x, line * count2 + column)
      end

   force (element: like item; line, column: INTEGER)
      do
         if not valid_index(line, column) then
            resize(1 + line.max(upper1), 1 + column.max(upper2))
         end
         put(element, line, column)
      end

   copy (other: like Current)
      do
         count1 := other.count1
         upper1 := count1 - 1
         count2 := other.count2
         upper2 := count2 - 1
         count := count1 * count2
         if capacity < count then
            capacity := count
            storage := storage.calloc(capacity)
         end
         storage.copy_from(other.storage, count - 1)
      end

feature {ANY} -- Writing:
   set_all_with (x: E_)
         --  All element are set with the value x.
      do
         storage.set_all_with(x, count - 1)
      end

   all_default: BOOLEAN
      do
         Result := storage.all_default(count - 1)
      end

   slice (line_min, line_max, column_min, column_max: INTEGER): like Current
      obsolete "Use sub_collection2 instead"
      require
         valid_index(line_min, column_min)
         valid_index(line_max, column_max)
         line_min <= line_max + 1
         column_min <= column_max + 1
      do
         Result := sub_collection2(line_min, line_max, column_min, column_max)
      end

   set_slice (element: like item; l1, up1, l2, up2: INTEGER)
         -- Set all the elements in the
         -- range [(l1,up1),(l2,up2)] of
         -- Current with the element 'element'.
      require
         valid_index(l1, l2)
         valid_index(up1, up2)
         l1 <= up1 + 1
         l2 <= up2 + 1
      local
         i, j: INTEGER
      do
         from
            i := l1 * count2
         until
            i > up1 * count2
         loop
            from
               j := l2
            until
               j > up2
            loop
               storage.put(element, i + j)
               j := j + 1
            end
            i := i + count2
         end
      end

   swap (line1, column1, line2, column2: INTEGER)
      local
         tmp: like item; c2, index1, index2: INTEGER
      do
         c2 := count2
         index1 := line1 * c2 + column1
         index2 := line2 * c2 + column2
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
   resize (new_count1, new_count2: INTEGER)
      require
         new_count1 >= 0
         new_count2 >= 0
      local
         tmp: like Current; l, c: INTEGER
      do
         create tmp.make(new_count1, new_count2)
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
               if tmp.valid_index(l, c) then
                  tmp.put(item(l, c), l, c)
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
         count = new_count1 * new_count2
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

   transpose
         -- Transpose the Current array
      local
         i, j: INTEGER; tmp: INTEGER; oldc1, oldc2: INTEGER
      do
         oldc1 := count1
         oldc2 := count2
         tmp := count2.max(count1)
         resize(tmp, tmp)
         from
            i := 0
         until
            i > upper1
         loop
            from
               j := i + 1
            until
               j > upper2
            loop
               swap(i, j, j, i)
               j := j + 1
            end
            i := i + 1
         end
         resize(oldc2, oldc1)
      end

   to_external: POINTER
         -- Gives C access to the internal `storage' (may be dangerous).
      do
         Result := storage.to_external
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

feature {} -- Implement manifest generic creation (very low-level):
   manifest_make (needed_capacity: INTEGER; new_count1, new_count2: INTEGER)
         -- Create a FAST_ARRAY2[E_] with `new_count1' lines and `new_count2' columns.
      require
         new_count1 > 0
         new_count2 > 0
         needed_capacity = new_count1 * new_count2
      do
         make(new_count1, new_count2)
      end

   manifest_put (index: INTEGER; element: like item)
         -- The `element's are stored line by line.
      do
         storage.put(element, index)
      end

invariant
   count1 = upper1 + 1
   count2 = upper2 + 1
   count = count1 * count2
   capacity >= count

end -- class FAST_ARRAY2
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
