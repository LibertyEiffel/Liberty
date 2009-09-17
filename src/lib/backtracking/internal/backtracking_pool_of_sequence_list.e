class BACKTRACKING_POOL_OF_SEQUENCE_LIST
	--
	-- Pool of sequences on lists
	--

inherit
	ABSTRACT_BACKTRACKING_POOL[BACKTRACKING_SEQUENCE_LIST]

creation {ANY}
	make

feature {ANY}
	get_fresh_instance: BACKTRACKING_SEQUENCE_LIST is
		do
			create Result
		end

end -- class BACKTRACKING_POOL_OF_SEQUENCE_LIST
