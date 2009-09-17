deferred class BACKTRACKING_NODE_LIST
	--
	-- Node for a sequence of list of nodes
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	node: BACKTRACKING_NODE
			-- first node of the list

	next: like Current
			-- remaining of the list

	make (nod: BACKTRACKING_NODE; nxt: like next) is
		require
			value_not_void: nod /= Void
		do
			node := nod
			next := nxt
		ensure
			definition: node = nod and next = nxt
			node_not_void: node /= Void
		end

	set_node (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			node := value
		ensure
			definition: node = value
			node_not_void: node /= Void
		end

	set_next (value: like next) is
		do
			next := value
		ensure
			definition: next = value
		end

invariant
	node_not_void: node /= Void

end -- class BACKTRACKING_NODE_LIST
