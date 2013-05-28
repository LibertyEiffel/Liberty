-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_PYTHON_DICTIONARY[V_, K_]
   --
   -- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
   --
   -- Efficient implementation of DICTIONARY using `hash_code' on keys, using Python's algorithm.
   --

inherit
   SIMPLE_DICTIONARY[V_, K_]
      redefine key_map_in, item_map_in, copy, manifest_make,
         new_iterator_on_items
      end

feature {ANY}
   Default_size: INTEGER is 16

   capacity: INTEGER
         -- Of the `storage' area. A power of two.

   count: INTEGER

   has (k: K_): BOOLEAN is
      local
         index: INTEGER
      do
         index := index_of(k)
         Result := index >= 0
      end

   at (k: K_): V_ is
      do
         Result := storage.item(index_of(k)).item
      end

   reference_at (k: K_): V_ is
      local
         index: INTEGER
      do
         index := index_of(k)
         if storage.item(index).is_set then
            Result := storage.item(index).item
         end
      end

   fast_has (k: K_): BOOLEAN is
      local
         index: INTEGER
      do
         index := fast_index_of(k)
         Result := index >= 0
      end

   fast_at (k: K_): V_ is
      do
         Result := storage.item(fast_index_of(k)).item
      end

   fast_reference_at (k: K_): V_ is
      local
         index: INTEGER
      do
         index := fast_index_of(k)
         if storage.item(index).is_set then
            Result := storage.item(index).item
         end
      end

feature {ANY}
   put (v: V_; k: K_) is
      local
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
         index: INTEGER
      do
         index := index_of(k)
         if index < 0 then
            if count // 3 >= capacity // 4 and then (capacity #* 2) > 0 then
               ensure_capacity(capacity * 2)
               index := index_of(k)
            end
            create item_.make(v, k)
            storage.put(item_, -index - 1)
            count := count + 1
            next_generation
         else
            item_ := storage.item(index)
            item_.set(v)
            storage.put(item_, index)
         end
      end

   fast_put (v: V_; k: K_) is
      local
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
         index: INTEGER
      do
         index := fast_index_of(k)
         if index < 0 then
            if count // 3 >= capacity // 4 and then (capacity #* 2) > 0 then
               ensure_capacity(capacity * 2)
               index := fast_index_of(k)
            end
            create item_.make(v, k)
            storage.put(item_, -index - 1)
            count := count + 1
            next_generation
         else
            item_ := storage.item(index)
            item_.set(v)
            storage.put(item_, index)
         end
      end

   add (v: V_; k: K_) is
      local
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
      do
         if count > capacity * 3 // 4 and then (capacity #* 2) > 0 then
            ensure_capacity(capacity * 2)
         end
         create item_.make(v, k)
         storage.put(item_, -index_of(k) - 1)
         count := count + 1
         next_generation
      end

   remove (k: K_) is
      local
         i, index: INTEGER
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
      do
         index := index_of(k)
         if index >= 0 then
            storage.put(item_, index)
            count := count - 1
            from
               i := 0
            until
               i = capacity
            loop
               if storage.item(i).is_set then
                  index := index_of(storage.item(i).key)
                  if index < 0 then
                     storage.put(storage.item(i), -index - 1)
                     storage.put(item_, i)
                     i := 0
                  end
               end
               i := i + 1
            end
            next_generation
         end
      end

   fast_remove (k: K_) is
      local
         i, index: INTEGER
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
      do
         index := fast_index_of(k)
         if index >= 0 then
            storage.put(item_, index)
            count := count - 1
            from
               i := 0
            until
               i = capacity
            loop
               if storage.item(i).is_set then
                  index := fast_index_of(storage.item(i).key)
                  if index < 0 then
                     storage.put(storage.item(i), -index - 1)
                     storage.put(item_, i)
                     i := 0
                  end
               end
               i := i + 1
            end
            next_generation
         end
      end

   clear_count, clear_count_and_capacity is
      local
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
      do
         storage.set_all_with(item_, capacity - 1)
         count := 0
         next_generation
      ensure then
         capacity = old capacity
      end

   set_item (v: V_; index: INTEGER) is
      local
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
         i: INTEGER
      do
         i := internal_index(index)
         item_ := storage.item(i)
         item_.set(v)
         storage.put(item_, i)
         next_generation
      end

   item (index: INTEGER): V_ is
      do
         Result := storage.item(internal_index(index)).item
      end

   key (index: INTEGER): K_ is
      do
         Result := storage.item(internal_index(index)).key
      end

   new_iterator_on_keys: ITERATOR[K_] is
      do
         create {ITERATOR_ON_PYTHON_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
      end

   new_iterator_on_items: ITERATOR[V_] is
      do
         create {ITERATOR_ON_PYTHON_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]] is
      do
         create {ITERATOR_ON_PYTHON_DICTIONARY[V_, K_]} Result.make(Current)
      end

   key_map_in (buffer: COLLECTION[K_]) is
      local
         i: INTEGER
      do
         from
            i := next_internal_index(-1)
         until
            not valid_internal_index(i)
         loop
            buffer.add_last(storage.item(i).key)
            i := next_internal_index(i)
         end
      end

   item_map_in (buffer: COLLECTION[V_]) is
      local
         i: INTEGER
      do
         from
            i := next_internal_index(-1)
         until
            not valid_internal_index(i)
         loop
            buffer.add_last(storage.item(i).item)
            i := next_internal_index(i)
         end
      end

   copy (other: like Current) is
      local
         i: INTEGER
      do
         clear_count
         ensure_capacity(other.capacity)
         from
            i := other.next_internal_index(-1)
         until
            not other.valid_internal_index(i)
         loop
            add(other.storage.item(i).item, other.storage.item(i).key)
            i := other.next_internal_index(i)
         end
      end

   internal_key (k: K_): K_ is
      do
         Result := storage.item(index_of(k)).key
      end

