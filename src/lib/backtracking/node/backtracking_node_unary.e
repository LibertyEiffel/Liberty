deferred class BACKTRACKING_NODE_UNARY
	--
	-- node that reference one subnode
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	node: BACKTRACKING_NODE
			-- the node

	make, set_node (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			node := value
		ensure
			definition: node = value
			node_not_void: node /= Void
		end

invariant
	node_not_void: node /= Void

end -- class BACKTRACKING_NODE_UNARY
