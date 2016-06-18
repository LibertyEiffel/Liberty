-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ARRAY2[E_]
   --
   -- General purpose, resizable, two dimensional array.
   --

inherit
   COLLECTION2[E_]

insert
   NATIVE_ARRAY_COLLECTOR[E_]

create {ANY}
   make, copy, from_collection2, from_collection, from_model, manifest_creation

feature {ANY}
   lower1, lower2, upper1, upper2: INTEGER

feature {ARRAY2}
   storage: NATIVE_ARRAY[E_]
         -- To store elements line by line.

   capacity: INTEGER
         -- Number of elements in `storage'.

   set_limits(line_min, line_max, column_min, column_max: INTEGER)
      -- set lower1,2 and upper1,2 to the given values and alloc 
      -- storage if necessary
      require
         line_min <= line_max + 1
         column_min <= column_max + 1
      do
         lower1 := line_min
         upper1 := line_max
         lower2 := column_min
         upper2 := column_max

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
   make (line_min, line_max, column_min, column_max: INTEGER)
         -- Reset all bounds `line_minimum' / `line_maximum' / `column_minimum' and
         -- `column_maximum' using arguments as new values.
         -- All elements are set to the default value of type E_.
      require
         line_min <= line_max + 1
         column_min <= column_max + 1
      local
         old_capacity: INTEGER
      do
         old_capacity := capacity
         set_limits(line_min, line_max, column_min, column_max)
         if old_capacity >= count then
            -- clear only if storage was reallocated
            storage.clear_all(count - 1)
         end
      ensure
         line_minimum = line_min
         line_maximum = line_max
         column_minimum = column_min
         column_maximum = column_max
      end

   from_collection2 (model: COLLECTION2[like item])
      local
         i, j: INTEGER
      do
         make(model.line_minimum, model.line_maximum, model.column_minimum, model.column_maximum)
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
               put(model.item(i, j), i, j)
               j := j + 1
            end
            i := i + 1
         end
      ensure then
         lower1 = model.lower1
         lower2 = model.lower2
      end

   from_collection (contents: COLLECTION[E_]; line_min, line_max, column_min, column_max: INTEGER)
         -- Reset all bounds using `line_min', `line_max', `column_min',
         -- and `column_max' .
         -- Copy all elements of `contents', line by line into Current.
      require
         line_min <= line_max + 1
         column_min <= column_max + 1
         contents.count = (line_max - line_min + 1) * (column_max - column_min + 1)
      local
         i: INTEGER
      do
         make(line_min, line_max, column_min, column_max)
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
         count = contents.count
      end

   from_model (model: COLLECTION[COLLECTION[E_]])
         -- The `model' is used to fill line by line the COLLECTION2.
         -- Assume all sub-collections of `model' have the same indexing.
      local
         line, column: INTEGER
      do
         if model.is_empty then
            make(model.lower, model.upper, 0, -1)
         else
            make(model.lower, model.upper, model.first.lower, model.first.upper)
         end
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
               put(model.item(line).item(column), line, column)
               column := column + 1
            end
            line := line + 1
         end
      ensure then
         line_minimum = model.lower
         line_maximum = model.upper
         column_minimum = model.first.lower
         column_maximum = model.first.upper
      end

feature {ANY} -- Resizing:
   resize (line_min, line_max, column_min, column_max: INTEGER)
         -- Resize bounds of the Current array
      require
         line_max >= line_min - 1
         column_max >= column_min - 1
      local
         tmp: like Current; l, c: INTEGER
      do
         tmp := standard_twin
         tmp.set_limits(line_min, line_max, column_min, column_max)

         --|*** It may be possible to avoid this creation when :
         --|    new `capacity' <= old `capacity'
         --|*** May be improved a lot.
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
               if tmp.valid_index(l, c) then
                  tmp.put(item(l, c), l, c)
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
      end

feature {ANY} -- Implementation of others feature from COLLECTION2:
   item (line, column: INTEGER): E_
      do
         Result := storage.item((line - lower1) * count2 + column - lower2)
      end

   put (element: like item; line, column: INTEGER)
      do
         storage.put(element, (line - lower1) * count2 + column - lower2)
      end

   count1: INTEGER
      do
         Result := upper1 - lower1 + 1
      end

   count2: INTEGER
      do
         Result := upper2 - lower2 + 1
      end

   count: INTEGER
      do
         Result := count1 * count2
      end

   force (x: like item; line, column: INTEGER)
      require else
         True
      do
         if not valid_index(line, column) then
            resize(line.min(lower1), line.max(upper1), column.min(lower2), column.max(upper2))
         end
         put(x, line, column)
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

   sub_collection2 (line_min, line_max, column_min, column_max: INTEGER): like Current
      local
         i, j, k: INTEGER
      do
         Result := standard_twin
         Result.set_limits(line_min, line_max, column_min, column_max)

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
               Result.storage.put(item(i, j), k)
               j := j + 1
               k := k + 1
            end
            i := i + 1
         end
      ensure then
         Result.lower1 = line_min
         Result.lower2 = column_min
         Result.upper1 = line_max
         Result.upper2 = column_max
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
         -- See also `fast_has' to chose the apropriate one.
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

   swap (line1, column1, line2, column2: INTEGER)
      local
         tmp: like item; c2, index1, index2: INTEGER
      do
         c2 := count2
         index1 := (line1 - lower1) * c2 + column1 - lower2
         index2 := (line2 - lower1) * c2 + column2 - lower2
         tmp := storage.item(index1)
         storage.put(storage.item(index2), index1)
         storage.put(tmp, index2)
      end

   copy (other: like Current)
      do
         set_limits(other.lower1, other.upper1, other.lower2, other.upper2)
         storage.copy_from(other.storage, count - 1)
      end

feature {ANY} -- Only for ARRAY2:
   transpose
         -- Transpose the Current array
      local
         i, j: INTEGER; oldu1, oldu2: INTEGER; oldl1, oldl2: INTEGER
      do
         oldu1 := line_maximum
         oldu2 := column_maximum
         oldl1 := lower1
         oldl2 := lower2
         resize(lower1.min(lower2), line_maximum.max(column_maximum), lower1.min(lower2), line_maximum.max(column_maximum))
         from
            i := lower1
         until
            i > line_maximum
         loop
            from
               j := i + 1
            until
               j > column_maximum
            loop
               swap(i, j, j, i)
               j := j + 1
            end
            i := i + 1
         end
         resize(oldl2, oldu2, oldl1, oldu1)
      ensure
         line_minimum = old column_minimum
         column_minimum = old line_minimum
         line_maximum = old column_maximum
         column_maximum = old line_maximum
         count = old count
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
   manifest_make (needed_capacity: INTEGER; line_min, line_max, column_min, column_max: INTEGER)
         -- Create an ARRAY2[E_] using `line_minimum' / `line_maximum' / `column_minimum' and `column_maximum' as bounds.
      require
         line_min <= line_max
         column_min <= column_max
         needed_capacity = (line_max - line_min + 1) * (column_max - column_min + 1)
      do
         make(line_min, line_max, column_min, column_max)
      end

   manifest_put (index: INTEGER; element: like item)
         -- The `element's are stored line by line.
      do
         check
            index < capacity
         end
         storage.put(element, index)
      end

invariant
   count2 = upper2 - lower2 + 1
   capacity >= count

end -- class ARRAY2
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