feature {ABSTRACT_PYTHON_DICTIONARY}
   storage: NATIVE_ARRAY[PYTHON_DICTIONARY_NODE[V_, K_]]

   ensure_capacity (new_capacity: INTEGER) is
      require
         -- `new_capacity' is a power of 2
      local
         item_: PYTHON_DICTIONARY_NODE[V_, K_]
         old_storage: like storage
         i, old_capacity: INTEGER
      do
         if capacity = 0 then
            if new_capacity > 0 then
               storage := storage.calloc(new_capacity)
               capacity := new_capacity
               next_generation
            end
         elseif capacity < new_capacity then
            old_storage := storage
            old_capacity := capacity
            storage := old_storage.calloc(new_capacity)
            capacity := new_capacity
            from
               i := 0
            until
               i = old_capacity
            loop
               item_ := old_storage.item(i)
               if item_.is_set then
                  storage.put(item_, -index_of(item_.key) - 1)
               end
               i := i + 1
            end
            next_generation
         end
      ensure
         capacity = (old capacity).max(new_capacity)
      end

feature {ANY}
   valid_internal_index (index: INTEGER): BOOLEAN is
      do
         Result := index.in_range(0, capacity - 1) and then storage.item(index).is_set
      end

   next_internal_index (index: INTEGER): INTEGER is
      require
         start_or_ongoing_iteration: index = -1 or else valid_internal_index(index)
      do
         from
            Result := index #+ {INTEGER_32 1}
         invariant
            Result.in_range(0, capacity)
         variant
            capacity - Result
         until
            Result = capacity or else storage.item(Result).is_set
         loop
            Result := Result #+ {INTEGER_32 1}
         end
      ensure
         done_or_ongoing_iteration: Result = capacity or else valid_internal_index(Result)
      end

   internal_index (index: INTEGER): INTEGER is
      require
         valid_index(index)
      local
         i: INTEGER
      do
         from
            i := 0
            Result := -1
         until
            i = index
         loop
            Result := next_internal_index(Result)
            i := i + 1
         end
      end

feature {}
   hash_code (k: K_): INTEGER is
      require
         k /= Void
      deferred
      end

   index_of (k: K_): INTEGER is
      require
         k /= Void
      local
         hash, stew: INTEGER; stop: BOOLEAN
      do
         if capacity = 0 then
            Result := -1
         else
            from
               stew := hash_code(k)
               hash := stew \\ capacity
            until
               stop
            loop
               Result := hash \\ capacity
               if storage.item(Result).is_set then
                  if key_safe_equal(storage.item(Result).key, k) then
                     stop := True
                  else
                     hash := (hash |<< 2) #+ hash #+ {INTEGER_32 1} #+ stew
                     stew := stew |>> stew_shift
                  end
               else
                  Result := -Result - 1
                  stop := True
               end
            end
         end
      ensure
         positive_is_found: Result >= 0 implies (Result.in_range(0, capacity - 1) and then key_safe_equal(storage.item(Result).key, k))
         negative_is_insert_index: Result < 0 implies (not storage.item(-Result - 1).is_set)
      end

   fast_index_of (k: K_): INTEGER is
      require
         k /= Void
      local
         hash, stew: INTEGER; stop: BOOLEAN
      do
         if capacity = 0 then
            Result := -1
         else
            from
               stew := hash_code(k)
               hash := stew \\ capacity
            until
               stop
            loop
               Result := hash \\ capacity
               if storage.item(Result).is_set then
                  if storage.item(Result).key = k then
                     stop := True
                  else
                     hash := (hash |<< 2) #+ hash #+ {INTEGER_32 1} #+ stew
                     stew := stew |>> stew_shift
                  end
               else
                  Result := -Result - 1
                  stop := True
               end
            end
         end
      ensure
         positive_is_found: Result >= 0 implies (Result.in_range(0, capacity - 1) and then storage.item(Result).key = k)
         negative_is_insert_index: Result < 0 implies ((-Result - 1).in_range(0, capacity - 1) and then not storage.item(-Result - 1).is_set)
      end

   stew_shift: INTEGER_8 is 5

feature {} -- Implement manifest generic creation:
   manifest_make (needed_capacity: INTEGER) is
         -- Manifest creation of a HASHED_DICTIONARY.
      do
         with_capacity(needed_capacity)
      end

feature {} -- Creation procedures
   create_with_capacity (new_capacity: INTEGER) is
      require
         new_capacity > 0
      do
         ensure_capacity(new_capacity)
         count := 0
      end

   powered_capacity (medium_size: INTEGER): INTEGER is
      do
         if medium_size > 0 then
            from
               Result := 4
            until
               Result >= medium_size
            loop
               Result := Result * 4
            end
         end
      ensure
         Result >= medium_size
         -- Result is a power of 2
      end

   make is
         -- Create an empty dictionary. Internal storage `capacity' of the dictionary is initialized using the
         -- `Default_size' value. Then, tuning of needed storage `capacity' is performed automatically
         -- according to usage. If you are really sure that your dictionary is always really bigger than
         -- `Default_size', you may consider to use `with_capacity' to save some execution time.
      do
         create_with_capacity(Default_size)
      ensure then
         capacity = Default_size
      end

   with_capacity (medium_size: INTEGER) is
         -- May be used to save some execution time if one is sure that storage size will rapidly become
         -- really bigger than `Default_size'.  When first `remove' occurs, storage size may naturally become
         -- smaller than `medium_size'. Afterall, tuning of storage size is done automatically according to
         -- usage.
      require
         medium_size >= 0
      do
         create_with_capacity(powered_capacity(medium_size))
      ensure
         is_empty
         capacity >= medium_size
      end

invariant
   capacity >= 0
   -- `capacity' is a power of 2
   capacity > 0 implies count < capacity

end -- class ABSTRACT_PYTHON_DICTIONARY
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
