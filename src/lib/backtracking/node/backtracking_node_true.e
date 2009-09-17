class BACKTRACKING_NODE_TRUE
	--
	-- Node that continues the current exploration.
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- Continues the exploration
			explorer.continue
		end

end -- class BACKTRACKING_NODE_TRUE
