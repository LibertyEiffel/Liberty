-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_AVL_DICTIONARY[V_, K_]
   --
   -- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
   --
   -- Efficient implementation of DICTIONARY using an AVL balanced tree. AVL stands for the names of G. M. Adel'son-Velskii
   -- and E. M. Landis, two Russian mathematicians who first came up with this method of keeping the tree balanced.
   --

inherit
   SIMPLE_DICTIONARY[V_, K_]
      redefine
         occurrences, fast_occurrences, key_at, fast_key_at, copy,
         new_iterator_on_items,
         default_create
      end

insert
   AVL_TREE[K_]
      rename
         item_memory as key_memory
      export
         {ITERATOR_ON_AVL_DICTIONARY_ITEMS, ITERATOR_ON_AVL_DICTIONARY_KEYS, ITERATOR_ON_AVL_DICTIONARY} root
      redefine
         default_create
      end

feature {ANY}
   capacity: INTEGER 0

   at (k: K_): V_
      do
         Result := root.at(k).value
      end

   fast_at (k: K_): V_
      do
         Result := root.fast_at(k).value
      end

   reference_at (k: K_): V_
      local
         n: ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]
      do
         if root /= Void then
            n := root.at(k)
            if n /= Void then
               Result := n.value
            end
         end
      end

   fast_reference_at (k: K_): V_
      local
         n: ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]
      do
         if root /= Void then
            n := root.fast_at(k)
            if n /= Void then
               Result := n.value
            end
         end
      end

   put, add (v: V_; k: K_)
      do
         value_memory := v
         key_memory := k
         root := do_insert(root)
         next_generation
      end

   fast_put (v: V_; k: K_)
      do
         value_memory := v
         key_memory := k
         root := fast_do_insert(root)
         next_generation
      end

   occurrences (v: V_): INTEGER
      do
         if root /= Void then
            Result := root.occurrences(v)
         end
      end

   fast_occurrences (v: V_): INTEGER
      do
         if root /= Void then
            Result := root.fast_occurrences(v)
         end
      end

   key_at (v: V_): K_
      do
         Result := root.key_at(v)
      end

   fast_key_at (v: V_): K_
      do
         Result := root.fast_key_at(v)
      end

   clear_count, clear_count_and_capacity
      do
         if not is_empty then
            clear_nodes(root)
            root := Void
            count := 0
            map_dirty := True
         end
         next_generation
      end

   set_item (v: V_; index: INTEGER)
      do
         if map_dirty then
            build_map
         end
         map.item(index - 1).set_value(v)
         next_generation
      end

   item (index: INTEGER): V_
      do
         if map_dirty then
            build_map
         end
         Result := map.item(index - 1).value
      end

   key (index: INTEGER): K_
      do
         if map_dirty then
            build_map
         end
         Result := map.item(index - 1).key
      end

   new_iterator_on_keys: ITERATOR[K_]
      do
         create {ITERATOR_ON_AVL_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
      end

   new_iterator_on_items: ITERATOR[V_]
      do
         create {ITERATOR_ON_AVL_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]]
      do
         create {ITERATOR_ON_AVL_DICTIONARY[V_, K_]} Result.make(Current)
      end

   internal_key (k: K_): K_
      do
         Result := root.at(k).key
      end

   copy (other: like Current)
      do
         make
         Precursor(other)
         next_generation
      end

feature {}
   value_memory: V_

   set_value_and_key (n: like a_new_node)
      do
         n.set(value_memory, key_memory)
      end

   set_value (n: like a_new_node)
      do
         n.set_value(value_memory)
      end

   a_new_node: ABSTRACT_AVL_DICTIONARY_NODE[V_, K_]
      deferred
      end

   exchange_and_discard (n1, n2: like root)
      do
         map_dirty := True
         n1.set_key(n2.key)
         n1.set_value(n2.value)
         rebalance := True
         count := count - 1
         discard_node(n2)
      end

   make, default_create
      do
         create map.make(0)
         next_generation
      end

end -- class ABSTRACT_AVL_DICTIONARY
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
