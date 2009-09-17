class ABSTRACT_BACKTRACKING_POOL_OF_CUT_POINT
	--
	-- Pool for the ABSTRACT_BACKTRACKING_CUT_POINT items
	--

inherit
	ABSTRACT_BACKTRACKING_POOL[ABSTRACT_BACKTRACKING_CUT_POINT]

creation {ANY}
	make

feature {ANY}
	get_fresh_instance: ABSTRACT_BACKTRACKING_CUT_POINT is
			-- creation of a new instance
		do
			create Result
		end

end -- class ABSTRACT_BACKTRACKING_POOL_OF_CUT_POINT
