class BACKTRACKING_NODE_TRUE_OR
	--
	-- Alternative between nothing (as true) first and then a node
	--

inherit
	BACKTRACKING_NODE_UNARY

insert
	BACKTRACKING_NODE_GLOBALS

creation {ANY}
	make

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- Push 'node' in front of the possible alternatives.
			explorer.push_or(node)
			-- Continues the exploration
			explorer.continue
		end

end -- class BACKTRACKING_NODE_TRUE_OR
