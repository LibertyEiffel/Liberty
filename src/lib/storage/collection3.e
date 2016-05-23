-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COLLECTION3[E_]
   --
   -- Abstract definition of a 3 dimensional collection of elements of type E_.
   --
   -- The SmartEiffel standard library provides two implementations of COLLECTION3: ARRAY3 and FIXED_ARRAY3.
   -- All implementations have exactly the same behavior. Switching from one implementation to another only
   -- change the memory used and the execution time.
   --

insert
   SAFE_EQUAL[E_]
      undefine copy, is_equal
      redefine fill_tagged_out_memory
      end

feature {ANY} -- Indexing:
   lower1: INTEGER
         -- Lower index bound for dimension 1.
      deferred
      end

   lower2: INTEGER
         -- Lower index bound for dimension 2.
      deferred
      end

   lower3: INTEGER
         -- Lower index bound for dimension 3.
      deferred
      end

   frozen line_minimum: INTEGER
         -- Equivalent of `lower1'.
      do
         Result := lower1
      end

   frozen column_minimum: INTEGER
         -- Equivalent of `lower2'.
      do
         Result := lower2
      end

   frozen depth_minimum: INTEGER
         -- Equivalent of `lower3'.
      do
         Result := lower3
      end

   upper1: INTEGER
         -- Upper index bound for dimension 1.
      deferred
      end

   upper2: INTEGER
         -- Upper index bound for dimension 2.
      deferred
      end

   upper3: INTEGER
         -- Upper index bound for dimension 3.
      deferred
      end

   frozen line_maximum: INTEGER
         -- Equivalent of `upper1'.
      do
         Result := upper1
      end

   frozen column_maximum: INTEGER
         -- Equivalent of `upper2'.
      do
         Result := upper2
      end

   frozen depth_maximum: INTEGER
         -- Equivalent of `upper3'.
      do
         Result := upper3
      end

feature {ANY} -- Reading:
   item (line, column, depth: INTEGER): E_
      require
         valid_index(line, column, depth)
      deferred
      end

feature {ANY} -- Writing:
   put (element: like item; line, column, depth: INTEGER) assign item
      require
         valid_index(line, column, depth)
      deferred
      ensure
         item(line, column, depth) = element
      end

   force (element: like item; line, column, depth: INTEGER)
         -- Put `element' at position (`line',`column',`depth').
         -- Collection is resized first when (`line',`column',`depth')
         -- is not inside current bounds.
         -- New bounds are initialized with default values.
      require
         line >= 0
         column >= 0
         depth >= 0
      deferred
      ensure
         item(line, column, depth) = element
         count >= old count
      end

feature {ANY} -- Index validity:
   frozen valid_line, valid_index1 (line: INTEGER): BOOLEAN
      do
         Result := lower1 <= line and then line <= upper1
      ensure
         Result = (lower1 <= line and line <= upper1)
      end

   frozen valid_column, valid_index2 (column: INTEGER): BOOLEAN
      do
         Result := lower2 <= column and then column <= upper2
      ensure
         Result = (lower2 <= column and column <= upper2)
      end

   frozen valid_depth, valid_index3 (depth: INTEGER): BOOLEAN
      do
         Result := lower3 <= depth and then depth <= upper3
      ensure
         Result = (lower3 <= depth and depth <= upper3)
      end

   frozen valid_index (line, column, depth: INTEGER): BOOLEAN
      do
         Result := lower1 <= line and then line <= upper1 and then lower2 <= column and then column <= upper2 and then lower3 <= depth and then depth <= upper3
      ensure
         Result = (valid_line(line) and valid_column(column) and valid_depth(depth))
      end

feature {ANY} -- Counting:
   count1: INTEGER
         -- Size of the first dimension.
      deferred
      ensure
         Result = upper1 - lower1 + 1
      end

   frozen line_count: INTEGER
         -- Equivalent of `count1'.
      do
         Result := count1
      end

   count2: INTEGER
         -- Size of the second dimension.
      deferred
      ensure
         Result = upper2 - lower2 + 1
      end

   frozen column_count: INTEGER
      do
         Result := count2
      end

   count3: INTEGER
         -- Size of the third dimension.
      deferred
      ensure
         Result = upper3 - lower3 + 1
      end

   frozen depth_count: INTEGER
      do
         Result := count3
      end

   count: INTEGER
         -- Total number of elements.
      deferred
      ensure
         Result = line_count * column_count * depth_count
      end

