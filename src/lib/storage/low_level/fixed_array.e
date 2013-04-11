-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class FIXED_ARRAY[E_]

insert
   SAFE_EQUAL[E_]
      undefine
         out_in_tagged_out_memory
      end
   TRAVERSABLE[E_]

create {ANY}
   default_create

feature {FIXED_ARRAY}
   elements: NATIVE_ARRAY[E_]

   capacity: INTEGER
         -- The number of slots this array holds

feature {FIXED_ARRAY}
   do_calloc (c: like capacity) is
      require
         c >= 0
      do
         elements := elements.calloc(c)
         capacity := c
      ensure
         capacity = c
      end

   do_realloc (e: like elements; c: like capacity) is
      require
         c >= 0
      do
         elements := e.realloc(capacity, c)
         capacity := c
      ensure
         capacity = c
      end

feature {ANY} -- Basic features:
   element_sizeof: INTEGER is
         -- The size in number of bytes for type `E_'.
      do
         Result := elements.element_sizeof
      end

   calloc (nb_elements: INTEGER): like Current is
         -- Allocate a new array of `nb_elements' of type `E_'.
         -- The new array is initialized with default values.
      require
         nb_elements > 0
      do
         Result.do_calloc(nb_elements)
      ensure
         Result.capacity = nb_elements
         Result.all_default
      end

   item (index: INTEGER): E_ is
         -- To read an `item'.
         -- Assume that `calloc' is already done and that `index' is the range [0 .. `capacity'-1].
      require
         index >= 0 and then index < capacity
      do
         Result := elements.item(index)
      end

   put (element: E_; index: INTEGER) is
         -- To write an item.
         -- Assume that `calloc' is already done and that `index'
         -- is the range [0 .. `capacity'-1].
      require
         index >= 0 and then index < capacity
      do
         elements.put(element, index)
      ensure
         item(index) = element
      end

   lower: INTEGER is 0

   upper: INTEGER is
      do
         Result := capacity - 1
      end

   count: INTEGER is
      do
         Result := capacity
      end

feature {ANY}
   realloc (new_nb_elts: INTEGER): like Current is
         -- Assume Current is a valid NATIVE_ARRAY in range
         -- [0 .. `capacity'-1]. Allocate a bigger new array in
         -- range [0 .. `new_nb_elts'-1].
         -- Old range is copied in the new allocated array.
         -- New items are initialized with default values.
      require
         new_nb_elts > capacity
      do
         Result.do_realloc(elements, new_nb_elts)
      ensure
         Result.capacity = new_nb_elts
      end

feature {ANY} -- Comparison:
   memcmp (other: like Current): BOOLEAN is
         -- True if all elements in range [0 .. `capacity'-1] are identical using `is_equal'.
         -- See also `fast_memcmp'.
      require
         other.capacity = capacity
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

   slice_memcmp (at: INTEGER; other: like Current; other_low, other_up: INTEGER): BOOLEAN is
         -- True if all elements in range [`at' .. `at' + `other_up' - `other_low'] are identical
         -- to the elements in range [`other_low' .. `other_up'] of `other' using
         -- `is_equal'. Assume `Current' and `other' are big enough.
         -- See also `slice_fast_memcmp'.
      require
         at >= 0
         other_low >= 0
         other_up >= other_low - 1
         other_up < other.capacity
      local
         i: INTEGER
      do
         from
            i := other_up - other_low
         until
            i < 0 or else not safe_equal(item(at + i), other.item(other_low + i))
         loop
            i := i - 1
         end
         Result := i < 0
      end

   fast_memcmp (other: like Current): BOOLEAN is
         -- Same jobs as `memcmp' but uses infix "=" instead of `is_equal'.
      require
         other.capacity = capacity
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

   slice_fast_memcmp (at: INTEGER; other: like Current; other_low, other_up: INTEGER): BOOLEAN is
         -- Same jobs as `slice_memcmp' but uses infix "=" instead of `is_equal'.
      require
         at >= 0
         other_low >= 0
         other_up >= other_low - 1
         other_up < other.capacity
      local
         i: INTEGER
      do
         from
            i := other_up - other_low
         until
            i < 0 or else item(at + i) /= other.item(other_low + i)
         loop
            i := i - 1
         end
         Result := i < 0
      end

   deep_memcmp (other: like Current; nb_elements: INTEGER): BOOLEAN is
         -- Same jobs as `memcmp' but uses `is_deep_equal' instead of `is_equal'.
      local
         i: INTEGER; e1, e2: like item
      do
         from
            i := nb_elements - 1
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

   slice_deep_memcmp (at: INTEGER; other: like Current; other_low, other_up: INTEGER): BOOLEAN is
         -- Same jobs as `slice_memcmp' but uses `is_deep_equal' instead of `is_equal'.
      require
         at >= 0
         other_low >= 0
         other_up >= other_low - 1
         other_up < other.capacity
      local
         i: INTEGER; e1, e2: like item
      do
         from
            i := other_up - other_low
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
   first_index_of (element: like item): INTEGER is
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or after
         -- `0'. Answer `-1' when the search fail.
         -- See also `fast_index_of', `reverse_index_of'.
      do
         Result := index_of(element, 0)
      ensure
         Result.in_range(-1, capacity - 1)
         Result /= -1 implies safe_equal(element, item(Result))
      end

   index_of (element: like item; start_index: INTEGER): INTEGER is
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `-1' when the search fail.
         -- See also `fast_index_of', `reverse_index_of'.
      require
         start_index >= 0
         start_index < capacity
      do
         from
            Result := start_index
         until
            Result >= capacity or else safe_equal(element, item(Result))
         loop
            Result := Result + 1
         end
         if Result >= capacity then
            Result := -1
         end
      ensure
         Result.in_range(-1, capacity - 1)
         Result /= -1 implies safe_equal(element, item(Result))
      end

   reverse_index_of (element: like item): INTEGER is
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or before
         -- `capacity'-1. Search is done in reverse direction, which means from `up' down to the
         -- `0'. Answer `-1' when the search fail.
         -- See also `fast_reverse_index_of', `index_of'.
      do
         from
            Result := capacity - 1
         until
            Result < 0 or else safe_equal(element, item(Result))
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(-1, capacity - 1)
         Result /= -1 implies safe_equal(element, item(Result))
      end

   fast_first_index_of (element: like item): INTEGER is
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
         -- `0'. Answer `-1' when the search fail.
         -- See also `fast_index_of', `reverse_index_of'.
      do
         Result := fast_index_of(element, 0)
      ensure
         Result.in_range(-1, capacity - 1)
         Result /= -1 implies element = item(Result)
      end

   fast_index_of (element: like item; start_index: INTEGER): INTEGER is
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `-1' when the search fail.
         -- See also `index_of', `reverse_index_of'.
      require
         start_index >= 0
         start_index < capacity
      do
         from
            Result := start_index
         until
            Result >= capacity or else element = item(Result)
         loop
            Result := Result + 1
         end
         if Result >= capacity then
            Result := -1
         end
      ensure
         Result.in_range(start_index, capacity - 1)
         Result /= -1 implies element = item(Result)
      end

   fast_reverse_index_of (element: like item): INTEGER is
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or before
         -- `capacity'-1. Search is done in reverse direction, which means from `up' down to the
         -- `0'. Answer `-1' when the search fail.
         -- See also `reverse_index_of', `index_of'.
      do
         from
            Result := capacity - 1
         until
            Result < 0 or else element = item(Result)
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(-1, capacity - 1)
         Result /= -1 implies element = item(Result)
      end

   has (element: like item): BOOLEAN is
         -- Look for `element' using `is_equal' for comparison.
         -- Also consider `fast_has' to choose the most appropriate.
      local
         i: INTEGER
      do
         from
            i := capacity - 1
         until
            Result or else i < 0
         loop
            Result := safe_equal(element, item(i))
            i := i - 1
         end
      end

   fast_has (element: like item): BOOLEAN is
         -- Look for `element' using basic `=' for comparison.
         -- Also consider `has' to choose the most appropriate.
      local
         i: INTEGER
      do
         from
            i := capacity - 1
         until
            Result or else i < 0
         loop
            Result := element = item(i)
            i := i - 1
         end
      end

feature {ANY} -- Removing:
   remove_first is
         -- Move range [1 .. `capacity'-1] by 1 position left.
      require
         capacity > 0
      do
         remove(0)
      end

   remove (index: INTEGER) is
         -- Move range [`index' + 1 .. `capacity' - 1] by 1 position left.
         -- The last element is set to the default value.
      require
         index >= 0
         index < capacity
      local
         i: INTEGER; e: E_
      do
         from
            i := index
         until
            i = capacity - 1
         loop
            put(item(i + 1), i)
            i := i + 1
         end
         put(e, i)
      end

feature {ANY} -- Replacing:
   replace_all (old_value, new_value: like item) is
         -- Replace all occurrences of the element `old_value' by `new_value' using `is_equal' for comparison.
         -- See also `fast_replace_all' to choose the apropriate one.
      local
         i: INTEGER
      do
         from
            i := capacity - 1
         until
            i < 0
         loop
            if safe_equal(old_value, item(i)) then
               put(new_value, i)
            end
            i := i - 1
         end
      end

   fast_replace_all (old_value, new_value: like item) is
         -- Replace all occurrences of the element `old_value' by `new_value'
         -- using basic `=' for comparison.
         -- See also `replace_all' to choose the apropriate one.
      local
         i: INTEGER
      do
         from
            i := capacity - 1
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
   copy_at (at: INTEGER; src: like Current) is
         -- Copy range [0 .. `src.capacity - 1'] of `src' to range [`at' .. `at + src.capacity - 1'] of `Current'.
         -- No subscript checking.
      require
         at >= 0
         src.capacity >= 0
         at + src.capacity <= capacity
      do
         slice_copy(at, src, 0, src.capacity-1)
      end

   slice_copy (at: INTEGER; src: like Current; src_min, src_max: INTEGER) is
         -- Copy range [`src_min' .. `src_max'] of `src' to range [`at' .. `at + src_max - src_min'] of `Current'.
         -- No subscript checking.
         --*** NATIVE_ARRAY[CHARACTER/INTEGER_8] are modified byte per byte. Efficiency should be improved here.
      require
         at >= 0
         src_max >= src_min - 1
         at + src_max - src_min < capacity
         useful_work: src /= Current or at /= src_min
      do
         elements.slice_copy(at, src.elements, src_min, src_max)
      end

feature {ANY} -- Other:
   set_all_with (v: like item) is
         -- Set all elements in range [0 .. `capacity'-1] with value `v'.
      do
         set_slice_with(v, 0, capacity - 1)
      end

   set_slice_with (v: like item; low, up: INTEGER) is
         -- Set all elements in range [`low' .. `up'] with value `v'.
      require
         low >= 0
         up >= low - 1
         up < capacity
      local
         i: INTEGER
      do
         from
            i := low
         until
            i > up
         loop
            put(v, i)
            i := i + 1
         end
      end

   clear_all is
         -- Set all elements in range [0 .. `capacity'-1] with the default value.
      local
         e: E_
      do
         set_all_with(e)
      ensure
         all_default
      end

   clear_slice (low, up: INTEGER) is
         -- Set all elements in range [`low' .. `up'] with the default value.
      require
         low >= 0
         up >= low - 1
         up < capacity
      local
         e: E_
      do
         set_slice_with(e, low, up)
      end

   copy_from (src: like Current) is
      require
         src.capacity = capacity
      do
         copy_at(0, src)
      end

   deep_twin_from: like Current is
         -- To implement `deep_twin'. Allocate a new array of `capacity' initialized  with `deep_twin'.
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

   move (low, up, offset: INTEGER) is
         -- Move range [`low' .. `up'] by `offset' positions.
         -- Freed positions are not initialized to default values.
      require
         low >= 0
         up >= low
         low + offset >= 0
         up + offset < capacity
      local
         i: INTEGER
      do
         if offset = 0 then
         elseif offset < 0 then
            from
               i := low
            until
               i > up
            loop
               put(item(i), i + offset)
               i := i + 1
            end
         else
            from
               i := up
            until
               i < low
            loop
               put(item(i), i + offset)
               i := i - 1
            end
         end
      end

   occurrences (element: like item): INTEGER is
         -- Number of occurrences of `element' in range [0 .. `capacity'-1] using `is_equal' for comparison.
         -- See also `fast_occurrences' to chose the apropriate one.
      do
         Result := slice_occurrences(element, 0, capacity - 1)
      end

   slice_occurrences (element: like item; low, up: INTEGER): INTEGER is
         -- Number of occurrences of `element' in range [`low' .. `up'] using `is_equal' for comparison.
         -- See also `slice_fast_occurrences' to chose the apropriate one.
      require
         low >= 0
         up >= low - 1
         up < capacity
      local
         i: INTEGER
      do
         from
            i := low
         until
            i > up
         loop
            if safe_equal(element, item(i)) then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   fast_occurrences (element: like item): INTEGER is
         -- Number of occurrences of `element' in range [0 .. `capacity'-1] using basic "=" for comparison.
         -- See also `occurrences' to chose the apropriate one.
      do
         Result := slice_fast_occurrences(element, 0, capacity - 1)
      end

   slice_fast_occurrences (element: like item; low, up: INTEGER): INTEGER is
         -- Number of occurrences of `element' in range [`low' .. `up']
         -- using basic "=" for comparison.
         -- See also `slice_occurrences' to chose the apropriate one.
      require
         low >= 0
         up >= low - 1
         up < capacity
      local
         i: INTEGER
      do
         from
            i := low
         until
            i > up
         loop
            if element = item(i) then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   all_default: BOOLEAN is
         -- Do all items in range [0 .. `capacity'-1] have their type's default value?
         -- Note: for non Void items, the test is performed with the `is_default' predicate.
      do
         Result := slice_default(0, capacity - 1)
      end

   slice_default (low, up: INTEGER): BOOLEAN is
         -- Do all items in range [`low' .. `up'] have their type's default value?
         -- Note: for non Void items, the test is performed with the `is_default' predicate.
      require
         low >= 0
         up >= low - 1
         up < capacity
      local
         i: INTEGER; v: like item
      do
         from
            Result := True
            i := low
         until
            i > up or else not Result
         loop
            v := item(i)
            if v /= Void then
               Result := v.is_default
            end
            i := i + 1
         end
      end

feature {ANY} -- Interfacing with other languages:
   to_external: POINTER is
         -- Gives access to the C pointer on the area of storage.
      do
         Result := elements.to_pointer
      end

   from_pointer (pointer: POINTER; nb_elements: INTEGER): like Current is
         -- Convert `pointer' into Current type.
      do
         elements := elements.from_pointer(pointer)
         capacity := nb_elements
      ensure
         Result.capacity = nb_elements
      end

invariant
   capacity >= 0

end -- class FIXED_ARRAY
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
