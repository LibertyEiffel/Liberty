-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_LINKED_HASHED_DICTIONARY[V_, K_]
   --
   -- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
   --
   -- Efficient implementation of DICTIONARY using some hash_code on keys.
   --
   -- When iterating over the dictionary, the insertion order is kept.
   --

inherit
   ABSTRACT_HASHED_DICTIONARY[V_, K_]
      redefine
         new_iterator_on_keys, new_iterator_on_items, new_iterator,
         for_each_item, for_all_items, exists_item, aggregate_items,
         key_map_in, item_map_in,
         buckets_item, cache_node, free_nodes, nodes_list, dispose_node, new_node,
         set_cache_user
      end

feature {ITERATOR}
   first_node, last_node: LINKED_HASHED_DICTIONARY_NODE[V_, K_]

feature {ANY}
   new_iterator_on_keys: ITERATOR[K_]
      do
         create {ITERATOR_ON_LINKED_HASHED_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
      end

   new_iterator_on_items: ITERATOR[V_]
      do
         create {ITERATOR_ON_LINKED_HASHED_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]]
      do
         create {ITERATOR_ON_LINKED_HASHED_DICTIONARY[V_, K_]} Result.make(Current)
      end

   key_map_in (buffer: COLLECTION[K_])
      local
         node: like first_node
      do
         from
            node := first_node
         until
            node = Void
         loop
            buffer.add_last(node.key)
            node := node.next_link
         end
      end

   item_map_in (buffer: COLLECTION[V_])
      local
         node: like first_node
      do
         from
            node := first_node
         until
            node = Void
         loop
            buffer.add_last(node.item)
            node := node.next_link
         end
      end

feature {ANY} -- Agent-based features:
   for_each_item (action: PROCEDURE[TUPLE[V_]])
         -- Apply `action' to every item of `Current'.
         --
         -- See also `for_all', `exists', `aggregate'.
      do
         new_iterator_on_items.for_each(action)
      end

   for_all_items (test: PREDICATE[TUPLE[V_]]): BOOLEAN
         -- Do all items satisfy `test'?
         --
         -- See also `for_each', `exists', `aggregate'.
      do
         Result := new_iterator_on_items.for_all(test)
      end

   exists_item (test: PREDICATE[TUPLE[V_]]): BOOLEAN
         -- Does at least one item satisfy `test'?
         --
         -- See also `for_each', `for_all', `aggregate'.
      do
         Result := new_iterator_on_items.exists(test)
      end

   aggregate_items (action: FUNCTION[TUPLE[V_, V_], V_]; initial: V_): V_
         -- Aggregate all the elements starting from the initial value.
         --
         -- See also `for_each', `for_all', `exists'.
      do
         Result := new_iterator_on_items.aggregate(action, initial)
      end

feature {}
   set_cache_user (index: INTEGER)
      do
         if cache_user /= index then
            if cache_iterator = Void then
               create cache_iterator.make(Current)
            end
            from
               if not cache_iterator.is_valid or else index < cache_iterator.index then
                  cache_iterator.start
               end
            until
               index = cache_iterator.index
            loop
               cache_iterator.next
            end
            cache_user := index
            cache_node := cache_iterator.node
         end
      end

   cache_iterator: ITERATOR_ON_LINKED_HASHED_DICTIONARY_KEYS[V_, K_]

feature {}
   buckets_item (a_buckets: like buckets; idx: INTEGER): like cache_node
      do
         Result ::= a_buckets.item(idx)
      end

   cache_node: LINKED_HASHED_DICTIONARY_NODE[V_, K_]

   free_nodes: WEAK_REFERENCE[LINKED_HASHED_DICTIONARY_NODE[V_, K_]]

   nodes_list: FAST_ARRAY[LINKED_HASHED_DICTIONARY_NODE[V_, K_]]

   dispose_node (node: like cache_node): like cache_node
      local
         previous, next: like node
      do
         Result := Precursor(node)

         next := node.next_link
         previous := node.previous_link

         if node = first_node then
            check
               previous = Void
            end
            first_node := next
         else
            previous.set_links(previous.previous_link, next)
         end

         if node = last_node then
            check
               next = Void
            end
            last_node := previous
         else
            next.set_links(previous, next.next_link)
         end

         node.set_links(Void, Void)
      end

   new_node (v: V_; k: K_; next: like cache_node): like cache_node
      do
         Result := Precursor(v, k, next)
         Result.set_links(last_node, Void)
         if first_node = Void then
            check
               last_node = Void
            end
            first_node := Result
         else
            last_node.set_links(last_node.previous_link, Result)
         end
         last_node := Result
      ensure
         last_node = Result
         last_node.previous_link = (old last_node)
      end

invariant
   count > 0 implies (first_node /= Void and last_node /= Void)
   count > 1 = (first_node /= last_node)

end -- class ABSTRACT_LINKED_HASHED_DICTIONARY
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
