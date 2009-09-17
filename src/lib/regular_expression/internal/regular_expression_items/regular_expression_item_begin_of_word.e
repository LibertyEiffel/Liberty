class REGULAR_EXPRESSION_ITEM_BEGIN_OF_WORD
	--
	-- test the begin of a word
	--

inherit
	REGULAR_EXPRESSION_ITEM

feature {ANY}
	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.is_begin_of_word then
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_BEGIN_OF_WORD
