class REGULAR_EXPRESSION_ITEM_IS_POSIX_BLANK

inherit
	REGULAR_EXPRESSION_ITEM

feature {ANY}
	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.valid_last_character and then (matcher.last_character = ' ' or else matcher.last_character = '%T') then
				matcher.advance
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_IS_POSIX_BLANK
