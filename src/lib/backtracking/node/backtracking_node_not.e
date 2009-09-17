class BACKTRACKING_NODE_NOT
	--
	-- node that negate a node what mean that the exploration
	-- will be continued if exploration of the subnode is stopped
	-- and conversly.
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
			-- insert a cut point
			explorer.push_cut_point
			-- create a call to continuation
			explorer.push_or(the_true_node)
			-- evaluate 'node' now
			explorer.set_current_node(node)
			-- and if it's a succes the following node
			-- will remove the or by a cut and will fail
			explorer.push_and(the_cut_and_false_node)
		end

end -- class BACKTRACKING_NODE_NOT
