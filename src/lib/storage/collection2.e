-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COLLECTION2[E_]
   --
   -- Abstract definition of a 2 dimensional collection of elements of type E_.
   --
   -- The Liberty Eiffel standard library provides two implementations of COLLECTION2: ARRAY2 and FIXED_ARRAY2.
   -- All implementations have exactly the same behavior. Switching from one implementation to
   -- another only change the memory used and the execution time.
   --

insert
   SAFE_EQUAL[E_]
      undefine copy
      redefine fill_tagged_out_memory, is_equal
      end

feature {ANY} -- Indexing:
   lower1, lower2: INTEGER
         -- Lower index bounds.
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

   upper1, upper2: INTEGER
         -- Upper index bounds.
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

feature {ANY} -- Reading:
   item (line, column: INTEGER): E_
      require
         valid_index(line, column)
      deferred
      end

feature {ANY} -- Writing:
   put (element: like item; line, column: INTEGER) assign item
      require
         valid_index(line, column)
      deferred
      ensure
         item(line, column) = element
      end

   force (element: like item; line, column: INTEGER)
         -- Put `element' at position (`line',`column'). Collection
         -- resized first when (`line',`column') is not inside current
         -- bounds. New bounds are initialized with default values.
      require
         line >= 0
         column >= 0
      deferred
      ensure
         item(line, column) = element
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

   frozen valid_index (line, column: INTEGER): BOOLEAN
      do
         Result := lower1 <= line and then line <= upper1 and then lower2 <= column and then column <= upper2
      ensure
         Result = (valid_line(line) and valid_column(column))
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

   count: INTEGER
         -- Total number of elements.
      deferred
      ensure
         Result = line_count * column_count
      end

feature {ANY}
   swap (line1, column1, line2, column2: INTEGER)
         -- Swap the element at index (`line1',`column1') with the
         -- the element at index (`line2',`column2').
      require
         valid_index(line1, column1)
         valid_index(line2, column2)
      deferred
      ensure
         item(line1, column1) = old item(line2, column2)
         item(line2, column2) = old item(line1, column1)
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
   from_collection2 (model: COLLECTION2[like item])
         -- Uses `model' to initialize Current.
      require
         model /= Void
      deferred
      ensure
         count1 = model.count1
         count2 = model.count2
      end

   from_model (model: COLLECTION[COLLECTION[E_]])
         -- The `model' is used to fill line by line Current.
         -- Assume all sub-collections of `model' have the same
         -- number of lines.
      require
         model.count >= 0
         model.count > 0 implies model.first.count >= 0
      deferred
      ensure
         count1 = model.count
         count1 > 0 implies count2 = model.first.count
         count1 = 0 implies count2 = 0
      end

feature {ANY} -- Looking and comparison:
   all_default: BOOLEAN
         -- Do all items have their type's default value?
      deferred
      end

   fast_is_equal (other: like Current): BOOLEAN
         -- Do both collections have the same `lower1', `lower2', `upper1' and `upper2', and items?
         -- The basic `=' is used for comparison of items.
         -- See also `is_equal'.
      local
         line, column: INTEGER
      do
         if lower1 /= other.lower1 then
         elseif upper1 /= other.upper1 then
         elseif lower2 /= other.lower2 then
         elseif upper2 /= other.upper2 then
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
                  Result := item(line, column) = other.item(line, column)
                  column := column - 1
               end
               line := line - 1
            end
         end
      end

   is_equal (other: like Current): BOOLEAN
         -- Do both collections have the same `lower1', `lower2', `upper1' and `upper2', and items?
         -- Feature `is_equal' is used for comparison of items.
         -- See also `fast_is_equal'.
      local
         line, column: INTEGER
      do
         if lower1 /= other.lower1 then
         elseif upper1 /= other.upper1 then
         elseif lower2 /= other.lower2 then
         elseif upper2 /= other.upper2 then
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
                  Result := safe_equal(item(line, column), other.item(line, column))
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
      obsolete "Use `is_equal' instead."
      do
         Result := is_equal(other)
      end

feature {ANY} -- Printing:
   frozen fill_tagged_out_memory
      local
         line, column: INTEGER; v: like item
      do
         tagged_out_memory.append(once "lower1: ")
         lower1.append_in(tagged_out_memory)
         tagged_out_memory.append(once " upper1: ")
         upper1.append_in(tagged_out_memory)
         tagged_out_memory.append(once " lower2: ")
         lower2.append_in(tagged_out_memory)
         tagged_out_memory.append(once " upper2: ")
         upper2.append_in(tagged_out_memory)
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
               v := item(line, column)
               if v = Void then
                  tagged_out_memory.append(once "Void")
               else
                  v.out_in_tagged_out_memory
               end
               tagged_out_memory.extend(' ')
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
         -- See also `occurrences' to chose the appropriate one.
      deferred
      ensure
         Result >= 0
      end

   has (x: like item): BOOLEAN
         -- Search if a element x is in the array using `is_equal'.
         -- See also `fast_has' to chose the appropriate one.
      deferred
      end

   fast_has (x: like item): BOOLEAN
         -- Search if a element x is in the array using `='.
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

   sub_collection2 (line_min, line_max, column_min, column_max: INTEGER): like Current
         -- Create a new object using selected area of `Current'.
      require
         valid_index(line_min, column_min)
         valid_index(line_max, column_max)
         line_min <= line_max + 1
         column_min <= column_max + 1
      deferred
      ensure
         Result /= Void
      end

   set_area (element: like item; line_min, line_max, column_min, column_max: INTEGER)
         -- Set all the elements of the selected area rectangle with `element'.
      require
         valid_index(line_min, column_min)
         valid_index(line_max, column_max)
      local
         line, column: INTEGER
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
               put(element, line, column)
               column := column + 1
            end
            line := line + 1
         end
      ensure
         count = old count
      end

feature {} -- Implement manifest generic creation:
   manifest_put (index: INTEGER; element: like item)
      require
         index >= 0
      deferred
      end

   manifest_semicolon_check: BOOLEAN True
         -- You can use semicolons to make the end of each line more visible.

end -- class COLLECTION2
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
