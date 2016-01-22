-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_HASHED_SET[E_]

inherit
   SET[E_]
      redefine intersection, copy, from_collection, manifest_make
      end

insert
   HASH_TABLE_SIZE
      undefine
         out_in_tagged_out_memory
      end

feature {ANY}
   Default_size: INTEGER 53
         -- Minimum size for storage in number of items.

feature {SET}
   buckets: NATIVE_ARRAY[HASHED_SET_NODE[E_]]
         -- The `buckets' storage area is the primary hash table of `capacity' elements. To search some
         -- element, the first access is done in `buckets' using the remainder of the division of the key
         -- `hash_code' by `capacity'. In order to try to avoid clashes, `capacity' is always a prime number
         -- (selected using HASHED_CAPACITY).

feature {SET} -- Internal cache handling:
   cache_user: INTEGER
         -- The last user's external index in range [1 .. `count'] (see `item' and `valid_index' for example)
         -- may be saved in `cache_user' otherwise -1 to indicate that the cache is not active. When the cache
         -- is active, the corresponding index in `buckets' is save in `cache_buckets' and the corresponding
         -- node in `cache_node'.

   cache_node: HASHED_SET_NODE[E_]
         -- Meaningful only when `cache_user' is not -1.

   cache_buckets: INTEGER
         -- Meaningful only when `cache_user' is not -1.

feature {}
   create_with_capacity (new_capacity: INTEGER)
      require
         new_capacity > 0
      do
         if free_nodes = Void then
            -- It is a brand new one:
            free_nodes ::= common_free_nodes.fast_reference_at(generating_type)
            if free_nodes = Void then
               create free_nodes.set_item(Void)
               common_free_nodes.add(free_nodes, generating_type)
            end
         end
         buckets := buckets.calloc(new_capacity)
         capacity := new_capacity
         cache_user := -1
         count := 0
      end

   make
         -- Create an empty set. Internal storage `capacity' of the set is initialized using the
         -- `Default_size' value. Then, tuning of needed storage size is done automatically according to
         -- usage. If you are really sure that your set is always really bigger than `Default_size', you may
         -- use `with_capacity' to save some execution time.
      do
         if free_nodes /= Void then
            clear_count
         else
            create_with_capacity(Default_size)
         end
         next_generation
      ensure then
         capacity = Default_size
      end

   with_capacity (medium_size: INTEGER)
         -- Create an empty set using `medium_size' as an appropriate value to help initialization of
         -- `capacity'. Thus, this feature may be used in place of `make' to save some execution time if one
         -- is sure that storage size will rapidly become really bigger than `Default_size' (if not sure,
         -- simply use `make'). Anyway, the initial `medium_size' value is just an indication and never a
         -- limit for the possible `capacity'. Keep in mind that the `capacity' tuning is done automatically
         -- according to usage.
      require
         medium_size > 0
      do
         create_with_capacity(prime_capacity(medium_size))
         next_generation
      ensure
         is_empty
         capacity >= medium_size
      end

