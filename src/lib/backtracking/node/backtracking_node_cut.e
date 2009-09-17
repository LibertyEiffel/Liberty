class BACKTRACKING_NODE_CUT
	--
	-- node to call cut and continue
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	explore (explorer: BACKTRACKING) is
		do
			-- cut until cut point
			explorer.cut
			-- continue
			explorer.continue
		end

end -- class BACKTRACKING_NODE_CUT
