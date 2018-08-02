-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class HASHED_BIJECTIVE_DICTIONARY[V_ -> HASHABLE, K_ -> HASHABLE]

inherit
   BIJECTIVE_DICTIONARY[V_, K_]

insert
   HASH_TABLE_SIZE
      undefine
         out_in_tagged_out_memory
      end

create {ANY}
   make, with_capacity, manifest_creation

feature {ANY}
   count: INTEGER

   has (k: K_): BOOLEAN
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
         until
            node = Void or else key_safe_equal(node.key, k)
         loop
            node := node.next_key
         end
         Result := node /= Void
      end

   at (k: K_): V_
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
         until
            key_safe_equal(node.key, k)
         loop
            node := node.next_key
         end
         Result := node.val
      end

   reference_at (k: K_): V_
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
         until
            node = Void or else key_safe_equal(node.key, k)
         loop
            node := node.next_key
         end
         if node /= Void then
            Result := node.val
         end
      end

   fast_has (k: K_): BOOLEAN
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
         until
            node = Void or else node.key = k
         loop
            node := node.next_key
         end
         Result := node /= Void
      end

   fast_at (k: K_): V_
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
         until
            node.key = k
         loop
            node := node.next_key
         end
         Result := node.val
      end

   fast_reference_at (k: K_): V_
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
         until
            node = Void or else node.key = k
         loop
            node := node.next_key
         end
         if node /= Void then
            Result := node.val
         end
      end

   has_value (v: V_): BOOLEAN
      local
         node: like cache_node
      do
         from
            node := val_buckets.item(v.hash_code #\\ capacity)
         until
            node = Void or else val_safe_equal(node.val, v)
         loop
            node := node.next_val
         end
         Result := node /= Void
      end

   key_at (v: V_): K_
      local
         node: like cache_node
      do
         from
            node := val_buckets.item(v.hash_code #\\ capacity)
         until
            val_safe_equal(node.val, v)
         loop
            node := node.next_val
         end
         Result := node.key
      end

   fast_has_value (v: V_): BOOLEAN
      local
         node: like cache_node
      do
         from
            node := val_buckets.item(v.hash_code #\\ capacity)
         until
            node = Void or else node.val = v
         loop
            node := node.next_val
         end
         Result := node /= Void
      end

   fast_key_at (v: V_): K_
      local
         node: like cache_node
      do
         from
            node := val_buckets.item(v.hash_code #\\ capacity)
         until
            node.val = v
         loop
            node := node.next_val
         end
         Result := node.key
      end

   put (v: V_; k: K_)
      local
         key_idx, val_idx: INTEGER; node: like cache_node
      do
         from
            key_idx := k.hash_code #\\ capacity
            node := key_buckets.item(key_idx)
         until
            node = Void or else key_safe_equal(node.key, k)
         loop
            node := node.next_key
         end
         if node = Void then
            if should_increase_capacity(capacity, count) then
               increase_capacity
               key_idx := k.hash_code #\\ capacity
            end
            val_idx := v.hash_code #\\ capacity
            node := new_node(v, val_buckets.item(val_idx), k, key_buckets.item(key_idx))
            key_buckets.put(node, key_idx)
            val_buckets.put(node, val_idx)
            count := count + 1
            cache_user := -1
         else
            remove(k)
            add(v, k)
         end
         next_generation
      end

   add (v: V_; k: K_)
      local
         key_idx, val_idx: INTEGER; node: like cache_node
      do
         cache_user := -1
         if should_increase_capacity(capacity, count) then
            increase_capacity
         end
         key_idx := k.hash_code #\\ capacity
         val_idx := v.hash_code #\\ capacity
         node := new_node(v, val_buckets.item(val_idx), k, key_buckets.item(key_idx))
         key_buckets.put(node, key_idx)
         val_buckets.put(node, val_idx)
         -- Finally:
         count := count + 1
         next_generation
      end

   remove (k: K_)
      local
         key_idx: INTEGER; node, previous_node: like cache_node
      do
         cache_user := -1
         key_idx := k.hash_code #\\ capacity
         node := key_buckets.item(key_idx)
         if node /= Void then
            if key_safe_equal(node.key, k) then
               val_buckets_remove(node)
               count := count - 1
               node := dispose_node(node)
               key_buckets.put(node, key_idx)
            else
               from
                  previous_node := node
                  node := node.next_key
               until
                  node = Void or else key_safe_equal(node.key, k)
               loop
                  previous_node := node
                  node := node.next_key
               end
               if node /= Void then
                  val_buckets_remove(node)
                  count := count - 1
                  previous_node.set_next_key(dispose_node(node))
               end
            end
         end
         next_generation
      end

   clear_count, clear_count_and_capacity
      require
         capacity > 0
      local
         i: INTEGER; node: like cache_node
      do
         cache_user := -1
         count := 0
         from
            i := capacity - 1
         until
            i < 0
         loop
            node := key_buckets.item(i)
            key_buckets.put(Void, i)
            val_buckets.put(Void, i)
            from
            until
               node = Void
            loop
               node := dispose_node(node)
            end
            i := i - 1
         end
         next_generation
      ensure then
         capacity = old capacity
      end

   item (index: INTEGER): V_
      do
         set_cache_user(index)
         Result := cache_node.val
      end

   key (index: INTEGER): K_
      do
         set_cache_user(index)
         Result := cache_node.key
      end

   Default_size: INTEGER 193
         -- Default size for the storage area in number of items.

   internal_key (k: K_): K_
         -- Retrieve the internal key object which correspond to the existing
         -- entry `k' (the one memorized into the `Current' dictionary).
      local
         node: like cache_node
      do
         from
            node := key_buckets.item(k.hash_code #\\ capacity)
            Result := node.key
         until
            key_safe_equal(Result, k)
         loop
            node := node.next_key
            Result := node.key
         end
      end

feature {HASHED_BIJECTIVE_DICTIONARY}
   key_buckets: NATIVE_ARRAY[like cache_node]
         -- The `key_buckets' storage area is the primary hash table of `capacity' elements. To search some
         -- key, the first access is done in `key_buckets' using the remainder of the division of the key
         -- `hash_code' by `capacity'. In order to try to avoid clashes, `capacity' is always a prime
         -- number (selected using HASHED_CAPACITY).

   val_buckets: NATIVE_ARRAY[like cache_node]
         -- The `val_buckets' storage area is the primary hash table of `capacity' elements. To search some
         -- value, the first access is done in `val_buckets' using the remainder of the division of the value
         -- `hash_code' by `capacity'. In order to try to avoid clashes, `capacity' is always a prime
         -- number (selected using HASHED_CAPACITY).

feature {ANY}
   capacity: INTEGER
         -- Approximation of the actual internal storage `capacity'. The `capacity' will grow automatically
         -- when needed (i.e. `capacity' is not a limit for the number of values stored). Also note that
         -- the `capacity' value may not be always accurate depending of the implementation (anyway, this
         -- `capacity' value is at least equals to `count').

   copy (other: like Current)
      local
         i: INTEGER
      do
         if capacity = 0 then
            -- It is a brand new one probably created by `twin':
            make
         else
            clear_count
         end
         from
            i := 1
         until
            i > other.count
         loop
            add(other.item(i), other.key(i))
            i := i + 1
         end
         next_generation
      end

feature {}
   cache_user: INTEGER
         -- The last user's external index in range [1 .. `count'] (see `item' and `valid_index' for example)
         -- may be saved in `cache_user' otherwise -1 to indicate that the cache is not active. When the
         -- cache is active, the corresponding index in `key_buckets' is save in `cache_buckets' and the
         -- corresponding node in `cache_node'.

   cache_node: HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]
         -- Meaningful only when `cache_user' is not -1.

   cache_buckets: INTEGER
         -- Meaningful only when `cache_user' is not -1.

   free_nodes: WEAK_REFERENCE[HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]]
         -- If any, they are ready to be recycled.

   set_cache_user (index: INTEGER)
         -- Set the internal memory cache (`cache_user', `cache_node' and `cache_buckets') to the appropriate
         -- valid value.
      require
         valid_index(index)
      do
         if index = cache_user + 1 then
            from
               cache_user := index
               cache_node := cache_node.next_key
            until
               cache_node /= Void
            loop
               cache_buckets := cache_buckets + 1
               cache_node := key_buckets.item(cache_buckets)
            end
         elseif index = cache_user then
         elseif index = 1 then
            from
               cache_user := 1
               cache_buckets := 0
               cache_node := key_buckets.item(cache_buckets)
            until
               cache_node /= Void
            loop
               cache_buckets := cache_buckets + 1
               cache_node := key_buckets.item(cache_buckets)
            end
         else
            from
               set_cache_user(1)
            until
               cache_user = index
            loop
               set_cache_user(cache_user + 1)
            end
         end
      ensure
         cache_user = index
         cache_buckets.in_range(0, capacity - 1)
         cache_node /= Void
      end

   make
         -- Create an empty dictionary. Internal storage `capacity' of the dictionary is initialized using
         -- the `Default_size' value. Then, tuning of needed storage `capacity' is performed automatically
         -- according to usage. If you are really sure that your dictionary is always really bigger than
         -- `Default_size', you may consider to use `with_capacity' to save some execution time.
      do
         basic_make(Default_size)
      ensure
         capacity = Default_size
      end

   with_capacity (medium_size: INTEGER)
         -- May be used to save some execution time if one is sure that storage size will rapidly become
         -- really bigger than `Default_size'.
         -- When first `remove' occurs, storage size may naturally become smaller than `medium_size'.
         -- Afterall, tuning of storage size is done automatically according to usage.
      require
         medium_size > 0
      local
         new_capacity: INTEGER
      do
         new_capacity := prime_capacity(medium_size)
         basic_make(new_capacity)
      ensure
         is_empty
         capacity >= medium_size
      end

   basic_make (new_capacity: like capacity)
      require
         new_capacity = prime_number_ceiling(new_capacity)
      do
         free_nodes ::= common_free_nodes.fast_reference_at(generating_type)
         if free_nodes = Void then
            create free_nodes.set_item(Void)
            common_free_nodes.add(free_nodes, generating_type)
         end
         key_buckets := key_buckets.calloc(new_capacity)
         val_buckets := val_buckets.calloc(new_capacity)
         capacity := new_capacity
         cache_user := -1
         count := 0
      ensure
         is_empty
         capacity = new_capacity
      end

   increase_capacity
         -- There is no more free slots: the dictionary must grow.
      require
         should_increase_capacity(capacity, count)
      local
         i, idx, new_capacity: INTEGER; old_key_buckets: like key_buckets; node1, node2: like cache_node
         old_val_buckets: like val_buckets
      do
         new_capacity := prime_capacity(capacity + 1)
         -- Rebuilding `key_buckets':
         from
            old_key_buckets := key_buckets
            key_buckets := key_buckets.calloc(new_capacity)
            i := capacity - 1
         until
            i < 0
         loop
            from
               node1 := old_key_buckets.item(i)
            until
               node1 = Void
            loop
               node2 := node1.next_key
               idx := node1.key.hash_code #\\ new_capacity
               node1.set_next_key(key_buckets.item(idx))
               key_buckets.put(node1, idx)
               node1 := node2
            end
            i := i - 1
         end
         -- Rebuilding `val_buckets':
         from
            old_val_buckets := val_buckets
            val_buckets := val_buckets.calloc(new_capacity)
            i := capacity - 1
         until
            i < 0
         loop
            from
               node1 := old_val_buckets.item(i)
            until
               node1 = Void
            loop
               node2 := node1.next_val
               idx := node1.val.hash_code #\\ new_capacity
               node1.set_next_val(val_buckets.item(idx))
               val_buckets.put(node1, idx)
               node1 := node2
            end
            i := i - 1
         end
         -- Finally:
         capacity := new_capacity
         cache_user := -1
      ensure
         count = old count
         capacity > old capacity
      end

   common_free_nodes: HASHED_DICTIONARY[WEAK_REFERENCE[ANY_HASHED_BIJECTIVE_DICTIONARY_NODE], STRING]
      once
         create Result.make
      end

   dispose_node (node: HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]): HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]
         -- Add `node' in the `free_nodes' list.
      require
         node /= Void
      do
         Result := node.next_key
         node.set_next_key(free_nodes.item)
         free_nodes.set_item(node)
      ensure
         Result = old node.next_key
      end

   new_node (v: V_; nv: HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]; k: K_; nk: HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]): HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]
         -- Recycle from `free_nodes' or create a new one.
      do
         Result := free_nodes.item
         if Result = Void then
            create Result.make(v, nv, k, nk)
         else
            free_nodes.set_item(Result.next_key)
            Result.make(v, nv, k, nk)
         end
      ensure
         Result.val = v
         Result.next_val = nv
         Result.key = k
         Result.next_key = nk
      end

   val_buckets_remove (node: HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_])
      require
         node /= Void
      local
         val_idx: INTEGER; other_node: HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]
      do
         --|*** like node -- *** DEBUG
         val_idx := node.val.hash_code #\\ capacity
         other_node := val_buckets.item(val_idx)
         if other_node = node then
            -- Head removal:
            val_buckets.put(node.next_val, val_idx)
         else
            from
            until
               other_node.next_val = node
            loop
               other_node := other_node.next_val
            end
            other_node.set_next_val(node.next_val)
         end
      end

feature {} -- Implement manifest generic creation:
   manifest_make (needed_capacity: INTEGER)
         -- Manifest creation of a dictionary.
      do
         with_capacity(needed_capacity.max(Default_size))
      end

invariant
   capacity >= count
   free_nodes /= Void

end -- class HASHED_BIJECTIVE_DICTIONARY
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
