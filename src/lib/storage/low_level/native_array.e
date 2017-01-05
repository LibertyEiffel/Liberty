-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class NATIVE_ARRAY[E_]
   --
   -- This class gives access to the lowest level for arrays. As any low level array, you can
   -- get high performances with NATIVE_ARRAYs, but you loose most valid bounds checks (as
   -- you can do in plain C code for example).
   --
   -- Note: this class is the basic support for most of our high-level arrays-like classes: STRING,
   -- ARRAY, FAST_ARRAY as well as MUTABLE_BIG_INTEGER. Each class using some attribute of some
   -- NATIVE_ARRAY  type needs an attribute named `capacity' with value set to the size of the
   -- actual NATIVE_ARRAY. Value has to be adjusted after each calloc/realloc/create_from.
   --

insert
   SAFE_EQUAL[E_]

create {ANY}
   default_create, manifest_creation

feature {ANY} -- Basic features:
   element_sizeof: INTEGER
         -- The size in number of bytes for type `E_'.
      external "built_in"
      end

   calloc (nb_elements: INTEGER): like Current
         -- Allocate a new array of `nb_elements' of type `E_'.
         -- The new array is initialized with default values.
      require
         nb_elements > 0
      external "built_in"
      ensure
         Result.is_not_null
         Result.all_default(nb_elements - 1)
      end

   item (index: INTEGER): E_
         -- To read an `item'.
         -- Assume that `calloc' is already done and that `index' is the range [0 .. `nb_elements'-1].
      require
         index >= 0
      external "built_in"
      end

   put (element: E_; index: INTEGER)
         -- To write an item.
         -- Assume that `calloc' is already done and that `index'
         -- is the range [0 .. `nb_elements'-1].
      require
         index >= 0
      external "built_in"
      ensure
         item(index) = element
      end

feature {ANY}
   realloc (old_nb_elts, new_nb_elts: INTEGER): like Current
         -- Assume Current is a valid NATIVE_ARRAY in range
         -- [0 .. `old_nb_elts'-1]. Allocate a bigger new array in
         -- range [0 .. `new_nb_elts'-1].
         -- Old range is copied in the new allocated array.
         -- New items are initialized with default values.
      require
         is_not_null
         old_nb_elts > 0
         old_nb_elts < new_nb_elts
      do
         Result := calloc(new_nb_elts)
         Result.copy_from(Current, old_nb_elts - 1)
      ensure
         Result.is_not_null
      end

feature {ANY} -- Comparison:
   memcmp (other: like Current; capacity: INTEGER): BOOLEAN
         -- True if all elements in range [0 .. `capacity'-1] are identical using `is_equal'.
         -- Assume Current and `other' are big enough.
         -- See also `fast_memcmp'.
      require
         capacity > 0 implies other.is_not_null
      local
         i: INTEGER
      do
         from
            i := capacity - 1
         until
            i < 0 or else not safe_equal(item(i), other.item(i))
         loop
            i := i - 1
         end
         Result := i < 0
      end

   slice_memcmp (at: INTEGER; other: like Current; other_lower, other_upper: INTEGER): BOOLEAN
         -- True if all elements in range [0 .. `other_upper' - `other_lower'] are identical
         -- to the elements in range [`other_lower' .. `other_upper'] of `other' using
         -- `is_equal'. Assume `Current' and `other' are big enough.
         -- See also `slice_fast_memcmp'.
      require
         at >= 0
         other_lower >= 0
         other_upper >= other_lower - 1
         other_upper >= other_lower implies other.is_not_null
      local
         i: INTEGER
      do
         from
            i := other_upper - other_lower
         until
            i < 0 or else not safe_equal(item(at + i), other.item(other_lower + i))
         loop
            i := i - 1
         end
         Result := i < 0
      end

   fast_memcmp (other: like Current; capacity: INTEGER): BOOLEAN
         -- Same jobs as `memcmp' but uses infix "=" instead of `is_equal'.
      require
         capacity > 0 implies other.is_not_null
      local
         i: INTEGER
      do
         from
            i := capacity - 1
         until
            i < 0 or else item(i) /= other.item(i)
         loop
            i := i - 1
         end
         Result := i < 0
      end

   slice_fast_memcmp (at: INTEGER; other: like Current; other_lower, other_upper: INTEGER): BOOLEAN
         -- Same jobs as `slice_memcmp' but uses infix "=" instead of `is_equal'.
      require
         at >= 0
         other_lower >= 0
         other_upper >= other_lower - 1
         other_upper >= other_lower implies other.is_not_null
      local
         i: INTEGER
      do
         from
            i := other_upper - other_lower
         until
            i < 0 or else item(at + i) /= other.item(other_lower + i)
         loop
            i := i - 1
         end
         Result := i < 0
      end

   deep_memcmp (other: like Current; capacity: INTEGER): BOOLEAN
         -- Same jobs as `memcmp' but uses `is_deep_equal' instead of `is_equal'.
      require
         capacity > 0 implies other.is_not_null
      local
         i: INTEGER; e1, e2: like item
      do
         from
            i := capacity - 1
            Result := True
         until
            not Result or else i < 0
         loop
            e1 := item(i)
            e2 := other.item(i)
            if e1 = e2 then
            elseif e1 /= Void then
               if e2 /= Void then
                  Result := e1.is_deep_equal(e2)
               else
                  Result := False
               end
            else
               Result := False
            end
            i := i - 1
         end
      end

   slice_deep_memcmp (at: INTEGER; other: like Current; other_lower, other_upper: INTEGER): BOOLEAN
         -- Same jobs as `slice_memcmp' but uses `is_deep_equal' instead of `is_equal'.
      require
         at >= 0
         other_lower >= 0
         other_upper >= other_lower - 1
         other_upper >= other_lower implies other.is_not_null
      local
         i: INTEGER; e1, e2: like item
      do
         from
            i := other_upper - other_lower
            Result := True
         until
            not Result or else i < 0
         loop
            e1 := item(i)
            e2 := other.item(i)
            if e1 = e2 then
            elseif e1 /= Void then
               if e2 /= Void then
                  Result := e1.is_deep_equal(e2)
               else
                  Result := False
               end
            else
               Result := False
            end
            i := i - 1
         end
      end

feature {ANY} -- Searching:
   first_index_of (element: like item; upper: INTEGER): INTEGER
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or after
         -- `0'. Answer `upper + 1' when the search fail.
         -- See also `fast_index_of', `reverse_index_of'.
      require
         upper >= 0
      do
         from
            check
               Result = 0
            end
         until
            Result > upper or else safe_equal(element, item(Result))
         loop
            Result := Result + 1
         end
      ensure
         Result.in_range(0, upper + 1)
         Result <= upper implies safe_equal(element, item(Result))
      end

   index_of (element: like item; start_index, upper: INTEGER): INTEGER
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `upper + 1' when the search fail.
         -- See also `fast_index_of', `reverse_index_of'.
      require
         start_index >= 0
         start_index <= upper
      do
         from
            Result := start_index
         until
            Result > upper or else safe_equal(element, item(Result))
         loop
            Result := Result + 1
         end
      ensure
         Result.in_range(start_index, upper + 1)
         Result <= upper implies safe_equal(element, item(Result))
      end

   reverse_index_of (element: like item; upper: INTEGER): INTEGER
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from `upper' down to the
         -- `0'. Answer `-1' when the search fail.
         -- See also `fast_reverse_index_of', `index_of'.
      require
         upper >= -1
      do
         from
            Result := upper
         until
            Result < 0 or else safe_equal(element, item(Result))
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(-1, upper)
         Result > 0 implies safe_equal(element, item(Result))
      end

   fast_index_of (element: like item; start_index, upper: INTEGER): INTEGER
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `upper + 1' when the search fail.
         -- See also `index_of', `reverse_index_of'.
      require
         start_index >= 0
         start_index <= upper + 1
      do
         from
            Result := start_index
         until
            Result > upper or else element = item(Result)
         loop
            Result := Result + 1
         end
      ensure
         Result.in_range(start_index, upper + 1)
         Result <= upper implies element = item(Result)
      end

   fast_reverse_index_of (element: like item; upper: INTEGER): INTEGER
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from `upper' down to the
         -- `0'. Answer `-1' when the search fail.
         -- See also `reverse_index_of', `index_of'.
      require
         upper >= -1
      do
         from
            Result := upper
         until
            Result < 0 or else element = item(Result)
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(-1, upper)
         Result > 0 implies element = item(Result)
      end

   fast_first_index_of (element: like item; upper: INTEGER): INTEGER
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
         -- `0'. Answer `upper + 1' when the search fail.
         -- See also `fast_index_of', `reverse_index_of'.
      require
         upper >= 0
      do
         from
            check
               Result = 0
            end
         until
            Result > upper or else element = item(Result)
         loop
            Result := Result + 1
         end
      ensure
         Result.in_range(0, upper + 1)
         Result <= upper implies element = item(Result)
      end

   has (element: like item; upper: INTEGER): BOOLEAN
         -- Look for `element' using `is_equal' for comparison.
         -- Also consider `fast_has' to choose the most appropriate.
      require
         upper >= -1
      local
         i: INTEGER
      do
         from
            i := upper
         until
            Result or else i < 0
         loop
            Result := safe_equal(element, item(i))
            i := i - 1
         end
      end

   slice_has (element: like item; lower, upper: INTEGER): BOOLEAN
         -- Look for `element' using `is_equal' for comparison.
         -- Also consider `slice_fast_has' to choose the most appropriate.
      require
         lower >= 0
         upper >= lower - 1
      local
         i: INTEGER
      do
         from
            i := lower
         until
            Result or else i > upper
         loop
            Result := safe_equal(element, item(i))
            i := i + 1
         end
      end

   fast_has (element: like item; upper: INTEGER): BOOLEAN
         -- Look for `element' using basic `=' for comparison.
         -- Also consider `has' to choose the most appropriate.
      require
         upper >= -1
      local
         i: INTEGER
      do
         from
            i := upper
         until
            i < 0 or else element = item(i)
         loop
            i := i - 1
         end
         Result := i >= 0
      end

   slice_fast_has (element: like item; lower, upper: INTEGER): BOOLEAN
         -- Look for `element' using `is_equal' for comparison.
         -- Also consider `slice_fast_has' to choose the most appropriate.
      require
         lower >= 0
         upper >= lower - 1
      local
         i: INTEGER
      do
         from
            i := lower
         until
            Result or else i > upper
         loop
            Result := element = item(i)
            i := i + 1
         end
      end

feature {ANY} -- Removing:
   remove_first (upper: INTEGER)
         -- Assume `upper' is a valid index.
         -- Move range [1 .. `upper'] by 1 position left.
      require
         upper >= 0
      local
         i: INTEGER
      do
         from
         until
            i = upper
         loop
            put(item(i + 1), i)
            i := i + 1
         end
      end

   remove (index, upper: INTEGER)
         -- Assume `upper' is a valid index.
         -- Move range [`index' + 1 .. `upper'] by 1 position left.
      require
         index >= 0
         index <= upper
      local
         i: INTEGER
      do
         from
            i := index
         until
            i = upper
         loop
            put(item(i + 1), i)
            i := i + 1
         end
      end

feature {ANY} -- Replacing:
   replace_all (old_value, new_value: like item; upper: INTEGER)
         -- Replace all occurrences of the element `old_value' by `new_value' using `is_equal' for comparison.
         -- See also `fast_replace_all' to choose the appropriate one.
      require
         upper >= -1
      local
         i: INTEGER
      do
         from
            i := upper
         until
            i < 0
         loop
            if safe_equal(old_value, item(i)) then
               put(new_value, i)
            end
            i := i - 1
         end
      end

   fast_replace_all (old_value, new_value: like item; upper: INTEGER)
         -- Replace all occurrences of the element `old_value' by `new_value'
         -- using basic `=' for comparison.
         -- See also `replace_all' to choose the appropriate one.
      require
         upper >= -1
      local
         i: INTEGER
      do
         from
            i := upper
         until
            i < 0
         loop
            if old_value = item(i) then
               put(new_value, i)
            end
            i := i - 1
         end
      end

feature {ANY} -- Adding:
   copy_at (at: INTEGER; src: like Current; src_capacity: INTEGER)
         -- Copy range [0 .. `src_capacity - 1'] of `src' to range [`at' .. `at + src_capacity - 1'] of `Current'.
         -- No subscript checking.
      require
         at >= 0
         src_capacity >= 0
      local
         at_idx, src_idx: INTEGER
      do
         from
            src_idx := src_capacity - 1
            at_idx := at + src_idx
         until
            src_idx < 0
         loop
            put(src.item(src_idx), at_idx)
            src_idx := src_idx - 1
            at_idx := at_idx - 1
         end
      end

   slice_copy (at: INTEGER; src: like Current; src_min, src_max: INTEGER)
         -- Copy range [`src_min' .. `src_max'] of `src' to range [`at' .. `at + src_max - src_min'] of `Current'.
         -- No subscript checking.
         --*** NATIVE_ARRAY[CHARACTER/INTEGER_8] are modified byte per byte. Efficiency should be improved here.
      require
         at >= 0
         src_max >= src_min - 1
         useful_work: src /= Current or at /= src_min
      external "built_in"
      end

feature {ANY} -- Other:
   set_all_with (v: like item; upper: INTEGER)
         -- Set all elements in range [0 .. `upper'] with value `v'.
      require
         upper >= -1
      do
         set_slice_with(v, 0, upper)
      end

   set_slice_with (v: like item; lower, upper: INTEGER)
         -- Set all elements in range [`lower' .. `upper'] with value `v'.
      require
         lower >= 0
         upper >= lower - 1
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            put(v, i)
            i := i + 1
         end
      end

   clear_all (upper: INTEGER)
         -- Set all elements in range [0 .. `upper'] with the default value.
      require
         upper >= -1
      local
         v: E_; i: INTEGER
      do
         from
            i := upper
         until
            i < 0
         loop
            put(v, i)
            i := i - 1
         end
      ensure
         all_default(upper)
      end

   clear (lower, upper: INTEGER)
         -- Set all elements in range [`lower' .. `upper'] with the default value.
      require
         lower >= 0
         upper >= lower - 1
      local
         v: E_; i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            put(v, i)
            i := i + 1
         end
      end

   copy_from (model: like Current; upper: INTEGER)
         -- Assume `upper' is a valid index both in Current and `model'.
      require
         upper >= -1
      do
         copy_slice_from(model, 0, upper)
      end

   copy_slice_from (model: like Current; lower, upper: INTEGER)
         -- Assume `upper' is a valid index both in Current and `model'.
      require
         lower >= 0
         upper >= lower - 1
         useful_work: model /= Current or else lower > 0
      do
         slice_copy(0, model, lower, upper)
      end

   deep_twin_from (capacity: INTEGER): like Current
         -- To implement `deep_twin'. Allocate a new array of `capacity' initialized  with `deep_twin'.
         -- Assume `capacity' is valid both in `Current' and `model'.
      require
         capacity >= 0
      local
         i: INTEGER; element: like item
      do
         if capacity > 0 then
            from
               Result := calloc(capacity)
               i := capacity - 1
            until
               i < 0
            loop
               element := item(i)
               if element /= Void then
                  element := element.deep_twin
               end
               Result.put(element, i)
               i := i - 1
            end
         end
      end

   move (lower, upper, offset: INTEGER)
         -- Move range [`lower' .. `upper'] by `offset' positions.
         -- Freed positions are not initialized to default values.
      require
         lower >= 0
         upper >= lower
         lower + offset >= 0
      local
         i: INTEGER
      do
         if offset = 0 then
         elseif offset < 0 then
            from
               i := lower
            until
               i > upper
            loop
               put(item(i), i + offset)
               i := i + 1
            end
         else
            from
               i := upper
            until
               i < lower
            loop
               put(item(i), i + offset)
               i := i - 1
            end
         end
      end

   occurrences (element: like item; upper: INTEGER): INTEGER
         -- Number of occurrences of `element' in range [0 .. `upper'] using `is_equal' for comparison.
         -- See also `fast_occurrences' to chose the appropriate one.
      require
         upper >= -1
      local
         i: INTEGER
      do
         from
            i := upper
         until
            i < 0
         loop
            if safe_equal(element, item(i)) then
               Result := Result + 1
            end
            i := i - 1
         end
      end

   slice_occurrences (element: like item; lower, upper: INTEGER): INTEGER
         -- Number of occurrences of `element' in range [`lower' .. `upper'] using `is_equal' for comparison.
         -- See also `slice_fast_occurrences' to chose the appropriate one.
      require
         lower >= 0
         upper >= lower - 1
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            if safe_equal(element, item(i)) then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   fast_occurrences (element: like item; upper: INTEGER): INTEGER
         -- Number of occurrences of `element' in range [0 .. `upper'] using basic "=" for comparison.
         -- See also `occurrences' to chose the appropriate one.
      require
         upper >= -1
      local
         i: INTEGER
      do
         from
            i := upper
         until
            i < 0
         loop
            if element = item(i) then
               Result := Result + 1
            end
            i := i - 1
         end
      end

   slice_fast_occurrences (element: like item; lower, upper: INTEGER): INTEGER
         -- Number of occurrences of `element' in range [`lower' .. `upper']
         -- using basic "=" for comparison.
         -- See also `slice_occurrences' to chose the appropriate one.
      require
         lower >= 0
         upper >= lower - 1
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            if element = item(i) then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   all_default (upper: INTEGER): BOOLEAN
         -- Do all items in range [0 .. `upper'] have their type's default value?
         -- Note: for non Void items, the test is performed with the `is_default' predicate.
      require
         upper >= -1
      do
         Result := slice_default(0, upper)
      end

   slice_default (lower, upper: INTEGER): BOOLEAN
         -- Do all items in range [`lower' .. `upper'] have their type's default value?
         -- Note: for non Void items, the test is performed with the `is_default' predicate.
      require
         lower >= 0
         upper >= lower - 1
      local
         i: INTEGER; v: like item
      do
         from
            Result := True
            i := lower
         until
            i > upper or else not Result
         loop
            v := item(i)
            if v /= Void then
               Result := v.is_default
            end
            i := i + 1
         end
      end

feature {ANY} -- Interfacing with other languages:
   to_external: POINTER
         -- Gives access to the C pointer on the area of storage.
      do
         Result := to_pointer
      end

   from_pointer (pointer: POINTER): like Current
         -- Convert `pointer' into Current type.
      external "built_in"
      end

   is_not_null: BOOLEAN
      do
         Result := to_pointer.is_not_null
      end

   is_null: BOOLEAN
      do
         Result := to_pointer.is_null
      end

feature {} -- Implement manifest generic creation.
   manifest_make (needed_capacity: INTEGER)
         -- Manifest creation (see also `calloc' and `realloc' for creation).
      do
         check
         -- Automatic usage of `calloc'.
            False
         end
      end

   manifest_put (index: INTEGER; element: like item)
      do
         check
         -- Automatic usage of `put'.
            False
         end
      end

   manifest_semicolon_check: BOOLEAN False

end -- class NATIVE_ARRAY
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