feature {ANY}
   swap (line1, column1, depth1, line2, column2, depth2: INTEGER)
         -- Swap the element at index (`line1',`column1',`depth1')
         -- with the element at index (`line2',`column2',`depth2').
      require
         valid_index(line1, column1, depth1)
         valid_index(line2, column2, depth2)
      deferred
      ensure
         item(line1, column1, depth1) = old item(line2, column2, depth2)
         item(line2, column2, depth2) = old item(line1, column1, depth1)
         count = old count
      end

   set_all_with (v: like item)
         -- Set all item with value `v'.
      deferred
      ensure
         count = old count
      end

   frozen clear_all
         -- Set all items to default values.
      local
         value: like item
      do
         set_all_with(value)
      ensure
         count = old count
         all_default
      end

feature {ANY} -- Creating or initializing:
   from_collection3 (model: COLLECTION3[like item])
         --  Uses `model' to initialize Current.
      require
         model /= Void
      deferred
      ensure
         count1 = model.count1
         count2 = model.count2
         count3 = model.count3
      end

   from_model (model: COLLECTION[COLLECTION[COLLECTION[E_]]])
         -- The `model' is used to fill line by line Current.
         -- Assume all sub-collections have the same
         -- dimension.
      require
         model /= Void
      deferred
      ensure
         count1 = model.count
         count2 > 0 implies count2 = model.first.count
         count3 > 0 implies count3 = model.first.first.count
      end

feature {ANY} -- Looking and comparison:
   all_default: BOOLEAN
         -- Do all items have their type's default value?
      deferred
      end

   fast_is_equal (other: like Current): BOOLEAN
         -- Do both collections have the same `lower1', `lower2', `lower3', `upper1', `upper2' and
         -- `upper3', and items?
         -- The basic `=' is used for comparison of items.
         -- See also `is_equal'.
      local
         line, column, depth: INTEGER
      do
         if lower1 /= other.lower1 then
         elseif upper1 /= other.upper1 then
         elseif lower2 /= other.lower2 then
         elseif upper2 /= other.upper2 then
         elseif lower3 /= other.lower3 then
         elseif upper3 /= other.upper3 then
         else
            from
               Result := True
               line := upper1
            until
               not Result or else line < lower1
            loop
               from
                  column := upper2
               until
                  not Result or else column < lower2
               loop
                  from
                     depth := upper3
                  until
                     not Result or else depth < lower3
                  loop
                     Result := item(line, column, depth) = other.item(line, column, depth)
                     depth := depth - 1
                  end
                  column := column - 1
               end
               line := line - 1
            end
         end
      end

   is_equal (other: like Current): BOOLEAN
         -- Do both collections have the same `lower1', `lower2', `lower3', `upper1', `upper2' and `upper3',
         -- and items?
         -- Feature `is_equal' is used for comparison of items.
         -- See also `fast_is_equal'.
      local
         line, column, depth: INTEGER
      do
         if lower1 /= other.lower1 then
         elseif upper1 /= other.upper1 then
         elseif lower2 /= other.lower2 then
         elseif upper2 /= other.upper2 then
         elseif lower3 /= other.lower3 then
         elseif upper3 /= other.upper3 then
         else
            from
               Result := True
               line := upper1
            until
               not Result or else line < lower1
            loop
               from
                  column := upper2
               until
                  not Result or else column < lower2
               loop
                  from
                     depth := upper3
                  until
                     not Result or else depth < lower3
                  loop
                     Result := safe_equal(item(line, column, depth), other.item(line, column, depth))
                     depth := depth - 1
                  end
                  column := column - 1
               end
               line := line - 1
            end
         end
      end

   is_equal_map (other: like Current): BOOLEAN
         -- Do both collections have the same `lower', `upper', and
         -- items?
         -- Feature `is_equal' is used for comparison of items.
      obsolete "is_equal now does that."
      do
         Result := is_equal(other)
      end

feature {ANY} -- Printing:
   frozen fill_tagged_out_memory
      local
         line, column, depth: INTEGER; v: like item
      do
         tagged_out_memory.append(once "lower1: ")
         lower1.append_in(tagged_out_memory)
         tagged_out_memory.append(once " upper1: ")
         upper1.append_in(tagged_out_memory)
         tagged_out_memory.append(once " lower2: ")
         lower2.append_in(tagged_out_memory)
         tagged_out_memory.append(once " upper2: ")
         upper2.append_in(tagged_out_memory)
         tagged_out_memory.append(once " lower3: ")
         lower3.append_in(tagged_out_memory)
         tagged_out_memory.append(once " upper3: ")
         upper3.append_in(tagged_out_memory)
         tagged_out_memory.append(once " [%N")
         from
            line := lower1
         until
            line > upper1 or else tagged_out_memory.count > 4096
         loop
            tagged_out_memory.append(once "line ")
            line.append_in(tagged_out_memory)
            tagged_out_memory.append(once "%T: ")
            from
               column := lower2
            until
               column > upper2
            loop
               tagged_out_memory.append(once "column ")
               column.append_in(tagged_out_memory)
               tagged_out_memory.append(once "%T: ")
               from
                  depth := lower3
               until
                  depth > upper3
               loop
                  tagged_out_memory.append(once "depth ")
                  depth.append_in(tagged_out_memory)
                  tagged_out_memory.append(once "%T: ")
                  v := item(line, column, depth)
                  if v = Void then
                     tagged_out_memory.append(once "Void")
                  else
                     v.out_in_tagged_out_memory
                  end
                  tagged_out_memory.extend(' ')
                  depth := depth + 1
               end
               tagged_out_memory.extend('%N')
               column := column + 1
            end
            tagged_out_memory.extend('%N')
            line := line + 1
         end
         if valid_line(line) then
            tagged_out_memory.append(once "......%N")
         end
      end

feature {ANY} -- Miscellaneous features:
   occurrences (elt: E_): INTEGER
         -- Number of occurrences using `is_equal'.
         -- See also `fast_occurrences' to choose the appropriate one.
      deferred
      ensure
         Result >= 0
      end

   fast_occurrences (elt: E_): INTEGER
         -- Number of occurrences using `='.
         -- See also `occurrences' to choose the appropriate one.
      deferred
      ensure
         Result >= 0
      end

   has (x: like item): BOOLEAN
         -- Search if a element x is in the array using `is_equal'.
         -- See also `fast_has' to choose the appropriate one.
      deferred
      end

   fast_has (x: like item): BOOLEAN
         --  Search if a element x is in the array using `='.
      deferred
      end

   replace_all (old_value, new_value: like item)
         -- Replace all occurrences of the element `old_value' by `new_value'
         -- using `is_equal' for comparison.
         -- See also `fast_replace_all' to choose the appropriate one.
      deferred
      ensure
         count = old count
         occurrences(old_value) = 0
      end

   fast_replace_all (old_value, new_value: like item)
         -- Replace all occurrences of the element `old_value' by `new_value'
         -- using operator `=' for comparison.
         -- See also `replace_all' to choose the appropriate one.
      deferred
      ensure
         count = old count
         fast_occurrences(old_value) = 0
      end

   sub_collection3 (line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER): like Current
         -- Create a new object using selected area of `Current'.
      require
         valid_index(line_min, column_min, depth_min)
         valid_index(line_max, column_max, depth_max)
      deferred
      ensure
         Result /= Void
      end

   set_area (element: like item; line_min, line_max, column_min, column_max, depth_min, depth_max: INTEGER)
         -- Set all the elements of the selected area rectangle with `element'.
      require
         valid_index(line_min, column_min, depth_min)
         valid_index(line_max, column_max, depth_max)
      local
         line, column, depth: INTEGER
      do
         from
            line := line_min
         until
            line > line_max
         loop
            from
               column := column_min
            until
               column > column_max
            loop
               from
                  depth := depth_min
               until
                  depth > depth_max
               loop
                  put(element, line, column, depth)
                  depth := depth + 1
               end
               column := column + 1
            end
            line := line + 1
         end
      ensure
         count = old count
      end

end -- class COLLECTION3
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
