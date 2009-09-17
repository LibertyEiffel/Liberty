class REGULAR_EXPRESSION_ITEM_PREVIOUS_GROUP
	--
	-- record the begin of a group
	--

inherit
	REGULAR_EXPRESSION_ITEM

creation {ANY}
	make

feature {ANY}
	number: INTEGER
			-- the number of the group

	make (num: INTEGER) is
		require
			natural_number: num >= 0
		do
			number := num
		ensure
			definition: number = num
			natural_number: number >= 0
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.match_previous_group(number)
		end

end -- class REGULAR_EXPRESSION_ITEM_PREVIOUS_GROUP
