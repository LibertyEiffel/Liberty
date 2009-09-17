class BACKTRACKING_GLOBALS
	--
	-- some global pools

feature {ANY} -- the pools
	pool_of_sequence: BACKTRACKING_POOL_OF_SEQUENCE is
		once
			create Result.make
		end

	pool_of_sequence_list: BACKTRACKING_POOL_OF_SEQUENCE_LIST is
		once
			create Result.make
		end

	pool_of_alternative: BACKTRACKING_POOL_OF_ALTERNATIVE is
		once
			create Result.make
		end

	pool_of_alternative_list: BACKTRACKING_POOL_OF_ALTERNATIVE_LIST is
		once
			create Result.make
		end

end -- class BACKTRACKING_GLOBALS
