class REGULAR_EXPRESSION_ITEM_RANGE
	--
	-- accept a character in a range
	--

inherit
	REGULAR_EXPRESSION_ITEM

creation {ANY}
	make

feature {ANY}
	lower, upper: CHARACTER
			-- lower and upper range

	make (low, up: CHARACTER) is
		do
			lower := low
			upper := up
		ensure
			definition: lower = low and upper = up
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.valid_last_character and then matcher.last_character.in_range(lower, upper) then
				matcher.advance
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_RANGE
