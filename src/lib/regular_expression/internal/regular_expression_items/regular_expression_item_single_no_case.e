class REGULAR_EXPRESSION_ITEM_SINGLE_NO_CASE
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
			item := char.to_upper
		ensure
			definition: item = char.to_upper
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.match_character_no_case(item)
		end

end -- class REGULAR_EXPRESSION_ITEM_SINGLE_NO_CASE
