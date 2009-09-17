class ABSTRACT_BACKTRACKING_GLOBALS
	--
	-- some globals

feature {ANY}
	pool_of_cut_points: ABSTRACT_BACKTRACKING_POOL_OF_CUT_POINT is
			-- Bank of cut points
		once
			create Result.make
		end

end -- class ABSTRACT_BACKTRACKING_GLOBALS
