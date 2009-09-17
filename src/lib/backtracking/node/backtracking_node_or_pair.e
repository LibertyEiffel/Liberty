class BACKTRACKING_NODE_OR_PAIR
	--
	-- Node for an alternative of 2 nodes
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
			-- Push 'second' in front of the possible alternatives.
			explorer.push_or(second)
		end

end -- class BACKTRACKING_NODE_OR_PAIR