feature {ANY}
   capacity: INTEGER
         -- Of the `buckets' storage area.

   count: INTEGER

feature {ANY}
   add (e: like item)
      local
         h, idx: INTEGER; node: like cache_node
      do
         cache_user := -1
         from
            h := hash_code(e)
            idx := h #\\ capacity
            node := buckets.item(idx)
         until
            node = Void or else safe_equal(node.item, e)
         loop
            node := node.next
         end
         if node = Void then
            if should_increase_capacity(capacity, count) then
               increase_capacity
               idx := h #\\ capacity
            end
            node := new_node(e, buckets.item(idx))
            buckets.put(node, idx)
            count := count + 1
         end
         next_generation
      end

   fast_add (e: like item)
      local
         h, idx: INTEGER; node: like cache_node
      do
         cache_user := -1
         from
            h := hash_code(e)
            idx := h #\\ capacity
            node := buckets.item(idx)
         until
            node = Void or else node.item = e
         loop
            node := node.next
         end
         if node = Void then
            if should_increase_capacity(capacity, count) then
               increase_capacity
               idx := h #\\ capacity
            end
            node := new_node(e, buckets.item(idx))
            buckets.put(node, idx)
            count := count + 1
         end
         next_generation
      end

   remove (e: like item)
      local
         h, idx: INTEGER; node, previous_node: like cache_node
      do
         cache_user := -1
         h := hash_code(e)
         idx := h #\\ capacity
         node := buckets.item(idx)
         if node /= Void then
            if safe_equal(node.item, e) then
               count := count - 1
               node := dispose_node(node)
               buckets.put(node, idx)
            else
               from
                  previous_node := node
                  node := node.next
               until
                  node = Void or else safe_equal(node.item, e)
               loop
                  previous_node := node
                  node := node.next
               end
               if node /= Void then
                  count := count - 1
                  previous_node.set_next(dispose_node(node))
               end
            end
         end
         next_generation
      end

   fast_remove (e: like item)
      local
         h, idx: INTEGER; node, previous_node: like cache_node
      do
         cache_user := -1
         h := hash_code(e)
         idx := h #\\ capacity
         node := buckets.item(idx)
         if node /= Void then
            if node.item = e then
               count := count - 1
               node := dispose_node(node)
               buckets.put(node, idx)
            else
               from
                  previous_node := node
                  node := node.next
               until
                  node = Void or else node.item = e
               loop
                  previous_node := node
                  node := node.next
               end
               if node /= Void then
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
            node := buckets.item(i)
            buckets.put(Void, i)
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

   has (e: like item): BOOLEAN
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(e) #\\ capacity
            node := buckets.item(idx)
         until
            node = Void or else safe_equal(node.item, e)
         loop
            node := node.next
         end
         Result := node /= Void
      end

   fast_has (e: like item): BOOLEAN
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(e) #\\ capacity
            node := buckets.item(idx)
         until
            node = Void or else node.item = e
         loop
            node := node.next
         end
         Result := node /= Void
      end

   reference_at (e: like item): like item
      local
         idx: INTEGER; node: like cache_node
      do
         from
            idx := hash_code(e) #\\ capacity
            node := buckets.item(idx)
         until
            node = Void or else safe_equal(node.item, e)
         loop
            node := node.next
         end
         if node /= Void then
            Result := node.item
         end
      end

   item (index: INTEGER): E_
      do
         set_cache_user(index)
         Result := cache_node.item
      end

   intersection (other: like Current)
      local
         i, c: INTEGER; node1, node2: like cache_node
      do
         cache_user := -1
         from
            i := capacity - 1
            c := count
         until
            c = 0
         loop
            from
               node1 := buckets.item(i)
            until
               node1 = Void or else other.has(node1.item)
            loop
               node1 := node1.next
               c := c - 1
               buckets.put(node1, i)
               count := count - 1
            end
            if node1 /= Void then
               from
                  node2 := node1.next
                  c := c - 1
               until
                  node2 = Void
               loop
                  if not other.has(node2.item) then
                     node1.set_next(node2.next)
                     count := count - 1
                  else
                     node1 := node2
                  end
                  node2 := node2.next
                  c := c - 1
               end
            end
            i := i - 1
         end
         next_generation
      end

   copy (other: like Current)
      local
         i: INTEGER
      do
         -- Note: this is a naive implementation because we should
         -- recycle already allocated nodes of `Current'.
         from
            if capacity = 0 then
               with_capacity(other.count + 1)
            else
               clear_count
            end
            i := 1
         until
            i > other.count
         loop
            add(other.item(i))
            i := i + 1
         end
         next_generation
      end

   from_collection (model: COLLECTION[like item])
      local
         i, up: INTEGER
      do
         from
            with_capacity(model.count.max(1))
            up := model.upper
            i := model.lower
         until
            i > up
         loop
            add(model.item(i))
            i := i + 1
         end
         next_generation
      end

feature {} -- Implement manifest generic creation:
   manifest_make (needed_capacity: INTEGER)
         -- Manifest creation of a HASHED_SET.
      do
         with_capacity(needed_capacity)
      end

feature {}
   free_nodes: WEAK_REFERENCE[HASHED_SET_NODE[E_]]
         -- If any, they are ready to be recycled.

   common_free_nodes: DICTIONARY[WEAK_REFERENCE[ANY_HASHED_SET_NODE], STRING]
      once
         create {HASHED_DICTIONARY[WEAK_REFERENCE[ANY_HASHED_SET_NODE], STRING]} Result.make
      end

   dispose_node (node: HASHED_SET_NODE[E_]): HASHED_SET_NODE[E_]
         -- Clear and add `node' in the `free_nodes' list.
      require
         node /= Void
      local
         default_e: E_
      do
         Result := node.next
         node.make(default_e, free_nodes.item)
         free_nodes.set_item(node)
      ensure
         Result = old node.next
         free_nodes /= Void
      end

   new_node (e: E_; next: HASHED_SET_NODE[E_]): HASHED_SET_NODE[E_]
         -- Recycle from `free_nodes' or create a new one.
      do
         Result := free_nodes.item
         if Result = Void then
            create Result.make(e, next)
         else
            free_nodes.set_item(Result.next)
            Result.make(e, next)
         end
      end

   increase_capacity
         -- There are not enough free slots: the set must grow.
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
               node1 := old_buckets.item(i)
            until
               node1 = Void
            loop
               node2 := node1.next
               idx := hash_code(node1.item) #\\ capacity
               node1.set_next(buckets.item(idx))
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
      do
         if index = cache_user + 1 then
            from
               cache_user := index
               cache_node := cache_node.next
            until
               cache_node /= Void
            loop
               cache_buckets := cache_buckets + 1
               cache_node := buckets.item(cache_buckets)
            end
         elseif index = cache_user then
         elseif index = 1 then
            from
               cache_user := 1
               cache_buckets := 0
               cache_node := buckets.item(cache_buckets)
            until
               cache_node /= Void
            loop
               cache_buckets := cache_buckets + 1
               cache_node := buckets.item(cache_buckets)
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
      end

   hash_code (e: like item): INTEGER
      require
         e /= Void
      deferred
      end

invariant
   capacity > 0
   capacity >= count
   cache_user.in_range(-1, count)
   cache_user > 0 implies cache_node /= Void
   cache_user > 0 implies cache_buckets.in_range(0, capacity - 1)

end -- class ABSTRACT_HASHED_SET
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
