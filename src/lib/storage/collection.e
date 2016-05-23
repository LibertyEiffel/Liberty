-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COLLECTION[E_]
   --
   -- Common abstract definition of a sequenceable collection of objects. Such a collection is traversable
   -- using a simple INTEGER index from `lower' to `upper' using `item'. All COLLECTIONs are resizable
   -- thanks to `add_last' / `remove_last', `add_first' / `remove_first' as well as `add' / `remove' .
   --
   -- This abstraction provides feature to view a COLLECTION as a stack (as an example by using `add_last',
   -- `last', and `remove_last'). One can also use a COLLECTION as a queue (as an example, by using
   -- `add_last', `first' and `remove_first'). See also class QUEUE and STACK.
   --
   -- The SmartEiffel standard library provides five implementations of COLLECTION: ARRAY, FAST_ARRAY,
   -- RING_ARRAY, LINKED_LIST and TWO_WAY_LINKED_LIST. Except for creations all implementations have
   -- exactly the same behavior. Switching from one implementation to another only change the memory used
   -- and the execution time (see header comment of ARRAY, FAST_ARRAY, RING_ARRAY, LINKED_LIST and
   -- TWO_WAY_LINKED_LIST for more details).
   --

inherit
   STORABLE
      undefine out_in_tagged_out_memory
      redefine copy, is_equal
      end
   TRAVERSABLE[E_]
      redefine copy, is_equal
      end
   SEARCHABLE[E_]
      undefine out_in_tagged_out_memory
      redefine copy, is_equal
      end

feature {ANY} -- Accessing:
   frozen infix "@" (i: INTEGER): E_
         -- The infix notation which is actually just a synonym for `item'.
         --
         -- See also `item'.
      require
         valid_index(i)
      do
         Result := item(i)
      ensure
         definition: Result = item(i)
      end

