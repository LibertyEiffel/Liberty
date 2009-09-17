class BACKTRACKING_NODE_AND_LIST
	--
	-- Node for a sequence of list of nodes
	--

inherit
	BACKTRACKING_NODE_LIST

creation {ANY}
	make, set_node

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- Tell to evaluate 'node' now.
			explorer.set_current_node(node)
			if next /= Void then
				-- Push 'next', the remaining of the list
				-- in front of the continuation path.
				explorer.push_and_list(next)
			end
		end

end -- class BACKTRACKING_NODE_AND_LIST
