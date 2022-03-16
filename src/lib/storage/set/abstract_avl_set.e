-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_AVL_SET[E_]

inherit
   SET[E_]
      redefine new_iterator
      end

insert
   AVL_TREE[E_]
      rename
         set_value_and_key as set_item
      export
         {ITERATOR_ON_AVL_SET} root
      end

feature {ANY}
   new_iterator: ITERATOR[E_]
      do
         create {ITERATOR_ON_AVL_SET[E_]} Result.make(Current)
      end

   add (e: like item)
      do
         item_memory := e
         root := do_insert(root)
         next_generation
      end

   fast_add (e: like item)
      do
         item_memory := e
         root := fast_do_insert(root)
         next_generation
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

   reference_at (e: like item): like item
      local
         n: ABSTRACT_AVL_SET_NODE[E_]
      do
         if root /= Void then
            n := root.at(e)
            if n /= Void then
               Result := n.item
            end
         end
      end

   item (index: INTEGER): E_
      do
         if map_dirty then
            build_map
         end
         Result := map.item(index - 1).item
      end

feature {}
   set_item (n: like a_new_node)
      do
         n.set(item_memory)
      end

   set_value (n: like a_new_node)
      do
      end

   a_new_node: ABSTRACT_AVL_SET_NODE[E_]
      deferred
      end

   exchange_and_discard (n1, n2: like a_new_node)
      do
         map_dirty := True
         n1.set_item(n2.item)
         rebalance := True
         count := count - 1
         discard_node(n2)
      end

feature {}
   make
      do
         create map.make(0)
         next_generation
      end

end -- class ABSTRACT_AVL_SET
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
