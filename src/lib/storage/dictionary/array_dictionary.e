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
         new_iterator_on_items, copy
      end

create {ANY}
   make, with_capacity

feature {ANY} -- Basic access:
   has (k: K_): BOOLEAN
      do
         Result := keys_storage.has(k)
      end

   at (k: K_): V_
      do
         Result := items_storage.item(keys_storage.first_index_of(k))
      end

   reference_at (k: K_): V_
      local
         i: INTEGER
      do
         i := keys_storage.first_index_of(k)
         if keys_storage.valid_index(i) then
            Result := items_storage.item(i)
         end
      end

   fast_has (k: K_): BOOLEAN
      do
         Result := keys_storage.fast_has(k)
      end

   fast_at (k: K_): V_
      do
         Result := items_storage.item(keys_storage.fast_first_index_of(k))
      end

   fast_reference_at (k: K_): V_
      local
         i: INTEGER
      do
         i := keys_storage.fast_first_index_of(k)
         if keys_storage.valid_index(i) then
            Result := items_storage.item(i)
         end
      end

feature {ANY}
   put (v: V_; k: K_)
      local
         i: INTEGER
      do
         i := keys_storage.first_index_of(k)
         if keys_storage.valid_index(i) then
            items_storage.put(v, i)
         else
            add(v, k)
         end
      end

   fast_put (v: V_; k: K_)
      local
         i: INTEGER
      do
         i := keys_storage.fast_first_index_of(k)
         if keys_storage.valid_index(i) then
            items_storage.put(v, i)
         else
            add(v, k)
         end
      end

   add (v: V_; k: K_)
      do
         keys_storage.add_last(k)
         items_storage.add_last(v)
      end

feature {ANY} -- Removing:
   remove (k: K_)
      local
         i: INTEGER
      do
         i := keys_storage.first_index_of(k)
         if keys_storage.valid_index(i) then
            keys_storage.remove(i)
            items_storage.remove(i)
         end
      end

   fast_remove (k: K_)
      local
         i: INTEGER
      do
         i := keys_storage.fast_first_index_of(k)
         if keys_storage.valid_index(i) then
            keys_storage.remove(i)
            items_storage.remove(i)
         end
      end

   clear_count
      do
         keys_storage.clear_count
         items_storage.clear_count
      end

   clear_count_and_capacity
      do
         keys_storage.clear_count_and_capacity
         items_storage.clear_count_and_capacity
      end

   capacity: INTEGER
      do
         Result := keys_storage.capacity -- see also invariant
      end

   count: INTEGER
      do
         Result := keys_storage.count -- see also invariant
      end

feature {ANY} -- To provide iterating facilities:
   set_item (v: V_; index: INTEGER)
      do
         items_storage.put(v, index - 1)
      end

   item (index: INTEGER): V_
      do
         Result := items_storage.item(index - 1)
      end

   key (index: INTEGER): K_
      do
         Result := keys_storage.item(index - 1)
      end

   new_iterator_on_items: ITERATOR[V_]
      do
         Result := items_storage.new_iterator
      end

   new_iterator_on_keys: ITERATOR[K_]
      do
         Result := keys_storage.new_iterator
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]]
      do
         not_yet_implemented
      end

feature {ANY} -- Other features:
   internal_key (k: K_): K_
      do
         Result := keys_storage.item(keys_storage.first_index_of(k))
      end

   copy (other: like Current)
         -- Reinitialize by copying all associations of `other'.
      do
         if keys_storage /= Void then
            keys_storage.copy(other.keys_storage)
            items_storage.copy(other.items_storage)
         else
            keys_storage := other.keys_storage.twin
            items_storage := other.items_storage.twin
         end
      end


feature {}
   make
      do
         create keys_storage.make(0)
         create items_storage.make(0)
      end

   with_capacity (needed_capacity: like capacity)
      require
         needed_capacity >= 0
      do
         create keys_storage.with_capacity(needed_capacity)
         create items_storage.with_capacity(needed_capacity)
      ensure
         capacity >= needed_capacity
         is_empty
      end

feature {ARRAY_DICTIONARY}
   keys_storage: FAST_ARRAY[K_]
   items_storage: FAST_ARRAY[V_]

invariant
   keys_storage.count = items_storage.count
   keys_storage.capacity = items_storage.capacity

end -- class ARRAY_DICTIONARY
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
