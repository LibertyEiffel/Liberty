-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class AVL_TREE_NODE[E_]
   --
   -- Auxiliary class to implement AVL_SET.
   --
   -- This a classic implementation of an AVL tree (balanced tree first designed by Adelson-Velskii and
   -- Landis (hence A.V.L.), 1960)
   --

inherit
   AVL_TREE_NODE_ANY

insert
   AVL_CONSTANTS

feature {ANY}
   out_in_tagged_out_memory
      do
         item.out_in_tagged_out_memory
         tagged_out_memory.extend('(')
         if left = Void then
            tagged_out_memory.append(once "Void")
         else
            left.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(',')
         if right = Void then
            tagged_out_memory.append(once "Void")
         else
            right.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(')')
      end

   safe_equal: SAFE_EQUAL[E_]

feature {AVL_TREE_NODE, AVL_TREE, AVL_TREE_ITERATOR}
   left, right: like Current

   item: E_

   balance: INTEGER
         -- Balance factor; either `balanced' (the tree is balanced),
         -- `imbalanced_left' (the left branch is the longer) or
         -- `imbalanced_right' (the right branch is the longer)

   count: INTEGER
      do
         Result := 1
         if left /= Void then
            Result := Result + left.count
         end
         if right /= Void then
            Result := Result + right.count
         end
      end

   height: INTEGER
      do
         if left /= Void then
            Result := left.height
         end
         if right /= Void then
            Result := Result.max(right.height)
         end
         Result := Result + 1
      end

   map_in (map: COLLECTION[like Current])
      require
         map /= Void
      do
         if left /= Void then
            left.map_in(map)
         end
         map.add_last(Current)
         if right /= Void then
            right.map_in(map)
         end
      ensure
         map.count = old map.count + count
      end

   has (e: like item): BOOLEAN
         -- Is element `e' in the tree?
      do
         Result := safe_equal.test(item, e)
         if not Result then
            if ordered(e, item) then
               Result := left /= Void and then left.has(e)
            else
               Result := right /= Void and then right.has(e)
            end
         end
      end

   fast_has (e: like item): BOOLEAN
         -- Is element `e' in the tree?
      do
         Result := item = e
         if not Result and then not safe_equal.test(item, e) then
            if ordered(e, item) then
               Result := left /= Void and then left.fast_has(e)
            else
               Result := right /= Void and then right.fast_has(e)
            end
         end
      ensure
         Result implies count > 0
      end

   at (e: like item): like Current
         -- Is element `e' in the tree?
      do
         if safe_equal.test(item, e) then
            Result := Current
         elseif ordered(e, item) then
            if left /= Void then
               Result := left.at(e)
            end
         else
            if right /= Void then
               Result := right.at(e)
            end
         end
      end

   set_item (i: like item)
      require
      -- Equality admitted for the free list
         left /= Void implies safe_equal.test(left.item, i) or else ordered(left.item, i)
         right /= Void implies ordered(i, right.item)
      do
         item := i
      ensure
         item = i
      end

   set_left (l: like left)
      require
      -- Equality admitted for the free list
         l /= Void implies safe_equal.test(l.item, item) or else ordered(l.item, item)
      do
         left := l
      ensure
         left = l
      end

   set_right (r: like right)
      require
         r /= Void implies ordered(item, r.item)
      do
         right := r
      ensure
         right = r
      end

   set_balance (b: like balance)
      do
         balance := b
      ensure
         balance = b
      end

feature {AVL_TREE} -- Rotations:
   rotate_right: like Current
         -- Proceeds to some reorganisation and returns the upper node.
      local
         left_right: like Current
      do
         Result := left
         left_right := left.right
         left.set_right(Current)
         set_left(left_right)
      ensure
         Result /= Void
      end

   rotate_left: like Current
         -- Proceeds to some reorganisation and returns the upper node.
      local
         right_left: like Current
      do
         Result := right
         right_left := right.left
         right.set_left(Current)
         set_right(right_left)
      ensure
         Result /= Void
      end

feature {}
   ordered (e1, e2: E_): BOOLEAN
         -- True if [e1, e2] is a correctly ordered sequence; usually, e1 < e2
      require
         e1 /= Void
         e2 /= Void
      deferred
      end

feature {RECYCLING_POOL}
   recycle
      local
         e: E_
      do
         left := Void
         right := Void
         item := e
      end

end -- class AVL_TREE_NODE
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
