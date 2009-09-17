class BACKTRACKING_POOL_OF_SEQUENCE
	--
	-- Pool of simple node sequences
	--

inherit
	ABSTRACT_BACKTRACKING_POOL[BACKTRACKING_SEQUENCE]

creation {ANY}
	make

feature {ANY}
	get_fresh_instance: BACKTRACKING_SEQUENCE is
		do
			create Result
		end

end -- class BACKTRACKING_POOL_OF_SEQUENCE
