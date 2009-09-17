class BACKTRACKING_NODE_FALSE
	--
	-- Node that stops the current exploration.
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- Stops the exploration
			explorer.backtrack
		end

end -- class BACKTRACKING_NODE_FALSE
