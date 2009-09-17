class REGULAR_EXPRESSION_ITEM_BEGIN_OF_TEXT
	--
	-- test the begin of the text
	--

inherit
	REGULAR_EXPRESSION_ITEM

feature {ANY}
	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.is_begin_of_text then
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_BEGIN_OF_TEXT
