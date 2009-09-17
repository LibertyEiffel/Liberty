class BACKTRACKING_POOL_OF_ALTERNATIVE
	--
	-- Pool of simple node alternatives
	--

inherit
	ABSTRACT_BACKTRACKING_POOL[BACKTRACKING_ALTERNATIVE]

creation {ANY}
	make

feature {ANY}
	get_fresh_instance: BACKTRACKING_ALTERNATIVE is
		do
			create Result
		end

end -- class BACKTRACKING_POOL_OF_ALTERNATIVE
