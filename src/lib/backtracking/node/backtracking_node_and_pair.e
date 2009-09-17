class BACKTRACKING_NODE_AND_PAIR
	--
	-- Node for a sequence of 2 nodes
	--

inherit
	BACKTRACKING_NODE_BINARY

creation {ANY}
	make

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- Tell to evaluate 'first' now.
			explorer.set_current_node(first)
			-- Push 'second' in front of the continuation path.
			explorer.push_and(second)
		end

end -- class BACKTRACKING_NODE_AND_PAIR
