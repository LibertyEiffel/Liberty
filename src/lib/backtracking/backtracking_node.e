deferred class BACKTRACKING_NODE
	--
	-- Parent class of all the nodes that are explored by BACKTRACKING
	--

feature {ANY}
	explore (explorer: BACKTRACKING) is
			-- That feature must update the state of 'explorer'.
		deferred
		end

end -- class BACKTRACKING_NODE
