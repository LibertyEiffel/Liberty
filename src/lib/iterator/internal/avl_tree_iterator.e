deferred class AVL_TREE_ITERATOR[E_]

inherit
   RECYCLABLE

--         4
--      2     6
--     1 3   5 7

feature {}
   nodes: STACK[AVL_TREE_NODE[E_]]
   cur: AVL_TREE_NODE[E_]

   go_leftmost (node: AVL_TREE_NODE[E_])
      require
         node = nodes.top
      local
         left: like node
      do
         left := node.left
         if left = Void then
            cur := node
         else
            nodes.push(left)
            go_leftmost(left)
         end
      end

   go_next_node (node: AVL_TREE_NODE[E_])
      require
         node = nodes.top
      local
         right: like node
      do
         if cur = node then
            right := node.right
            if right /= Void then
               nodes.pop
               nodes.push(right)
               go_leftmost(right)
            else
               nodes.pop
               if nodes.is_empty then
                  cur := Void
               else
                  cur := nodes.top
               end
            end
         else
            cur := node
         end
      end

   go_first (root: AVL_TREE_NODE[E_])
      do
         from
         until
            nodes.is_empty
         loop
            nodes.pop
         end
         nodes.push(root)
         go_leftmost(root)
      end

   go_next
      require
         not nodes.is_empty
      do
         go_next_node(nodes.top)
      end

feature {ANY}
   generation: INTEGER

feature {RECYCLING_POOL}
   recycle
      do
         nodes_pool.recycle(nodes)
      end

feature {}
   new_nodes: like nodes
      do
         if nodes_pool.is_empty then
            create Result.make
         else
            Result := nodes_pool.item
         end
      end

   nodes_pool: RECYCLING_POOL[STACK[AVL_TREE_NODE[E_]]]
      local
         key: FIXED_STRING
      do
         Result := nodes_pool_memory
         if Result = Void then
            key := generating_type.intern
            Result ::= nodes_pools.fast_reference_at(key)
            if Result = Void then
               create Result.make
               nodes_pools.add(Result, key)
            end
            nodes_pool_memory := Result
         end
      end

   nodes_pool_memory: like nodes_pool

   nodes_pools: HASHED_DICTIONARY[RECYCLING_POOL[STACK[AVL_TREE_NODE_ANY]], FIXED_STRING]
      once
         create Result.make
      end

invariant
   nodes /= Void

end -- class AVL_TREE_ITERATOR