feature {ANY} -- Writing:
   put (element: like item; i: INTEGER) assign item
         -- Make `element' the item at index `i'.
         --
         -- See also `lower', `upper', `valid_index', `item', `swap', `force'.
      require
         valid_index(i)
      deferred
      ensure
         item(i) = element
         count = old count
      end

   swap (i1, i2: INTEGER)
         -- Swap item at index `i1' with item at index `i2'.
         --
         -- See also `item', `put'.
      require
         valid_index(i1)
         valid_index(i2)
      local
         tmp: like item
      do
         tmp := item(i1)
         put(item(i2), i1)
         put(tmp, i2)
      ensure
         item(i1) = old item(i2)
         item(i2) = old item(i1)
         count = old count
      end

   set_all_with (v: like item)
         -- Set all items with value `v'.
         --
         -- See also `set_slice_with'.
      deferred
      ensure
         count = old count
      end

   set_slice_with (v: like item; lower_index, upper_index: INTEGER)
         -- Set all items in range [`lower_index' .. `upper_index'] with `v'.
         --
         -- See also `set_all_with'.
      require
         lower_index <= upper_index
         valid_index(lower_index)
         valid_index(upper_index)
      local
         i: INTEGER
      do
         from
            i := lower_index
         until
            i > upper_index
         loop
            put(v, i)
            i := i + 1
         end
      ensure
         count = old count
      end

   clear_all
         -- Set every item to its default value. The `count' is not affected.
         --
         -- See also `clear', `all_default'.
      local
         value: like item
      do
         set_all_with(value)
      ensure
         stable_upper: upper = old upper
         stable_lower: lower = old lower
         all_default
      end

feature {ANY} -- Adding:
   add_first (element: like item)
         -- Add a new item in first position : `count' is increased by
         -- one and all other items are shifted right.
         --
         -- See also `add_last', `first', `last', `add'.
      deferred
      ensure
         first = element
         count = 1 + old count
         lower = old lower
         upper = 1 + old upper
      end

   add_last (element: like item)
         -- Add a new item at the end : `count' is increased by one.
         --
         -- See also `add_first', `last', `first', `add'.
      deferred
      ensure
         last = element
         count = 1 + old count
         lower = old lower
         upper = 1 + old upper
      end

   add (element: like item; index: INTEGER)
         -- Add a new `element' at rank `index' : `count' is increased
         -- by one and range [`index' .. `upper'] is shifted right by one position.
         --
         -- See also `add_first', `add_last', `append_collection'.
      require
         index.in_range(lower, upper + 1)
      deferred
      ensure
         item(index) = element
         count = 1 + old count
         upper = 1 + old upper
      end

   append_collection (other: COLLECTION[E_])
         -- Append `other' to Current.
         --
         -- See also `add_last', `add_first', `add'.
      obsolete "use append_traversable instead"
      require
         other /= Void
      do
         append_traversable(other)
      ensure
         count = other.count + old count
      end

   append_traversable (other: TRAVERSABLE[E_])
         -- Append `other' to Current.
         --
         -- See also `add_last', `add_first', `add'.
      require
         other /= Void
      local
         i: INTEGER
      do
         from
            i := other.lower
         until
            i > other.upper
         loop
            add_last(other.item(i))
            i := i + 1
         end
         -- Note: AFAIK it could also be implemented with other.for_each(agent add_last). Paolo 2011-08-12
         -- Yes, but it MUST NOT. We are in the standard library and it must work without the GC so don't build useless
         -- objects. Cad 2015-06-03
      ensure
         count = other.count + old count
      end

feature {ANY} -- Modification:
   force (element: E_; index: INTEGER)
         -- Make `element' the item at `index', enlarging the collection if
         -- necessary (new bounds except `index' are initialized with
         -- default values).
         --
         -- See also `put', `item', `swap'.
      require
         index >= lower
      deferred
      ensure
         upper = index.max(old upper)
         item(index) = element
      end

   copy (other: like Current)
         -- Reinitialize by copying all the items of `other'.
      deferred
      end

   from_collection (model: TRAVERSABLE[like item])
         -- Initialize the current object with the contents of `model'.
      require
         model /= Void
         useful_work: model /= Current
      deferred
      ensure
         count = model.count
      end

feature {ANY} -- Removing:
   remove_first
         -- Remove the `first' element of the collection.
         --
         -- See also `remove_last', `remove', `remove_head'.
      require
         not is_empty
      deferred
      ensure
         count = old count - 1
         lower = old lower + 1 xor upper = old upper - 1
      end

   remove_head (n: INTEGER)
         -- Remove the `n' elements of the collection.
         --
         -- See also `remove_tail', `remove', `remove_first'.
      require
         n > 0 and n <= count
      deferred
      ensure
         count = old count - n
         lower = old lower + n xor upper = old upper - n
      end

   remove (index: INTEGER)
         -- Remove the item at position `index'. Followings items are shifted left by one position.
         --
         -- See also `remove_first', `remove_head', `remove_tail', `remove_last'.
      require
         valid_index(index)
      deferred
      ensure
         count = old count - 1
         upper = old upper - 1
      end

   remove_last
         -- Remove the `last' item.
         --
         -- See also `remove_first', `remove', `remove_tail'.
      require
         not is_empty
      deferred
      ensure
         count = old count - 1
         upper = old upper - 1
      end

   remove_tail (n: INTEGER)
         -- Remove the last `n' item(s).
         --
         -- See also `remove_head', `remove', `remove_last'.
      require
         n > 0 and n <= count
      deferred
      ensure
         count = old count - n
         upper = old upper - n
      end

   clear_count
         -- Discard all items (`is_empty' is True after that call). If possible, the actual implementation
         -- supposed to keep its internal storage area in order to refill `Current' in an efficient way.
         --
         -- See also `clear_count_and_capacity'.
      deferred
      ensure
         is_empty: count = 0
      end

   clear_count_and_capacity
         -- Discard all items (`is_empty' is True after that call). If possible, the actual implementation
         -- supposed to release its internal storage area for this memory to be used by other objects.
         --
         -- See also `clear_count'.
      deferred
      ensure
         is_empty: count = 0
      end

feature {ANY} -- Looking and Searching:
   has (x: like item): BOOLEAN
         -- Look for `x' using `is_equal' for comparison.
         --
         -- See also `fast_has', `index_of', `fast_index_of'.
      do
         Result := valid_index(first_index_of(x))
      end

   fast_has (x: like item): BOOLEAN
         -- Look for `x' using basic `=' for comparison.
         --
         -- See also `has', `fast_index_of', `index_of'.
      do
         Result := valid_index(fast_first_index_of(x))
      end

   last_index_of (element: like item): INTEGER
         -- Using `is_equal' for comparison, gives the index of the last occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from the `upper' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_last_index_of', `reverse_index_of', `index_of'.
      do
         Result := reverse_index_of(element, upper)
      end

   fast_last_index_of (element: like item): INTEGER
         -- Using basic `=' for comparison, gives the index of the last occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from the `upper' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_reverse_index_of', `last_index_of'.
      do
         Result := fast_reverse_index_of(element, upper)
      end

feature {ANY} -- Looking and comparison:
   fast_is_equal (other: like Current): BOOLEAN
         -- Do both collections have the same `lower', `upper', and items?
         -- The basic `=' is used for comparison of items.
         --
         -- See also `is_equal', `same_items'.
      deferred
      ensure
         Result implies lower = other.lower and upper = other.upper
      end

   is_equal (other: like Current): BOOLEAN
         -- Do both collections have the same `lower', `upper', and
         -- items?
         -- Feature `is_equal' is used for comparison of items.
         --
         -- See also `fast_is_equal', `same_items'.
      deferred
      ensure then
         Result implies lower = other.lower and upper = other.upper
      end

   is_equal_map (other: like Current): BOOLEAN
         -- Do both collections have the same `lower', `upper', and
         -- items?
         -- Feature `is_equal' is used for comparison of items.
      obsolete "is_equal now does that."
      do
         Result := is_equal(other)
      end

   all_default: BOOLEAN
         -- Do all items have their type's default value?
         -- Note: for non Void items, the test is performed with the `is_default' predicate.
         --
         -- See also `clear_all'.
      deferred
      end

   same_items (other: COLLECTION[E_]): BOOLEAN
         -- Do both collections have the same items? The basic `=' is used
         -- for comparison of items and indices are not considered (for
         -- example this routine may yield True with `Current' indexed in
         -- range [1..2] and `other' indexed in range [2..3]).
         --
         -- See also `is_equal', `fast_is_equal'.
      require
         other /= Void
      local
         i, j: INTEGER
      do
         if count = other.count then
            from
               Result := True
               i := lower
               j := other.lower
            until
               not Result or else i > upper
            loop
               Result := item(i) = other.item(j)
               i := i + 1
               j := j + 1
            end
         end
      ensure
         Result implies count = other.count
      end

   occurrences (element: like item): INTEGER
         -- Number of occurrences of `element' using `is_equal' for comparison.
         --
         -- See also `fast_occurrences', `index_of'.
      deferred
      ensure
         Result >= 0
      end

   fast_occurrences (element: like item): INTEGER
         -- Number of occurrences of `element' using basic `=' for comparison.
         --
         -- See also `occurrences', `index_of'.
      deferred
      ensure
         Result >= 0
      end

feature {ANY} -- Other features:
   replace_all (old_value, new_value: like item)
         -- Replace all occurrences of the element `old_value' by `new_value' using `is_equal' for comparison.
         --
         -- See also `fast_replace_all', `move'.
      deferred
      ensure
         count = old count
         not (create {SAFE_EQUAL[E_]}).test(old_value, new_value) implies occurrences(old_value) = 0
      end

   fast_replace_all (old_value, new_value: like item)
         -- Replace all occurrences of the element `old_value' by `new_value' using basic `=' for comparison.
         --
         -- See also `replace_all', `move'.
      deferred
      ensure
         count = old count
         old_value /= new_value implies fast_occurrences(old_value) = 0
      end

   move (lower_index, upper_index, distance: INTEGER)
         -- Move range `lower_index' .. `upper_index' by `distance' positions.
         --   Negative distance moves towards lower indices.
         -- Free places get default values.
         --
         -- See also `slice', `replace_all'.
      require
         lower_index <= upper_index
         valid_index(lower_index)
         valid_index(lower_index + distance)
         valid_index(upper_index)
         valid_index(upper_index + distance)
      local
         default_value: like item; i: INTEGER
      do
         if distance = 0 then
         elseif distance < 0 then
            from
               i := lower_index
            until
               i > upper_index
            loop
               put(item(i), i + distance)
               put(default_value, i)
               i := i + 1
            end
         else
            from
               i := upper_index
            until
               i < lower_index
            loop
               put(item(i), i + distance)
               put(default_value, i)
               i := i - 1
            end
         end
      ensure
         count = old count
      end

   slice (min, max: INTEGER): like Current
         -- New collection consisting of items at indexes in [`min'..`max'].
         -- Result has the same dynamic type as `Current'.
         -- The `lower' index of the `Result' is the same as `lower'.
         --
         -- See also `from_collection', `move', `replace_all'.
      require
         lower <= min
         max <= upper
         min <= max + 1
      deferred
      ensure
         same_dynamic_type(Result)
         Result.count = max - min + 1
         Result.lower = lower
      end

   reverse
         -- Reverse the order of the elements.
      deferred
      ensure
         count = old count
      end

feature {} -- Implement manifest generic creation:
   manifest_semicolon_check: BOOLEAN False

   manifest_put (index: INTEGER; element: like item)
      require
         index >= 0
      deferred
      end

invariant
   valid_bounds: lower <= upper + 1

end -- class COLLECTION
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
