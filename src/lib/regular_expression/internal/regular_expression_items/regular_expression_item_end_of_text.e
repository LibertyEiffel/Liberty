class REGULAR_EXPRESSION_ITEM_END_OF_TEXT
	--
	-- test end of text
	--

inherit
	REGULAR_EXPRESSION_ITEM

creation {ANY}
	make

feature {ANY}
	really_end: BOOLEAN
			-- is the end of text even after new line searched?

	make (real: BOOLEAN) is
			-- creation
		do
			really_end := real
		ensure
			definition: really_end = real
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.is_end_of_text(really_end) then
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_END_OF_TEXT
