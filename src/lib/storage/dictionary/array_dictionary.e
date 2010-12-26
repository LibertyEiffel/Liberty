-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ARRAY_DICTIONARY[V_, K_]
   --
   -- This dictionary is sorted in the order in which the keys are added.
   -- Access time is not good at all: O(n)
   --

inherit
   DICTIONARY[V_, K_]
      redefine
         new_iterator_on_items
      end

create {ANY}
   make, with_capacity

feature {ANY} -- Basic access:
   has (k: K_): BOOLEAN is
      do
         Result := keys.has(k)
      end

   at (k: K_): V_ is
      do
         Result := items.item(keys.first_index_of(k))
      end

   reference_at (k: K_): V_ is
      local
         i: INTEGER
      do
         i := keys.first_index_of(k)
         if keys.valid_index(i) then
            Result := items.item(i)
         end
      end

   fast_has (k: K_): BOOLEAN is
      do
         Result := keys.fast_has(k)
      end

   fast_at (k: K_): V_ is
      do
         Result := items.item(keys.fast_first_index_of(k))
      end

   fast_reference_at (k: K_): V_ is
      local
         i: INTEGER
      do
         i := keys.fast_first_index_of(k)
         if keys.valid_index(i) then
            Result := items.item(i)
         end
      end

feature {ANY}
   put (v: V_; k: K_) is
      local
         i: INTEGER
      do
         i := keys.first_index_of(k)
         if keys.valid_index(i) then
            items.put(v, i)
         else
            add(v, k)
         end
      end

   fast_put (v: V_; k: K_) is
      local
         i: INTEGER
      do
         i := keys.fast_first_index_of(k)
         if keys.valid_index(i) then
            items.put(v, i)
         else
            add(v, k)
         end
      end

   add (v: V_; k: K_) is
      do
         keys.add_last(k)
         items.add_last(v)
      end

feature {ANY} -- Removing:
   remove (k: K_) is
      local
         i: INTEGER
      do
         i := keys.first_index_of(k)
         if keys.valid_index(i) then
            keys.remove(i)
            items.remove(i)
         end
      end

   fast_remove (k: K_) is
      local
         i: INTEGER
      do
         i := keys.fast_first_index_of(k)
         if keys.valid_index(i) then
            keys.remove(i)
            items.remove(i)
         end
      end

   clear_count is
      do
         keys.clear_count
         items.clear_count
      end

   clear_count_and_capacity is
      do
         keys.clear_count_and_capacity
         items.clear_count_and_capacity
      end

   capacity: INTEGER is
      do
         Result := keys.capacity -- see also invariant
      end

   count: INTEGER is
      do
         Result := keys.count -- see also invariant
      end

feature {ANY} -- To provide iterating facilities:
   set_item (v: V_; index: INTEGER) is
      do
         items.put(v, index - 1)
      end

   item (index: INTEGER): V_ is
      do
         Result := items.item(index - 1)
      end

   key (index: INTEGER): K_ is
      do
         Result := keys.item(index - 1)
      end

   new_iterator_on_items: ITERATOR[V_] is
      do
         Result := items.new_iterator
      end

   new_iterator_on_keys: ITERATOR[K_] is
      do
         Result := keys.new_iterator
      end

feature {ANY} -- Other features:
   internal_key (k: K_): K_ is
      do
         Result := keys.item(keys.first_index_of(k))
      end

feature {}
   make is
      do
         create keys.make(0)
         create items.make(0)
      end

   with_capacity (needed_capacity: like capacity) is
      require
         needed_capacity >= 0
      do
         create keys.with_capacity(needed_capacity)
         create items.with_capacity(needed_capacity)
      ensure
         capacity >= needed_capacity
         is_empty
      end

   keys: FAST_ARRAY[K_]
   items: FAST_ARRAY[V_]

invariant
   keys.count = items.count
   keys.capacity = items.capacity

end -- class ARRAY_DICTIONARY
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
