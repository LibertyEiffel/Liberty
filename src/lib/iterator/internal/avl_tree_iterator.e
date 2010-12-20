deferred class AVL_TREE_ITERATOR[E_]

--         4
--      2     6
--     1 3   5 7

feature {}
	nodes: STACK[AVL_TREE_NODE[E_]]
	cur: AVL_TREE_NODE[E_]

	go_first is
		local
			node: AVL_TREE_NODE[E_]
		do
			node := nodes.top
			if node.left = Void then
				cur := node
			else
				nodes.push(node.left)
				go_first
			end
		end

	go_next is
		local
			node: AVL_TREE_NODE[E_]
		do
			node := nodes.top
			if cur = node then
				if node.right /= Void then
					nodes.pop
					nodes.push(node.right)
					go_first
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

invariant
	nodes /= Void

end -- class AVL_TREE_ITERATOR
