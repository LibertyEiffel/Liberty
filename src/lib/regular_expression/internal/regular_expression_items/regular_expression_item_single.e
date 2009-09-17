class REGULAR_EXPRESSION_ITEM_SINGLE
	--
	-- accept one character
	--

inherit
	REGULAR_EXPRESSION_ITEM

creation {ANY}
	make

feature {ANY}
	item: CHARACTER
			-- the accepted character

	make (char: CHARACTER) is
		do
			item := char
		ensure
			definition: item = char
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.match_character(item)
		end

end -- class REGULAR_EXPRESSION_ITEM_SINGLE
