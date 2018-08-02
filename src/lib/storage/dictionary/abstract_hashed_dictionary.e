-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_HASHED_DICTIONARY[V_, K_]
   --
   -- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
   --
   -- Efficient implementation of DICTIONARY using `hash_code' on keys.
   --

inherit
   SIMPLE_DICTIONARY[V_, K_]
      redefine key_map_in, item_map_in, copy, manifest_make, default_create
      end

insert
   HASH_TABLE_SIZE
      undefine out_in_tagged_out_memory
      redefine default_create
      end

feature {HASHED_DICTIONARY}
   buckets: NATIVE_ARRAY[HASHED_DICTIONARY_NODE[V_, K_]]
         -- The `buckets' storage area is the primary hash table of `capacity' elements. To search some key,
         -- the first access is done in `buckets' using the remainder of the division of the key `hash_code'
         -- by `capacity'. In order to try to avoid clashes, `capacity' is always a prime number (selected
         -- using HASHED_CAPACITY).

feature {}
   hash_code (k: K_): INTEGER
      require
         k /= Void
      deferred
      end

   buckets_item (a_buckets: like buckets; idx: INTEGER): like cache_node
      require
         idx.in_range(0, capacity - 1)
      do
         Result := a_buckets.item(idx)
      end

feature {ANY}
   Default_size: INTEGER 53
         -- Default size for the storage area in number of items.

   capacity: INTEGER
         -- Of the `buckets' storage area. Note: this not the accurate capacity value, but it does not hurt.

   count: INTEGER

   has (k: K_): BOOLEAN
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(k) #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node = Void or else key_safe_equal(node.key, k)
         loop
            node := node.next
         end
         Result := node /= Void
      end

   at (k: K_): V_
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(k) #\\ capacity
            node := buckets_item(buckets, idx)
         until
            key_safe_equal(node.key, k)
         loop
            node := node.next
         end
         Result := node.item
      end

   reference_at (k: K_): V_
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(k) #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node = Void or else key_safe_equal(node.key, k)
         loop
            node := node.next
         end
         if node /= Void then
            Result := node.item
         end
      end

   fast_has (k: K_): BOOLEAN
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(k) #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node = Void or else node.key = k
         loop
            node := node.next
         end
         Result := node /= Void
      end

   fast_at (k: K_): V_
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(k) #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node.key = k
         loop
            node := node.next
         end
         Result := node.item
      end

   fast_reference_at (k: K_): V_
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(k) #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node = Void or else node.key = k
         loop
            node := node.next
         end
         if node /= Void then
            Result := node.item
         end
      end

feature {ANY}
   put (v: V_; k: K_)
      local
         h, idx: INTEGER; node: like cache_node
      do
         from
            h := hash_code(k)
            idx := h #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node = Void or else key_safe_equal(node.key, k)
         loop
            node := node.next
         end
         if node = Void then
            if should_increase_capacity(capacity, count) then
               increase_capacity
               idx := h #\\ capacity
            end
            node := new_node(v, k, buckets_item(buckets, idx))
            buckets.put(node, idx)
            count := count + 1
            cache_user := -1
            debug
               nodes_list.add_last(node)
            end
         else
            node.set_item(v)
         end
         next_generation
      end

   fast_put (v: V_; k: K_)
      local
         h, idx: INTEGER; node: like cache_node
      do
         from
            h := hash_code(k)
            idx := h #\\ capacity
            node := buckets_item(buckets, idx)
         until
            node = Void or else node.key = k
         loop
            node := node.next
         end
         if node = Void then
            if should_increase_capacity(capacity, count) then
               increase_capacity
               idx := h #\\ capacity
            end
            node := new_node(v, k, buckets_item(buckets, idx))
            buckets.put(node, idx)
            count := count + 1
            cache_user := -1
            debug
               nodes_list.add_last(node)
            end
         else
            node.set_item(v)
         end
         next_generation
      end

   add (v: V_; k: K_)
      local
         idx: INTEGER; node: like cache_node
      do
         cache_user := -1
         if should_increase_capacity(capacity, count) then
            increase_capacity
         end
         idx := hash_code(k) #\\ capacity
         node := new_node(v, k, buckets_item(buckets, idx))
         buckets.put(node, idx)
         count := count + 1
         debug
            nodes_list.add_last(node)
         end
         next_generation
      end

   remove (k: K_)
      local
         h, idx: INTEGER; node, previous_node: like cache_node
      do
         cache_user := -1
         h := hash_code(k)
         idx := h #\\ capacity
         node := buckets_item(buckets, idx)
         if node /= Void then
            if key_safe_equal(node.key, k) then
               debug
                  nodes_list.remove(nodes_list.fast_first_index_of(node))
               end
               count := count - 1
               node := dispose_node(node)
               buckets.put(node, idx)
            else
               from
                  previous_node := node
                  node := node.next
               until
                  node = Void or else key_safe_equal(node.key, k)
               loop
                  previous_node := node
                  node := node.next
               end
               if node /= Void then
                  debug
                     nodes_list.remove(nodes_list.fast_first_index_of(node))
                  end
                  count := count - 1
                  previous_node.set_next(dispose_node(node))
               end
            end
         end
         next_generation
      end

   fast_remove (k: K_)
      local
         h, idx: INTEGER; node, previous_node: like cache_node
      do
         cache_user := -1
         h := hash_code(k)
         idx := h #\\ capacity
         node := buckets_item(buckets, idx)
         if node /= Void then
            if node.key = k then
               debug
                  nodes_list.remove(nodes_list.fast_first_index_of(node))
               end
               count := count - 1
               node := dispose_node(node)
               buckets.put(node, idx)
            else
               from
                  previous_node := node
                  node := node.next
               until
                  node = Void or else node.key = k
               loop
                  previous_node := node
                  node := node.next
               end
               if node /= Void then
                  debug
                     nodes_list.remove(nodes_list.fast_first_index_of(node))
                  end
                  count := count - 1
                  previous_node.set_next(dispose_node(node))
               end
            end
         end
         next_generation
      end

   clear_count, clear_count_and_capacity
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
            node := buckets_item(buckets, i)
            buckets.put(Void, i)
            from
            until
               node = Void
            loop
               node := dispose_node(node)
            end
            i := i - 1
         end
         debug
            nodes_list.clear_count
         end
         next_generation
      ensure then
         capacity = old capacity
      end

   set_item (v: V_; index: INTEGER)
      do
         set_cache_user(index)
         cache_node.set_item(v)
         next_generation
      end

   item (index: INTEGER): V_
      do
         set_cache_user(index)
         Result := cache_node.item
      end

   key (index: INTEGER): K_
      do
         set_cache_user(index)
         Result := cache_node.key
      end

   new_iterator_on_keys: ITERATOR[K_]
      do
         create {ITERATOR_ON_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]]
      do
         create {ITERATOR_ON_DICTIONARY[V_, K_]} Result.make(Current)
      end

   key_map_in (buffer: COLLECTION[K_])
      local
         node: like cache_node; i, idx: INTEGER
      do
         from
            i := count
            node := buckets_item(buckets, idx)
         until
            i <= 0
         loop
            from
            until
               node /= Void
            loop
               idx := idx + 1
               check
                  idx < capacity
               end
               node := buckets_item(buckets, idx)
            end
            buffer.add_last(node.key)
            node := node.next
            i := i - 1
         end
      end

   item_map_in (buffer: COLLECTION[V_])
      local
         node: like cache_node; i, idx: INTEGER
      do
         from
            i := count
            node := buckets_item(buckets, idx)
         until
            i <= 0
         loop
            from
            until
               node /= Void
            loop
               idx := idx + 1
               check
                  idx < capacity
               end
               node := buckets_item(buckets, idx)
            end
            buffer.add_last(node.item)
            node := node.next
            i := i - 1
         end
      end

   copy (other: like Current)
      local
         i: INTEGER
      do
         debug
            if nodes_list = Void then
               create nodes_list.with_capacity(capacity)
            end
         end
         clear_count
         from
            if capacity < other.count then
               with_capacity(other.count + 1)
            elseif capacity = 0 then
               make
            end
            i := 1
         until
            i > other.count
         loop
            put(other.item(i), other.key(i))
            i := i + 1
         end
      end

   internal_key (k: K_): K_
      local
         node: like cache_node
      do
         from
            node := buckets_item(buckets, hash_code(k) #\\ capacity)
            Result := node.key
         until
            key_safe_equal(Result, k)
         loop
            node := node.next
            Result := node.key
         end
      end

feature {} -- Implement manifest generic creation:
   manifest_make (needed_capacity: INTEGER)
         -- Manifest creation of a HASHED_DICTIONARY.
      do
         with_capacity(needed_capacity)
      end

feature {}
   increase_capacity
         -- There are not enough free slots: the dictionary must grow.
      require
         should_increase_capacity(capacity, count)
      local
         i, idx, new_capacity: INTEGER; old_buckets: like buckets; node1, node2: like cache_node
      do
         from
            new_capacity := prime_capacity(capacity + 1)
            old_buckets := buckets
            buckets := buckets.calloc(new_capacity)
            i := capacity - 1
            capacity := new_capacity
         until
            i < 0
         loop
            from
               node1 := buckets_item(old_buckets, i)
            until
               node1 = Void
            loop
               node2 := node1.next
               idx := hash_code(node1.key) #\\ capacity
               node1.set_next(buckets_item(buckets, idx))
               buckets.put(node1, idx)
               node1 := node2
            end
            i := i - 1
         end
         cache_user := -1
      ensure
         count = old count
         capacity > old capacity
      end

   set_cache_user (index: INTEGER)
         -- Set the internal memory cache (`cache_user', `cache_node' and `cache_buckets') to the appropriate
         -- valid value.
      require
         valid_index(index)
      do
         if index = cache_user + 1 then
            from
               cache_user := index
               cache_node := cache_node.next
            invariant
               cache_buckets.in_range(0, capacity - 1)
            until
               cache_node /= Void
            loop
               cache_buckets := cache_buckets + 1
               cache_node := buckets_item(buckets, cache_buckets)
            end
         elseif index = cache_user then
         elseif index = 1 then
            from
               cache_user := 1
               cache_buckets := 0
               cache_node := buckets_item(buckets, cache_buckets)
            invariant
               cache_buckets.in_range(0, capacity - 1)
            until
               cache_node /= Void
            loop
               cache_buckets := cache_buckets + 1
               cache_node := buckets_item(buckets, cache_buckets)
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

   cache_user: INTEGER
         -- The last user's external index in range [1 .. `count'] (see `item' and `valid_index' for example)
         -- may be saved in `cache_user' otherwise -1 to indicate that the cache is not active. When the cache
         -- is active, the corresponding index in `buckets' is saved in `cache_buckets' and the corresponding
         -- node in `cache_node'.

   cache_node: HASHED_DICTIONARY_NODE[V_, K_]
         -- Meaningful only when `cache_user' is not -1.

   cache_buckets: INTEGER
         -- Meaningful only when `cache_user' is not -1.

   free_nodes: WEAK_REFERENCE[HASHED_DICTIONARY_NODE[V_, K_]]
         -- If any, they are ready to be recycled.

   nodes_list: FAST_ARRAY[HASHED_DICTIONARY_NODE[V_, K_]]
         -- Only in debug: the nodes list, in insertion order. Useful with sedb when browsing the nodes

   common_free_nodes: DICTIONARY[WEAK_REFERENCE[ANY_HASHED_DICTIONARY_NODE], STRING]
      local
         fn: WEAK_REFERENCE[HASHED_DICTIONARY_NODE[WEAK_REFERENCE[ANY_HASHED_DICTIONARY_NODE], STRING]]
      once
         create fn.set_item(Void)
         create {HASHED_DICTIONARY[WEAK_REFERENCE[ANY_HASHED_DICTIONARY_NODE], STRING]} Result.special_common_dictionary(fn)
         Result.add(fn, Result.generating_type)
      end

   dispose_node (node: like cache_node): like cache_node
         -- Add `node' in the `free_nodes' list.
      require
         node /= Void
      do
         Result := node.next
         node.set_next(free_nodes.item)
         free_nodes.set_item(node)
      ensure
         Result = old node.next
      end

   new_node (v: V_; k: K_; next: like cache_node): like cache_node
         -- Recycle from `free_nodes' or create a new one.
      do
         Result := free_nodes.item
         if Result = Void then
            create Result.make(v, k, next)
         else
            free_nodes.set_item(Result.next)
            Result.make(v, k, next)
         end
      end

   create_with_capacity (new_capacity: INTEGER)
      require
         new_capacity > 0
      do
         free_nodes ::= common_free_nodes.fast_reference_at(generating_type)
         if free_nodes = Void then
            create free_nodes.set_item(Void)
            common_free_nodes.add(free_nodes, generating_type)
         end
         buckets := buckets.calloc(new_capacity)
         capacity := new_capacity
         cache_user := -1
         count := 0
         debug
            create nodes_list.with_capacity(new_capacity)
         end
      end

   make, default_create
         -- Create an empty dictionary. Internal storage `capacity' of the dictionary is initialized using the
         -- `Default_size' value. Then, tuning of needed storage `capacity' is performed automatically
         -- according to usage. If you are really sure that your dictionary is always really bigger than
         -- `Default_size', you may consider to use `with_capacity' to save some execution time.
      do
         create_with_capacity(Default_size)
      ensure then
         capacity = Default_size
      end

   with_capacity (medium_size: INTEGER)
         -- May be used to save some execution time if one is sure that storage size will rapidly become
         -- really bigger than `Default_size'.  When first `remove' occurs, storage size may naturally become
         -- smaller than `medium_size'. Afterall, tuning of storage size is done automatically according to
         -- usage.
      require
         medium_size >= 0
      do
         create_with_capacity(prime_capacity(medium_size))
      ensure
         is_empty
         capacity >= medium_size
      end

invariant
   capacity > 0
   capacity >= count
   cache_user.in_range(-1, count)
   cache_user > 0 implies cache_node /= Void
   cache_user > 0 implies cache_buckets.in_range(0, capacity - 1)
   free_nodes /= Void

end -- class ABSTRACT_HASHED_DICTIONARY
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
