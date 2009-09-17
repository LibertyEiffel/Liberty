class BACKTRACKING_NODE_OR_TRUE
	--
	-- Alternative between a node first and then nothing (as true)
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
			-- Tell to evaluate 'node' now.
			explorer.set_current_node(node)
			-- Push true in front of the possible alternatives.
			explorer.push_or(the_true_node)
		end

end -- class BACKTRACKING_NODE_OR_TRUE
