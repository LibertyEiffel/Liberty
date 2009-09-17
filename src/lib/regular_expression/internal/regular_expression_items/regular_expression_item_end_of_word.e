class REGULAR_EXPRESSION_ITEM_END_OF_WORD
	--
	-- test end of word
	--

inherit
	REGULAR_EXPRESSION_ITEM

feature {ANY}
	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.is_end_of_word then
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_END_OF_WORD
