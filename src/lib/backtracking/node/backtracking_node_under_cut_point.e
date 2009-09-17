class BACKTRACKING_NODE_UNDER_CUT_POINT
	--
	-- node to evaluate an action under a cut point
	--

inherit
	BACKTRACKING_NODE_UNARY

creation {ANY}
	make

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- insert the cut point
			explorer.push_cut_point
			-- now evaluate 'node' under the cut point
			explorer.set_current_node(node)
		end

end -- class BACKTRACKING_NODE_UNDER_CUT_POINT
