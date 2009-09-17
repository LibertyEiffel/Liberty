class BACKTRACKING_NODE_CUT_AND_FALSE
	--
	-- node to call cut and stop the current path
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- cut until cut point
			explorer.cut
			-- stop
			explorer.backtrack
		end

end -- class BACKTRACKING_NODE_CUT_AND_FALSE
