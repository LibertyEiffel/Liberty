class BACKTRACKING_POOL_OF_ALTERNATIVE_LIST
	--
	-- Pool of alternatives on lists
	--

inherit
	ABSTRACT_BACKTRACKING_POOL[BACKTRACKING_ALTERNATIVE_LIST]

creation {ANY}
	make

feature {ANY}
	get_fresh_instance: BACKTRACKING_ALTERNATIVE_LIST is
		do
			create Result
		end

end -- class BACKTRACKING_POOL_OF_ALTERNATIVE_LIST
